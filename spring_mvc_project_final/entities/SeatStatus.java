/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.SeatStatusEnum;
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
@Table(name = "Seat_Status")
public class SeatStatus implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Enumerated(EnumType.STRING)
    private SeatStatusEnum seatStatusEnum;

    @OneToMany(mappedBy = "seatStatus", cascade = CascadeType.ALL,
            orphanRemoval = true, fetch = FetchType.LAZY)
    private List<AircraftSeats> aircraircraftSeats;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public SeatStatusEnum getSeatStatusEnum() {
        return seatStatusEnum;
    }

    public void setSeatStatusEnum(SeatStatusEnum seatStatusEnum) {
        this.seatStatusEnum = seatStatusEnum;
    }

    public List<AircraftSeats> getAircraircraftSeats() {
        return aircraircraftSeats;
    }

    public void setAircraircraftSeats(List<AircraftSeats> aircraircraftSeats) {
        this.aircraircraftSeats = aircraircraftSeats;
    }

}
