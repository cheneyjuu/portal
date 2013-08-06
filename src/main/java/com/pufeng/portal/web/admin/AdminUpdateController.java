package com.pufeng.portal.web.admin;

import com.pufeng.portal.entity.Content;
import com.pufeng.portal.entity.Image;
import com.pufeng.portal.service.admin.ContentService;
import com.pufeng.portal.service.admin.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

/**
 * User: Juchen
 * Date: 13-7-15
 * Time: 下午2:53
 */
@Controller
@RequestMapping (value = "/admin/update")
public class AdminUpdateController {

    @Autowired
    private ContentService contentService;
    @Autowired
    private ImageService imageService;

    @RequestMapping (value = "/{typeName}/{subType}/{id}", method = RequestMethod.GET)
    public String update(@PathVariable (value = "typeName") String typeName,
                         @PathVariable (value = "subType") String subTyep,
                         @PathVariable (value = "id") Long id,
                         Model model){
        List<String> typeList = this.typeList(typeName);
        model.addAttribute("typeList", typeList);
        Content content = contentService.findById(id);
        model.addAttribute("contentModel", content);
        model.addAttribute("subType", subTyep);
        return "admin/update";
    }

    @RequestMapping (value = "/{typeName}/{subType}", method = RequestMethod.POST)
    public String addContent(@Valid @ModelAttribute ("perloadContent") Content content,
                             @RequestParam(value = "fileNameList", required = false) List<String> fileNameList,
                             @PathVariable (value = "typeName") String typeName,
                             @PathVariable (value = "subType") String subType){
        List<Image> imageList = new ArrayList<Image>();
        if (fileNameList!=null){
            Image image;
            String filePath;
            String fileName;
            for (String str : fileNameList){
                image = new Image();
                filePath = str.substring(0,str.lastIndexOf("/") + 1);
                fileName = str.substring(str.lastIndexOf("/") + 1,str.length());
                image.setImagePath(filePath);
                image.setImageName(fileName);
                image.setBigName("bt_"+fileName);
                image.setMiddleName("m_"+fileName);
                image.setSmallName("st_"+fileName);
                imageService.save(image);
                imageList.add(image);
            }
            content.setImageList(imageList);
        }
        content.setParentType(typeName);
        contentService.save(content);
        String type = null;
        try {
            type = URLEncoder.encode(subType, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "redirect:/admin/list/" + typeName+"/"+ type;
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

    @ModelAttribute (value = "perloadContent")
    public Content getContent(@RequestParam (value = "contentId", required = false) Long contentId){
        if (contentId != null) {
            return contentService.findById(contentId);
        }
        return null;
    }
}
