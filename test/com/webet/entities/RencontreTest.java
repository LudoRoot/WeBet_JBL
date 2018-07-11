package com.webet.entities;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Date;

import org.junit.Test;

public class RencontreTest {

	@Test
	public void testRencontregetId() {
		Rencontre renc = new Rencontre();
		assertNull(renc.getId());
	}

	@Test
	public void testRencontresetId() {
		Rencontre renc = new Rencontre();
		renc.setId(5l);
		assertTrue(renc.getId() == 5l);
	}

	@Test
	public void testRencontregetEquipe1() {
		Rencontre renc = new Rencontre();
		assertNull(renc.getEquipe1());
	}

	@Test
	public void testRencontresetEquipe1() {
		Rencontre renc = new Rencontre();
		Equipe e = new Equipe();
		e.setNom("fr");
		renc.setEquipe1(e);
		assertTrue(renc.getEquipe1().getNom().equals("fr"));
	}

	@Test
	public void testRencontregetEquipe2() {
		Rencontre renc = new Rencontre();
		assertNull(renc.getEquipe2());
	}

	@Test
	public void testRencontresetEquipe2() {
		Rencontre renc = new Rencontre();
		Equipe e = new Equipe();
		e.setNom("fr");
		renc.setEquipe2(e);
		assertTrue(renc.getEquipe2().getNom().equals("fr"));
	}

	@Test
	public void testRencontregetDate_debut() {
		Rencontre renc = new Rencontre();
		assertNull(renc.getDate_debut());
	}

	@Test
	public void testRencontresetDate_debut() {
		Rencontre renc = new Rencontre();
		renc.setDate_debut(new Date(3000));
		assertTrue(renc.getDate_debut().compareTo(new Date(3000))==0);
	}

	@Test
	public void testRencontregetDate_fin() {
		Rencontre renc = new Rencontre();
		assertNull(renc.getDate_fin());
	}

	@Test
	public void testRencontresetDate_fin() {
		Rencontre renc = new Rencontre();
		renc.setDate_fin(new Date(3000));
		assertTrue(renc.getDate_fin().compareTo(new Date(3000))==0);
	}

	@Test
	public void testRencontregetCote1() {
		Rencontre renc = new Rencontre();
		assertTrue(renc.getCote1() == 0);
	}

	@Test
	public void testRencontresetCote1() {
		Rencontre renc = new Rencontre();
		renc.setCote1(2);
		assertTrue(renc.getCote1() == 2);
	}

	@Test
	public void testRencontregetCote2() {
		Rencontre renc = new Rencontre();
		assertTrue(renc.getCote2() == 0);
	}

	@Test
	public void testRencontresetCote2() {
		Rencontre renc = new Rencontre();
		renc.setCote2(2);
		assertTrue(renc.getCote2() == 2);
	}

	@Test
	public void testRencontregetCotenull() {
		Rencontre renc = new Rencontre();
		assertTrue(renc.getCotenull() == 0);
	}

	@Test
	public void testRencontresetCotenull() {
		Rencontre renc = new Rencontre();
		renc.setCotenull(2);
		assertTrue(renc.getCotenull() == 2);
	}

	@Test
	public void testRencontregetResultat1() {
		Rencontre renc = new Rencontre();
		assertTrue(renc.getResultat1() == 0);
	}

	@Test
	public void testRencontresetResultat1() {
		Rencontre renc = new Rencontre();
		renc.setResultat1(2);
		assertTrue(renc.getResultat1() == 2);
	}

	@Test
	public void testRencontregetResultat2() {
		Rencontre renc = new Rencontre();
		assertTrue(renc.getResultat2() == 0);
	}

	@Test
	public void testRencontresetResultat2() {
		Rencontre renc = new Rencontre();
		renc.setResultat2(2);
		assertTrue(renc.getResultat2() == 2);
	}

	@Test
	public void testRencontregetTerminee() {
		Rencontre renc = new Rencontre();
		assertTrue(renc.isTerminee() == false);
	}

	@Test
	public void testRencontresetTerminee() {
		Rencontre renc = new Rencontre();
		renc.setTerminee(true);
		assertTrue(renc.isTerminee() == true);
	}

}
