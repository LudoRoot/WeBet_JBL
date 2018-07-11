package com.webet.entities;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class PariTest extends SpringTest {

	@Test
	public void testParigetId() {
		Pari p = new Pari();
		assertNull(p.getId());
	}
	
	@Test
	public void testParisetId() {
		Pari p = new Pari();
		p.setId(4l);
		assertTrue(p.getId() == 4l);
	}

	@Test
	public void testParigetClient() {
		Pari p = new Pari();
		assertNull(p.getClient());
	}
	
	@Test
	public void testParisetClient() {
		Pari p = new Pari();
		Client c = new Client();
		c.setCodepostal("31770");
		p.setClient(c);
		assertTrue(p.getClient().getCodepostal().equals("31770"));
	}

	@Test
	public void testParigetRencontre() {
		Pari p = new Pari();
		assertNull(p.getRencontre());
	}
	
	@Test
	public void testParisetRencontre() {
		Pari p = new Pari();
		Rencontre r = new Rencontre();
		r.setResultat1(6);
		p.setRencontre(r);
		assertTrue(p.getRencontre().getResultat1()==6);
	}

	@Test
	public void testParigetSomme() {
		Pari p = new Pari();
		assertTrue(p.getSomme()==0);
	}
	
	@Test
	public void testParisetSomme() {
		Pari p = new Pari();
		p.setSomme(8);
		assertTrue(p.getSomme()==8);
	}

	@Test
	public void testParigetGain() {
		Pari p = new Pari();
		assertNull(p.getGain());
	}
	
	@Test
	public void testParisetGain() {
		Pari p = new Pari();
		p.setGain(8d);
		assertTrue(p.getGain()==8d);
	}

	@Test
	public void testParigetVainqueur() {
		Pari p = new Pari();
		assertNull(p.getVainqueur());
	}
	
	@Test
	public void testParisetVainqueur() {
		Pari p = new Pari();
		Equipe v = new Equipe();
		v.setNom("win");
		p.setVainqueur(v);
		assertTrue(p.getVainqueur().getNom().equals("win"));
	}
}
