package com.studentmgmtsys.model;

public class Fees {
    private int id;
    private int studId;
    private boolean transport;
    private boolean semister;
    private boolean hostel;
    private boolean misc;
    
    // Empty constructor
    public Fees() {}
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getStudId() {
        return studId;
    }
    
    public void setStudId(int studId) {
        this.studId = studId;
    }
    
    public boolean isTransport() {
        return transport;
    }
    
    public void setTransport(boolean transport) {
        this.transport = transport;
    }
    
    public boolean isSemister() {
        return semister;
    }
    
    public void setSemister(boolean semister) {
        this.semister = semister;
    }
    
    public boolean isHostel() {
        return hostel;
    }
    
    public void setHostel(boolean hostel) {
        this.hostel = hostel;
    }
    
    public boolean isMisc() {
        return misc;
    }
    
    public void setMisc(boolean misc) {
        this.misc = misc;
    }
}
