/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.Flight;
import com.mycompany.spring_mvc_project_final.repository.FlightRepository;
import java.util.List;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author OS
 */
@Service
public class FlightServices {

    @Autowired
    public FlightRepository flightRepository;

    public List<Flight> getDepartFlights(int departure, int desternation, String depart, int passenger) {
        List<Flight> flightList = flightRepository.getdepartflight(departure, desternation, depart, passenger);
        for (Flight s : flightList) {
            Hibernate.initialize(s.getFlightRoute());
            Hibernate.initialize(s.getAircrafts());
        }
        return flightList;
    }

    public Flight getflightbyID(int id) {
        Flight flight = flightRepository.findById(id);
        Hibernate.initialize(flight.getAircrafts());
        Hibernate.initialize(flight.getFlightRoute());
        return flight;
    }
    
        public Flight save(Flight flight) {
            return flightRepository.save(flight);
        }

}
