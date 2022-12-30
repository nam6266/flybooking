/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.SeatStatusEnum;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author OS
 */
@Entity
@Table(name = "Aircrafts_Seats")
public class AircraftSeats implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "Aircrafts_id")
    private Aircrafts aircrafts;

    @ManyToOne
    @JoinColumn(name = "Seat_Id")
    private Seats seats;

    @ManyToOne
    @JoinColumn(name = "Seat_Type_id")
    private SeatType seatType;

    @ManyToOne
    @JoinColumn(name = "Seat_Status_id")
    private SeatStatus seatStatus;

    @ManyToOne
    @JoinColumn(name = "Flight_id")
    private Flight flight;

    private double price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Aircrafts getAircrafts() {
        return aircrafts;
    }

    public void setAircrafts(Aircrafts aircrafts) {
        this.aircrafts = aircrafts;
    }

    public SeatType getSeatType() {
        return seatType;
    }

    public void setSeatType(SeatType seatType) {
        this.seatType = seatType;
    }

    public SeatStatus getSeatStatus() {
        return seatStatus;
    }

    public void setSeatStatus(SeatStatus seatStatus) {
        this.seatStatus = seatStatus;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Flight getFlight() {
        return flight;
    }

    public void setFlight(Flight flight) {
        this.flight = flight;
    }

    public Seats getSeats() {
        return seats;
    }

    public void setSeats(Seats seats) {
        this.seats = seats;
    }

}
