package com.Ashesi.ASHRC.Controllers;


import com.Ashesi.ASHRC.Model.IncidentDetails;
import com.Ashesi.ASHRC.Model.OffenderDetails;
import com.Ashesi.ASHRC.Model.RespondentDetails;
import com.Ashesi.ASHRC.Model.RoleDetails;
import com.Ashesi.ASHRC.Model.UserDetails;
import com.Ashesi.ASHRC.Model.IncidentOffenderDetails;
import com.Ashesi.ASHRC.RepositoriesDAO.RespondentRepository;
import com.Ashesi.ASHRC.RepositoriesDAO.UserRepository;
import com.Ashesi.ASHRC.RepositoriesDAO.IncidentRepository;
import com.Ashesi.ASHRC.RepositoriesDAO.OffenderRepository;
import com.Ashesi.ASHRC.RepositoriesDAO.IncidentOffenderRepository;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping("/incident")
public class IncidentController {

    // Required repositories to help implement needed methods
    @Autowired
    private EntityManager entityManager;

    @Autowired
    public IncidentRepository incidentRepo;

    @Autowired
    public OffenderRepository offenderRepo;

    @Autowired
    public UserRepository userRepo;

    @Autowired
    public RespondentRepository respondentRepo;
    
	@Autowired
    public IncidentOffenderRepository incidentOffenderRepo;

    @GetMapping
    public List<IncidentDetails> getAllIncidents() {
        return incidentRepo.findAll();
    }

    @GetMapping(path="/reports")
    public List<IncidentDetails> getAllReports() {
        return incidentRepo.getIncidentReports().get();
    }

    @GetMapping(path="/user/{userId}")
    public List<IncidentDetails> getReportsByUser(@PathVariable("userId") Integer userId) {
        // Check if user exists
		boolean exists = userRepo.existsById(userId);
		
		if(!exists) {
			throw new IllegalStateException("User with an id of " + userId + " does not exist");
        }

        // Get user with the specified ID
        UserDetails userFilter = userRepo.findById(userId).get();
        
        // Get incidents related to specified user
        return incidentRepo.getIncidentDetailsByUser(userFilter).get();
    }

    @GetMapping(path="/respondent/{respondentId}")
    public List<IncidentDetails> getReportsByRespondent(@PathVariable("respondentId") Integer respondentId) {
        // Check if respondent exists
		boolean exists = respondentRepo.existsById(respondentId);
		
		if(!exists) {
			throw new IllegalStateException("Respondent with an id of " + respondentId + " does not exist");
        }

        // Get user with the specified ID
        RespondentDetails respondentFilter = respondentRepo.findById(respondentId).get();
        
        // Get incidents related to specified user
        return incidentRepo.getIncidentDetailsByRespondent(respondentFilter).get();
    }

    @GetMapping(path="{incidentId}")
    public IncidentDetails getIncidentById(@PathVariable("incidentId") Integer incidentId) {
        // Check if incident exists
		boolean exists = incidentRepo.existsById(incidentId);
		
		if(!exists) {
			throw new IllegalStateException("Incident with an id of " + incidentId + " does not exist");
        }

        return incidentRepo.findById(incidentId).get();
    }

    @PostMapping
    public void addNewIncident(@RequestBody IncidentDetails incident) {
        incidentRepo.save(incident);
    }
    
	@PostMapping(path="/addOffender")
	public void addOffenderToIncident(@RequestBody IncidentOffenderDetails incidentOffender) {
		// Check if incident and offender exist
		int incidentId = incidentOffender.getIncident().getIncident_ID();
		int offenderId = incidentOffender.getOffender().getOffender_ID();

		boolean incidentExists = incidentRepo.existsById(incidentId);
		boolean offenderExists = offenderRepo.existsById(offenderId);
		
		if(!incidentExists) {
			throw new IllegalStateException("Incident with an id of " + incidentId + " does not exist");
        }

		if(!offenderExists) {
			throw new IllegalStateException("Offender with an id of " + offenderId + " does not exist");
        }

		incidentOffenderRepo.save(incidentOffender);
	}

    @DeleteMapping(path="{incidentId}")
    public void deleteIncident(@PathVariable("incidentId") Integer incidentId) {
        // Check if incident exists
		boolean exists = incidentRepo.existsById(incidentId);
		
		if(!exists) {
			throw new IllegalStateException("Incident with an id of " + incidentId + " does not exist");
        }
		
		incidentRepo.deleteById(incidentId);
    }

    @Transactional
    @PutMapping(path="{incidentId}")
	public void updateIncident(@RequestBody IncidentDetails incident, @PathVariable Integer incidentId) {
		boolean exists = incidentRepo.existsById(incidentId);
		
		if(!exists) {
			throw new IllegalStateException("Incident with an id of " + incidentId + " does not exist");
		}
		
		IncidentDetails incidentToUpdate = incidentRepo.findById(incidentId).get();
		RoleDetails newRole = incident.getRole_();
		
        if(!(newRole == null)) {
			if (!(incidentToUpdate.getRole_().equals(newRole))) {
				incidentToUpdate.setRole_(incident.getRole_());
			}
		}
		
		incidentRepo.save(incidentToUpdate);
	}
}
