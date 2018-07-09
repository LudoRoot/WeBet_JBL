package com.webet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.webet.entities.Equipe;

public interface IEquipeJpaRepository extends JpaRepository<Equipe, Long> {

    @Query("select e from Equipe e where e.sport.id=:id")
    List<Equipe> findTeamBySport(@Param("id") Long id);
}
