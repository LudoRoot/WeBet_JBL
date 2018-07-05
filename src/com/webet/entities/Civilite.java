package com.webet.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Civilite {

    @Id
    private Long id;
    private String abbreviation;

    public Civilite() {
	super();
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getAbbreviation() {
	return abbreviation;
    }

    public void setAbbreviation(String abbreviation) {
	this.abbreviation = abbreviation;
    }

    @Override
    public String toString() {
	return abbreviation;
    }

}
