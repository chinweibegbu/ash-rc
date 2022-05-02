package com.Ashesi.ASHRC.Model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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
    private int phoneNumber;

}
