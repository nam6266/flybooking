/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.RoleName;
import com.mycompany.spring_mvc_project_final.enums.RoleStatus;
import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author Administrator
 */
@Entity
@Table(name = "ROLE_ACCOUNT")
public class Role implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ROLE_ID")
    private int id;

    @Enumerated(EnumType.STRING)
    @Column(name = "ROLE_NAME")
    private RoleName roleName;

    @Enumerated(EnumType.STRING)
    @Column(name = "ROLE_STATUS")
    private RoleStatus roleStatus;

    @ManyToMany(mappedBy = "listRole")
    private List<Acount> listAccount;

    public Role() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public RoleName getRoleName() {
        return roleName;
    }

    public void setRoleName(RoleName roleName) {
        this.roleName = roleName;
    }

    public RoleStatus getRoleStatus() {
        return roleStatus;
    }

    public void setRoleStatus(RoleStatus roleStatus) {
        this.roleStatus = roleStatus;
    }


    public List<Acount> getListAccount() {
        return listAccount;
    }

    public void setListAccount(List<Acount> listAccount) {
        this.listAccount = listAccount;
    }

}
