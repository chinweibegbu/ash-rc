package com.Ashesi.ASHRC.Model;

import lombok.Data;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Data
public class RespondentDetails {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int respondent_ID;
    private String username;
    private String email;
    private String firstName;
    private String lastName;
    private String department;
    private String phoneNumber;
    
}
