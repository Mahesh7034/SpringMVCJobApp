package com.mvcproject.JobApp.repo;

import com.mvcproject.JobApp.model.UserProfile;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserProfileRepo extends JpaRepository<UserProfile, Integer> {
}