<%-- 
    Document   : confirme
    Created on : Dec 20, 2022, 10:12:59 PM
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/confirm.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/header.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/footer.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
              integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <c:import url="/WEB-INF/pages/include/header.jsp"/> 

        <div class="container-fluid">
            <div id="customerInfo" class="row">
                <div class="col-md-12">
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
                            <tr>
                                <td>IDcard</td>
                                <td>${booking.idCard}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <table class="table tableFormat">
                        <thead>
                            <tr>
                                <th class="title">Booking Information</th>
                                <th class="title"></th>
                                <th class="title"></th>
                                <th class="title"></th>
                                <th class="title"></th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr>
                                <td></td>
                                <td class="subtitle" style="font-weight: 550">From ${departflight.flightRoute.departure.country} to ${departflight.flightRoute.desternation.country} : <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${departflight.flightRoute.price}" /> Vnd 
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>Passenger namer</th>
                                <th>Seats</th>
                                <th style="text-align: right; padding-right: 100px">Cost</th>
                                <th></th>
                                <th></th>
                            </tr>

                            <c:forEach var="b" items="${Listbepart}" varStatus="status">
                                <tr>
                                    <td class="subtitle">${b.fullName}
                                        <c:if test="${ticket.attachedInfant == true}">
                                            (+ Infant)
                                        </c:if> 
                                    </td>
                                    <td>
                                        Seat ${b.seats.number} <br>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>Class ${b.seatType}</td>
                                                <td > <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${b.price}" /> Vnd</td>
                                            </tr>


                                            <c:if test ="${b.attachedInfant == true}">
                                                <tr>
                                                    <td>Attached infant</td>
                                                    <td ><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${b.iffantprice}" /> Vnd</td>
                                                </tr>  
                                            </c:if>

                                            <tr>
                                                <td>Total</td>
                                                <td > <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${b.toallyprice}" /> Vnd </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>

                                    </td>
                                    <td>

                                    </td>
                                </tr>
                            </c:forEach>

                            <c:if test="${not empty Listreturn}">   
                                <tr>
                                    <td></td>
                                    <td class="subtitle" style="font-weight: 550">From ${returnflight.flightRoute.departure.country} To ${returnflight.flightRoute.desternation.country} : <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${returnflight.flightRoute.price}" /> Vnd
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th>Passenge namer</th>
                                    <th>Seat</th>
                                    <th style="text-align: right; padding-right: 100px">Cost</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                <c:forEach var="b" items="${Listreturn}" varStatus="status">
                                    <tr>
                                        <td class="subtitle">${b.fullName}
                                            <c:if test="${ticket.attachedInfant == true}">
                                                (+ Infant)
                                            </c:if> 
                                        </td>
                                        <td>
                                            Seat ${b.seats.number} <br>
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td >Class ${b.seatType}</td>
                                                    <td > <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${b.price}" /> Vnd  </td>
                                                </tr>


                                                <c:if test ="${b.attachedInfant == true}">
                                                    <tr>
                                                        <td>Attached infant</td>
                                                        <td > <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${b.iffantprice}" /> Vnd  </td>
                                                    </tr>  
                                                </c:if>

                                                <tr>
                                                    <td>Total</td>
                                                    <td > <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${b.toallyprice}" /> Vnd  </td>
                                                </tr>
                                            </table>
                                        </td>

                                        <td> </td>
                                        <td> </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <tr>
                                <th colspan='4'>Total</th>
                                <th class="number"> <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${booking.totallyPrice}" /> Vnd </th>

                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>  

            <div style="background-color: lavender;padding: 10px">Pleas chose payment method </div>
            <mvc:form id="bookingForm" action="${pageContext.request.contextPath}/finishBooking"  method="POST" class="col-md-11" >

                <div class="form-group row">
                    <div class="col-md-3 custom-control custom-radio">
                        <input id="roundTrip" type="radio" name="paymentMethod" value="payoline" class="custom-control-input" checked> 
                        <label for="roundTrip" class="custom-control-label">Pay now</label>
                    </div>

                    <div class="col-md-3 custom-control custom-radio">
                        <input id="oneWay" type="radio" name="paymentMethod" value="paylater" class="custom-control-input"> 
                        <label for="oneWay" class="custom-control-label">pay later</label>
                    </div>
                </div>
                <button style="margin-left: 90%; margin-bottom: 10px" type="submit" class="btn btn-primary" >Submit</button>
            </mvc:form>
        </div>
        <c:import url="/WEB-INF/pages/include/footer.jsp"/> 
    </body>
</html>
