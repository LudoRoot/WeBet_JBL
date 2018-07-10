package com.webet.entities;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Entity
public class Login {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;

    @NotEmpty(message = "{error.champ.obligatoire}")
    @Email(message = "{error.utilisateur.email.malforme}")
    private String email;

    @NotEmpty(message = "{error.champ.obligatoire}")
    private String mdp;

    // @NotNull(message = "{error.champ.obligatoire}")
    @Enumerated(EnumType.STRING)
    private ERole role;

    @NotNull(message = "{error.champ.obligatoire}")
    private String nom;

    @NotNull(message = "{error.champ.obligatoire}")
    private String prenom;

    @Valid
    @OneToOne
    private Client client;

    public Login() {

    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    public String getMdp() {
	return mdp;
    }

    public void setMdp(String mdp) {
	this.mdp = mdp;
    }

    public ERole getRole() {
	return role;
    }

    public void setRole(ERole role) {
	this.role = role;
    }

    public String getNom() {
	return nom;
    }

    public void setNom(String nom) {
	this.nom = nom;
    }

    public String getPrenom() {
	return prenom;
    }

    public void setPrenom(String prenom) {
	this.prenom = prenom;
    }

    public Client getClient() {
	return client;
    }

    public void setClient(Client client) {
	this.client = client;
    }

    @Override
    public String toString() {
	return "Login [email=" + email + ", role=" + role + ", nom=" + nom + ", prenom=" + prenom + ", client=" + client
		+ "]";
    }

}
