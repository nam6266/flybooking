<%-- 
    Document   : passengerinfor
    Created on : Dec 15, 2022, 5:40:27 PM
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
        <title>Passenger information</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/passenger.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/header.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/footer.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
              integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <c:import url="/WEB-INF/pages/include/header.jsp"/> 

        <div class="container-fluid">

            <h1> Customer Information </h1>
            <mvc:form id="bookinginfor" action="${pageContext.request.contextPath}/bookingresult" method="POST" modelAttribute="booking">

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="fullname">fullname</label>
                            <input class="form-control" id="fullname" name="fullname"  value="" required/>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="email">email</label>
                            <input class="form-control" type="email" id="email" name="email" value="" required/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="idCard">ID card</label>
                            <input class="form-control" id="idCard" name="idCard" pattern="[0-9]{12}" min="12" required/>
                        </div>
                    </div>


                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="phone">phone</label>
                            <input class="form-control" id="phone" type="tel"  placeholder="0000-000-000" name="phone" value="" pattern="[0-9]{4}[0-9]{3}[0-9]{3}" required/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="gender">gender: </label>
                            <c:forEach items="${genders}" var="g">
                                <input style="margin: 0 10px 0 10px" name="gender" type="radio" value="${g}">${g}
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-success" >Submit</button>
                    </div>
                </div>
            </mvc:form>
        </div>
        <c:import url="/WEB-INF/pages/include/footer.jsp"/> 
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        
        <script type="text/javascript">
            $().ready(function () {
                $("#bookinginfor").validate();
        </script>
    </body>
</html>
