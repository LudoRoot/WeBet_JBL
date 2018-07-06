package com.webet.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admincontroller")
public class AdminController {

    @RequestMapping("/gotoespaceadministration")
    public String goToEspacePerso(Model model) {

	return "espaceadministration";
    }

}
