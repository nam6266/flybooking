/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.CerditCard;
import com.mycompany.spring_mvc_project_final.repository.CreditcardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author OS
 */
@Service
public class CreditCardServices {

    @Autowired
    public CreditcardRepository creditcardRepository;

    public CerditCard getCreditcard(int number, String name, String bank){
        return creditcardRepository.findByCardNumberAndNameAndBank(number,name, bank);
    }

    public CerditCard save(CerditCard card) {
        return creditcardRepository.save(card);
    }
}
