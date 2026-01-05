package com.mvcproject.JobApp.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Data
public class JobApplication {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer userId; // Who applied

    @ManyToOne
    @JoinColumn(name = "job_id")
    private Job job; // Which job

    private LocalDateTime appliedDate = LocalDateTime.now();
    private String status = "Applied"; // Default status

    // Getters and Setters
//    public Long getId() { return id; }
//    public void setId(Long id) { this.id = id; }
//    public Integer getUserId() { return userId; }
//    public void setUserId(Integer userId) { this.userId = userId; }
//    public Job getJob() { return job; }
//    public void setJob(Job job) { this.job = job; }
//    public LocalDateTime getAppliedDate() { return appliedDate; }
//    public void setAppliedDate(LocalDateTime appliedDate) { this.appliedDate = appliedDate; }
//    public String getStatus() { return status; }
//    public void setStatus(String status) { this.status = status; }
}