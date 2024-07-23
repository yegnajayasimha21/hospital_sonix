package com.java.hoscust;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.hibernate.Session;

public class ShowDoctorsTag extends TagSupport {
    @Override
    public int doStartTag() throws JspException {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            List<Doctor> doctors = session.createQuery("from Doctor", Doctor.class).list();
            session.close();
            pageContext.setAttribute("doctors", doctors);
        } catch (Exception e) {
            throw new JspException("Error in ShowDoctorsTag", e);
        }
        return SKIP_BODY;
    }
}
