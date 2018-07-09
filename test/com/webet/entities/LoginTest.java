package com.webet.entities;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class LoginTest extends SpringTest {

	@Test
	public void testLogingetId() {
		Login log = new Login();
		assertNull(log.getId());
	}

	@Test
	public void testLoginsetId() {
		Login log = new Login();
		log.setId(4l);
		assertTrue(log.getId()==4l);
	}

	@Test
	public void testLogingetEmail() {
		Login log = new Login();
		assertNull(log.getEmail());
	}

	@Test
	public void testLoginsetEmail() {
		Login log = new Login();
		log.setEmail("mail");
		assertTrue(log.getEmail().equals("mail"));
	}

	@Test
	public void testLogingetMdp() {
		Login log = new Login();
		assertNull(log.getMdp());
	}

	@Test
	public void testLoginsetMdp() {
		Login log = new Login();
		log.setMdp("mail");
		assertTrue(log.getMdp().equals("mail"));
	}

	@Test
	public void testLogingetRole() {
		Login log = new Login();
		assertNull(log.getRole());
	}

	@Test
	public void testLoginsetRole() {
		Login log = new Login();
		log.setRole(ERole.ROLE_USER);
		assertTrue(log.getRole() == ERole.ROLE_USER);
	}

	@Test
	public void testLogingetNom() {
		Login log = new Login();
		assertNull(log.getNom());
	}

	@Test
	public void testLoginsetNom() {
		Login log = new Login();
		log.setNom("mail");
		assertTrue(log.getNom().equals("mail"));
	}

	@Test
	public void testLogingetPrenom() {
		Login log = new Login();
		assertNull(log.getPrenom());
	}

	@Test
	public void testLoginsetPrenom() {
		Login log = new Login();
		log.setPrenom("mail");
		assertTrue(log.getPrenom().equals("mail"));
	}

	@Test
	public void testLogingetClient() {
		Login log = new Login();
		assertNull(log.getClient());
	}

	@Test
	public void testLoginsetClient() {
		Login log = new Login();
		Client c = new Client();
		c.setCodepostal("31770");
		log.setClient(c);
		assertTrue(log.getClient().getCodepostal().equals("31770"));
	}
}
