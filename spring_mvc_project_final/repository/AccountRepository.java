/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.Acount;
import com.mycompany.spring_mvc_project_final.enums.RoleStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRepository extends JpaRepository<Acount, Integer> {

    @Query("Select DISTINCT a FROM Acount a LEFT JOIN FETCH a.listRole"
            + " Where a.userName = ?1")
    Acount getAccount(String username);

}
