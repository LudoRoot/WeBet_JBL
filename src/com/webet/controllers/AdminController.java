package com.webet.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webet.dao.IEquipeJpaRepository;
import com.webet.dao.IPariJpaRepository;
import com.webet.dao.IRencontreJpaRepository;
import com.webet.dao.ISportsJpaRepository;
import com.webet.entities.Equipe;
import com.webet.entities.Rencontre;
import com.webet.entities.Sport;

@Secured({"ROLE_ADMIN"})
@Controller
@RequestMapping("/admincontroller")
public class AdminController {
	@Autowired
	private ISportsJpaRepository sportrepo;
	@Autowired
	private IEquipeJpaRepository equiperepo;
	@Autowired
	private IRencontreJpaRepository rencontrerepo;
	@Autowired
	private IPariJpaRepository parirepo;

	@RequestMapping("/gotomenuadmin")
	public String gotomenuadmin(Model model) {

		model.addAttribute("sport", new Sport());
		model.addAttribute("liste_sport", sportrepo.findAll());
		model.addAttribute("equipe", new Equipe());
		model.addAttribute("liste_equipe", equiperepo.findAll());
		model.addAttribute("rencontre", new Rencontre());
		model.addAttribute("liste_rencontre", rencontrerepo.findAll());
		model.addAttribute("liste_pari", parirepo.findAll());
		return "espaceadministration";
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
		model.addAttribute("liste_pari", parirepo.findAll());
		return "espaceadministration";
	}

	@PostMapping("/modifiersport")
	public String modifiersport(@Valid @ModelAttribute(value = "sport") Sport sport, BindingResult result, Model model) {
		if (!result.hasErrors()) {
			sportrepo.save(sport);
		}
		model.addAttribute("liste_sport", sportrepo.findAll());
		model.addAttribute("sport", new Sport());
		model.addAttribute("equipe", new Equipe());
		model.addAttribute("liste_equipe", equiperepo.findAll());
		model.addAttribute("rencontre", new Rencontre());
		model.addAttribute("liste_rencontre", rencontrerepo.findAll());
		model.addAttribute("liste_pari", parirepo.findAll());

		return "espaceadministration";
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
		model.addAttribute("liste_pari", parirepo.findAll());
		return "espaceadministration";
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
		model.addAttribute("liste_pari", parirepo.findAll());
		return "espaceadministration";
	}

	@PostMapping("/modifierequipe")
	public String modifierequipe(@Valid @ModelAttribute(value = "equipe") Equipe equipe, BindingResult result,
			Model model) {
		boolean b = false;
		for(Rencontre r : rencontrerepo.findAll()) {
			if( (equipe.getId().longValue() == r.getEquipe1().getId().longValue() )
			 || (equipe.getId().longValue() == r.getEquipe2().getId().longValue() ) ) {
				b = true;
			}
		}
		if(b) {
		    ObjectError error = new ObjectError("equipe", "Already in a meeting");
		    result.addError(error);
		}
		
		if (!result.hasErrors()) {
			equiperepo.save(equipe);
		}
		model.addAttribute("liste_equipe", equiperepo.findAll());
		model.addAttribute("equipe", new Equipe());
		model.addAttribute("liste_sport", sportrepo.findAll());
		model.addAttribute("sport", new Sport());
		model.addAttribute("rencontre", new Rencontre());
		model.addAttribute("liste_rencontre", rencontrerepo.findAll());
		model.addAttribute("liste_pari", parirepo.findAll());

		return "espaceadministration";
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
		model.addAttribute("liste_pari", parirepo.findAll());
		return "espaceadministration";
	}

	@GetMapping("/chargerequipeparsport/{id}")
	public String chargerequipeparsport(@PathVariable("id") Long id, Model model) {
		List<Equipe> liste_equipe = equiperepo.findTeamBySport(id);
		model.addAttribute("liste_equipe2", liste_equipe);
		model.addAttribute("equipe", new Equipe());
		model.addAttribute("liste_equipe", equiperepo.findAll());
		model.addAttribute("equipe", new Equipe());
		model.addAttribute("liste_sport", sportrepo.findAll());
		model.addAttribute("sport", new Sport());
		model.addAttribute("rencontre", new Rencontre());
		model.addAttribute("liste_rencontre", rencontrerepo.findAll());
		model.addAttribute("liste_pari", parirepo.findAll());
		return "espaceadministration";
	}
	
	@GetMapping("/gotomodifierrencontre/{id}")
	public String gotomodifierrencontre(@PathVariable("id") Long id, Model model) {
		Rencontre rencontre = rencontrerepo.getOne(id);
		model.addAttribute("liste_equipe", equiperepo.findAll());
		model.addAttribute("liste_equipe2", equiperepo.findAll());
		model.addAttribute("equipe", new Equipe());
		model.addAttribute("liste_sport", sportrepo.findAll());
		model.addAttribute("sport", new Sport());
		model.addAttribute("rencontre", rencontre);
		model.addAttribute("liste_rencontre", rencontrerepo.findAll());
		model.addAttribute("liste_pari", parirepo.findAll());
		return "espaceadministration";
	}

	@PostMapping("/modifierrencontre")
	public String modifierrencontre(@Valid @ModelAttribute(value = "rencontre") Rencontre rencontre, BindingResult result,
			Model model) {
		if(rencontre.getEquipe1().getId().longValue() == rencontre.getEquipe2().getId().longValue()) { 
		    ObjectError error = new ObjectError("rencontre", "Same teams");
		    result.addError(error);
		}
		if(rencontre.getDate_debut().compareTo(rencontre.getDate_fin()) >= 0) {
		    ObjectError error = new ObjectError("rencontre", "Date not chronological");
		    result.addError(error);
		}
		
		if (!result.hasErrors()) {
			rencontre.setTerminee(false);
			rencontrerepo.save(rencontre);
		}
		
		model.addAttribute("liste_equipe", equiperepo.findAll());
		model.addAttribute("liste_equipe2", equiperepo.findAll());
		model.addAttribute("equipe", new Equipe());
		model.addAttribute("liste_sport", sportrepo.findAll());
		model.addAttribute("sport", new Sport());
		model.addAttribute("rencontre", new Rencontre());
		model.addAttribute("liste_rencontre", rencontrerepo.findAll());
		model.addAttribute("liste_pari", parirepo.findAll());

		return "espaceadministration";
	}

	@SuppressWarnings("unused")
	@GetMapping("/supprimerrencontre/{id}")
	public String supprimerrencontre(@PathVariable("id") Long id, Model model) {
		rencontrerepo.deleteById(id);
		model.addAttribute("liste_equipe", equiperepo.findAll());
		model.addAttribute("liste_equipe2", equiperepo.findAll());
		model.addAttribute("equipe", new Equipe());
		model.addAttribute("liste_sport", sportrepo.findAll());
		model.addAttribute("sport", new Sport());
		model.addAttribute("rencontre", new Rencontre());
		model.addAttribute("liste_rencontre", rencontrerepo.findAll());
		model.addAttribute("liste_pari", parirepo.findAll());
		return "espaceadministration";
	}

	@PostMapping("/clorerencontre")
	public String clorerencontre(@Valid @ModelAttribute(value = "rencontre") Rencontre rencontre, BindingResult result,
			Model model) {
		if (!result.hasErrors()) {
			rencontre.setTerminee(true);
			rencontrerepo.save(rencontre);
		}
		
		model.addAttribute("liste_equipe", equiperepo.findAll());
		model.addAttribute("liste_equipe2", equiperepo.findAll());
		model.addAttribute("equipe", new Equipe());
		model.addAttribute("liste_sport", sportrepo.findAll());
		model.addAttribute("sport", new Sport());
		model.addAttribute("rencontre", new Rencontre());
		model.addAttribute("liste_rencontre", rencontrerepo.findAll());
		model.addAttribute("liste_pari", parirepo.findAll());

		return "espaceadministration";
	}

}
