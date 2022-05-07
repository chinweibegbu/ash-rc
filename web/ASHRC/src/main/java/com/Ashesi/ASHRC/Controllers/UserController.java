package com.Ashesi.ASHRC.Controllers;


import com.Ashesi.ASHRC.Model.UserDetails;
import com.Ashesi.ASHRC.RepositoriesDAO.LoginRepository;
import com.Ashesi.ASHRC.RepositoriesDAO.UserRepository;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;
import lombok.Data;

@RestController
@RequestMapping("/user")
public class UserController {

    // Required repositories to help implement needed methods
    @Autowired
    private EntityManager entityManager;

    @Autowired
    public UserRepository userRepo;

    @Autowired
    LoginRepository loginRepo;

    @GetMapping
    public List<UserDetails> getAllUsers() {
        return userRepo.findAll();
    }

    @GetMapping(path="{userId}")
    public UserDetails getUserById(@PathVariable("userId") Integer userId) {
        // Check if incident exists
		boolean exists = userRepo.existsById(userId);
		
		if(!exists) {
			throw new IllegalStateException("User with an id of " + userId + " does not exist");
        }

        return userRepo.findById(userId).get();
    }

    @PostMapping
    public void addNewUser(@RequestBody UserDetails user) {
        // If the email address exists in the DB, throw an error
		Optional<UserDetails> userWithEmail = userRepo.getUserDetailsByEmail(user.getEmail());
		
		if(userWithEmail.isPresent()) {
			throw new IllegalStateException("Email already exists");
		}

        userRepo.save(user);
    }

    @DeleteMapping(path="{userId}")
    public void delete(@PathVariable("userId") Integer userId) {
        // Get shopper with the given ID
		boolean exists = userRepo.existsById(userId);
		
		if(!exists) {
			throw new IllegalStateException("User with an id of " + userId + " does not exist");
        }
		
		userRepo.deleteById(userId);
    }

    @PostMapping("/login")
    public Integer Login(@RequestBody UserDetails user) {
        Optional<UserDetails> registeredUser = userRepo.getUserDetailsByEmailAndPassword(user.getEmail(), user.getPassword());

        if(!registeredUser.isPresent()) {
            throw new IllegalStateException("Incorrect email address or password");
        }

        return registeredUser.get().getUserId();
    }
}
