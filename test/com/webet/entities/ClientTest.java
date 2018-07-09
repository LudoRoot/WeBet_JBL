package com.webet.entities;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Date;

import org.junit.Test;

public class ClientTest extends SpringTest {

	@Test
	public void testClientgetId() {
		Client client = new Client();
		assertNull(client.getId());
	}

	@Test
	public void testClientsetId() {
		Client client = new Client();
		client.setId(5l);
		assertTrue(client.getId() == 5l);
	}

	@Test
	public void testClientgetCivilite() {
		Client client = new Client();
		assertNull(client.getCiv());
	}

	@Test
	public void testClientsetCivilite() {
		Client client = new Client();
		Civilite c = new Civilite();
		String str = "Mr";
		c.setAbbreviation(str);
		client.setCiv(c);
		assertTrue(client.getCiv().getAbbreviation().equals(str));
	}

	@Test
	public void testRencontregetDatenaissance() {
		Client client = new Client();
		assertNull(client.getDatenaissance());
	}

	@Test
	public void testRencontresetDatenaissance() {
		Client client = new Client();
		client.setDatenaissance(new Date(3000));
		assertTrue(client.getDatenaissance().compareTo(new Date(3000))==0);
	}

	@Test
	public void testClientgetMobile() {
		Client client = new Client();
		assertNull(client.getMobile());
	}

	@Test
	public void testClientsetMobile() {
		Client client = new Client();
		String str = "Mr";
		client.setMobile(str);
		assertTrue(client.getMobile().equals(str));
	}

	@Test
	public void testClientgetNumerorue() {
		Client client = new Client();
		assertNull(client.getNumerorue());
	}

	@Test
	public void testClientsetNumerorue() {
		Client client = new Client();
		String str = "Mr";
		client.setNumerorue(str);
		assertTrue(client.getNumerorue().equals(str));
	}

	@Test
	public void testClientgetRue() {
		Client client = new Client();
		assertNull(client.getRue());
	}

	@Test
	public void testClientsetRue() {
		Client client = new Client();
		String str = "Mr";
		client.setRue(str);
		assertTrue(client.getRue().equals(str));
	}

	@Test
	public void testClientgetCodepostal() {
		Client client = new Client();
		assertNull(client.getCodepostal());
	}

	@Test
	public void testClientsetCodepostal() {
		Client client = new Client();
		String str = "Mr";
		client.setCodepostal(str);
		assertTrue(client.getCodepostal().equals(str));
	}

	@Test
	public void testClientgetVille() {
		Client client = new Client();
		assertNull(client.getVille());
	}

	@Test
	public void testClientsetVille() {
		Client client = new Client();
		String str = "Mr";
		client.setVille(str);
		assertTrue(client.getVille().equals(str));
	}

	@Test
	public void testClientgetSoldecompte() {
		Client client = new Client();
		assertNull(client.getSoldecompte());
	}

	@Test
	public void testClientsetSoldecompte() {
		Client client = new Client();
		client.setSoldecompte(5d);
		assertTrue(client.getSoldecompte()==5d);
	}

	@Test
	public void testClientgetMontantmax() {
		Client client = new Client();
		assertTrue(client.getMontantmax() == 0);
	}

	@Test
	public void testClientsetMontantmax() {
		Client client = new Client();
		client.setMontantmax(5);
		assertTrue(client.getMontantmax()==5);
	}
	
}
