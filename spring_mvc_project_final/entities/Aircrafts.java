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
@Table(name = "Aircrafts")
public class Aircrafts implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Aircraft_Name", length = 100, nullable = false)
    private String name;

    @Column(name = "Aircraft_Code", nullable = false)
    private int number;

    @OneToMany(mappedBy = "aircrafts", cascade = CascadeType.ALL,
            orphanRemoval = true, fetch = FetchType.LAZY)
    private List<AircraftSeats> aircraftSeats;

    @OneToMany(mappedBy = "aircrafts", cascade = CascadeType.ALL,
            orphanRemoval = true, fetch = FetchType.LAZY)
    private List<Flight> Flight;

    @Column(name = "Aircraft_row", nullable = false)
    private int row;

    @Column(name = "Aircraft_collum", nullable = false)
    private int col;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public int getCol() {
        return col;
    }

    public void setCol(int col) {
        this.col = col;
    }

    public List<AircraftSeats> getAircraftSeats() {
        return aircraftSeats;
    }

    public void setAircraftSeats(List<AircraftSeats> aircraftSeats) {
        this.aircraftSeats = aircraftSeats;
    }

    public List<Flight> getFlight() {
        return Flight;
    }

    public void setFlight(List<Flight> Flight) {
        this.Flight = Flight;
    }

}
