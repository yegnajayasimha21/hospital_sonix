package com.java.hoscust;

import java.util.List;

public interface AppointmentDao {

	String addappointment (Appointment appointment);
	List<Appointment> showappointment();
}
