<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Appointment</title>
<!-- Flatpickr CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<style>
    body {
    	background: url("https://static.vecteezy.com/system/resources/thumbnails/026/977/435/small_2x/healthcare-theme-3d-illustration-of-an-empty-emergency-room-ai-generative-free-photo.jpg")
		no-repeat center center fixed;
    	background-size: cover;
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        padding: 20px;
    }
    #table-1 {
        width: 60%;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    label {
        font-weight: bold;
    }
    input[type="text"], input[type="date"], input[type="time"] {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        transition: border-color 0.3s, box-shadow 0.3s;
    }
    input[type="date"], input[type="time"] {
        background-color: #fff;
        cursor: pointer;
    }
    input[type="submit"], input[type="button"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-top: 10px;
        transition: background-color 0.3s;
    }
    input[type="submit"]:hover, input[type="button"]:hover {
        background-color: #45a049;
    }
    .button-container {
        text-align: center;
    }
</style>
</head>
<body>
	<jsp:include page="index.jsp" />
    <form action="AddAppointmentjsp.jsp" method="get">
        <table id="table-1">
            <tr>
                <td><label>Patient Name:</label></td>
                <td><input type="text" name="patientname" required="required"></td>
            </tr>
            <tr>
                <td><label>Patient Email:</label></td>
                <td><input type="text" name="patientemail" required="required"></td>
            </tr>
            <tr>
                <td><label>Patient Mobile:</label></td>
                <td><input type="text" name="patientmobile" required="required"></td>
            </tr>
            <tr>
                <td><label>Doctor Name:</label></td>
                <td><input type="text" name="doctorname" required="required"></td>
            </tr>
            <tr>
                <td><label>Appointment Date:</label></td>
                <td><input id="datePicker" type="text" name="appointmentdate" required="required"></td>
            </tr>
            <tr>
                <td><label>Appointment Time:</label></td>
                <td><input id="timePicker" type="text" name="appointtime" required="required"></td>
            </tr>
            <tr>
                <td><label>Patient Disease:</label></td>
                <td><input type="text" name="patientdisease"></td>
            </tr>
            <tr>
                <td colspan="2" class="button-container">
                    <input type="submit" value="Submit">
                    <input type="button" value="Go to Menu" onclick="location.href='index.jsp'">
                </td>
            </tr>
        </table>
    </form>
    <c:if test="${param.patientname != null}">
        <jsp:useBean id="addappointmentimp" class="com.java.hoscust.AppointmentDaoImpl" />
        <jsp:useBean id="appointment" class="com.java.hoscust.Appointment" />
        <%
            // Processing form data
            String patientName = request.getParameter("patientname");
            String patientEmail = request.getParameter("patientemail");
            String patientMobile = request.getParameter("patientmobile");
            String doctorName = request.getParameter("doctorname");
            String appointTime = request.getParameter("appointtime");
            String patientDisease = request.getParameter("patientdisease");

            // Parse and convert the date
            String dateString = request.getParameter("appointmentdate");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date date = sdf.parse(dateString);
            java.sql.Date appointmentDate = new java.sql.Date(date.getTime());

            // Set appointment properties
            appointment.setPatientname(patientName);
            appointment.setPatientemail(patientEmail);
            appointment.setPatientmobile(patientMobile);
            appointment.setDoctorName(doctorName);
            appointment.setAppointmentdate(appointmentDate);
            appointment.setAppointtime(appointTime);
            appointment.setPatientdisease(patientDisease);
        %>
        <c:out value="${addappointmentimp.addappointment(appointment)}" />
    </c:if>

    <!-- Flatpickr JS -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script>
        flatpickr("#timePicker", {
            enableTime: true,
            noCalendar: true,
            dateFormat: "H:i",
            time_24hr: true
        });

        flatpickr("#datePicker", {
            dateFormat: "Y-m-d"
        });
    </script>
</body>
</html>
