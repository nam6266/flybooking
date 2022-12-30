<%-- 
    Document   : payment
    Created on : Dec 22, 2022, 2:24:40 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/payment.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/header.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/footer.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
              integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <c:import url="/WEB-INF/pages/include/header.jsp"/> 
        <div class="container-fluid">
            <div class="contain row">          


                <div class="payment col-md-12">
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6 center" id="paycheck" >
                            <mvc:form id="passengerinfor" action="${pageContext.request.contextPath}/checkbalance" method="POST">
                                <table>
                                    <tr>
                                        <th style="width: 35%"></th>
                                        <th style="width: 65%"></th>
                                    </tr>
                                    <tr>
                                        <th colspan="2">Payment Information</th>
                                    </tr>

                                    <tr>
                                        <td><label for="accountNo">Account number</label></td>
                                        <td> 
                                            <input class="form-control-sm" name="accountNo" id="accountNo" type="number"  placeholder="put in credit cardr" style="width: 100%" required>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><label for="name">Owner name's</label></td>
                                        <td> 
                                            <input class="form-control-sm" name="name" id="name" type="text"  placeholder="put in name" style="width: 100%" required>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><label for="bank">Bank name</label></td>
                                        <td>
                                            <select id="bank" class="form-control-sm" name="bank" >
                                                <option value="TPbank">Tien phong Bank</option>
                                                <option value="Vcbank">Vietcom Bank</option>
                                                <option value="Vtbank">Vietin Bank</option>
                                            </select>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td><label for="owner">Amount need to pay: </label></td>
                                        <td> 
                                            <h3><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${booking.totallyPrice}" /> Vnd</h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td><div class="error">${error}</div></td>
                                    </tr>

                                    <tr>
                                        <td></td>
                                        <td><button class="btn btn-success" type="submit" style="width: 5em; margin-left: 65%"> Pay</button></td>
                                    </tr>   

                                </table>
                            </mvc:form>
                        </div>
                        <div class="col-md-3"></div>
                    </div>
                </div>

            </div>
        </div>
        <c:import url="/WEB-INF/pages/include/footer.jsp"/> 

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            $().ready(function () {
            $("#passengerinfor").validate();
        </script>

    </body>
</html>
