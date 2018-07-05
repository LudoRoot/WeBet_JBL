package com.webet.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webet.entities.Rencontre;

public interface IRencontreJpaRepository extends JpaRepository<Rencontre, Long> {

}
