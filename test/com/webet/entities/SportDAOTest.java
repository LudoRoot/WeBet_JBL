package com.webet.entities;

import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.webet.dao.ISportsJpaRepository;

public class SportDAOTest extends SpringTest {
	
	@Autowired
	private ISportsJpaRepository sportrepo;
	
	@Test
	public void testSportAdd() {
		Sport sport = new Sport();
		sport.setNomSport("sport");
		Sport sportcree = sportrepo.save(sport);
		assertTrue(sport.getNomSport().equals(sportcree.getNomSport()));
	}
	
	@Test
	public void testSportRead() {
		Sport sport = new Sport();
		sport.setNomSport("sport");
		
		Sport sportcree = sportrepo.save(sport);
		
		Sport sport_recup = sportrepo.getOne(sportcree.getId());
		
		assertTrue(sportcree.getNomSport().equals(sport_recup.getNomSport()));
	}
	
	@Test
	public void testSportUpdate() {
		Sport sport = new Sport();
		sport.setNomSport("sport");
		
		Sport sport_cree = sportrepo.save(sport);
		
		Sport sport_recup = sportrepo.getOne(sport_cree.getId());
		
		sport_recup.setNomSport("mon_nouveau_sport");
		Sport sport_modif = sportrepo.save(sport_recup);

		assertTrue(sport_modif.getNomSport().equals("mon_nouveau_sport"));
	}
	
	@Test
	public void testSportDelete() {
		Sport sport = new Sport();
		sport.setNomSport("sport");
		
		Sport sport_cree = sportrepo.save(sport);
		
		Sport sport_recup = sportrepo.getOne(sport_cree.getId());
		
		assertTrue(sport_cree.getNomSport().equals(sport_recup.getNomSport()));
		
		sportrepo.delete(sport_cree);
		
		for(Sport s : sportrepo.findAll()) {
			assertNotEquals(s.getId(), sport_cree.getId());
		}
	}
}
