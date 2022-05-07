package com.Ashesi.ASHRC.Controllers;

import com.Ashesi.ASHRC.Model.OffenderDetails;
import com.Ashesi.ASHRC.RepositoriesDAO.IncidentRepository;
import com.Ashesi.ASHRC.RepositoriesDAO.OffenderRepository;
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
@RequestMapping("/offender")
public class OffenderController {

    // Required repositories to help implement needed methods
    @Autowired
    private EntityManager entityManager;

    @Autowired
    public OffenderRepository offenderRepo;

    @GetMapping
    public List<OffenderDetails> getAllOffenders() {
        return offenderRepo.findAll();
    }

    @GetMapping(path="{offenderId}")
    public OffenderDetails getOffenderById(@PathVariable("offenderId") Integer offenderId) {
        // Check if incident exists
		boolean exists = offenderRepo.existsById(offenderId);
		
		if(!exists) {
			throw new IllegalStateException("Offender with an id of " + offenderId + " does not exist");
        }

        return offenderRepo.findById(offenderId).get();
    }

    @PostMapping
    public void addNewOffender(@RequestBody OffenderDetails offender) {
        // If the email address exists in the DB, throw an error
		Optional<OffenderDetails> offenderWithEmail = offenderRepo.getOffenderDetailsByEmail(offender.getEmail());
		
		if(offenderWithEmail.isPresent()) {
			throw new IllegalStateException("Email already exists");
		}

        offenderRepo.save(offender);
    }

    @DeleteMapping(path="{offenderId}")
    public void deleteOffender(@PathVariable("offenderId") Integer offenderId) {
        // Get offender with the given ID
		boolean exists = offenderRepo.existsById(offenderId);
		
		if(!exists) {
			throw new IllegalStateException("Offender with an id of " + offenderId + " does not exist");
        }
		
		offenderRepo.deleteById(offenderId);
    }

    @Transactional
    @PutMapping(path="{offenderId}")
	public void updateOffender(@RequestBody OffenderDetails offender, @PathVariable Integer offenderId) {
		boolean exists = offenderRepo.existsById(offenderId);
		
		if(!exists) {
			throw new IllegalStateException("Offender with an id of " + offenderId + " does not exist");
		}
		
		OffenderDetails offenderToUpdate = offenderRepo.findById(offenderId).get();
        String newFirstName = offender.getFirstName();
		String newLastName = offender.getLastName();
		String newEmail = offender.getEmail();

		if(!(newFirstName == null)) {
			if(newFirstName.length() <= 0) {
				throw new IllegalStateException("First name cannot be blank");
			} else if(newFirstName.equals(offenderToUpdate.getFirstName())) {
				throw new IllegalStateException("First name is the same");
			} else if (newFirstName.length() > 0 && !(offenderToUpdate.getFirstName().equals(newFirstName))) {
				offenderToUpdate.setFirstName(offender.getFirstName());
			}
		}
		
		if(!(newLastName == null)) {
			if(newLastName.length() <= 0) {
				throw new IllegalStateException("Last name cannot be blank");
			} else if(newLastName.equals(offenderToUpdate.getLastName())) {
				throw new IllegalStateException("Last name is the same");
			} else if (newLastName.length() > 0 && !(offenderToUpdate.getLastName().equals(newLastName))) {
				offenderToUpdate.setLastName(offender.getLastName());
			}  
		}
		
		Optional<OffenderDetails> offenderWithEmail = offenderRepo.getOffenderDetailsByEmail(offender.getEmail());
		
		if(offenderWithEmail.isPresent()) {
			throw new IllegalStateException("New email already exists");
		} else if(!(newEmail == null)) {
			if(newEmail.length() <= 0) {
				throw new IllegalStateException("Email cannot be blank");
			} else if(newEmail.equals(offenderToUpdate.getEmail())) {
				throw new IllegalStateException("Email is the same");
			} else if(newEmail.length() > 0 && !(offenderToUpdate.getEmail().equals(newEmail))) {
				offenderToUpdate.setEmail(offender.getEmail());
			} 
		}
		
		offenderRepo.save(offenderToUpdate);
	}
}
