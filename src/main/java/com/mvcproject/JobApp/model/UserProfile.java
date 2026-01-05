package com.mvcproject.JobApp.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class UserProfile {

    @Id
    private Integer userId; // Matches the AppUser ID

    // This links Profile to the Login User table
    @OneToOne
    @MapsId
    @JoinColumn(name = "user_id")
    private AppUser appUser;

    private String fullName;
    private String email;
    private String city;
    private String skills;

    public UserProfile() {}

    public UserProfile(AppUser appUser) {
        this.appUser = appUser;
    }

    // Getters and Setters
//    public Integer getUserId() { return userId; }
//    public void setUserId(Integer userId) { this.userId = userId; }
//    public AppUser getAppUser() { return appUser; }
//    public void setAppUser(AppUser appUser) { this.appUser = appUser; }
//    public String getFullName() { return fullName; }
//    public void setFullName(String fullName) { this.fullName = fullName; }
//    public String getEmail() { return email; }
//    public void setEmail(String email) { this.email = email; }
//    public String getCity() { return city; }
//    public void setCity(String city) { this.city = city; }
//    public String getSkills() { return skills; }
//    public void setSkills(String skills) { this.skills = skills; }
}