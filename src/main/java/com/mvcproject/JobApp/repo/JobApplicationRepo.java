package com.mvcproject.JobApp.repo;

import com.mvcproject.JobApp.model.JobApplication;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface JobApplicationRepo extends JpaRepository<JobApplication, Long> {
    List<JobApplication> findByUserId(Integer userId);
    boolean existsByUserIdAndJob(Integer userId, com.mvcproject.JobApp.model.Job job);
}