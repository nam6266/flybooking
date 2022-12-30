/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.CommonStatus;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author OS
 */
@Entity
@Table(name = "Flight")
public class Flight implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int avaibleSeats;

    @ManyToOne
    @JoinColumn(name = "FlightRoute_id")
    private FlightRoute flightRoute;

    @ManyToOne
    @JoinColumn(name = "Aircraft_id")
    private Aircrafts aircrafts;

    @Column(name = "Depart_Date")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date depart;

    @Column(name = "Arrival_Date")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date arrival;

    @Column(name = "Depart_Time")
    private String timeDepart;

    @Column(name = "Arrival_Time")
    private String timeArrivale;

    @OneToMany(mappedBy = "flight", cascade = CascadeType.ALL,
            orphanRemoval = true, fetch = FetchType.LAZY)
    private List<AircraftSeats> aircraftSeats;

    @OneToMany(mappedBy = "flight", cascade = CascadeType.ALL,
            orphanRemoval = true, fetch = FetchType.LAZY)
    private List<BookingDetail> bookingDetails;

    @Enumerated(EnumType.STRING)
    private CommonStatus status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAvaibleSeats() {
        return avaibleSeats;
    }

    public void setAvaibleSeats(int avaibleSeats) {
        this.avaibleSeats = avaibleSeats;
    }


    public FlightRoute getFlightRoute() {
        return flightRoute;
    }

    public void setFlightRoute(FlightRoute flightRoute) {
        this.flightRoute = flightRoute;
    }

    public Aircrafts getAircrafts() {
        return aircrafts;
    }

    public void setAircrafts(Aircrafts aircrafts) {
        this.aircrafts = aircrafts;
    }

    public Date getDepart() {
        return depart;
    }

    public void setDepart(Date depart) {
        this.depart = depart;
    }

    public Date getArrival() {
        return arrival;
    }

    public void setArrival(Date arrival) {
        this.arrival = arrival;
    }

    public List<AircraftSeats> getAircraftSeats() {
        return aircraftSeats;
    }

    public void setAircraftSeats(List<AircraftSeats> aircraftSeats) {
        this.aircraftSeats = aircraftSeats;
    }

    public List<BookingDetail> getBookingDetails() {
        return bookingDetails;
    }

    public void setBookingDetails(List<BookingDetail> bookingDetails) {
        this.bookingDetails = bookingDetails;
    }

    public CommonStatus getStatus() {
        return status;
    }

    public void setStatus(CommonStatus status) {
        this.status = status;
    }

    public String getTimeDepart() {
        return timeDepart;
    }

    public void setTimeDepart(String timeDepart) {
        this.timeDepart = timeDepart;
    }

    public String getTimeArrivale() {
        return timeArrivale;
    }

    public void setTimeArrivale(String timeArrivale) {
        this.timeArrivale = timeArrivale;
    }

}
