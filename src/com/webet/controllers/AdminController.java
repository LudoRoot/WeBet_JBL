package com.webet.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webet.dao.IEquipeJpaRepository;
import com.webet.dao.IRencontreJpaRepository;
import com.webet.dao.ISportsJpaRepository;
import com.webet.entities.Equipe;
import com.webet.entities.Rencontre;
import com.webet.entities.Sport;

@Controller
@RequestMapping("/admincontroller")
public class AdminController {
    @Autowired
    private ISportsJpaRepository sportrepo;
    @Autowired
    private IEquipeJpaRepository equiperepo;
    @Autowired
    private IRencontreJpaRepository rencontrerepo;

    @RequestMapping("/gotomenuadmin")
    public String gotomenuadmin(Model model) {

	model.addAttribute("sport", new Sport());
	model.addAttribute("liste_sport", sportrepo.findAll());
	model.addAttribute("equipe", new Equipe());
	model.addAttribute("liste_equipe", equiperepo.findAll());
	model.addAttribute("rencontre", new Rencontre());
	model.addAttribute("liste_rencontre", rencontrerepo.findAll());
	return "menuadmin";
    }

    @GetMapping("/gotomodifiersport/{id}")
    public String gotomodifiersport(@PathVariable("id") Long id, Model model) {
	Sport sport = sportrepo.getOne(id);
	model.addAttribute("liste_sport", sportrepo.findAll());
	model.addAttribute("sport", sport);
	model.addAttribute("equipe", new Equipe());
	model.addAttribute("liste_equipe", equiperepo.findAll());
	model.addAttribute("rencontre", new Rencontre());
	model.addAttribute("liste_rencontre", rencontrerepo.findAll());
	return "menuadmin";
    }

    @PostMapping("/modifiersport")
    public String modifiersport(@Valid @ModelAttribute(value = "usr") Sport sport, BindingResult result, Model model) {
	if (!result.hasErrors()) {
	    sportrepo.save(sport);
	}
	model.addAttribute("liste_sport", sportrepo.findAll());
	model.addAttribute("sport", new Sport());
	model.addAttribute("equipe", new Equipe());
	model.addAttribute("liste_equipe", equiperepo.findAll());
	model.addAttribute("rencontre", new Rencontre());
	model.addAttribute("liste_rencontre", rencontrerepo.findAll());

	return "menuadmin";
    }

    @SuppressWarnings("unused")
    @GetMapping("/supprimersport/{id}")
    public String supprimersport(@PathVariable("id") Long id, Model model) {
	sportrepo.deleteById(id);
	model.addAttribute("liste_sport", sportrepo.findAll());
	model.addAttribute("sport", new Sport());
	model.addAttribute("equipe", new Equipe());
	model.addAttribute("liste_equipe", equiperepo.findAll());
	model.addAttribute("rencontre", new Rencontre());
	model.addAttribute("liste_rencontre", rencontrerepo.findAll());
	return "menuadmin";
    }

    @GetMapping("/gotomodifierequipe/{id}")
    public String gotomodifierequipe(@PathVariable("id") Long id, Model model) {
	Equipe equipe = equiperepo.getOne(id);
	model.addAttribute("liste_equipe", equiperepo.findAll());
	model.addAttribute("equipe", equipe);
	model.addAttribute("liste_sport", sportrepo.findAll());
	model.addAttribute("sport", new Sport());
	model.addAttribute("rencontre", new Rencontre());
	model.addAttribute("liste_rencontre", rencontrerepo.findAll());
	return "menuadmin";
    }

    @PostMapping("/modifierequipe")
    public String modifierequipe(@Valid @ModelAttribute(value = "usr") Equipe equipe, BindingResult result,
	    Model model) {
	if (!result.hasErrors()) {
	    equiperepo.save(equipe);
	}
	model.addAttribute("liste_equipe", equiperepo.findAll());
	model.addAttribute("equipe", new Equipe());
	model.addAttribute("liste_sport", sportrepo.findAll());
	model.addAttribute("sport", new Sport());
	model.addAttribute("rencontre", new Rencontre());
	model.addAttribute("liste_rencontre", rencontrerepo.findAll());

	return "menuadmin";
    }

    @SuppressWarnings("unused")
    @GetMapping("/supprimerequipe/{id}")
    public String supprimerequipe(@PathVariable("id") Long id, Model model) {
	equiperepo.deleteById(id);
	model.addAttribute("liste_equipe", equiperepo.findAll());
	model.addAttribute("equipe", new Equipe());
	model.addAttribute("liste_sport", sportrepo.findAll());
	model.addAttribute("sport", new Sport());
	model.addAttribute("rencontre", new Rencontre());
	model.addAttribute("liste_rencontre", rencontrerepo.findAll());
	return "menuadmin";
    }
}
