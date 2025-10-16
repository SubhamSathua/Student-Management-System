package com.studentmgmtsys.model;
import java.util.Date;

public class Profile {
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private Date dob;
    private String education;
    private String profilePic;

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public Date getDob() { return dob; }
    public void setDob(Date dob) { this.dob = dob; }

    public String getEducation() { return education; }
    public void setEducation(String education) { this.education = education; }

    public String getProfilePic() { return profilePic; }
    public void setProfilePic(String profilePic) { this.profilePic = profilePic; }
}

