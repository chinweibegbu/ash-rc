package com.Ashesi.ASHRC.Controllers;


import com.Ashesi.ASHRC.Model.Request;
import com.Ashesi.ASHRC.Model.RespondentDetails;
import com.Ashesi.ASHRC.Model.UserDetails;
import com.Ashesi.ASHRC.RepositoriesDAO.RequestRepository;
import com.Ashesi.ASHRC.RepositoriesDAO.RespondentRepository;
import com.Ashesi.ASHRC.RepositoriesDAO.UserRepository;
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
import lombok.Data;

@RestController
@RequestMapping("/request")
public class RequestController {

    // Required repositories to help implement needed methods
    @Autowired
    private EntityManager entityManager;

    @Autowired
    public RequestRepository requestRepo;

    @Autowired
    public OffenderRepository offenderRepo;

    @Autowired
    public UserRepository userRepo;

    @Autowired
    public RespondentRepository respondentRepo;

    @GetMapping
    public List<Request> getAllRequests() {
        List<Request> requests = requestRepo.findAll();
        
        for(Request r: requests) {
            r.setUser(null);
        }

        return requests;
    }

    @GetMapping(path="/user/{userId}")
    public List<Request> getRequestsByUser(@PathVariable("userId") Integer userId) {
        // Check if user exists
		boolean exists = userRepo.existsById(userId);
		
		if(!exists) {
			throw new IllegalStateException("User with an id of " + userId + " does not exist");
        }

        // Get user with the specified ID
        UserDetails userFilter = userRepo.findById(userId).get();
        
        // Get requests related to specified user
        return requestRepo.getRequestByUser(userFilter).get();
    }

    @GetMapping(path="/respondent/{respondentId}")
    public List<Request> getRequestByRespondent(@PathVariable("respondentId") Integer respondentId) {
        // Check if respondent exists
		boolean exists = respondentRepo.existsById(respondentId);
		
		if(!exists) {
			throw new IllegalStateException("Respondent with an id of " + respondentId + " does not exist");
        }

        // Get user with the specified ID
        RespondentDetails respondentFilter = respondentRepo.findById(respondentId).get();
        
        // Get requests related to specified user
        return requestRepo.getRequestByRespondent(respondentFilter).get();
    }

    @GetMapping(path="{requestId}")
    public Request getRequestById(@PathVariable("requestId") Integer requestId) {
        // Check if request exists
		boolean exists = requestRepo.existsById(requestId);
		
		if(!exists) {
			throw new IllegalStateException("Request with an id of " + requestId + " does not exist");
        }

        return requestRepo.findById(requestId).get();
    }

    @PostMapping
    public void addNewRequest(@RequestBody Request request) {
        // Check if respondent and user exists
        int respondentId = request.getRespondent().getRespondent_ID();
        int userId = request.getUser().getUserId();

		boolean respondentExists = respondentRepo.existsById(respondentId);
		boolean userExists = userRepo.existsById(userId);

		if(!respondentExists) {
			throw new IllegalStateException("Respondent with an id of " + respondentId + " does not exist");
        }

        if(!userExists) {
			throw new IllegalStateException("User with an id of " + userId + " does not exist");
        }

        // Add request to respondent's request
        RespondentDetails respondent = respondentRepo.findById(respondentId).get();
        respondent.getRequests().add(request);
        respondentRepo.save(respondent);

        // Add request to respondent's request
        UserDetails user = userRepo.findById(userId).get();
        user.getRequests().add(request);
        userRepo.save(user);

        // Save request
        requestRepo.save(request);
    }

    @DeleteMapping(path="{requestId}")
    public void deleteRequest(@PathVariable("requestId") Integer requestId) {
        // Check if request exists
		boolean exists = requestRepo.existsById(requestId);
		
		if(!exists) {
			throw new IllegalStateException("Request with an id of " + requestId + " does not exist");
        }
		
		requestRepo.deleteById(requestId);
    }

    @Transactional
    @PutMapping(path="{requestId}")
	public void updateRequest(@RequestBody Request request, @PathVariable Integer requestId) {
		boolean exists = requestRepo.existsById(requestId);
		
		if(!exists) {
			throw new IllegalStateException("Request with an id of " + requestId + " does not exist");
		}
		
		Request requestToUpdate = requestRepo.findById(requestId).get();
		String newRequestedServices = request.getRequestedServices();
		
        if(!(newRequestedServices == null)) {
			if (!(requestToUpdate.getRequestedServices().equals(newRequestedServices))) {
				requestToUpdate.setRequestedServices(request.getRequestedServices());
			}
		}
		
		requestRepo.save(requestToUpdate);
	}
}
