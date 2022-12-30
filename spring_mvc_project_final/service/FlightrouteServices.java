/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.FlightRoute;
import com.mycompany.spring_mvc_project_final.repository.FlightRepository;
import com.mycompany.spring_mvc_project_final.repository.FlightrouteRepository;
import java.util.List;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author OS
 */
@Service
public class FlightrouteServices {

    @Autowired
    public FlightrouteRepository flightrouteRepository;

    public List<FlightRoute> getAriveStation(int id) {
        List<FlightRoute> flight = flightrouteRepository.findByDeparture_Id(id);
        for (FlightRoute s : flight) {
            Hibernate.initialize(s.getDesternation());
        }
        return flight;
    }
    
//        public List<String> getdesternation(int id) {
//        return flightrouteRepository.getdesternation(id);
//        }
}
