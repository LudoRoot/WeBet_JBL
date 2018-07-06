package com.webet.dao;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.webet.entities.Client;
import com.webet.entities.Pari;

public interface IPariJpaRepository extends JpaRepository<Pari, Long> {

    @Query("select p from Pari p where p.client =:client")
    Collection<Pari> findPariByClient(@Param("client") Client client);
}
