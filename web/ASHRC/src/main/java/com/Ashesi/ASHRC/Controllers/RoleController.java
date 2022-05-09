package com.Ashesi.ASHRC.Controllers;


import com.Ashesi.ASHRC.Model.RoleDetails;
import com.Ashesi.ASHRC.RepositoriesDAO.RoleRepository;
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

import javax.annotation.security.RolesAllowed;
import javax.persistence.EntityManager;

import java.util.List;
import java.util.Optional;
import lombok.Data;

@RestController
@RequestMapping("/role")
public class RoleController {

    // Required repositories to help implement needed methods
    @Autowired
    private EntityManager entityManager;

    @Autowired
    public RoleRepository roleRepo;

    @GetMapping
    public List<RoleDetails> getAllRoles() {
        return roleRepo.findAll();
    }

    @GetMapping(path="{roleName}")
    public RoleDetails getRoleByName(@PathVariable("roleName") String roleName) {
        Optional<RoleDetails> role = roleRepo.getRoleDetailsByRole(roleName);
		
		if(!role.isPresent()) {
			throw new IllegalStateException("Role does not exist");
		}

        return role.get();
    }
    
    @PostMapping
    public void addNewRole(@RequestBody RoleDetails role) {
        Optional<RoleDetails> existingRole = roleRepo.getRoleDetailsByRole(role.getRole());
		
		if(existingRole.isPresent()) {
			throw new IllegalStateException("Role already exists");
		}

        roleRepo.save(role);
    }

    @DeleteMapping(path="{roleId}")
    public void deleteRole(@PathVariable("roleId") Integer roleId) {
        // Get shopper with the given ID
		boolean exists = roleRepo.existsById(roleId);
		
		if(!exists) {
			throw new IllegalStateException("Role with an id of " + roleId + " does not exist");
        }
		
		roleRepo.deleteById(roleId);
    }
}
