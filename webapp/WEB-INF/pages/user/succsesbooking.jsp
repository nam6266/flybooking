<%-- 
    Document   : succsesbooking
    Created on : Dec 22, 2022, 12:32:03 AM
    Author     : OS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/header.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/succes.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/footer.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
              integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
         <c:import url="/WEB-INF/pages/include/header.jsp"/> 
        <div class="container-fluid">
           

            <c:if test="${booking.bookingCode != null}">
                <div class="col-md-6">
                    <div id="alert" style="background-color: #63df1d;" class="row alert">
                        <p>Booking successful!</p>
                        <p>Thank you for using Travel Booking booking system.</p>
                        <p>You've booked ticket(s) successful with detail below.</p>
                    </div>
                </div>


                <div class="bookInfo col-md-12">
                    <div class="row"> 
                        <div class="col-md-6">
                            <table class="table tableFormat">
                                <thead>
                                    <tr>
                                        <th colspan="2" class="title">Booker Information</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Name</td>
                                        <td>${booking.fullname}</td>
                                    </tr>

                                    <tr>
                                        <td>Email</td>
                                        <td>${booking.email}</td>
                                    </tr>

                                    <tr>
                                        <td>Phone number</td>
                                        <td>${booking.phone}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>


                        <div class="col-md-1"></div>
                        <div class="col-md-5">
                            <table class="table tableFormat">
                                <tr>
                                    <th>Booking Code</th>
                                    <td>${booking.bookingCode}</td>
                                </tr>
                                <c:if test="${booking.bookingStatus == 'IN_PROGESS'}">
                                    <tr>
                                        <th>Payment Code</th>
                                        <td>${booking.paymentCode}</td>
                                    </tr>
                                </c:if>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="ticketInfo col-md-12">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table tableFormat">
                                <thead>
                                    <tr>
                                        <th colspan="9" class="title">Booking Information</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th class="subtitle">Passenger</th>
                                        <th class="subtitle">Infant</th>
                                        <th class="subtitle">Flight</th>
                                        <th class="subtitle">Seat</th>
                                        <th class="subtitle">Depart time</th>
                                        <th class="subtitle">Payment</th>
                                        <th class="subtitle">Date</th>
                                        <th class="subtitle">Cost</th>
                                        <th></th>
                                    </tr>

                                <c:forEach var="ticket" items="${booking.bookingDetails}" varStatus="status">
                                    <tr>
                                        <td class="info">${ticket.fullName}</td>
                                        <td class="info">
                                    <c:if test="${ticket.attachedInfant == true}">
                                        attachedInfant
                                    </c:if>
                                    <c:if test="${ticket.attachedInfant == false}">
                                        None
                                    </c:if>
                                    </td> 
                                    <td class="info">
                                        ${ticket.flight.aircrafts.name}-${ticket.flight.aircrafts.number}<br>
                                        ${ticket.flight.flightRoute.departure.country} -
                                        ${ticket.flight.flightRoute.desternation.country}
                                    </td>
                                    <td class="info">${ticket.seatType}<br>Seat ${ticket.seats.number}
                                    <td class="info">${ticket.flight.timeDepart}<br>${ticket.flight.timeArrivale}</td>
                                    <td class="info">${booking.bookingStatus}</td>
                                    <td class="info">${ticket.flight.timeDepart}</td>
                                    <td class="info"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${ticket.toallyprice} " /> Vnd </td>
                                    <td></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tr>
                                    <th class="subtitle" colspan="8" style="text-align: left; padding-left: 1em">Total</th>
                                    <th class="subtitle"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${booking.totallyPrice}  " /> Vnd </th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    <c:import url="/WEB-INF/pages/include/footer.jsp"/> 
</body>
</html>
