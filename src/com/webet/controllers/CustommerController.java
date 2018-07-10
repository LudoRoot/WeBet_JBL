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
	logactif.getClient().setSoldecompte(logactif.getClient().getSoldecompte() - somme);
	return "listeparis";

    }

    @RequestMapping("/golistparis")
    public String golistparis(Model model) {

	Login logmodif = AuthHelper.getLogin();

	Collection<Pari> listParis = parirepo.findPariByClient(logmodif.getClient());

	model.addAttribute("listparis", listParis);
	model.addAttribute("activelogin", logmodif);
	return "listeparis";
    }

    @RequestMapping("/gotoaffichedesrencontre")
    public String goToAfficheDesRencontre(Model model) {

	model.addAttribute("liste_sport", sportrepo.findAll());
	model.addAttribute("liste_rencontre", rencontrerepo.findAll());

	Login logactif = AuthHelper.getLogin();
	model.addAttribute("activelogin", logactif);

	return "affichedesrencontres";
    }

    @RequestMapping("/dobet/{idrencontre}")
    public String dobet(Model model, @PathVariable(value = "idrencontre", required = true) Long idRencontre,
	    @RequestParam(value = "mise", required = true) int mise,
	    @RequestParam(value = "choix", required = true) Long choix) {

	Login logmodif = AuthHelper.getLogin();
	Client activeClient = logmodif.getClient();
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
	model.addAttribute("liste_rencontre", rencontrerepo.findAll());

	model.addAttribute("activelogin", logmodif);

	return "affichedesrencontres";
    }

    @RequestMapping("/goaddmoney")
    public String goToAddMoney(Model model) {
	Login logactif = AuthHelper.getLogin();
	model.addAttribute("activelogin", logactif);
	return "creditercompte";
    }

    @RequestMapping("/doaddmoney")
    public String doAddMoney(Model model, @RequestParam(value = "credit", required = true) Long credit) {

	Login logactif = AuthHelper.getLogin();

	Client clientmodif = logactif.getClient();

	Double nouveausolde = clientmodif.getSoldecompte() + credit;

	clientmodif.setSoldecompte(nouveausolde);

	clientrepo.save(clientmodif);

	model.addAttribute("activelogin", logactif);
	return "espacepersonnel";
    }

    @RequestMapping("/gotomodbet")
    public String gotomodbet(Model model, @RequestParam(value = "betid", required = true) Long betid) {

	Login logactif = AuthHelper.getLogin();
	Pari pariActif = parirepo.getOne(betid);
	Client clientactif = logactif.getClient();

	int mise = pariActif.getSomme();
	Double nouveauSolde = clientactif.getSoldecompte() + mise;
	clientactif.setSoldecompte(nouveauSolde);

	clientrepo.save(clientactif);

	model.addAttribute("bettomodif", pariActif);
	model.addAttribute("mise", mise);
	model.addAttribute("activelogin", logactif);

	return "modifbet";
    }

    @RequestMapping("/modbet/{betid}")
    public String modBet(Model model, @PathVariable(value = "betid", required = true) Long betid,
	    @RequestParam(value = "mise", required = true) int mise,
	    @RequestParam(value = "choix", required = true) Long choix) {

	Login logactif = AuthHelper.getLogin();
	Pari pariActif = parirepo.getOne(betid);
	Client clientactif = logactif.getClient();

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

	model.addAttribute("activelogin", logactif);

	return "listeparis";
    }

    @RequestMapping("/delbet")
    public String delBet(Model model, @RequestParam(value = "betid", required = true) Long betid) {

	Login logactif = AuthHelper.getLogin();
	Pari pariActif = parirepo.getOne(betid);
	Client clientactif = logactif.getClient();

	int mise = pariActif.getSomme();
	Double nouveauSolde = clientactif.getSoldecompte() + mise;
	clientactif.setSoldecompte(nouveauSolde);

	clientrepo.save(clientactif);

	parirepo.delete(pariActif);

	Collection<Pari> listParis = parirepo.findPariByClient(clientactif);
	model.addAttribute("listparis", listParis);

	model.addAttribute("activelogin", logactif);

	return "listeparis";
    }

}
