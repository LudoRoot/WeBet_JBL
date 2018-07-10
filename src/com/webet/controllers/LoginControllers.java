package com.webet.controllers;

import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webet.dao.ICiviliteJpaRepository;
import com.webet.dao.IClientJpaRepository;
import com.webet.dao.ILoginJpaRepository;
import com.webet.dao.IRencontreJpaRepository;
import com.webet.dao.ISportsJpaRepository;
import com.webet.entities.Client;
import com.webet.entities.ERole;
import com.webet.entities.Login;

@Controller
@RequestMapping("/logincontroller")
public class LoginControllers {

    @Autowired
    private ILoginJpaRepository loginRepo;
    @Autowired
    private IClientJpaRepository clientrepo;
    @Autowired
    private ICiviliteJpaRepository civiliterepo;
    @Autowired
    private ISportsJpaRepository sportsrepo;
    @Autowired
    private IRencontreJpaRepository rencontrerepo;

    @RequestMapping("/gotomenu")
    public String goToMenu(@RequestParam(value = "error", required = false) Boolean error,
	    @RequestParam(value = "logout", required = false) Boolean logout, Model model) {
	Login login = new Login();
	model.addAttribute("login", login);

	model.addAttribute("liste_sport", sportsrepo.findAll());
	model.addAttribute("liste_rencontre", rencontrerepo.findAll());

	return "menu";
    }

    @RequestMapping("/checklogin")
    public String checklogin(@ModelAttribute(value = "login") Login login, Model model) {

	Login logcheck = loginRepo.findLoginByPwdEmail(login.getMdp(), login.getEmail());

	if (logcheck == null) {
	    model.addAttribute("login", login);
	    model.addAttribute("MessageErreurLog", "Veuillez r�essayer de vous loguer");
	    return "menu";
	}
	return "espacepersonnel";
    }

    @RequestMapping("/dispatchbyrole")
    public String dispatchbyrole(Model model) {

	Login logactif = AuthHelper.getLogin();

	System.out.println(logactif.getRole().toString());

	if (logactif.getRole().equals(ERole.ROLE_ADMIN)) {
	    return "redirect:/admincontroller/gotomenuadmin";
	}

	model.addAttribute("activelogin", logactif);
	return "espacepersonnel";

    }

    @RequestMapping("/gotoinscription")
    public String goToInscription(Model model) {
	Client client = new Client();
	Login login = new Login();
	login.setClient(client);
	model.addAttribute("login", login);
	model.addAttribute("listecivil", civiliterepo.findAll());
	model.addAttribute("listesport", sportsrepo.findAll());
	return "inscription";
    }

    @RequestMapping("/createlogin")
    public String createLogin(@Valid @ModelAttribute(value = "login") Login login, BindingResult result, Model model) {
	if (loginRepo.findByEmail(login.getEmail()) != null) { // verification si l'email renseign� existe d�j�.
	    ObjectError error = new ObjectError("login", "Email already used");
	    result.addError(error);
	}

	Date check18 = new Date();
	int y = check18.getYear();
	check18.setYear(y - 18);

	if (login.getClient().getDatenaissance().compareTo(check18) > 0) {
	    ObjectError error = new ObjectError("login", "Vous devez etre majeur pour vous inscrire");
	    result.addError(error);
	}

	/*
	 * 1) appel au dao pour requete 2) test if existe ou pas 2.2) si existe creation
	 * d'un ObjectError 3) ajout de l'ObjectError dans result
	 */

	if (!result.hasErrors()) {
	    login.setRole(ERole.ROLE_USER);
	    encodePassword(login);
	    login.getClient().setSoldecompte(100d);
	    clientrepo.save(login.getClient());
	    loginRepo.save(login);
	    return "menu";
	}

	model.addAttribute("listecivil", civiliterepo.findAll());
	model.addAttribute("login", login);
	return "inscription";

    }

    @RequestMapping("/modiflogin")
    public String modifLogin(@Valid @ModelAttribute(value = "login") Login login, BindingResult result, Model model) {

	if (!result.hasErrors()) {

	    encodePassword(login);
	    clientrepo.save(login.getClient());
	    loginRepo.save(login);
	    return "espacepersonnel";
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
