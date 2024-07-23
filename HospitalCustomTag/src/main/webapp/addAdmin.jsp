<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://example.com/doctor-taglib" prefix="custom" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Admin</title>
    <link rel="stylesheet" type="text/css" href="AdminCss.css">
</head>
<body>
    <div class="container">
        <jsp:include page="index.jsp" />
        <h2>Add Admin</h2>
        <form action="addAdmin.jsp" method="post">
            <label for="hospitalId">Hospital ID:</label>
            <input type="text" id="hospitalId" name="hospitalId" required><br>
            <label for="userName">Username:</label>
            <input type="text" id="userName" name="userName" required><br>
            <label for="passcode">Passcode:</label>
            <input type="password" id="passcode" name="passcode" required><br>
            <label for="otpPurpose">OTP Purpose:</label>
            <input type="text" id="otpPurpose" name="otpPurpose" required><br>
            <label for="otp">OTP:</label>
            <input type="text" id="otp" name="otp" required><br>
            <input type="submit" value="Add Admin">
        </form>
        <input type="button" value="Return Home" onclick="location.href='index.jsp';">

        <% if ("POST".equalsIgnoreCase(request.getMethod())) { %>
            <% String hospitalIdStr = request.getParameter("hospitalId"); %>
            <% String userName = request.getParameter("userName"); %>
            <% String passcode = request.getParameter("passcode"); %>
            <% String otpPurpose = request.getParameter("otpPurpose"); %>
            <% String enteredOtp = request.getParameter("otp"); %>

            <% int hospitalId = Integer.parseInt(hospitalIdStr); %>

            <custom:addAdmin hospitalId="<%= hospitalId %>" userName="<%= userName %>"
                             passcode="<%= passcode %>" otpPurpose="<%= otpPurpose %>"
                             enteredOtp="<%= enteredOtp %>" />
        <% } %>
    </div>
</body>
</html>
