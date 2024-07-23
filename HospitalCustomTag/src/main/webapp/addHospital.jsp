<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="WEB-INF/doctor.tld" prefix="doc" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Hospital</title>
    <link rel="stylesheet" type="text/css" href="HospitalCss.css">
</head>
<body>
    <div class="container">
        <jsp:include page="index.jsp" />
        <h2>Add Hospital</h2>
        <form action="addHospital.jsp" method="post">
            <label for="hospitalName">Hospital Name:</label>
            <input type="text" id="hospitalName" name="hospitalName" required><br><br>
            <label for="city">City:</label>
            <input type="text" id="city" name="city" required><br><br>
            <label for="hospitalType">Hospital Type:</label>
            <input type="text" id="hospitalType" name="hospitalType" required><br><br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>
            <label for="phoneNo">Phone Number:</label>
            <input type="text" id="phoneNo" name="phoneNo" required><br><br>
            <input type="submit" value="Add Hospital">
            <input type="button" value="Return Home" onclick="location.href='index.jsp';">
        </form>
        <% if ("POST".equalsIgnoreCase(request.getMethod())) { %>
            <% String hospitalName = request.getParameter("hospitalName"); %>
            <% String city = request.getParameter("city"); %>
            <% String hospitalType = request.getParameter("hospitalType"); %>
            <% String email = request.getParameter("email"); %>
            <% String phoneNo = request.getParameter("phoneNo"); %>

            <doc:addHospital 
                hospitalName="<%= hospitalName %>" 
                city="<%= city %>" 
                hospitalType="<%= hospitalType %>" 
                email="<%= email %>" 
                phoneNo="<%= phoneNo %>" 
            />
            <p>Hospital added successfully!</p>
        <% } %>
    </div>
</body>
</html>
