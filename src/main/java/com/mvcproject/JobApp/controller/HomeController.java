package com.mvcproject.JobApp.controller;

import com.mvcproject.JobApp.model.AppUser;
import com.mvcproject.JobApp.model.Job;
import com.mvcproject.JobApp.model.JobApplication;
import com.mvcproject.JobApp.model.UserProfile;
import com.mvcproject.JobApp.repo.JobApplicationRepo;
import com.mvcproject.JobApp.repo.JobRepo;
import com.mvcproject.JobApp.repo.UserDetailsRepository;
import com.mvcproject.JobApp.repo.UserProfileRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class HomeController {

    @Autowired private JobRepo jobRepo;
    @Autowired private UserDetailsRepository userRepo; // To find the logged in user ID
    @Autowired private UserProfileRepo profileRepo;    // To save profile details
    @Autowired private JobApplicationRepo appRepo;     // To save applications

    // --- HOME PAGE ---
    @GetMapping("/")
    public String home(Model model, Authentication auth) {
        // Pass username to view for the Greeting
        if(auth != null) {
            model.addAttribute("username", auth.getName());
        }
        model.addAttribute("jobs", jobRepo.findAll());
        return "home";
    }

    // --- VIEW JOB DETAILS ---
    @GetMapping("/job/{id}")
    public String viewJobDetails(@PathVariable("id") Long id, Model model, Authentication auth) {
        Job job = jobRepo.findById(id).orElse(null);
        if (job == null) return "redirect:/";

        model.addAttribute("job", job);

        // Check if user already applied (to disable button)
        if(auth != null) {
            AppUser user = userRepo.findByUsername(auth.getName());
            boolean hasApplied = appRepo.existsByUserIdAndJob(user.getId(), job);
            model.addAttribute("hasApplied", hasApplied);
        }

        return "job_details";
    }

    // --- APPLY FOR JOB ---
    @PostMapping("/apply/{jobId}")
    public String applyJob(@PathVariable Long jobId, Authentication auth) {
        // 1. Get Logged in User
        String username = auth.getName();
        AppUser user = userRepo.findByUsername(username);

        // 2. Get Job
        Job job = jobRepo.findById(jobId).orElse(null);

        // 3. Save Application (if not already applied)
        if (job != null && !appRepo.existsByUserIdAndJob(user.getId(), job)) {
            JobApplication application = new JobApplication();
            application.setUserId(user.getId());
            application.setJob(job);
            appRepo.save(application);
        }
        return "redirect:/my-applications";
    }

    // --- MY APPLICATIONS PAGE ---
    @GetMapping("/my-applications")
    public String myApplications(Model model, Authentication auth) {
        AppUser user = userRepo.findByUsername(auth.getName());
        List<JobApplication> apps = appRepo.findByUserId(user.getId());
        model.addAttribute("apps", apps);
        return "my_applications";
    }


    // 1. Show Profile (GET)
    @GetMapping("/profile")
    public String showProfile(Model model, Authentication auth) {
        AppUser user = userRepo.findByUsername(auth.getName());

        // Try to find existing profile, or create a blank one attached to the user
        UserProfile profile = profileRepo.findById(user.getId())
                .orElse(new UserProfile());

        // If it's a new profile, we must pre-set the ID so the JSP can read it
        if(profile.getUserId() == null) {
            profile.setUserId(user.getId());
        }

        model.addAttribute("profile", profile);
        return "profile";
    }

    // 2. Save Profile (POST)
    @PostMapping("/update-profile")
    public String updateProfile(@ModelAttribute UserProfile profile, Authentication auth) {
        // A. Fetch the logged-in user from DB
        AppUser user = userRepo.findByUsername(auth.getName());

        // B. CRITICAL: Link the profile to the user
        profile.setAppUser(user);
        profile.setUserId(user.getId()); // Explicitly set ID

        // C. Save
        profileRepo.save(profile);

        return "redirect:/profile?success";
    }

    @GetMapping("/create-job")
    public String createJobPage() { return "create_job"; }

    @PostMapping("/save-job")
    public String saveJob(@ModelAttribute Job job) {
        jobRepo.save(job);
        return "redirect:/success";
    }

    @GetMapping("/success")
    public String successPage() { return "success"; }
}