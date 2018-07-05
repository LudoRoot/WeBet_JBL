package com.webet.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webet.entities.Login;

public interface ILoginJpaRepository extends JpaRepository<Login, Long> {

    public Login findByEmail(String email);
}
