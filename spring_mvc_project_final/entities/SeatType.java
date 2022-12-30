/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.SeatTypeEnum;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author OS
 */
@Entity
@Table(name = "Seat_Type")
public class SeatType implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Enumerated(EnumType.STRING)
    private SeatTypeEnum seatTypeEnum;

    @OneToMany(mappedBy = "seatType", cascade = CascadeType.ALL,
            orphanRemoval = true, fetch = FetchType.LAZY)
    private List<AircraftSeats> aircraftSeats;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public SeatTypeEnum getSeatTypeEnum() {
        return seatTypeEnum;
    }

    public void setSeatTypeEnum(SeatTypeEnum seatTypeEnum) {
        this.seatTypeEnum = seatTypeEnum;
    }

    public List<AircraftSeats> getAircraftSeats() {
        return aircraftSeats;
    }

    public void setAircraftSeats(List<AircraftSeats> aircraftSeats) {
        this.aircraftSeats = aircraftSeats;
    }

}
