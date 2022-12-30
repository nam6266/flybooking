<%-- 
    Document   : manageaircraft
    Created on : Dec 6, 2022, 5:40:58 PM
    Author     : OS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Aircraft Form</h1>
        <mvc:form action="${pageContext.request.contextPath}/saveAircraft" 
                  method="POST" modelAttribute="aircraft">
            <label for="name">Aircraft Name</label>
            <input id="name" name="name" type="text" value="TV" ><br>

            <label for="number">Aircraft Code:</label>
            <input id="number" name="number" type="text"  ><br>

            <label for="row">Nhập số hàng ghế: </label>
            <input id="row" name="row" type="number"  ><br>

            <label for="col">Nhập số dãy ghế :</label>
            <input id="col" name="col" type="number" ><br>

            <input type="submit" value="Add"/>
        </mvc:form>
    </body>
</html>
