package com.webet.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/securitycontroller")
public class SecurityController {

    @SuppressWarnings("unused")
    @GetMapping("/login")
    public String appLogin(@RequestParam(value = "error", required = false) Boolean error,
	    @RequestParam(value = "logout", required = false) Boolean logout) {

	return "menu";
    }

}
