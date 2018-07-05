package com.webet.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webet.dao.IClientJpaRepository;
import com.webet.dao.ILoginJpaRepository;
import com.webet.entities.Client;
import com.webet.entities.Login;

@Controller
@RequestMapping("/logincontroller")
public class LoginControllers {

    @Autowired
    private ILoginJpaRepository loginRepo;
    @Autowired
    private IClientJpaRepository clientrepo;

    @RequestMapping("/gotomenu")
    public String goToMenu(Model model) {
	Login login = new Login();
	model.addAttribute("login", login);
	return "menu";
    }

    @RequestMapping("/checklogin")
    public String checklogin(@ModelAttribute(value = "login") Login login, Model model) {

	Login logcheck = loginRepo.findLoginByPwdEmail(login.getMdp(), login.getEmail());

	if (logcheck == null) {
	    model.addAttribute("login", login);
	    model.addAttribute("MessageErreurLog", "Veuillez réessayer de vous loguer");
	    return "menu";
	}

	return "menu";
    }

    @RequestMapping("/gotoinscription")
    public String goToInscription(Model model) {
	Client client = new Client();
	Login login = new Login();
	login.setClient(client);
	model.addAttribute("login", login);
	return "inscription";
    }

    @RequestMapping("/createlogin")
    public String CreateLogin(@Valid @ModelAttribute(value = "login") Login login, Model model, BindingResult result) {

	System.out.println(login);

	if (loginRepo.findByEmail(login.getEmail()) != null) {
	    ObjectError error = new ObjectError("login", "Email already used");
	    result.addError(error);
	}

	/*
	 * 1) appel au dao pour requete 2) test if existe ou pas 2.2) si existe creation
	 * d'un ObjectError 3) ajout de l'ObjectErrordans result
	 */

	if (!result.hasErrors()) {

	    encodePassword(login);
	    clientrepo.save(login.getClient());
	    loginRepo.save(login);
	    model.addAttribute("login", login);
	    return "menu";
	}

	model.addAttribute("login", login);
	return "inscription";
    }

    private static void encodePassword(Login login) {
	String rawPassword = login.getMdp();
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	String encodedPassword = encoder.encode(rawPassword);
	login.setMdp(encodedPassword);
    }

}
