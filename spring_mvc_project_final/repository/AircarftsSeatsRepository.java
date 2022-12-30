/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeats;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author OS
 */
@Repository
public interface AircarftsSeatsRepository extends JpaRepository<AircraftSeats, Integer> {

    @Query(value = "SELECT * FROM project_final.aircrafts_seats sa join project_final.seats s on s.id = sa.Seat_ID where sa.Aircrafts_id = ?1 ORDER BY s.id", nativeQuery = true)
    List<AircraftSeats> getAircraftSeatsbyflight(int id);

   
    @Query(value = "select * from project_final.aircrafts_seats a join seats s on a.Seat_Id = s.id where s.Seat_Number = ?1 and a.Flight_id= ?2", nativeQuery = true)
    AircraftSeats FindSeat(String number, int id);
}
