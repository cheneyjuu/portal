package com.pufeng.portal.web.admin;

import com.pufeng.portal.entity.Content;
import com.pufeng.portal.service.admin.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * User: Juchen
 * Date: 13-7-8
 * Time: 下午9:45
 */
@Controller
@RequestMapping(value = "/admin/content")
public class AdminContent {

    private static final int PAGE_SIZE = 12;
    private ContentService contentService;

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String update() {

        return "";
    }

    @RequestMapping(value = "/details/{contentId}", method = RequestMethod.GET)
    public String details(@PathVariable(value = "contentId") Long contentId,
                          Model model) {
        Content content = contentService.findById(contentId);
        model.addAttribute("contentModel", content);
        return "admin/details";
    }

    @RequestMapping(value = "/delete/{typeName}/{subType}/{contentId}", method = RequestMethod.GET)
    public String delete(@PathVariable(value = "typeName") String typeName,
                         @PathVariable(value = "subType") String subType,
                         @PathVariable(value = "contentId") Long contentId,
                         @RequestParam(value = "page", defaultValue = "1") int pageNumber,
                         Model model) {
        contentService.delete(contentId);
        Page<Content> contentPage = contentService.listWithParentType(pageNumber, PAGE_SIZE, typeName);
        model.addAttribute("contentPage", contentPage);
        String type = null;
        try {
            type = URLEncoder.encode(subType, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "redirect:/admin/list/" + typeName+"/"+type;
    }

    @ModelAttribute("perloadContent")
    public Content perloadContent(@RequestParam(value = "contentId", required = false) Long contentId) {
        if (contentId != null) {
            return contentService.findById(contentId);
        }
        return null;
    }

    @Autowired
    public void setContentService(ContentService contentService) {
        this.contentService = contentService;
    }
}
