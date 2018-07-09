package com.webet.entities;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class CiviliteTest {

	@Test
	public void testCivilitegetId() {
		Civilite civil = new Civilite();
		assertNull(civil.getId());
	}

	@Test
	public void testCivilitesetId() {
		Civilite civil = new Civilite();
		civil.setId(5l);
		assertTrue(civil.getId() == 5l);
	}

	@Test
	public void testCivilitegetAbbreviation() {
		Civilite civil = new Civilite();
		assertNull(civil.getAbbreviation());
	}

	@Test
	public void testCivilitesetAbbreviation() {
		Civilite civil = new Civilite();
		civil.setAbbreviation("essai");
		assertTrue(civil.getAbbreviation().equals("essai"));
	}
}
