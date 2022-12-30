/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.Gender;
import com.mycompany.spring_mvc_project_final.enums.SeatTypeEnum;
import java.beans.Transient;
import java.io.Serializable;
import javax.persistence.Column;
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
@Table(name = "Booking_details")
public class BookingDetail implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Price")
    private double price;

    @Column(name = "Ifant_Price")
    private double iffantprice;

    @Column(name = "toally_Price")
    private double toallyprice;

    @Column(name = "Full_Name")
    private String fullName;

  
    @Enumerated(EnumType.STRING)
    private SeatTypeEnum seatType;

    @Column(name = "GENDER")
    @Enumerated(EnumType.STRING)
    private Gender gender;

    @Column(name = "ATTACHED_INFANT")
    private boolean attachedInfant;

    @ManyToOne
    @JoinColumn(name = "Flight_id")
    private Flight flight;

    @ManyToOne
    @JoinColumn(name = "Booking_id")
    private Booking booking;

    @ManyToOne
    @JoinColumn(name = "Seats_id")
    private Seats seats;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getIffantprice() {
        return iffantprice;
    }

    public void setIffantprice() {
        double sum;
        if (attachedInfant == true) {
            sum = getPrice();
            sum = +(sum * 20) / 100;
        } else {
            sum = 0;
        }
        this.iffantprice = sum;
    }

    public double getToallyprice() {
        return toallyprice;
    }

    public void setToallyprice() {
        this.toallyprice = getPrice() + getIffantprice();
    }

    public Flight getFlight() {
        return flight;
    }

    public void setFlight(Flight flight) {
        this.flight = flight;
    }

    public Booking getBooking() {
        return booking;
    }

    public void setBooking(Booking booking) {
        this.booking = booking;
    }

    public Seats getSeats() {
        return seats;
    }

    public void setSeats(Seats seats) {
        this.seats = seats;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public boolean isAttachedInfant() {
        return attachedInfant;
    }

    public void setAttachedInfant(boolean attachedInfant) {
        this.attachedInfant = attachedInfant;
    }

    public SeatTypeEnum getSeatType() {
        return seatType;
    }

    public void setSeatType(SeatTypeEnum seatType) {
        this.seatType = seatType;
    }

}
