package com.mvcproject.JobApp.model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Data
@Table(name = "jobs")
public class Job {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String companyName;
    private String location;
    private String jobType;
    private String description;
    private String salaryRange;


    private Date postedAt = new Date();

    // Getters and Setters omitted for brevity

    public Job(){}
}