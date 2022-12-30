<%-- 
    Document   : passengerinfor
    Created on : Dec 18, 2022, 2:48:23 PM
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
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/header.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/footer.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
              integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <c:import url="/WEB-INF/pages/include/header.jsp"/> 

        <div class="container-fluid">
            <mvc:form id="passengerinfor" action="${pageContext.request.contextPath}/pasengerresult" method="POST" modelAttribute="warp">
                <div id="tickets" class="row">
                    <div class="col-md-12">
                        <table class="table tableFormat">
                            <thead>
                            <th colspan="4">Passenger Information</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <th style="width: 35%" class="subtitle">Passenger</th>
                                    <th style="width: 30%" class="subtitle">Infant</th>
                                </tr>
                                <tr>
                                    <td>Passenger infor for depart flight</td>
                                    <td></td>
                                </tr>
                                <c:forEach var="ticket" items="${warp.listBookingDetailsdepart}" varStatus="status">

                                    <tr>
                                        <td> 
                                            <div class="input-group input-group-sm info">
                                                <div class="input-group-prepend col-md-5 labelcontain">
                                                    <lable class="input-group-text label" for="departFirstName${status.count}">Full name</lable>
                                                </div>
                                                <input name="listBookingDetailsdepart[${status.index}].fullName" placeholder="Name for passenger at seat:  ${warp.listBookingDetailsdepart[status.index].seats.number}" class="form-control form-control-sm col-md-7 firstName" id="departFirstName${status.count}" type="text" required>
                                            </div>
                                            <div class="input-group input-group-sm">
                                                <div class="col-md-5">
                                                </div>
                                                <c:set var="departFirstNameError" value="${requestScope['departFirstNameError'.concat(status.index)]}" />
                                                <div class="error" id="vDepartFirstName${status.count}">${departFirstNameError}</div>
                                            </div>

                                            <div class="input-group input-group-sm info">
                                                <div class="input-group-prepend col-md-5 labelcontain">
                                                    <label class="input-group-text label" for="departGender${status.count}">Gender</label>
                                                </div>
                                                <select name="listBookingDetailsdepart[${status.index}].gender" class="custom-select custom-select-sm col-md-7" id="departGender${status.count}" required="required">
                                                    <option value="MALE" selected > Male 
                                                    </option>
                                                    <option value="FEMALE">
                                                        Female 
                                                    </option>
                                                </select>
                                            </div>

                                        </td>
                                        <td>     
                                            <div class="input-group input-group-sm info attachedInfantContain">
                                                <div class="input-group-prepend col-md-5 labelcontain">
                                                    <lable class="input-group-text label">Infant</lable>
                                                </div>
                                                <div class="form-control form-control-sm col-md-7 attachedInfant">
                                                    <input name="listBookingDetailsdepart[${status.index}].attachedInfant" value="true" type="radio" id="departInfantTrue${status.count}" >
                                                    <lable>Yes</lable>
                                                    <input name="listBookingDetailsdepart[${status.index}].attachedInfant" value="false" type="radio" id="departInfantFalse${status.count}" checked >
                                                    <lable>No</lable>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td>Passenger infor for return flight</td>
                                    <td></td>
                                </tr>

                                <c:if test="${not empty warp.listBookingDetailsreturn}">
                                    <c:forEach var="ticket" items="${warp.listBookingDetailsreturn}" varStatus="status">
                                        <tr>
                                            <td> 
                                                <div class="input-group input-group-sm info">
                                                    <div class="input-group-prepend col-md-5 labelcontain">
                                                        <lable class="input-group-text label" for="departFirstName${status.count}">Full name</lable>
                                                    </div>
                                                    <input name="listBookingDetailsreturn[${status.index}].fullName" placeholder="Name for passenger at seat:   ${warp.listBookingDetailsreturn[status.index].seats.number}" class="form-control form-control-sm col-md-7 firstName" id="departFirstName${status.count}" type="text">
                                                </div>
                                                <div class="input-group input-group-sm">
                                                    <div class="col-md-5">
                                                    </div>
                                                    <c:set var="departFirstNameError" value="${requestScope['departFirstNameError'.concat(status.index)]}" />
                                                    <div class="error" id="vDepartFirstName${status.count}">${departFirstNameError}</div>
                                                </div>

                                                <div class="input-group input-group-sm info">
                                                    <div class="input-group-prepend col-md-5 labelcontain">
                                                        <label class="input-group-text label" for="departGender${status.count}">Gender</label>
                                                    </div>
                                                    <select name="listBookingDetailsreturn[${status.index}].gender" class="custom-select custom-select-sm col-md-7" id="departGender${status.count}" required="required">
                                                        <option value="MALE" selected > Male 
                                                        </option>
                                                        <option value="FEMALE">
                                                            Female 
                                                        </option>
                                                    </select>
                                                </div>

                                            </td>
                                            <td>     
                                                <div class="input-group input-group-sm info attachedInfantContain">
                                                    <div class="input-group-prepend col-md-5 labelcontain">
                                                        <lable class="input-group-text label">Infant</lable>
                                                    </div>
                                                    <div class="form-control form-control-sm col-md-7 attachedInfant">
                                                        <input name="listBookingDetailsreturn[${status.index}].attachedInfant" value="true" type="radio" id="departInfantTrue${status.count}" >
                                                        <lable>Yes</lable>
                                                        <input name="listBookingDetailsreturn[${status.index}].attachedInfant" value="false" type="radio" id="departInfantFalse${status.count}" checked >
                                                        <lable>No</lable>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>


                <button style="margin: 0 0 10px 85%;border-radius: 5px" type="submit">submit</button>
            </mvc:form>
            <c:import url="/WEB-INF/pages/include/footer.jsp"/> 

            <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

            <script type="text/javascript">
                $().ready(function () {
                $("#passengerinfor").validate();
            </script>
        </div>
    </body>
</html>
