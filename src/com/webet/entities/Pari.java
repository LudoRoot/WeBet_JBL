package com.webet.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Pari {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne
    private Client client;
    @OneToOne
    private Rencontre rencontre;
    private int somme;
    private Double gain;
    @OneToOne
    private Equipe vainqueur;

    public Pari() {

    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public Client getClient() {
	return client;
    }

    public void setClient(Client client) {
	this.client = client;
    }

    public Rencontre getRencontre() {
	return rencontre;
    }

    public void setRencontre(Rencontre rencontre) {
	this.rencontre = rencontre;
    }

    public int getSomme() {
	return somme;
    }

    public void setSomme(int somme) {
	this.somme = somme;
    }

    public Double getGain() {
	return gain;
    }

    public void setGain(Double gain) {
	this.gain = gain;
    }

    public Equipe getVainqueur() {
	return vainqueur;
    }

    public void setVainqueur(Equipe vainqueur) {
	this.vainqueur = vainqueur;
    }

}
