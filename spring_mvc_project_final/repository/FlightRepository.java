/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.Flight;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author OS
 */
@Repository
public interface FlightRepository extends JpaRepository<Flight, Integer> {

    @Query(value = "SELECT * FROM project_final.flight f left join flight_route fr on f.FlightRoute_id = fr.id where "
            + "fr.departure_id = ?1 and fr.desternation_id = ?2 "
            + "and f.Depart_Date like ?3 and f.avaibleSeats >= ?4", nativeQuery = true)
    List<Flight> getdepartflight(int departure, int desternation, String depart, int passenger);

    Flight findById(int id);
}
