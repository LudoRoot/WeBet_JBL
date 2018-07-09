package com.webet.controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webet.dao.ICiviliteJpaRepository;
import com.webet.dao.IEquipeJpaRepository;
import com.webet.dao.ILoginJpaRepository;
import com.webet.dao.IPariJpaRepository;
import com.webet.dao.IRencontreJpaRepository;
import com.webet.dao.ISportsJpaRepository;
import com.webet.entities.*;

@Controller
@RequestMapping("/custommercontroller")
public class CustommerController {

    @Autowired
    private IPariJpaRepository parirepo;

    @Autowired
    private ICiviliteJpaRepository civiliterepo;

    @Autowired
    private ILoginJpaRepository loginRepo;
    
    @Autowired
	private ISportsJpaRepository sportrepo;
    
	@Autowired
	private IEquipeJpaRepository equiperepo;
	
	@Autowired
	private IRencontreJpaRepository rencontrerepo;

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

    @RequestMapping("/gocreateparis")
    public String golistparis(@ModelAttribute(value = "rencontre") Rencontre rencontre,
	    @RequestParam(value = "betvalue", required = true) int somme, Model model) {

	Login logactif = AuthHelper.getLogin();

	Pari pari = new Pari();
	pari.setRencontre(rencontre);
	pari.setSomme(somme);
	pari.setClient(logactif.getClient());

	parirepo.save(pari);

	return "listeparis";
    }

    @RequestMapping("/golistparis")
    public String golistparis(Model model) {

	Login logmodif = AuthHelper.getLogin();

	Collection<Pari> listParis = parirepo.findPariByClient(logmodif.getClient());

	model.addAttribute("listparis", listParis);

	return "listeparis";
    }
    
    @RequestMapping("/gotoaffichedesrencontre")
    public String goToAfficheDesRencontre(Model model) {
	
	model.addAttribute("liste_sport", sportrepo.findAll());
	model.addAttribute("liste_rencontre", rencontrerepo.findAll());
	
	
	return "affichedesrencontres";
    }
    
    @RequestMapping("/dobet/{idrencontre}")
    public String dobet(Model model, @PathVariable(value = "idrencontre", required = true) Long idRencontre,  
    		@RequestParam(value = "mise", required = true) int mise) {
	
    	System.out.println("idrencontre= "+idRencontre+";  mise= "+mise);
    	
    	Login logmodif = AuthHelper.getLogin();
    	Client activeClient = logmodif.getClient();
    	Rencontre rencontre = rencontrerepo.getOne(idRencontre);
    	Pari nouveauPari = new Pari();
    	
    	nouveauPari.setClient(activeClient);
    	nouveauPari.setRencontre(rencontre);
    	nouveauPari.setSomme(mise);
    	parirepo.save(nouveauPari);
    	
    	model.addAttribute("liste_sport", sportrepo.findAll());
    	model.addAttribute("liste_rencontre", rencontrerepo.findAll());
    	
    	
    	return "affichedesrencontres";
    }
    
    

}
