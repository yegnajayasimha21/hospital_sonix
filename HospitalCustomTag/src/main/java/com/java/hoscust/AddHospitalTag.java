package com.java.hoscust;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class AddHospitalTag extends TagSupport {

    private String hospitalName;
    private String city;
    private String hospitalType;
    private String email;
    private String phoneNo;

    // Getters and setters

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setHospitalType(String hospitalType) {
        this.hospitalType = hospitalType;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    @Override
    public int doStartTag() throws JspException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();

            Hospital hospital = new Hospital();
            hospital.setHospitalName(hospitalName);
            hospital.setCity(city);
            hospital.setHospitalType(hospitalType);
            hospital.setEmail(email);
            hospital.setPhoneNo(phoneNo);

            session.save(hospital);
            tx.commit();

            // Generate OTP
            String otp = OtpGen.generateOtp();

            // Save OTP in session for later validation
            pageContext.getSession().setAttribute("generatedOtp", otp);

            // Send OTP via email
            String subject = "OTP for Admin Registration";
            String body = "Your OTP for admin registration: " + otp;
            SendMail.mail(email, subject, body);

            return SKIP_BODY;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw new JspException("Error in AddHospitalTag", e);
        } finally {
            session.close();
        }
    }
}
