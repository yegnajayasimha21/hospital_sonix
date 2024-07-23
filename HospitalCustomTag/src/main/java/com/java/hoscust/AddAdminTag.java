package com.java.hoscust;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class AddAdminTag extends TagSupport {

    private int hospitalId;
    private String userName;
    private String passcode;
    private String otpPurpose;
    private String enteredOtp;

    // Getters and setters

    public void setHospitalId(int hospitalId) {
        this.hospitalId = hospitalId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPasscode(String passcode) {
        this.passcode = passcode;
    }

    public void setOtpPurpose(String otpPurpose) {
        this.otpPurpose = otpPurpose;
    }

    public void setEnteredOtp(String enteredOtp) {
        this.enteredOtp = enteredOtp;
    }

    @Override
    public int doStartTag() throws JspException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();

            // Validate OTP
            String generatedOtp = (String) pageContext.getSession().getAttribute("generatedOtp");
            if (generatedOtp == null || !generatedOtp.equals(enteredOtp)) {
                throw new RuntimeException("Invalid OTP.");
            }

            // Check if the hospital has reached the maximum admin count limit
            long adminCount = (long) session.createQuery("SELECT COUNT(*) FROM Admin WHERE hospitalId = :hospitalId")
                                            .setParameter("hospitalId", hospitalId)
                                            .uniqueResult();
            if (adminCount >= 3) {
                throw new RuntimeException("Maximum admin accounts limit reached for this hospital.");
            }


            Admin admin = new Admin(hospitalId, userName, passcode, otpPurpose, "ACTIVE");


            session.save(admin);
            tx.commit();

            return SKIP_BODY;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw new JspException("Error in AddAdminTag", e);
        } finally {
            session.close();
        }
    }
}
