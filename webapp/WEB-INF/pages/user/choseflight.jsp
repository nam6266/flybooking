<%-- 
    Document   : choseflight
    Created on : Nov 30, 2022, 7:36:37 PM
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
        <title>Chose flight</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/choseflight.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/header.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/footer.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
              integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <c:import url="/WEB-INF/pages/include/header.jsp"/> 
        <div class="container">

            <c:if test="${fn:length(flight)<=0}">
                <h3>No Flight Found</h3>
            </c:if>

            <c:if test="${fn:length(flight)>0}">
                <div id="departnote">
                    <h3>chọn chuyến bay lượt đi</h3> 
                    <h3>${flight[0].flightRoute.departure.stationCode} ----> ${flight[0].flightRoute.desternation.stationCode}</h3>
                    <h3>Ngày khởi hành:${flight[0].depart}</h3>
                </div>

                <div id="returnnote" hidden>
                    <h3 >chọn chuyến bay lượt về</h3> 
                    <h3>${returnflight[0].flightRoute.departure.stationCode} ----> ${returnflight[0].flightRoute.desternation.stationCode}</h3>
                    <h3>Ngày khởi hành :${returnflight[0].depart}</h3>
                </div>
                <c:forEach items="${flight}" var="f">
                    <div id="fligh">                        
                        <div class="header">
                            <h1>${f.aircrafts.name}${f.aircrafts.number}</h1>
                        </div>
                        <div class="row">
                            <div class="col-sm-2" style="text-align:center">
                                <div>
                                    ${f.timeDepart}&nbsp&nbsp&nbsp<i class="fa-solid fa-plane-departure"></i>
                                </div>
                                <div>
                                    ${f.flightRoute.departure.stationCode}
                                </div>
                            </div>

                            <div class="col-sm-3" style="text-align:center">
                                <div> 
                                    ${f.flightRoute.duration}h
                                </div>
                                <div> 
                                    ---------->
                                </div>
                            </div>

                            <div class="col-sm-2" style="text-align:center">
                                <div>                            
                                    <i class="fa-solid fa-plane-arrival"></i> ${f.timeArrivale}h
                                </div>
                                <div>
                                    ${f.flightRoute.desternation.stationCode}
                                </div>
                            </div>

                            <div class="col-sm-5" style="text-align:center">
                                <div>
                                    <p><fmt:formatNumber type = "number" 
                                                         maxFractionDigits = "3" value = "${f.flightRoute.price}" /> Vnd</p>
                                </div>

                                <div>
                                    Còn ${f.avaibleSeats} chỗ
                                </div>

                                <c:if test = "${triptype == 1}">
                                    <div>
                                        <button class="chose_flight" type="button" onclick="showReturnTrip(${f.id})"> chọn   </button>
                                    </div>
                                </c:if>

                                <c:if test = "${triptype == 2}">
                                    <div>
                                        <button class="chose_flight" type="button" onclick="location.href = '<c:url value="/addflight/${f.id}/${triptype}"/>'" >chọn(roundtrip)</button>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>

            <c:forEach items="${returnflight}" var="f">
                <div class="returnfligh"  >
                    <div class="header">
                        <h1>${f.aircrafts.name}${f.aircrafts.number}</h1>
                    </div>
                    <div class="row">
                        <div class="col-sm-2" style="text-align:center">
                            <div>
                                ${f.timeDepart}h <i class="fa-solid fa-plane-departure"></i>
                            </div>
                            <div>
                                ${f.flightRoute.departure.stationCode}
                            </div>
                        </div>

                        <div class="col-sm-3" style="text-align:center">
                            <div> 
                                ${f.flightRoute.duration}h
                            </div>
                            <div> 
                                ---------->
                            </div>
                        </div>

                        <div class="col-sm-2" style="text-align:center">
                            <div>                            
                                <i class="fa-solid fa-plane-arrival"></i> ${f.timeArrivale}h
                            </div>
                            <div>
                                ${f.flightRoute.desternation.stationCode}
                            </div>
                        </div>

                        <div class="col-sm-5" style="text-align:center">
                            <div>
                                    <p><fmt:formatNumber type = "number" 
                                                         maxFractionDigits = "3" value = "${f.flightRoute.price}" /> Vnd</p>
                                </div>
                            <div>
                                Còn ${f.avaibleSeats} chỗ
                            </div>
                            <div>
                                <button class="chose_flight" type="button" onclick="location.href = '<c:url value="/addflight/${f.id}/${triptype}"/>'" >chọn</button>
                            </div>

                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <c:import url="/WEB-INF/pages/include/footer.jsp"/> 

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <script>
                                    $(document).ready(function () {
                                        $("#returnDateInput").attr('disabled', true);
                                    });


                                    function showReturnTrip(id)
                                    {
                                        $.ajax({
                                            url: "/Spring_MVC_Project_Final/addDepartFlight",
                                            type: "GET", //send it through get method
                                            data:
                                                    {
                                                        'id': id
                                                    },
                                            success: function (data) {
                                                $("#fligh").attr('hidden', true);
                                                $(".returnfligh").css('display', 'block');
                                                $("#returnnote").attr('hidden', false);
                                                $("#departnote").attr('hidden', true);
                                            },
                                            error: function (xhr) {
                                                //Do Something to handle error
                                            }
                                        });
                                    }


        </script>
    </body>
</html>
