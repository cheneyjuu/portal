package com.pufeng.portal.web.admin;

import com.pufeng.portal.entity.Content;
import com.pufeng.portal.entity.Image;
import com.pufeng.portal.service.admin.ContentService;
import com.pufeng.portal.service.admin.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * User: Juchen
 * Date: 13-7-7
 * Time: 上午9:41
 */
@Controller
@RequestMapping (value = "/admin/add")
public class AdminAddContentController {

    private ContentService contentService;
    private ImageService imageService;

    @RequestMapping (value = "/{typeName}", method = RequestMethod.GET)
    public String addContent(@PathVariable(value = "typeName") String typeName,
                             Model model){
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
        }
        model.addAttribute("typeList", typeList);
        model.addAttribute("typeName", typeName);
        Content content = contentService.findBySubType("企业相册");
        model.addAttribute("contentModel", content);
        return "admin/addContent";
    }

    @RequestMapping (value = "/{typeName}", method = RequestMethod.POST)
    public String addContent(@Valid Content content,
                             @RequestParam(value = "fileNameList", required = false) List<String> fileNameList,
                             @PathVariable (value = "typeName") String typeName){
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
        }
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String createTime = format.format(new Date());
        content.setCreateTime(createTime);
        content.setParentType(typeName);
        content.setImageList(imageList);
        contentService.save(content);
        return "redirect:/admin/add/"+typeName;
    }

    @RequestMapping (value = "/image/{typeName}", method = RequestMethod.POST)
    public String addContentImage(@Valid @ModelAttribute (value = "perloadContent") Content content,
                             @RequestParam(value = "fileNameList", required = false) List<String> fileNameList,
                             @PathVariable (value = "typeName") String typeName){
        List<Image> imageList = content.getImageList();
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
        }
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String createTime = format.format(new Date());
        content.setCreateTime(createTime);
        content.setParentType(typeName);
        content.setImageList(imageList);
        contentService.save(content);
        return "redirect:/admin/add/"+typeName;
    }

    @ModelAttribute (value = "perloadContent")
    public Content getContent(@RequestParam (value = "contentId", required = false) Long contentId){
        if (contentId != null){
            return contentService.findById(contentId);
        }
        return null;
    }

    @Autowired
    public void setContentService(ContentService contentService) {
        this.contentService = contentService;
    }

    @Autowired
    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }
}
