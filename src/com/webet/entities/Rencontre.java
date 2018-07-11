package com.webet.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Rencontre {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotNull(message = "{error.champ.obligatoire}")
    @OneToOne
    private Equipe equipe1;
    @NotNull(message = "{error.champ.obligatoire}")
    @OneToOne
    private Equipe equipe2;
    @NotNull(message = "{error.champ.obligatoire}")
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
    private Date date_debut;
    @NotNull(message = "{error.champ.obligatoire}")
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
    private Date date_fin;
    private double cote1, cote2, cotenull;
    private int resultat1;
    private int resultat2;
    private boolean terminee;

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

    public double getCote1() {
	return cote1;
    }

    public void setCote1(double cote1) {
	this.cote1 = cote1;
    }

    public double getCote2() {
	return cote2;
    }

    public void setCote2(double cote2) {
	this.cote2 = cote2;
    }

    public double getCotenull() {
	return cotenull;
    }

    public void setCotenull(double cotenull) {
	this.cotenull = cotenull;
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

    public boolean isTerminee() {
		return terminee;
	}

	public void setTerminee(boolean terminee) {
		this.terminee = terminee;
	}

	@Override
    public String toString() {
	return "Rencontre [equipe1=" + equipe1 + ", equipe2=" + equipe2 + ", date_debut=" + date_debut + ", date_fin="
		+ date_fin + ", cote1=" + cote1 + ", cote2=" + cote2 + ", cotenull=" + cotenull + ", resultat1="
		+ resultat1 + ", resultat2=" + resultat2 + "]";
    }

}
