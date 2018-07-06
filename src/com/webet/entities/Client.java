package com.webet.entities;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;

    @OneToOne
    private Civilite civ;

    @NotNull(message = "{error.champ.obligatoire}")
    @DateTimeFormat(pattern = "dd/mm/yyyy")
    private Date datenaissance;

    private String mobile;

    @NotEmpty(message = "{error.champ.obligatoire}")
    private String numerorue;

    @NotEmpty(message = "{error.champ.obligatoire}")
    private String rue;

    @NotEmpty(message = "{error.champ.obligatoire}")
    private String codepostal;

    @NotEmpty(message = "{error.champ.obligatoire}")
    private String ville;

    private Double soldecompte;

    @NotNull(message = "{error.champ.obligatoire}")
    private int montantmax;

    @OneToMany
    @JoinTable(name = "CLIENT_SPORT", joinColumns = @JoinColumn(name = "CLIENT_ID"), inverseJoinColumns = @JoinColumn(name = "SPORT_ID"))
    private Collection<Sport> mysports;

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

    public void setDatenaissance(String datenaissance) {
	this.datenaissance = new Date(datenaissance);
    }

    public String getMobile() {
	return mobile;
    }

    public void setMobile(String mobile) {
	this.mobile = mobile;
    }

    public String getNumerorue() {
	return numerorue;
    }

    public void setNumerorue(String numerorue) {
	this.numerorue = numerorue;
    }

    public String getRue() {
	return rue;
    }

    public void setRue(String rue) {
	this.rue = rue;
    }

    public String getCodepostal() {
	return codepostal;
    }

    public void setCodepostal(String codepostal) {
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

    public Collection<Sport> getMysports() {
	return mysports;
    }

    public void setMysports(Collection<Sport> mysports) {
	this.mysports = mysports;
    }

    public Civilite getCiv() {
	return civ;
    }

    public void setCiv(Civilite civ) {
	this.civ = civ;
    }

    @Override
    public String toString() {
	return "Client [datedenaissance=" + datenaissance + ", mobile=" + mobile + ", soldecompte=" + soldecompte
		+ ", montantmax=" + montantmax + ", mysports=" + mysports + "]";
    }

}
