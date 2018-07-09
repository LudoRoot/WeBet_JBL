package com.webet.entities;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class EquipeTest extends SpringTest {

	@Test
	public void testEquipegetId() {
		Equipe eq = new Equipe();
		assertNull(eq.getId());
	}
	
	@Test
	public void testEquipesetId() {
		Equipe eq = new Equipe();
		eq.setId(4l);
		assertTrue(eq.getId() == 4l);
	}
	
	@Test
	public void testEquipegetNom() {
		Equipe eq = new Equipe();
		assertNull(eq.getNom());
	}
	
	@Test
	public void testEquipesetNom() {
		Equipe eq = new Equipe();
		eq.setNom("fr");
		assertTrue(eq.getNom().equals("fr"));
	}
	
	@Test
	public void testEquipegetSport() {
		Equipe eq = new Equipe();
		assertNull(eq.getSport());
	}
	
	@Test
	public void testEquipesetSport() {
		Equipe eq = new Equipe();
		Sport sp = new Sport();
		sp.setNomSport("foot");
		eq.setSport(sp);
		assertTrue(eq.getSport().getNomSport().equals("foot"));
	}
}
