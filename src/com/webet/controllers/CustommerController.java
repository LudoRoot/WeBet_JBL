package com.webet.controllers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webet.dao.ICiviliteJpaRepository;
import com.webet.dao.IClientJpaRepository;
import com.webet.dao.IEquipeJpaRepository;
import com.webet.dao.ILoginJpaRepository;
import com.webet.dao.IPariJpaRepository;
import com.webet.dao.IRencontreJpaRepository;
import com.webet.dao.ISportsJpaRepository;
import com.webet.entities.Client;
import com.webet.entities.Equipe;
import com.webet.entities.Login;
import com.webet.entities.Pari;
import com.webet.entities.Rencontre;

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

    @Autowired
    private IClientJpaRepository clientrepo;

    @RequestMapping("/gotoespaceperso")
    public String goToEspacePerso(Model model) {

	return "espacepersonnel";
    }

    @RequestMapping("/gomodifdataperso")
    public String goToMenu(Model model) {
	Login logmodif = AuthHelper.getLogin();
	Login log = loginRepo.getOne(logmodif.getId());
	log.setMdp("");
	model.addAttribute("login", log);
	model.addAttribute("listecivil", civiliterepo.findAll());
	return "inscription";
    }

    @RequestMapping("/gocreateparis")
    public String golistparis(@ModelAttribute(value = "rencontre") Rencontre rencontre,
	    @RequestParam(value = "betvalue", required = true) int somme, Model model) {

	Login logactif = AuthHelper.getLogin();
	Login log = loginRepo.getOne(logactif.getId());

	Pari pari = new Pari();
	pari.setRencontre(rencontre);
	pari.setSomme(somme);
	pari.setClient(log.getClient());
	model.addAttribute("activelogin", log);

	parirepo.save(pari);
	log.getClient().setSoldecompte(log.getClient().getSoldecompte() - somme);
	return "listeparis";

    }

    @RequestMapping("/golistparis")
    public String golistparis(Model model) {

	Login logmodif = AuthHelper.getLogin();
	Login log = loginRepo.getOne(logmodif.getId());

	Collection<Pari> listParis = parirepo.findPariByClient(log.getClient());

	model.addAttribute("listparis", listParis);
	model.addAttribute("activelogin", log);
	return "listeparis";
    }

    @RequestMapping("/gotoaffichedesrencontre")
    public String goToAfficheDesRencontre(Model model) {

	model.addAttribute("liste_sport", sportrepo.findAll());

	List<Rencontre> l = new ArrayList<Rencontre>();
	Date today = new Date();
	for (Rencontre r : rencontrerepo.findAll()) {
	    if (today.compareTo(r.getDate_fin()) < 0) {
		l.add(r);
	    }
	}
	model.addAttribute("liste_rencontre", l);

	Login logactif = AuthHelper.getLogin();

	Login log = loginRepo.getOne(logactif.getId());

	model.addAttribute("activelogin", log);

	return "affichedesrencontres";
    }

    @RequestMapping("/dobet/{idrencontre}")
    public String dobet(Model model, @PathVariable(value = "idrencontre", required = true) Long idRencontre,
	    @RequestParam(value = "mise", required = true) int mise,
	    @RequestParam(value = "choix", required = true) Long choix) {

	Login logmodif = AuthHelper.getLogin();
	Login log = loginRepo.getOne(logmodif.getId());
	Client activeClient = log.getClient();
	Rencontre rencontre = rencontrerepo.getOne(idRencontre);

	Pari nouveauPari = new Pari();

	nouveauPari.setClient(activeClient);
	nouveauPari.setRencontre(rencontre);
	nouveauPari.setSomme(mise);

	if (choix != 0) {
	    Equipe victoire = equiperepo.getOne(choix);
	    nouveauPari.setVainqueur(victoire);

	    if (choix == rencontre.getEquipe1().getId()) {
		double gain = nouveauPari.getRencontre().getCote1() * mise;
		nouveauPari.setGain(gain);
	    } else {
		double gain = nouveauPari.getRencontre().getCote2() * mise;
		nouveauPari.setGain(gain);
	    }
	} else {
	    Equipe victoire = null;
	    nouveauPari.setVainqueur(victoire);
	    double gain = nouveauPari.getRencontre().getCotenull() * mise;
	    nouveauPari.setGain(gain);
	}

	parirepo.save(nouveauPari);

	activeClient.setSoldecompte(activeClient.getSoldecompte() - mise);
	clientrepo.save(activeClient);

	model.addAttribute("liste_sport", sportrepo.findAll());

	List<Rencontre> l = new ArrayList<Rencontre>();
	Date today = new Date();
	for (Rencontre r : rencontrerepo.findAll()) {
	    if (today.compareTo(r.getDate_fin()) < 0) {
		l.add(r);
	    }
	}
	model.addAttribute("liste_rencontre", l);

	model.addAttribute("activelogin", log);

	return "affichedesrencontres";
    }

    @RequestMapping("/goaddmoney")
    public String goToAddMoney(Model model) {
	Login logactif = AuthHelper.getLogin();
	Login log = loginRepo.getOne(logactif.getId());

	model.addAttribute("activelogin", log);
	return "creditercompte";
    }

    @RequestMapping("/doaddmoney")
    public String doAddMoney(Model model, @RequestParam(value = "credit", required = true) Long credit) {

	Login logactif = AuthHelper.getLogin();
	Login log = loginRepo.getOne(logactif.getId());

	Client clientmodif = log.getClient();

	Double nouveausolde = clientmodif.getSoldecompte() + credit;

	clientmodif.setSoldecompte(nouveausolde);

	clientrepo.save(clientmodif);

	model.addAttribute("activelogin", log);
	return "espacepersonnel";
    }

    @RequestMapping("/gotomodbet")
    public String gotomodbet(Model model, @RequestParam(value = "betid", required = true) Long betid) {

	Login logactif = AuthHelper.getLogin();
	Login log = loginRepo.getOne(logactif.getId());

	Pari pariActif = parirepo.getOne(betid);
	Client clientactif = log.getClient();

	int mise = pariActif.getSomme();
	Double nouveauSolde = clientactif.getSoldecompte() + mise;
	clientactif.setSoldecompte(nouveauSolde);

	clientrepo.save(clientactif);

	model.addAttribute("bettomodif", pariActif);
	model.addAttribute("mise", mise);
	model.addAttribute("activelogin", log);

	return "modifbet";
    }

    @RequestMapping("/modbet/{betid}")
    public String modBet(Model model, @PathVariable(value = "betid", required = true) Long betid,
	    @RequestParam(value = "mise", required = true) int mise,
	    @RequestParam(value = "choix", required = true) Long choix) {

	Login logactif = AuthHelper.getLogin();
	Login log = loginRepo.getOne(logactif.getId());

	Pari pariActif = parirepo.getOne(betid);
	Client clientactif = log.getClient();

	Double nouveauSolde = clientactif.getSoldecompte() - mise;
	clientactif.setSoldecompte(nouveauSolde);

	clientrepo.save(clientactif);

	pariActif.setSomme(mise);

	if (choix != 0) {
	    Equipe victoire = equiperepo.getOne(choix);
	    pariActif.setVainqueur(victoire);

	    if (choix == pariActif.getRencontre().getEquipe1().getId()) {
		double gain = pariActif.getRencontre().getCote1() * mise;
		pariActif.setGain(gain);
	    } else {
		double gain = pariActif.getRencontre().getCote2() * mise;
		pariActif.setGain(gain);
	    }
	} else {
	    Equipe victoire = null;
	    pariActif.setVainqueur(victoire);
	    double gain = pariActif.getRencontre().getCote2() * mise;
	    pariActif.setGain(gain);
	}

	parirepo.save(pariActif);

	Collection<Pari> listParis = parirepo.findPariByClient(clientactif);
	model.addAttribute("listparis", listParis);

	model.addAttribute("activelogin", log);

	return "listeparis";
    }

    @RequestMapping("/delbet")
    public String delBet(Model model, @RequestParam(value = "betid", required = true) Long betid) {

	Login logactif = AuthHelper.getLogin();
	Login log = loginRepo.getOne(logactif.getId());

	Pari pariActif = parirepo.getOne(betid);
	Client clientactif = log.getClient();

	int mise = pariActif.getSomme();
	Double nouveauSolde = clientactif.getSoldecompte() + mise;
	clientactif.setSoldecompte(nouveauSolde);

	clientrepo.save(clientactif);

	parirepo.delete(pariActif);

	Collection<Pari> listParis = parirepo.findPariByClient(clientactif);
	model.addAttribute("listparis", listParis);

	model.addAttribute("activelogin", log);

	return "listeparis";
    }

}
