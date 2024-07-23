<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Details</title>
<style>
body {
	background: url("https://static.vecteezy.com/system/resources/thumbnails/026/977/435/small_2x/healthcare-theme-3d-illustration-of-an-empty-emergency-room-ai-generative-free-photo.jpg")
		no-repeat center center fixed;
    background-size: cover;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	line-height: 1.6;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
}

.container {
	width: 80%;
	margin: 20px auto;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	background-color: #fff;
	border-radius: 8px;
	overflow: hidden;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 12px;
	text-align: center;
	border: 1px solid #ddd;
}

th {
	background-color: #4CAF50;
	color: white;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}

.header {
	background-color: #4CAF50;
	color: white;
	padding: 12px 0;
	text-align: center;
	font-size: 24px;
}
input[type="button"]{
    	background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-top: 10px;
    }
    input[type="button"]:hover{
        background-color: #45a049;
    }
</style>
</head>
<body>
	<jsp:useBean id="addappointmentimp"
		class="com.java.hoscust.AppointmentDaoImpl" />
	<c:set var="details" value="${addappointmentimp.showappointment()}" />

	<div class="container">
		<div class="header">Appointment Details</div>
		<table>
			<thead>
				<tr>
					<th>Appointment ID</th>
					<th>Patient Name</th>
					<th>Patient Email</th>
					<th>Patient Mobile</th>
					<th>Doctor Name</th>
					<th>Appointment Date</th>
					<th>Appointment Time</th>
					<th>Patient Disease</th>
				</tr>

			</thead>
			<tbody>
				<c:forEach var="appointment" items="${details}">
					<tr>
						<td><c:out value="${appointment.appointmentid}" /></td>
						<td><c:out value="${appointment.patientname}" /></td>
						<td><c:out value="${appointment.patientemail}" /></td>
						<td><c:out value="${appointment.patientmobile}" /></td>
						<td><c:out value="${appointment.doctorName}" /></td>
						<td><c:out value="${appointment.appointmentdate}" /></td>
						<td><c:out value="${appointment.appointtime}" /></td>
						<td><c:out value="${appointment.patientdisease}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="text-align: center; margin-top: 20px;">
		<input type="button" value="Go to Menu"
			onclick="location.href='index.jsp'" />
	</div>
</body>
</html>
