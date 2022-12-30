<%-- 
    Document   : welcomePage
    Created on : Jun 9, 2020, 10:09:35 AM
    Author     : ldanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Travel Booking</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/home.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/header.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/footer.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
              integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <c:import url="/WEB-INF/pages/include/header.jsp"/> 
        <div id="banner" class="row">      
            <div id="imgslide" class="col-sm-6">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">

                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>

                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/singapor.jpg" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/japan.jpg" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/alaskar.jpg" alt="Third slide">
                        </div>
                    </div>

                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>

                </div>

            </div>        
        </div>

        <div id="loginOrBooking" class="row"> 
            <div id="booking" class="col-md-12">
                <div>
                    <h2>Booking</h2>
                </div>
                <mvc:form id="bookingForm" action="${pageContext.request.contextPath}/searchflight"  method="POST" class="col-md-11" >
                    <div class="form-group row">
                        <div class="col-md-3 custom-control custom-radio">
                            <input id="roundTrip" type="radio" name="tripType" value="roundTrip" class="custom-control-input" checked> 
                            <label for="roundTrip" class="custom-control-label">Round-trip</label>
                        </div>

                        <div class="col-md-3 custom-control custom-radio">
                            <input id="oneWay" type="radio" name="tripType" value="oneWay" class="custom-control-input"> 
                            <label for="oneWay" class="custom-control-label">One-way</label>
                        </div>
                    </div>

                    <div class=" form-group row">
                        <div class="col-md-4">
                            <label for="departure" class=" col-form-label">From</label>
                            <select id="departure" class="custom-select" name="departure" onchange="loadtostation();">
                                <option value="" disabled selected>Pleas chose your depart  station</option>
                                <c:forEach items="${listStation}" var="station">
                                    <option value="${station.id}">${station.country}</option>
                                </c:forEach>
                            </select>
                            <div class="error">${StationError}</div>
                        </div>

                        <div class="col-md-4">
                            <label for="arrival" class="col-form-label">To</label>
                            <select id="arrival" class="custom-select" name="arrival">

                            </select>
                            <div class="error">${StationError}</div>
                        </div>         

                        <div class="col-md-4">
                            <label class="col-form-label">chose passenger(max 7)</label>
                            <input class="form-control" name="passenger" type="number" min="1" max="7" value="1">
                        </div>  
                    </div>

                    <div class="form-group row">

                        <div class="col-md-5">
                            <label id="departDate" for="departDate" class="col-form-label">Depart</label>
                            <input name="departDate" type="date" id="departDateInput" class="form-control" style="width:100%">
                            <div class="error">${DateError}</div>
                        </div>

                        <div class="col-md-5">
                            <label id="returnDate" for="returnDate" class="col-form-label">Return</label>
                            <input name="returnDate" type="date" id="returnDateInput" class="form-control" style="width:100%">
                            <div class="error">${DateError}</div>
                        </div>
                    </div>

                    <button style="margin-left: 90%; margin-bottom: 10px" type="submit" class="btn btn-primary" >Search</button>

                </div>                    
            </mvc:form>
        </div>   
    </div>
    <c:import url="/WEB-INF/pages/include/footer.jsp"/> 

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
                                $(document).ready(function () {

                                    document.getElementById('departDateInput').valueAsDate = new Date();
                                    document.getElementById('returnDateInput').valueAsDate = new Date();
                                });

                                $(function () {
                                    $('input[name=tripType]').change(function () {
                                        if ($(this).val() === "oneWay") {
                                            $("#returnDateInput").attr('disabled', true);
                                            $("#returnDateInput").attr('hidden', true);
                                            $("#returnDate").attr('hidden', true);
                                        } else {
                                            $("#returnDateInput").attr('disabled', false);
                                            $("#returnDateInput").attr('hidden', false);
                                            $("#returnDate").attr('hidden', false);
                                        }
                                    });
                                });

                                function loadtostation()
                                {                                   
                                   var arive = $( "#departure" ).val();
                                   console.log(arive);
                                    $.ajax({
                                        url: "/Spring_MVC_Project_Final/loadAriveStation",
                                        type: "GET", //send it through get method
                                       data:
                                                {
                                                    'id': arive
                                                },
                                        success: function (data) {
                                            var row = document.getElementById("arrival");
                                            row.innerHTML = data;
                                        },
                                        error: function (xhr) {
                                            //Do Something to handle error
                                        }
                                    });
                                }
                                ;


    </script>
</body>
</html>
