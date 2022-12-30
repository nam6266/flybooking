/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author OS
 */
@Entity
@Table(name = "Station")
public class Station implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Station_Name", length = 100, nullable = false)
    private String stationName;

    @Column(name = "Station_Code", length = 10)
    private String stationCode;

    @Column(name = "Country", length = 100, nullable = false)
    private String country;

    @OneToMany(mappedBy = "departure", cascade = CascadeType.ALL,
            orphanRemoval = true, fetch = FetchType.LAZY)
    private List<FlightRoute> departureStation;

    @OneToMany(mappedBy = "desternation", cascade = CascadeType.ALL,
            orphanRemoval = true, fetch = FetchType.LAZY)
    private List<FlightRoute> desternationStation;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStationName() {
        return stationName;
    }

    public void setStationName(String stationName) {
        this.stationName = stationName;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public List<FlightRoute> getDepartureStation() {
        return departureStation;
    }

    public void setDepartureStation(List<FlightRoute> departureStation) {
        this.departureStation = departureStation;
    }

    public List<FlightRoute> getDesternationStation() {
        return desternationStation;
    }

    public void setDesternationStation(List<FlightRoute> desternationStation) {
        this.desternationStation = desternationStation;
    }

    public String getStationCode() {
        return stationCode;
    }

    public void setStationCode(String stationCode) {
        this.stationCode = stationCode;
    }

}
