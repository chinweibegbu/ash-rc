package com.Ashesi.ASHRC.Model;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Data
public class OffenderDetails {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int offender_ID;
    private String firstName;
    private String lastName;
    private String email;

}
