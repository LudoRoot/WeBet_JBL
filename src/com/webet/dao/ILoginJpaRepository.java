package com.webet.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.webet.entities.Login;

public interface ILoginJpaRepository extends JpaRepository<Login, Long> {

    public Login findByEmail(String email);

    @Query("select l from Login l where l.mdp =:mdp and l.email=:email")
    Login findLoginByPwdEmail(@Param("mdp") String mdp, @Param("email") String email);

}
