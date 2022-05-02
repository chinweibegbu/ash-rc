package com.Ashesi.ASHRC.Model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class RespondentDetails {

    @Id
    @ManyToOne
    @JoinColumn(name="userId")
    private UserDetails user; //FK
    private int respondent_ID;
    private int username;
    private String email;
    private String firstName;
    private String lastName;
    private String department;
    private int phoneNumber;

}
