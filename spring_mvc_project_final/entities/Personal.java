/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.Gender;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

/**
 *
 * @author OS
 */
@MappedSuperclass
@Table(name = "Personal")
public class Personal implements Serializable {

    
    @Column(name = "FULL_NAME", nullable = false)
    @NotNull(message = "field is required!!")
    private String fullname;

    @Column(name = "EMAIL", nullable = false)
    @NotNull(message = "field is required!!")
    @Email
    private String email;

    @Column(name = "Gender", nullable = false)
    @Enumerated(EnumType.STRING)
    @NotNull(message = "field is required!!")
    private Gender gender;

    @Column(name = "PHONE", nullable = false)
    @NotNull(message = "field is required!!")
    private String phone;

    @Column(name = "Cccd", nullable = false)
    @NotNull(message = "field is required!!")
    private String idCard;

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

}
