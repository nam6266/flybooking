/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.Seats;
import com.mycompany.spring_mvc_project_final.repository.SeatRepository;
import java.util.List;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author OS
 */
@Service
public class SeatServices {

    @Autowired
    public SeatRepository seatRepository;

    public List<Seats> getSeat(char seat, int limit) {
        List<Seats> listSeat = seatRepository.getSeat(seat, limit);
        for (Seats s : listSeat) {
            Hibernate.initialize(s.getAircraftSeats());
        }
        return listSeat;
    }

    public List<Seats> getSeatbyaircraft(int id) {
        return seatRepository.getSeatbyaircraft(id);
    }

    public Seats FindSeat(String number, int id) {
        Seats seat =  seatRepository.FindSeat(number, id);
        return seat;
    }
}
