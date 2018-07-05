package com.webet.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webet.entities.Sports;

public interface ISportsJpaRepository extends JpaRepository<Sports, Long> {

}
