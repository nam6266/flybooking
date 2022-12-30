/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeats;
import com.mycompany.spring_mvc_project_final.entities.Seats;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author OS
 */
@Repository
public interface SeatRepository extends JpaRepository<Seats, Integer> {

//    @Query("Select  s FROM Seats s "
//            + " Where s.number = ?1% ORDERBY id LIMIT ?2 ")
//    List<Seats> getSeat(String seat, int limit);
    @Query(value = "SELECT * FROM project_final.seats where Seat_Number like \"?1%\" ORDER BY id limit ?2", nativeQuery = true)
    List<Seats> getSeat(char seat, int row);

    @Query(value = "SELECT * FROM project_final.seats s join project_final.aircrafts_seats sa on s.id = sa.Seat_ID where sa.Aircrafts_id = ?1 ORDER BY s.id", nativeQuery = true)
    List<Seats> getSeatbyaircraft(int id);

    @Query(value = "select * from project_final.seats s left join project_final.aircrafts_seats a on s.id = a.Seat_Id where s.Seat_Number = ?1 and a.Flight_id = ?2", nativeQuery = true)
    Seats FindSeat(String number, int id);
}
