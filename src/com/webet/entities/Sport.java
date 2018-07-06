package com.webet.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Sport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nomSport;

    public Sport() {
	super();
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getNomSport() {
	return nomSport;
    }

    public void setNomSport(String nomSport) {
	this.nomSport = nomSport;
    }

    @Override
    public String toString() {
	return "Sport [nomSport=" + nomSport + "]";
    }

}
