package com.pufeng.portal.web.index;

import com.pufeng.portal.entity.Content;
import com.pufeng.portal.service.admin.ContentService;
import com.pufeng.portal.utility.HTMLSpirit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

/**
 * User: Juchen
 * Date: 13-7-5
 * Time: 下午1:50
 */
@Controller
@RequestMapping (value = "/")
public class IndexController {

    private static final int PAGE_SIZE = 6;
    private ContentService contentService;

    @RequestMapping (value = "index", method = RequestMethod.GET)
    public String index(Model model){
        String subType = "公司新闻";
        Page<Content> contentPage = contentService.findBySubTypeWithPage(1, PAGE_SIZE, subType);
        model.addAttribute("contentPage", contentPage);
        return "index/index";
    }

    @RequestMapping (value = "view/{typeName}")
    public String view(@PathVariable (value = "typeName") String typeName,
                       Model model){
        List<String> typeList = this.typeList(typeName);
        model.addAttribute("typeList", typeList);
        model.addAttribute("typeName", typeName);
        Content content = contentService.findBySubType(typeList.get(0));
        model.addAttribute("contentModel", content);
        model.addAttribute("subType", typeList.get(0));
        return "index/view";
    }

    @RequestMapping (value = "view/{typeName}/{subType}")
    public String view(@PathVariable (value = "typeName") String typeName,
                       @PathVariable (value = "subType") String subType,
                       @RequestParam(value = "page", defaultValue = "1", required = false) int pageNumber,
                       Model model){
        List<String> typeList = this.typeList(typeName);
        model.addAttribute("typeList", typeList);
        model.addAttribute("typeName", typeName);
        Content content = contentService.findBySubType(subType);
        Page<Content> contentPage = contentService.findBySubTypeWithPage(pageNumber,5,subType);
        if (typeName.equalsIgnoreCase("news") || typeName.equalsIgnoreCase("market") || subType.equalsIgnoreCase("招聘信息")){
            String contentStr;
            for (Content c : contentPage) {
                contentStr = HTMLSpirit.delHTMLTag(c.getContent());
                if (contentStr.length() > 200) {
                    contentStr = contentStr.substring(0,200) + " ...";
                }
                c.setContent(contentStr);
            }
            model.addAttribute("contentPage", contentPage);
        } else {
            model.addAttribute("contentModel", content);
        }
        model.addAttribute("subType", subType);
        return "index/view";
    }

    @RequestMapping (value = "details/{typeName}/{subType}/{id}")
    public String details(@PathVariable (value = "typeName") String typeName,
                          @PathVariable (value = "subType") String subType,
                          @PathVariable (value = "id") Long id, Model model){
        List<String> typeList = this.typeList(typeName);
        model.addAttribute("typeList", typeList);
        Content content = contentService.findById(id);
        model.addAttribute("contentModel", content);
        model.addAttribute("typeName", typeName);
        model.addAttribute("subType", subType);
        return "index/details";
    }

    @RequestMapping (value = "search")
    public String search(@RequestParam (value = "param") String param,
                         @RequestParam(value = "page", defaultValue = "1") int pageNumber,
                         Model model){
        List<String> typeList = this.typeList("search");
        model.addAttribute("typeList", typeList);
        Page<Content> contentPage = contentService.search(pageNumber, PAGE_SIZE, param);
        model.addAttribute("contentPage", contentPage);
        model.addAttribute("typeName", "search");
        model.addAttribute("subType", "搜索结果");
        return "index/search";
    }

    public List<String> typeList(String typeName){
        List<String> typeList = new ArrayList<String>();
        if (typeName.equalsIgnoreCase("introduce")){
            typeList.add("集团介绍");
            typeList.add("组织结构");
            typeList.add("荣誉资质");
            typeList.add("企业相册");
        } else if (typeName.equalsIgnoreCase("business")){
            typeList.add("煤炭贸易");
            typeList.add("房产置业");
            typeList.add("航道疏浚");
            typeList.add("仓储物流");
        } else if (typeName.equalsIgnoreCase("market")){
            typeList.add("煤炭信息");
            typeList.add("航运信息");
            typeList.add("合作需求");
        } else if (typeName.equalsIgnoreCase("news")){
            typeList.add("公司新闻");
            typeList.add("行业资讯");
        } else if (typeName.equalsIgnoreCase("contact")){
            typeList.add("招聘信息");
            typeList.add("联系方式");
            typeList.add("友情链接");
        } else if (typeName.equalsIgnoreCase("search")){
            typeList.add("搜索结果");
        }
        return typeList;
    }

    @Autowired
    public void setContentService(ContentService contentService) {
        this.contentService = contentService;
    }
}
