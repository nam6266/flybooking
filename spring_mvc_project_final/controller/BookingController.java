/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeats;
import com.mycompany.spring_mvc_project_final.entities.Booking;
import com.mycompany.spring_mvc_project_final.entities.BookingDetail;
import com.mycompany.spring_mvc_project_final.entities.CerditCard;
import com.mycompany.spring_mvc_project_final.entities.Flight;
import com.mycompany.spring_mvc_project_final.entities.FlightRoute;
import com.mycompany.spring_mvc_project_final.enums.BookingStatus;
import com.mycompany.spring_mvc_project_final.enums.Gender;
import com.mycompany.spring_mvc_project_final.model.warpmodel;
import com.mycompany.spring_mvc_project_final.service.AircraftsSeatsServices;
import com.mycompany.spring_mvc_project_final.service.BookingDetailServices;
import com.mycompany.spring_mvc_project_final.service.BookingServices;
import com.mycompany.spring_mvc_project_final.service.CreditCardServices;
import com.mycompany.spring_mvc_project_final.service.EmailServices;
import com.mycompany.spring_mvc_project_final.service.FlightServices;
import com.mycompany.spring_mvc_project_final.service.FlightrouteServices;
import com.mycompany.spring_mvc_project_final.service.SeatServices;
import com.mycompany.spring_mvc_project_final.service.SeatstatusServices;
import com.mycompany.spring_mvc_project_final.service.StationServices;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author OS
 */
@Controller
public class BookingController {

    @Autowired
    public StationServices stationServices;

    @Autowired
    public FlightServices flightServices;

    @Autowired
    public SeatServices seatServices;

    @Autowired
    public AircraftsSeatsServices aircraftsSeatsServices;

    @Autowired
    public FlightrouteServices flightrouteServices;

    @Autowired
    public BookingServices bookingServices;

    @Autowired
    public BookingDetailServices bookingDetailServices;

    @Autowired
    public SeatstatusServices seatstatusServices;

    @Autowired
    public CreditCardServices creditCardServices;

    @Autowired
    public EmailServices emailServices;

 

    @RequestMapping(value = {"/searchflight"}, method = RequestMethod.POST)
    public String showSearchForm(Model model,
            HttpServletRequest request,
            @RequestParam("tripType") String tripType,
            @RequestParam("departure") int departure,
            @RequestParam("arrival") int arrival,
            @RequestParam("passenger") int passenger,
            @RequestParam("departDate") String departDate,
            @RequestParam(name = "returnDate", required = false) String returnDate) throws ParseException {

        model.addAttribute("listStation", stationServices.getStation());
        HttpSession session = request.getSession();
        session.setAttribute("listpassenger", passenger);
        if (departure == arrival) {
            model.addAttribute("StationError", "depart and arrive can't be the same");
            return "home";
        }
        if (tripType.equals("roundTrip")) {
            if (departDate.equals(returnDate)) {
                model.addAttribute("DateError", "depart time and arrive time can't be the same");
                return "home";
            } else {
                model.addAttribute("flight", flightServices.getDepartFlights(departure, arrival, departDate, passenger));
                model.addAttribute("returnflight", flightServices.getDepartFlights(arrival, departure, returnDate, passenger));
                model.addAttribute("triptype", 1);
                return "user/choseflight";
            }
        }
        if (tripType.equals("oneWay")) {
            model.addAttribute("flight", flightServices.getDepartFlights(departure, arrival, departDate, passenger));
            model.addAttribute("triptype", 2);
            return "user/choseflight";
        }
        return "home";
    }

    @RequestMapping(value = {"/loadAriveStation"}, method = RequestMethod.GET)
    public @ResponseBody
    String loadAriveStation(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse respone,
            @RequestParam("id") int id) throws IOException {
        List<FlightRoute> ariveStation = flightrouteServices.getAriveStation(id);
        if (ariveStation == null) {
            PrintWriter out = respone.getWriter();
            out.println("No flight avaiable");
        } else {

            for (int i = 0; i < ariveStation.size(); i++) {
                for (int j = i + 1; j < ariveStation.size(); j++) {
                    if (ariveStation.get(i).getDesternation().getCountry().equals(ariveStation.get(j).getDesternation().getCountry())) {
                        ariveStation.remove(j);
                    }
                }
            }
            PrintWriter out = respone.getWriter();
            for (FlightRoute s : ariveStation) {
                out.println("<option value=" + s.getDesternation().getId() + ">" + s.getDesternation().getCountry() + "</option>");
            }
        }
        return null;
    }

    @RequestMapping(value = {"/addDepartFlight"}, method = RequestMethod.GET)
    public @ResponseBody
    String saveFlight(Model model, HttpSession session,
            HttpServletRequest request,
            @RequestParam("id") int id
    ) {
        HttpSession flightsession = request.getSession();
        flightsession.setAttribute("departflight", id);
        return null;
    }

    @RequestMapping(value = {"/addflight/{id}/{triptype}"})
    public String addflight(Model model,
            HttpSession session,
            HttpServletRequest request,
            @PathVariable int id,
            @PathVariable int triptype
    ) {
        HttpSession flightsession = request.getSession();
        if (triptype == 2) {
            Flight flight = flightServices.getflightbyID(id);
            model.addAttribute("row", flight.getAircrafts().getCol());
            model.addAttribute("col", flight.getAircrafts().getRow());
            model.addAttribute("departSeat", aircraftsSeatsServices.getAircraftSeats(id));
            model.addAttribute("flight", flight);
            flightsession.setAttribute("returnflight", id);
            return "user/choseseat";
        } else {
            int flightid = (int) flightsession.getAttribute("departflight");
            flightsession.setAttribute("returnflight", id);
            Flight returnflight = flightServices.getflightbyID(id);
            Flight departflight = flightServices.getflightbyID(flightid);

            model.addAttribute("row", departflight.getAircrafts().getCol());
            model.addAttribute("col", departflight.getAircrafts().getRow());
            model.addAttribute("departSeat", aircraftsSeatsServices.getAircraftSeats(flightid));
            model.addAttribute("flight", flightServices.getflightbyID(flightid));

            model.addAttribute("returnrow", returnflight.getAircrafts().getCol());
            model.addAttribute("returncol", returnflight.getAircrafts().getRow());
            model.addAttribute("returntSeat", aircraftsSeatsServices.getAircraftSeats(id));
            model.addAttribute("returnflight", flightServices.getflightbyID(id));
            return "user/choseseat";
        }
    }

    @RequestMapping(value = {"/addTicket"}, method = RequestMethod.GET)
    public @ResponseBody
    String addTicket(Model model,
            HttpServletRequest request,
            @RequestParam("id") String id
    ) {
        HttpSession session = request.getSession();
        int LimitPassenger = (int) session.getAttribute("listpassenger");
        List<String> ListSeat;
        ListSeat = (List<String>) session.getAttribute("listseat");
        if (ListSeat == null) {
            ListSeat = new ArrayList<>();
            ListSeat.add(id);
            session.setAttribute("listseat", ListSeat);
            return "ok";
        } else {
            if (ListSeat.size() == LimitPassenger) {
                for (String s : ListSeat) {
                    if (s.equals(id)) {
                        ListSeat.remove(id);
                        return "notok";
                    }

                }
                return "1";
            }
            if (ListSeat.size() < LimitPassenger) {
                boolean check = false;
                for (String s : ListSeat) {
                    if (s.equals(id)) {
                        check = true;
                        break;
                    }
                }
                if (check == true) {
                    ListSeat.remove(id);
                    session.setAttribute("listseat", ListSeat);
                    return "notok";
                } else {
                    ListSeat.add(id);
                    session.setAttribute("listseat", ListSeat);
                    if (ListSeat.size() >= LimitPassenger) {
                        return "1";
                    } else {
                        return "notok";
                    }
                }

            }
        }
        return null;
    }

    @RequestMapping(value = {"/addReturnTicket"}, method = RequestMethod.GET)
    public @ResponseBody
    String addReturnTicket(Model model,
            HttpServletRequest request,
            @RequestParam("id") String id
    ) {
        HttpSession session = request.getSession();
        int LimitPassenger = (int) session.getAttribute("listpassenger");
        List<String> ListReturnSeat;
        ListReturnSeat = (List<String>) session.getAttribute("ListReturnSeat");
        if (ListReturnSeat == null) {
            ListReturnSeat = new ArrayList<>();
            ListReturnSeat.add(id);
            session.setAttribute("ListReturnSeat", ListReturnSeat);
            return "ok";
        } else {
            if (ListReturnSeat.size() == LimitPassenger) {
                for (String s : ListReturnSeat) {
                    if (s.equals(id)) {
                        ListReturnSeat.remove(id);
                        return "ok";
                    }

                }
                return "1";
            }
            if (ListReturnSeat.size() < LimitPassenger) {
                boolean check = false;
                for (String s : ListReturnSeat) {
                    if (s.equals(id)) {
                        check = true;
                        break;
                    }
                }
                if (check == true) {
                    ListReturnSeat.remove(id);
                    session.setAttribute("ListReturnSeat", ListReturnSeat);
                    return "ok";
                } else {
                    ListReturnSeat.add(id);
                    session.setAttribute("ListReturnSeat", ListReturnSeat);
                    if (ListReturnSeat.size() >= LimitPassenger) {
                        return "1";
                    } else {
                        return "ok";
                    }
                }

            }
        }
        return null;
    }

    @RequestMapping(value = {"/confirm"}, method = RequestMethod.GET)
    public @ResponseBody
    String confirm(Model model,
            HttpServletRequest request
    ) {

        HttpSession session = request.getSession();
        int LimitPassenger = (int) session.getAttribute("listpassenger");
        List<String> ListReturnSeat;
        ListReturnSeat = (List<String>) session.getAttribute("ListReturnSeat");
        List<String> ListSeat;
        ListSeat = (List<String>) session.getAttribute("listseat");

        if (ListReturnSeat == null && ListSeat == null) {
            return "2";
        }

        if (ListReturnSeat == null) {
            if (ListSeat.size() == LimitPassenger) {
                return "1";
            }
            return "2";
        } else {
            if (ListSeat.size() == LimitPassenger && ListReturnSeat.size() == LimitPassenger) {
                return "1";
            }
            return "2";
        }

    }

    @RequestMapping(value = {"/bookinginfor"})
    public String passenger(Model model
    ) {
        model.addAttribute("booking", new Booking());
        model.addAttribute("genders", Gender.values());
        return "user/bookinginfor";
    }

    @RequestMapping(value = "/bookingresult", method = RequestMethod.POST)
    public String submitAccount(
            @Valid
            @ModelAttribute("booking") Booking booking,
            HttpServletRequest request,
            BindingResult result,
            Model model
    ) {
        HttpSession session = request.getSession();
        int flightid = (int) session.getAttribute("departflight");
        int returnflightid = (int) session.getAttribute("returnflight");

        warpmodel warp = new warpmodel();
        session.setAttribute("booking", booking);
        List<BookingDetail> ListBDdepart = new ArrayList<>();
        List<BookingDetail> ListBDdreturn = new ArrayList<>();
        List<String> ListSeat = (List<String>) session.getAttribute("listseat");
        List<String> ListReturnSeat = (List<String>) session.getAttribute("ListReturnSeat");

        for (int i = 0; i < ListSeat.size(); i++) {
            BookingDetail Bd = new BookingDetail();
            Bd.setFlight(flightServices.getflightbyID((int) session.getAttribute("departflight")));
            Bd.setSeats(aircraftsSeatsServices.getAircraftSeats(ListSeat.get(i), flightid).getSeats());

            ListBDdepart.add(Bd);
        }

        if (ListReturnSeat != null) {
            for (int i = 0; i < ListReturnSeat.size(); i++) {
                BookingDetail Bd = new BookingDetail();
                Bd.setFlight(flightServices.getflightbyID((int) session.getAttribute("returnflight")));
                Bd.setSeats(aircraftsSeatsServices.getAircraftSeats(ListReturnSeat.get(i), returnflightid).getSeats());
                ListBDdreturn.add(Bd);
            }
            warp.setListBookingDetailsreturn(ListBDdreturn);
        }

        warp.setListBookingDetailsdepart(ListBDdepart);

        model.addAttribute("warp", warp);
        return "user/passengerinfor";

    }

    @RequestMapping(value = "/pasengerresult", method = RequestMethod.POST)
    public String pasengerresult(
            @ModelAttribute("warp") warpmodel warpmodel,
            HttpServletRequest request,
            BindingResult result,
            Model model
    ) {
        HttpSession session = request.getSession();
        List<String> ListSeat = (List<String>) session.getAttribute("listseat");
        List<String> ListReturnSeat = (List<String>) session.getAttribute("ListReturnSeat");
        int flightid = (int) session.getAttribute("departflight");
        int returnflightid = (int) session.getAttribute("returnflight");
        Booking booking = (Booking) session.getAttribute("booking");
        List<BookingDetail> Listbepart = new ArrayList<>();
        List<BookingDetail> Listreturn = new ArrayList<>();
        List<BookingDetail> Listbooking = new ArrayList<>();
        double sum = flightServices.getflightbyID(flightid).getFlightRoute().getPrice() + flightServices.getflightbyID(returnflightid).getFlightRoute().getPrice();

        for (int i = 0; i < ListSeat.size(); i++) {
            warpmodel.getListBookingDetailsdepart().get(i).setFlight(flightServices.getflightbyID(flightid));
            warpmodel.getListBookingDetailsdepart().get(i).setSeats(seatServices.FindSeat(ListSeat.get(i), flightid));
            warpmodel.getListBookingDetailsdepart().get(i).setPrice(aircraftsSeatsServices.getAircraftSeats(ListSeat.get(i), flightid).getPrice() * 20000);
            warpmodel.getListBookingDetailsdepart().get(i).setSeatType(aircraftsSeatsServices.getAircraftSeats(ListSeat.get(i), flightid).getSeatType().getSeatTypeEnum());
            warpmodel.getListBookingDetailsdepart().get(i).setIffantprice();
            warpmodel.getListBookingDetailsdepart().get(i).setToallyprice();
            sum = sum + warpmodel.getListBookingDetailsdepart().get(i).getToallyprice();
            Listbepart.add(warpmodel.getListBookingDetailsdepart().get(i));
            Listbooking.add(warpmodel.getListBookingDetailsdepart().get(i));
        }

        if (ListReturnSeat != null) {
            for (int i = 0; i < ListReturnSeat.size(); i++) {
                warpmodel.getListBookingDetailsreturn().get(i).setFlight(flightServices.getflightbyID(returnflightid));
                warpmodel.getListBookingDetailsreturn().get(i).setSeats(seatServices.FindSeat(ListReturnSeat.get(i), returnflightid));
                warpmodel.getListBookingDetailsreturn().get(i).setPrice(aircraftsSeatsServices.getAircraftSeats(ListReturnSeat.get(i), returnflightid).getPrice() * 20000);
                warpmodel.getListBookingDetailsreturn().get(i).setSeatType(aircraftsSeatsServices.getAircraftSeats(ListReturnSeat.get(i), returnflightid).getSeatType().getSeatTypeEnum());
                warpmodel.getListBookingDetailsreturn().get(i).setIffantprice();
                warpmodel.getListBookingDetailsreturn().get(i).setToallyprice();
                sum = sum + warpmodel.getListBookingDetailsreturn().get(i).getToallyprice();
                Listreturn.add(warpmodel.getListBookingDetailsreturn().get(i));
                Listbooking.add(warpmodel.getListBookingDetailsreturn().get(i));
            }
        }
        booking.setBookingDetails(Listbooking);
        booking.setBookingDate(new Date());
        booking.setTotallyPrice(sum);
        session.setAttribute("booking", booking);
        model.addAttribute("booking", booking);
        model.addAttribute("departflight", flightServices.getflightbyID(flightid));
        model.addAttribute("returnflight", flightServices.getflightbyID(returnflightid));
        model.addAttribute("Listbepart", Listbepart);
        model.addAttribute("Listreturn", Listreturn);
        return "user/confirme";

    }

    @RequestMapping(value = "/finishBooking", method = RequestMethod.POST)
    public String finishBooking(Model model,
            @ModelAttribute("payment") String payment,
            HttpServletRequest request,
            BindingResult result,
            @RequestParam("paymentMethod") String paymentMethod
    ) throws MessagingException {
        HttpSession session = request.getSession();
        Booking booking = (Booking) session.getAttribute("booking");
        List<String> ListSeat = (List<String>) session.getAttribute("listseat");
        List<String> ListReturnSeat = (List<String>) session.getAttribute("ListReturnSeat");
        int flightid = (int) session.getAttribute("departflight");
        int returnflightid = (int) session.getAttribute("returnflight");
        if (paymentMethod.equals("paylater")) {
            booking.setBookingStatus(BookingStatus.IN_PROGESS);
            booking.setBookingCode();
            booking.setPaymentCode();

            for (BookingDetail s : booking.getBookingDetails()) {
                s.setBooking(booking);
            }
            if (ListReturnSeat != null) {
                for (int i = 0; i < ListReturnSeat.size(); i++) {
                    AircraftSeats as = aircraftsSeatsServices.getAircraftSeats(ListReturnSeat.get(i), returnflightid);
                    as.setSeatStatus(seatstatusServices.findbyid(2));
                    aircraftsSeatsServices.save(as);
                }
            }

            for (int i = 0; i < ListSeat.size(); i++) {
                AircraftSeats as = aircraftsSeatsServices.getAircraftSeats(ListSeat.get(i), flightid);
                as.setSeatStatus(seatstatusServices.findbyid(2));
                aircraftsSeatsServices.save(as);
            }
            Flight flight = flightServices.getflightbyID(flightid);
            flight.setAvaibleSeats(flight.getAvaibleSeats() - ListSeat.size());
            Flight returnflight = flightServices.getflightbyID(returnflightid);
            returnflight.setAvaibleSeats(returnflight.getAvaibleSeats() - ListSeat.size());
            flightServices.save(flight);
            
            flightServices.save(returnflight);
            bookingServices.save(booking);
            model.addAttribute("booking", booking);
            String recipient = booking.getEmail();
            String subject = "Thanhk you for booking at Travel Booking";
            String content = "Here is your Booking Code: " + booking.getBookingCode() + " "
                    + "and this is your payment code: " + booking.getPaymentCode() + " pleas give payment code at station and pay to get ticket";

            emailServices.sendEmail(recipient, subject,
                    content);

            return "user/succsesbooking";
        } else {
            model.addAttribute("booking", booking);
            session.setAttribute("booking", booking);
            return "user/payment";
        }
    }

    @RequestMapping(value = "/checkbalance", method = RequestMethod.POST)
    public String checkbalance(Model model,
            @ModelAttribute("payment") String payment,
            HttpServletRequest request,
            BindingResult result,
            @RequestParam("accountNo") int cardid,
            @RequestParam("name") String name,
            @RequestParam("bank") String bank) throws MessagingException {
        HttpSession session = request.getSession();
        Booking booking = (Booking) session.getAttribute("booking");

        name = name.replaceAll(" ", "");
        CerditCard card = creditCardServices.getCreditcard(cardid, name, bank);
        if (card == null) {
            model.addAttribute("booking", booking);
            model.addAttribute("error", "this card doesn't exit");
            return "user/payment";
        } else {
            if (card.getBalance() < booking.getTotallyPrice()) {
                model.addAttribute("booking", booking);
                model.addAttribute("error", "dont have enough money");
                return "user/payment";
            } else {
                List<String> ListSeat = (List<String>) session.getAttribute("listseat");
                List<String> ListReturnSeat = (List<String>) session.getAttribute("ListReturnSeat");
                int flightid = (int) session.getAttribute("departflight");
                int returnflightid = (int) session.getAttribute("returnflight");
                booking.setBookingStatus(BookingStatus.COMPLETED);
                booking.setBookingCode();
                booking.setPaymentCode();
                for (BookingDetail s : booking.getBookingDetails()) {
                    s.setBooking(booking);
                }
                if (ListReturnSeat != null) {
                    for (int i = 0; i < ListReturnSeat.size(); i++) {
                        AircraftSeats as = aircraftsSeatsServices.getAircraftSeats(ListReturnSeat.get(i), returnflightid);
                        as.setSeatStatus(seatstatusServices.findbyid(2));
                        aircraftsSeatsServices.save(as);
                    }
                }

                for (int i = 0; i < ListSeat.size(); i++) {
                    AircraftSeats as = aircraftsSeatsServices.getAircraftSeats(ListSeat.get(i), flightid);
                    as.setSeatStatus(seatstatusServices.findbyid(2));
                    aircraftsSeatsServices.save(as);
                }
                card.setBalance(card.getBalance() - booking.getTotallyPrice());
                creditCardServices.save(card);
                bookingServices.save(booking);
                model.addAttribute("booking", booking);
                String recipient = booking.getEmail();
                String subject = "Thanhk you for booking at Travel Booking you had purchased ticket with amount: "+booking.getTotallyPrice()+"";
                String content = "Here is your Booking Code: " + booking.getBookingCode() + " "
                        + "pleas give this code to station office to recive the ticket";

                emailServices.sendEmail(recipient, subject,
                        content);
                return "user/succsesbooking";
            }
        }
    }
}
