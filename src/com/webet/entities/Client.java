package com.webet.entities;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotEmpty;

@Entity
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;

    @NotEmpty(message = "{error.champ.obligatoire}")
    private Date datenaissance;

    private int telfixe;

    private int mobile;

    @NotEmpty(message = "{error.champ.obligatoire}")
    private int numerorue;

    @NotEmpty(message = "{error.champ.obligatoire}")
    private String rue;

    @NotEmpty(message = "{error.champ.obligatoire}")
    private int codepostal;

    @NotEmpty(message = "{error.champ.obligatoire}")
    private String ville;

    private Double soldecompte;

    @NotEmpty(message = "{error.champ.obligatoire}")
    private int montantmax;

    // private Collection<Sports> mysports;
    private String mysports;

    public Client() {

    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public Date getDatenaissance() {
	return datenaissance;
    }

    public void setDatenaissance(Date datenaissance) {
	this.datenaissance = datenaissance;
    }

    public int getTelfixe() {
	return telfixe;
    }

    public void setTelfixe(int telfixe) {
	this.telfixe = telfixe;
    }

    public int getMobile() {
	return mobile;
    }

    public void setMobile(int mobile) {
	this.mobile = mobile;
    }

    public int getNumerorue() {
	return numerorue;
    }

    public void setNumerorue(int numerorue) {
	this.numerorue = numerorue;
    }

    public String getRue() {
	return rue;
    }

    public void setRue(String rue) {
	this.rue = rue;
    }

    public int getCodepostal() {
	return codepostal;
    }

    public void setCodepostal(int codepostal) {
	this.codepostal = codepostal;
    }

    public String getVille() {
	return ville;
    }

    public void setVille(String ville) {
	this.ville = ville;
    }

    public Double getSoldecompte() {
	return soldecompte;
    }

    public void setSoldecompte(Double soldecompte) {
	this.soldecompte = soldecompte;
    }

    public int getMontantmax() {
	return montantmax;
    }

    public void setMontantmax(int montantmax) {
	this.montantmax = montantmax;
    }

    // public Collection<Sports> getMysports() {
    // return mysports;
    // }
    //
    // public void setMysports(Collection<Sports> mysports) {
    // this.mysports = mysports;
    // }

    public String getMysports() {
	return mysports;
    }

    public void setMysports(String mysports) {
	this.mysports = mysports;
    }

    @Override
    public String toString() {
	return "Client [datedenaissance=" + datenaissance + ", mobile=" + mobile + ", soldecompte=" + soldecompte
		+ ", montantmax=" + montantmax + ", mysports=" + mysports + "]";
    }

}
