package com.webet.entities;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class SportTest extends SpringTest {

	@Test
	public void testSportgetId() {
		Sport sport = new Sport();
		assertNull(sport.getId());
	}

	@Test
	public void testSportsetId() {
		Sport sport = new Sport();
		sport.setId(5l);
		assertTrue(sport.getId() == 5l);
	}

	@Test
	public void testSportgetNomSport() {
		Sport sport = new Sport();
		assertNull(sport.getNomSport());
	}

	@Test
	public void testSportsetNomSport() {
		Sport sport = new Sport();
		sport.setNomSport("essai");
		assertTrue(sport.getNomSport().equals("essai"));
	}

}
