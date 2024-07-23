<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://example.com/doctor-taglib" prefix="doc"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Show Doctors</title>
<style>
body {
	font-family: Arial, sans-serif;
	background:
		url("https://static.vecteezy.com/system/resources/thumbnails/026/977/435/small_2x/healthcare-theme-3d-illustration-of-an-empty-emergency-room-ai-generative-free-photo.jpg")
		no-repeat center center fixed;
	background-size: cover;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	height: 100vh;
	background-color: #f9f9f9;
}

h2 {
	color: #333;
	text-align: center;
	margin-bottom: 20px;
}

table {
	width: 70%;
	border-collapse: collapse;
	margin: 0 auto;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 10px;
	text-align: center;
}

th {
	background-color: #f4f4f4;
}

tr{
	background-color: #f9f9f9;
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
	<h2>List of Doctors</h2>
	<doc:showDoctors />
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Specialization</th>
			<th>Qualification</th>
			<th>Available Slot</th>
		</tr>
		<c:forEach var="doctor" items="${doctors}">
			<tr>
				<td><c:out value="${doctor.doctorId}" /></td>
				<td><c:out value="${doctor.doctorName}" /></td>
				<td><c:out value="${doctor.specialization}" /></td>
				<td><c:out value="${doctor.qualification}" /></td>
				<td><c:out value="${doctor.availableSlot}" /></td>
			</tr>
		</c:forEach>
	</table>
	<div style="text-align: center; margin-top: 20px;">
		<input type="button" value="Go to Menu"
			onclick="location.href='index.jsp'" />
	</div>
	
</body>
</html>