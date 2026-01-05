package com.mvcproject.JobApp.service;


import com.mvcproject.JobApp.model.AppUser;
import com.mvcproject.JobApp.repo.UserDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserDetailsRepository repo;

//    @Autowired
//    private final BCryptPasswordEncoder encoder  = new BCryptPasswordEncoder(12);


//    public AppUser saveUser(AppUser user) {
//
//        user.setUserpassword(encoder.encode(user.getUserpassword()));
//
//        return repo.save(user);
//    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        AppUser user  = repo.findByUsername(username);
        if (user == null) {
            System.out.println("User Not Found");
            throw new UsernameNotFoundException("user not found");
        }

        // 3. Return a Principal object that Spring Security understands
        return org.springframework.security.core.userdetails.User.builder()
                .username(user.getUsername())
                .password(user.getUserpassword()) // Must be BCrypt hashed in DB!
                .authorities("ROLE_USER")
                .build();
    }
}
