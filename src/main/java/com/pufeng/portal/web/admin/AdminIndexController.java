package com.pufeng.portal.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * User: Juchen
 * Date: 13-7-5
 * Time: 上午11:01
 */
@Controller
@RequestMapping (value = "/admin/index")
public class AdminIndexController {

    @RequestMapping (method = RequestMethod.GET)
    public String index(){
        return "admin/index";
    }
}
