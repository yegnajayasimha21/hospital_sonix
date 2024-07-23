package com.java.hoscust;

import javax.persistence.*;

@Entity
@Table(name = "admin")
public class Admin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "hospitalId")
    private int hospitalId;

    @Column(name = "username")
    private String userName;

    @Column(name = "passcode")
    private String passcode;

    @Column(name = "otpPurpose")
    private String otpPurpose;

    @Column(name = "enteredOtp")
    private String enteredOtp;

    // Default constructor
    public Admin() {
    }

    // Constructor with all fields except ID
    public Admin(int hospitalId, String userName, String passcode, String otpPurpose, String enteredOtp) {
        this.hospitalId = hospitalId;
        this.userName = userName;
        this.passcode = passcode;
        this.otpPurpose = otpPurpose;
        this.enteredOtp = enteredOtp;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(int hospitalId) {
        this.hospitalId = hospitalId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPasscode() {
        return passcode;
    }

    public void setPasscode(String passcode) {
        this.passcode = passcode;
    }

    public String getOtpPurpose() {
        return otpPurpose;
    }

    public void setOtpPurpose(String otpPurpose) {
        this.otpPurpose = otpPurpose;
    }

    public String getEnteredOtp() {
        return enteredOtp;
    }

    public void setEnteredOtp(String enteredOtp) {
        this.enteredOtp = enteredOtp;
    }
}
