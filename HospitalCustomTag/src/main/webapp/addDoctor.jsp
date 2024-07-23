<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="WEB-INF/doctor.tld" prefix="doc"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Doctor</title>
<link rel="stylesheet" type="text/css" href="DoctorCss.css">
</head>
<body>
	<div class="container">
		<jsp:include page="index.jsp" />
		<h2>Add Doctor</h2>
		<form action="addDoctor.jsp" method="post">
			<label for="doctorId">Doctor ID:</label> <input type="text"
				id="doctorId" name="doctorId" required><br> <label
				for="doctorName">Name:</label> <input type="text" id="doctorName"
				name="doctorName" required><br> <label
				for="specialization">Specialization:</label> <input type="text"
				id="specialization" name="specialization" required><br>
			<label for="qualification">Qualification:</label> <input type="text"
				id="qualification" name="qualification" required><br> <label
				for="availableSlot">Available Slot:</label> <select
				id="availableSlot" name="availableSlot">
				<option value="GENERAL">General</option>
				<option value="MORNING">Morning</option>
				<option value="EVENING">Evening</option>
				<option value="WEEKENDS">Weekends</option>
				<option value="CALLON">CallOn</option>
			</select><br> <input type="submit" value="Add Doctor">
			
			<input type="button" value="Go to Menu" onclick="location.href='index.jsp'" />

		</form>

		<% if ("POST".equalsIgnoreCase(request.getMethod())) { %>
		<% String doctorId = request.getParameter("doctorId"); %>
		<% String doctorName = request.getParameter("doctorName"); %>
		<% String specialization = request.getParameter("specialization"); %>
		<% String qualification = request.getParameter("qualification"); %>
		<% String availableSlot = request.getParameter("availableSlot"); %>

		<doc:addDoctor doctorId='<%= doctorId %>'
			doctorName='<%= doctorName %>' specialization='<%= specialization %>'
			qualification='<%= qualification %>'
			availableSlot='<%= availableSlot %>' />
		<p>Doctor added successfully!</p>
		<% } %>
	</div>
</body>
</html>
