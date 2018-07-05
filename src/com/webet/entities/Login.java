package com.webet.entities;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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

    @NotNull(message = "{error.champ.obligatoire}")
    @Enumerated(EnumType.STRING)
    private ERole role;

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

    @Override
    public String toString() {
	return "Login [email=" + email + "]";
    }

}
