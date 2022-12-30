<%-- 
    Document   : choseseat
    Created on : Dec 7, 2022, 9:30:09 PM
    Author     : OS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aircraft Seats</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/seat.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/header.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/footer.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
              integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <c:import url="/WEB-INF/pages/include/header.jsp"/> 
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-9">

                    <div class="row choicemap">
                        <div class="col-md-9 seats">

                            <div id="departSeatOption" class="seatOption">

                                <h2 class="col-md-12 title">Chọn ghế cho chuyến bay lượt đi</h2>
                                <div class="seatTitle"> Máy bay: ${flight.aircrafts.name}${flight.aircrafts.number}</div>
                                <div class="seatTitle"> Đi từ: ${flight.flightRoute.departure.stationCode} Đi đến: ${flight.flightRoute.desternation.stationCode}</div>
                                <div class="seatTitle"> Xuất phát lúc: ${flight.timeDepart}</div>

                                <div id="listDepartSeat" class="plane">
                                    <div class="head">

                                    </div>
                                    <div class="cabin">
                                        <table class="seatTable">
                                            <c:forEach var="i" begin="1" end="${row}">
                                                <c:if test="${i==(row/2 + 1)}">
                                                    <tr><td><p style="border: none; margin: 10px;"></p></td></tr>
                                                        </c:if>
                                                <tr>
                                                    <c:forEach items="${departSeat}" varStatus="index" begin="${(i-1)*col}" end="${((i-1)*col)+(col-1)}">
                                                        <c:if test="${departSeat[index.index].seatStatus.seatStatusEnum =='AVAIABLE'}">
                                                            <c:if test="${departSeat[index.index].seatType.seatTypeEnum =='ECONOMY'}">
                                                                <td><input type="checkbox" name="uncheck" onclick="addTicket('${departSeat[index.index].seats.number}')" id="${departSeat[index.index].seats.number}"/>
                                                                    <label for="${departSeat[index.index].seats.number}" >${departSeat[index.index].seats.number}</label></td>
                                                                </c:if>

                                                            <c:if test="${departSeat[index.index].seatType.seatTypeEnum =='FIRST_CLASS'}">
                                                                <td><input type="checkbox" name="uncheck" onclick="addTicket('${departSeat[index.index].seats.number}')" id="${departSeat[index.index].seats.number}"/>
                                                                    <label style="color: red;" for="${departSeat[index.index].seats.number}" >${departSeat[index.index].seats.number}</label></td>
                                                                </c:if>                                                       
                                                            </c:if>

                                                        <c:if test="${departSeat[index.index].seatStatus.seatStatusEnum =='BOOKED'}">
                                                            <td><input type="checkbox" />
                                                                <label style="background-color: red">${departSeat[index.index].seats.number}</label></td>
                                                            </c:if>
                                                        </c:forEach>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </div>  

                                    <div style="clear: both;">
                                    </div>

                                </div>

                                <c:if test="${not empty returnflight}">                                   
                                    <h2 style="margin-top: 70px" class="col-md-12 title">Chọn ghế cho chuyến bay lượt về</h2>
                                    <div class="seatTitle"> Máy bay: ${returnflight.aircrafts.name}${returnflight.aircrafts.number}</div>
                                    <div class="seatTitle"> Đi từ: ${returnflight.flightRoute.departure.stationCode} Đi đến: ${returnflight.flightRoute.desternation.stationCode}</div>
                                    <div class="seatTitle"> Xuất phát lúc: ${returnflight.timeDepart}</div>

                                    <div id="listDepartSeat" class="plane">
                                        <div class="head">

                                        </div>
                                        <div class="cabin">
                                            <table class="seatTable">
                                                <c:forEach var="i" begin="1" end="${returnrow}">
                                                    <c:if test="${i==(returnrow/2 + 1)}">
                                                        <tr><td><p style="border: none; margin: 10px;"></p></td></tr>
                                                            </c:if>
                                                    <tr>
                                                        <c:forEach items="${returntSeat}" varStatus="index" begin="${(i-1)*returncol}" end="${((i-1)*returncol)+(returncol-1)}">
                                                            <c:if test="${returntSeat[index.index].seatStatus.seatStatusEnum =='AVAIABLE'}">
                                                                <c:if test="${returntSeat[index.index].seatType.seatTypeEnum =='ECONOMY'}">
                                                                    <td><input type="checkbox" name="Reuncheck" onclick="addReturnTicket('${returntSeat[index.index].seats.number}')" id="${returntSeat[index.index].seats.number}re"/>
                                                                        <label for="${returntSeat[index.index].seats.number}re" >${returntSeat[index.index].seats.number}</label></td>
                                                                    </c:if>

                                                                <c:if test="${returntSeat[index.index].seatType.seatTypeEnum =='FIRST_CLASS'}">
                                                                    <td><input type="checkbox" name="Reuncheck" id="${returntSeat[index.index].seats.number}re"/>
                                                                        <label for="${returntSeat[index.index].seats.number}re" style="color: red" onclick="addReturnTicket('${returntSeat[index.index].seats.number}')">${returntSeat[index.index].seats.number}</label></td>
                                                                    </c:if>                                                       
                                                                </c:if>

                                                            <c:if test="${returntSeat[index.index].seatStatus.seatStatusEnum =='BOOKED'}">
                                                                <td><input type="checkbox" />
                                                                    <label style="background-color: red">${returntSeat[index.index].seats.number}</label></td>
                                                                </c:if>
                                                            </c:forEach>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </div>  

                                        <div style="clear: both;">
                                        </div>

                                    </div>
                                </c:if>


                                <div style="margin-top: 10px" id="noti"></div>
                                <div class="noti">
                                    <div class="ECONOMY">
                                        <p style="color: red">A1</p>
                                    </div>
                                    <div>
                                        <p style="color: black; padding-top: 6px"> : First class</p>
                                    </div>
                                </div>

                                <div class="noti">
                                    <div class="ECONOMY">
                                        <p style="color: black">A1</p>
                                    </div>
                                    <div>
                                        <p style="color: black; padding-top: 6px"> : Economy</p>
                                    </div>
                                </div>

                                <div class="noti">
                                    <div class="BOOKED">
                                        <p style="color: black">A1</p>
                                    </div>
                                    <div>
                                        <p style="color: black; padding-top: 6px"> : Booked</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
                                
            <div><p style="color: red" id="alert"></p></div>            
            <button id="confirm" name="next" type="button" onclick="confirm()" >Confirme</button>
            
        </div>


        <c:import url="/WEB-INF/pages/include/footer.jsp"/> 
    </body>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script>
                function addTicket(id)
                {
                    if ($("#" + id + "").attr("name") == "uncheck") {
                        $("#" + id + "").attr('name', 'checked');
                    } else if ($("#" + id + "").attr("name") == "checked") {
                        $("#" + id + "").attr('name', 'uncheck');
                    }

                    $.ajax({
                        url: "/Spring_MVC_Project_Final/addTicket",
                        type: "GET", //send it through get method
                        data:
                                {
                                    'id': id
                                },
                        success: function (data) {
                            if (data == 1) {
                                $("input[name='uncheck']").attr('disabled', true);
                            }
                            if (data != 1) {
                                $("input[name='uncheck']").attr('disabled', false);
                            }
                        },
                        error: function (xhr) {
                            //Do Something to handle error
                        }
                    });
                }

                function addReturnTicket(id)
                {
                    var reid = id + "re";
                    if ($("#" + reid + "").attr("name") == "Reuncheck") {
                        $("#" + reid + "").attr('name', 'Rechecked');
                    } else if ($("#" + reid + "").attr("name") == "Rechecked") {
                        $("#" + reid + "").attr('name', 'Reuncheck');
                    }
                    $.ajax({
                        url: "/Spring_MVC_Project_Final/addReturnTicket",
                        type: "GET", //send it through get method
                        data:
                                {
                                    'id': id
                                },
                        success: function (data) {
                            if (data == 1) {
                                $("input[name='Reuncheck']").attr('disabled', true);
                            }
                            if (data != 1) {
                                $("input[name='Reuncheck']").attr('disabled', false);
                            }
                        },
                        error: function (xhr) {
                            //Do Something to handle error
                        }
                    });
                }

                function confirm()
                {

                    $.ajax({
                        url: "/Spring_MVC_Project_Final/confirm",
                        type: "GET", //send it through get method

                        success: function (data) {
                            if (data == 1) {
                                $("#alert").text(' ');
                                $("#confirm").attr('onclick', "location.href = '<c:url value="/bookinginfor"/>'");
                                $("#confirm").text('Next');
                            } else {
                                $("#alert").text('pleas chose enough seats');
                            }

                        },
                        error: function (xhr) {
                            //Do Something to handle error
                        }
                    });
                }
    </script>
</html>
