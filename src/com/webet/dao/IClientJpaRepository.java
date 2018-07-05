package com.webet.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webet.entities.Client;

public interface IClientJpaRepository extends JpaRepository<Client, Long> {

}
