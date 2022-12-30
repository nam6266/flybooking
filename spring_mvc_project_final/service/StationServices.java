/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.Station;
import com.mycompany.spring_mvc_project_final.repository.StationRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author OS
 */
@Service
public class StationServices {
    
     @Autowired StationRepository stationRepository;
     
    public List<Station> getStation() {
        return stationRepository.findAll();
    }
    
    public List<Station> getariveStation(int id){
        return stationRepository.findById(id);
    }
    
}
