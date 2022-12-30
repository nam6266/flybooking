/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.CommonStatus;
import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author OS
 */
@Entity
@Table(name = "Flight_Route")
public class FlightRoute implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "departure_id")
    private Station departure;

    @ManyToOne
    @JoinColumn(name = "desternation_id")
    private Station desternation;

    private int duration;

    private double price;

    private String distance;

    @Enumerated(EnumType.STRING)
    private CommonStatus status;

    @OneToMany(mappedBy = "flightRoute", cascade = CascadeType.ALL,
            orphanRemoval = true, fetch = FetchType.LAZY)
    private List<Flight> flight;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Station getDeparture() {
        return departure;
    }

    public void setDeparture(Station departure) {
        this.departure = departure;
    }

    public Station getDesternation() {
        return desternation;
    }

    public void setDesternation(Station desternation) {
        this.desternation = desternation;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }

    public CommonStatus getStatus() {
        return status;
    }

    public void setStatus(CommonStatus status) {
        this.status = status;
    }

    public List<Flight> getFlight() {
        return flight;
    }

    public void setFlight(List<Flight> flight) {
        this.flight = flight;
    }

//     @Override 
//     public int compareTo(FlightRoute f){
//         
//         if(desternation.getCountry().compareTo(f.getDesternation().getCountry()) <0){
//             return  0;
//         }else{
//             return 1;
//         }
//     }
}
