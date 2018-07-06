package com.webet.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webet.dao.ICiviliteJpaRepository;
import com.webet.dao.ILoginJpaRepository;
import com.webet.entities.Login;

@Controller
@RequestMapping("/custommercontroller")
public class CustommerController {

    @Autowired
    private ICiviliteJpaRepository civiliterepo;

    @Autowired
    private ILoginJpaRepository loginRepo;

    @RequestMapping("/gotoespaceperso")
    public String goToEspacePerso(Model model) {

	return "espacepersonnel";
    }

    @RequestMapping("/gomodifdataperso")
    public String goToMenu(Model model) {
	Login logmodif = AuthHelper.getLogin();
	logmodif.setMdp("");
	model.addAttribute("login", logmodif);
	model.addAttribute("listecivil", civiliterepo.findAll());
	return "inscription";
    }

    @RequestMapping("/golistparis")
    public String golistparis(Model model) {

	return "listeparis";
    }

}
