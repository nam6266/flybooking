/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.SeatStatus;
import com.mycompany.spring_mvc_project_final.repository.SeatstatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author OS
 */
@Service
public class SeatstatusServices {
    
    @Autowired
    public SeatstatusRepository seatstatusRepository;
    
    public SeatStatus findbyid(int id){
        return seatstatusRepository.findById(id);
    }
}
