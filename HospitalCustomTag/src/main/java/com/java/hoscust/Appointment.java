package com.java.hoscust;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Appointment")
public class Appointment {
	
	@Id
	@Column(name="appointmentID")
	private int appointmentid;
	@Column(name = "patientName")
	private String patientname;
	@Column(name = "PatientEmail")
	private String patientemail;
	@Column(name = "PatientMobile")
	private String patientmobile;
	@Column(name = "DoctorName")
	private String doctorName;
	@Column(name = "AppointmentDate")
	private Date appointmentdate;
	@Column(name = "AppointTime")
	private String appointtime;
	@Column(name = "PatientDisease")
	private String patientdisease;
	public int getAppointmentid() {
		return appointmentid;
	}
	public void setAppointmentid(int appointmentid) {
		this.appointmentid = appointmentid;
	}
	public String getPatientname() {
		return patientname;
	}
	public void setPatientname(String patientname) {
		this.patientname = patientname;
	}
	public String getPatientemail() {
		return patientemail;
	}
	public void setPatientemail(String patientemail) {
		this.patientemail = patientemail;
	}
	public String getPatientmobile() {
		return patientmobile;
	}
	public void setPatientmobile(String patientmobile) {
		this.patientmobile = patientmobile;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public Date getAppointmentdate() {
		return appointmentdate;
	}
	public void setAppointmentdate(Date appointmentdate) {
		this.appointmentdate = appointmentdate;
	}
	public String getAppointtime() {
		return appointtime;
	}
	public void setAppointtime(String appointtime) {
		this.appointtime = appointtime;
	}
	public String getPatientdisease() {
		return patientdisease;
	}
	public void setPatientdisease(String patientdisease) {
		this.patientdisease = patientdisease;
	}
	public Appointment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Appointment(int appointmentid, String patientname, String patientemail, String patientmobile,
			String doctorName, Date appointmentdate, String appointtime, String patientdisease) {
		super();
		this.appointmentid = appointmentid;
		this.patientname = patientname;
		this.patientemail = patientemail;
		this.patientmobile = patientmobile;
		this.doctorName = doctorName;
		this.appointmentdate = appointmentdate;
		this.appointtime = appointtime;
		this.patientdisease = patientdisease;
	}
	@Override
	public String toString() {
		return "Appointment [appointmentid=" + appointmentid + ", patientname=" + patientname + ", patientemail="
				+ patientemail + ", patientmobile=" + patientmobile + ", doctorName=" + doctorName
				+ ", appointmentdate=" + appointmentdate + ", appointtime=" + appointtime + ", patientdisease="
				+ patientdisease + "]";
	}
	
	
}
