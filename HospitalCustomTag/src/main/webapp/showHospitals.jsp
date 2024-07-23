<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://example.com/doctor-taglib" prefix="doc"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Show Hospitals</title>
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
	border-radius: 15px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
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

tr {
	background-color: #f9f9f9;
}

input[type="button"] {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-top: 10px;
}

input[type="button"]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<h2>Hospitals List</h2>
	<doc:showHospitals />
	<table>
		<tr>
			<th>ID</th>
			<th>Hospital Name</th>
			<th>City</th>
			<th>Type</th>
			<th>Email</th>
			<th>Phone Number</th>
		</tr>
		<c:forEach var="hospital" items="${hospitals}">
			<tr>
				<td><c:out value="${hospital.hospitalId}" /></td>
				<td><c:out value="${hospital.hospitalName}" /></td>
				<td><c:out value="${hospital.city}" /></td>
				<td><c:out value="${hospital.hospitalType}" /></td>
				<td><c:out value="${hospital.email}" /></td>
				<td><c:out value="${hospital.phoneNo}" /></td>
			</tr>
		</c:forEach>
	</table>
	<div style="text-align: center; margin-top: 20px;">
		<input type="button" value="Go to Menu"
			onclick="location.href='index.jsp'" />
	</div>

</body>
</html>
