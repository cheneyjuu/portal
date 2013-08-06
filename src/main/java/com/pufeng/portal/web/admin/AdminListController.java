package com.pufeng.portal.web.admin;

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

/**
 * User: Juchen
 * Date: 13-7-8
 * Time: 下午4:32
 */
@Controller
@RequestMapping (value = "/admin/list")
public class AdminListController {

    private static final int PAGE_SIZE = 12;
    private ContentService contentService;

    @RequestMapping (value = "/{typeName}", method = RequestMethod.GET)
    public String list(@PathVariable (value = "typeName") String typeName,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber,
                       Model model){
        Page<Content> contentPage = contentService.listWithParentType(pageNumber, PAGE_SIZE, typeName);
        model.addAttribute("contentPage",contentPage);
        return "/admin/list";
    }
    @RequestMapping (value = "/{typeName}/{subType}", method = RequestMethod.GET)
    public String list(@PathVariable (value = "typeName") String typeName,
                       @PathVariable (value = "subType") String subType,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber,
                       Model model){
        Page<Content> contentPage = contentService.listWithAllType(pageNumber, PAGE_SIZE, typeName, subType);
        String contentStr;
        for (Content c : contentPage) {
            contentStr = HTMLSpirit.delHTMLTag(c.getContent());
            if (contentStr.length() > 200) {
                contentStr = contentStr.substring(0,200) + " ...";
            }
            c.setContent(contentStr);
        }
        model.addAttribute("contentPage", contentPage);
        model.addAttribute("typeName", typeName);
        if (typeName.equalsIgnoreCase("introduce") || typeName.equalsIgnoreCase("business")){
            model.addAttribute("showTitle", false);
        } else {
            model.addAttribute("showTitle", true);
        }
        return "/admin/list";
    }

    @Autowired
    public void setContentService(ContentService contentService) {
        this.contentService = contentService;
    }
}
