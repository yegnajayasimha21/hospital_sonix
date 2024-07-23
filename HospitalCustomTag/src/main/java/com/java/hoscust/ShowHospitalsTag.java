package com.java.hoscust;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.hibernate.Session;

public class ShowHospitalsTag extends TagSupport {
    @Override
    public int doStartTag() throws JspException {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            List<Hospital> hospitals = session.createQuery("from Hospital", Hospital.class).list();
            session.close();
            pageContext.setAttribute("hospitals", hospitals);
        } catch (Exception e) {
            throw new JspException("Error in ShowHospitalsTag", e);
        }
        return SKIP_BODY;
    }
}
