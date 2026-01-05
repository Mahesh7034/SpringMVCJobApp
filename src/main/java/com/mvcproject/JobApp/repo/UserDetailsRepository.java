package com.mvcproject.JobApp.repo;


import com.mvcproject.JobApp.model.AppUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDetailsRepository extends JpaRepository<AppUser,Integer > {
    AppUser findByUsername(String username);
}
