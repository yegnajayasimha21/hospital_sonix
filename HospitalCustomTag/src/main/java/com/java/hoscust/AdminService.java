package com.java.hoscust;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.jvnet.hk2.annotations.Service;

@Service
public class AdminService {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    public void saveAdmin(int hospitalId, String userName, String passcode, String otpPurpose, String enteredOtp) {
        Admin admin = new Admin(hospitalId, userName, passcode, otpPurpose, enteredOtp);
        entityManager.persist(admin);
    }
}
