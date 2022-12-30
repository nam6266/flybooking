/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.FlightRoute;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author OS
 */
@Repository
public interface FlightrouteRepository extends JpaRepository<FlightRoute, Integer> {
    
//        @Query(value = "SELECT id, distinct desternation_id FROM project_final.flight_route where departure_id = ?1",
//            nativeQuery = true)
//    List<FlightRoute> getdesternation(int id);
    
//        @Query("Select DISTINCT  fr.departure FROM FlightRoute fr LEFT JOIN FETCH fr.desternation"
//            + " Where fr.departure.id = ?1")
//            List<String> getdesternation(int id);
            
            List<FlightRoute> findByDeparture_Id(int id);
}
