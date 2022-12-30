/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.model;

import com.mycompany.spring_mvc_project_final.entities.BookingDetail;
import java.util.List;

/**
 *
 * @author OS
 */
public class warpmodel {
        private List<BookingDetail> listBookingDetailsdepart;
        private List<BookingDetail> listBookingDetailsreturn;

    public List<BookingDetail> getListBookingDetailsdepart() {
        return listBookingDetailsdepart;
    }

    public void setListBookingDetailsdepart(List<BookingDetail> listBookingDetailsdepart) {
        this.listBookingDetailsdepart = listBookingDetailsdepart;
    }

    public List<BookingDetail> getListBookingDetailsreturn() {
        return listBookingDetailsreturn;
    }

    public void setListBookingDetailsreturn(List<BookingDetail> listBookingDetailsreturn) {
        this.listBookingDetailsreturn = listBookingDetailsreturn;
    }


        
        
}
