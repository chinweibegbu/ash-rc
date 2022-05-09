package com.Ashesi.ASHRC.Model;


import lombok.Data;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
// Contains details of users
@Data public class UserDetails {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int userId;
    private String firstName;
    private String lastName;
    private String yearGroup;
    private String department;
    private String password;
    private String email;
    @ManyToOne
    @JoinColumn(name="role_id")
    private RoleDetails role; // set default role to 1 which is regular user

    @JsonIgnore
    @OneToMany(mappedBy="user", cascade = CascadeType.ALL)
	@ElementCollection(fetch=FetchType.EAGER)
	private Collection<Request> requests = new ArrayList<>();
}
