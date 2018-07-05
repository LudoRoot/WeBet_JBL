package com.webet.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Rencontre {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne
    private Equipe equipe1;
    @OneToOne
    private Equipe equipe2;
    private Date date_debut;
    private Date date_fin;
    private int cote;
    private int resultat1;
    private int resultat2;

    public Rencontre() {

    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public Equipe getEquipe1() {
	return equipe1;
    }

    public void setEquipe1(Equipe equipe1) {
	this.equipe1 = equipe1;
    }

    public Equipe getEquipe2() {
	return equipe2;
    }

    public void setEquipe2(Equipe equipe2) {
	this.equipe2 = equipe2;
    }

    public Date getDate_debut() {
	return date_debut;
    }

    public void setDate_debut(Date date_debut) {
	this.date_debut = date_debut;
    }

    public Date getDate_fin() {
	return date_fin;
    }

    public void setDate_fin(Date date_fin) {
	this.date_fin = date_fin;
    }

    public int getCote() {
	return cote;
    }

    public void setCote(int cote) {
	this.cote = cote;
    }

    public int getResultat1() {
	return resultat1;
    }

    public void setResultat1(int resultat1) {
	this.resultat1 = resultat1;
    }

    public int getResultat2() {
	return resultat2;
    }

    public void setResultat2(int resultat2) {
	this.resultat2 = resultat2;
    }

}
