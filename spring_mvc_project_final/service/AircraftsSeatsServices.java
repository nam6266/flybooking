/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeats;
import com.mycompany.spring_mvc_project_final.repository.AircarftsSeatsRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author OS
 */
@Service
public class AircraftsSeatsServices {

    @Autowired
    public AircarftsSeatsRepository aircarftsSeatsRepository;

    public void save(AircraftSeats aircraftSeats) {
        aircarftsSeatsRepository.save(aircraftSeats);
    }

    public List<AircraftSeats> getAircraftSeats(int flightid) {
        return aircarftsSeatsRepository.getAircraftSeatsbyflight(flightid);
    }

    public AircraftSeats getAircraftSeats(String number, int id) {
        return aircarftsSeatsRepository.FindSeat(number,id);
    }
}
