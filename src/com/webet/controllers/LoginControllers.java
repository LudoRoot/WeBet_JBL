package com.webet.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webet.dao.ILoginJpaRepository;
import com.webet.entities.Login;

@Controller
@RequestMapping("/logincontroller")
public class LoginControllers {

    @Autowired
    private ILoginJpaRepository loginRepo;

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
	Login login = new Login();
	model.addAttribute("login", login);
	return "inscription";
    }

    @RequestMapping("/createlogin")
    public String CreateLogin(@Valid @ModelAttribute(value = "login") Login login, Model model, BindingResult result) {

	if (!result.hasErrors()) {
	    if (loginRepo.findByEmail(login.getEmail()) == null) {
		encodePassword(login);
		loginRepo.save(login);
		model.addAttribute("login", login);
		return "menu";
	    }

	    result.rejectValue("email", "error.user", "An account already exists for this email.");
	    model.addAttribute("login", login);
	    return "inscription";
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
