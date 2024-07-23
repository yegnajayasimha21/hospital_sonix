package com.java.hoscust;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class AppointmentDaoImpl implements AppointmentDao{

	SessionFactory sessionFactory;
	Session session;
	@Override
	public String addappointment(Appointment appointment) {
		SessionFactory sessionFactory = SessionHelper.getSession();
        Session session = sessionFactory.openSession();
        Transaction trn = session.beginTransaction();

        try {
            Criteria cr = session.createCriteria(Appointment.class);
            cr.add(Restrictions.eq("doctorName", appointment.getDoctorName()));
            Appointment existingAppointment = (Appointment) cr.uniqueResult();

            if (existingAppointment == null) {
                Criteria cr1 = session.createCriteria(Appointment.class);
                cr1.add(Restrictions.eq("appointtime", appointment.getAppointtime()));
                List<Appointment> existingAppointments = cr1.list();

                if (existingAppointments.isEmpty()) {
                    session.save(appointment);
                    trn.commit();
                    return "Appointment added successfully";
                } else {
                    return "There is already an appointment at this time";
                }
            } else {
                return "Doctor already has an appointment";
            }
        } catch (Exception e) {
            trn.rollback();
            e.printStackTrace();
            return "Error adding appointment: " + e.getMessage();
        } finally {
            session.close();
        }
		
	}
	@Override
	public List<Appointment> showappointment() {
		SessionFactory sessionFactory = SessionHelper.getSession();
        Session session = sessionFactory.openSession();
        Criteria cr = session.createCriteria(Appointment.class);
        List<Appointment> appointments = cr.list();
        session.close();
        return appointments;
	}
}
