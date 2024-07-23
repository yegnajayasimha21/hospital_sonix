package com.java.hoscust;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class AddDoctorTag extends TagSupport {
    private String doctorId;
    private String doctorName;
    private String specialization;
    private String qualification;
    private String availableSlot;

    // Getters and Setters

    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public void setAvailableSlot(String availableSlot) {
        this.availableSlot = availableSlot;
    }

    @Override
    public int doStartTag() throws JspException {
        try {
            Doctor doctor = new Doctor();
            doctor.setDoctorId(doctorId);
            doctor.setDoctorName(doctorName);
            doctor.setSpecialization(specialization);
            doctor.setQualification(qualification);
            doctor.setAvailableSlot(availableSlot);

            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.save(doctor);
            tx.commit();
            session.close();
        } catch (Exception e) {
            throw new JspException("Error in AddDoctorTag", e);
        }
        return SKIP_BODY;
    }
}
