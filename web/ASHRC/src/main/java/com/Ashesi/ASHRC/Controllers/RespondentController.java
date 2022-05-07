package com.Ashesi.ASHRC.Controllers;


import com.Ashesi.ASHRC.Model.RespondentDetails;
import com.Ashesi.ASHRC.RepositoriesDAO.RespondentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import java.util.List;
import java.util.Optional;
import lombok.Data;

@RestController
@RequestMapping("/respondent")
public class RespondentController {

    // Required repositories to help implement needed methods
    @Autowired
    private EntityManager entityManager;

    @Autowired
    public RespondentRepository respondentRepo;

    @GetMapping
    public List<RespondentDetails> getAllRespondents() {
        return respondentRepo.findAll();
    }

    @GetMapping(path="{respondentId}")
    public RespondentDetails getRespondentById(@PathVariable("respondentId") Integer respondentId) {
        // Check if incident exists
		boolean exists = respondentRepo.existsById(respondentId);
		
		if(!exists) {
			throw new IllegalStateException("Respondent with an id of " + respondentId + " does not exist");
        }

        return respondentRepo.findById(respondentId).get();
    }

    @PostMapping
    public void addNewRespondent(@RequestBody RespondentDetails respondent) {
        // If the email address exists in the DB, throw an error
		Optional<RespondentDetails> respondentWithEmail = respondentRepo.getRespondentDetailsByEmail(respondent.getEmail());
		
		if(respondentWithEmail.isPresent()) {
			throw new IllegalStateException("Email already exists");
		}

        respondentRepo.save(respondent);
    }

    @DeleteMapping(path="{respondentId}")
    public void deleteRespondent(@PathVariable("respondentId") Integer respondentId) {
        // Get respondent with the given ID
		boolean exists = respondentRepo.existsById(respondentId);
		
		if(!exists) {
			throw new IllegalStateException("Respondent with an id of " + respondentId + " does not exist");
        }
		
		respondentRepo.deleteById(respondentId);
    }

    @Transactional
    @PutMapping(path="{respondentId}")
	public void updateRespondent(@RequestBody RespondentDetails respondent, @PathVariable Integer respondentId) {
		boolean exists = respondentRepo.existsById(respondentId);
		
		if(!exists) {
			throw new IllegalStateException("RespondentDetails with an id of " + respondentId + " does not exist");
		}
		
		RespondentDetails respondentToUpdate = respondentRepo.findById(respondentId).get();
		String newUsername = respondent.getUsername();
        String newFirstName = respondent.getFirstName();
		String newLastName = respondent.getLastName();
		String newPhoneNumber = respondent.getPhoneNumber();
		String newEmail = respondent.getEmail();
        String newDepartment = respondent.getDepartment();
		
        if(!(newUsername == null)) {
			if(newUsername.length() <= 0) {
				throw new IllegalStateException("Username cannot be blank");
			} else if(newUsername.equals(respondentToUpdate.getUsername())) {
				throw new IllegalStateException("Username is the same");
			} else if (newUsername.length() > 0 && !(respondentToUpdate.getUsername().equals(newUsername))) {
				respondentToUpdate.setUsername(respondent.getUsername());
			}
		}

		if(!(newFirstName == null)) {
			if(newFirstName.length() <= 0) {
				throw new IllegalStateException("First name cannot be blank");
			} else if(newFirstName.equals(respondentToUpdate.getFirstName())) {
				throw new IllegalStateException("First name is the same");
			} else if (newFirstName.length() > 0 && !(respondentToUpdate.getFirstName().equals(newFirstName))) {
				respondentToUpdate.setFirstName(respondent.getFirstName());
			}
		}
		
		if(!(newLastName == null)) {
			if(newLastName.length() <= 0) {
				throw new IllegalStateException("Last name cannot be blank");
			} else if(newLastName.equals(respondentToUpdate.getLastName())) {
				throw new IllegalStateException("Last name is the same");
			} else if (newLastName.length() > 0 && !(respondentToUpdate.getLastName().equals(newLastName))) {
				respondentToUpdate.setLastName(respondent.getLastName());
			}  
		}
		
		if(!(newPhoneNumber == null)) {
			if(newPhoneNumber.length() <= 0) {
				throw new IllegalStateException("Phone number cannot be blank");
			} else if(newPhoneNumber.equals(respondentToUpdate.getPhoneNumber())) {
				throw new IllegalStateException("Phone number is the same");
			} else if (newPhoneNumber.length() > 0 && !(respondentToUpdate.getPhoneNumber().equals(newPhoneNumber))) {
				respondentToUpdate.setPhoneNumber(respondent.getPhoneNumber());
			}
		}
		
		Optional<RespondentDetails> respondentWithEmail = respondentRepo.getRespondentDetailsByEmail(respondent.getEmail());
		
		if(respondentWithEmail.isPresent()) {
			throw new IllegalStateException("New email already exists");
		} else if(!(newEmail == null)) {
			if(newEmail.length() <= 0) {
				throw new IllegalStateException("Email cannot be blank");
			} else if(newEmail.equals(respondentToUpdate.getEmail())) {
				throw new IllegalStateException("Email is the same");
			} else if(newEmail.length() > 0 && !(respondentToUpdate.getEmail().equals(newEmail))) {
				respondentToUpdate.setEmail(respondent.getEmail());
			} 
		}

        if(!(newDepartment == null)) {
			if(newDepartment.length() <= 0) {
				throw new IllegalStateException("Department cannot be blank");
			} else if(newDepartment.equals(respondentToUpdate.getDepartment())) {
				throw new IllegalStateException("Department is the same");
			} else if (newDepartment.length() > 0 && !(respondentToUpdate.getDepartment().equals(newDepartment))) {
				respondentToUpdate.setDepartment(respondent.getDepartment());
			}
		}
		
		respondentRepo.save(respondentToUpdate);
	}
}
