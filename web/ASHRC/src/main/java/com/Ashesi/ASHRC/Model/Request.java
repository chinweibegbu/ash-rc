package com.Ashesi.ASHRC.Model;

import lombok.Data;

import java.util.Date;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Data
@Entity
public class Request {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int requestId;
    private Date date = new Date();
    @ManyToOne
    @JoinColumn(name="respondent_ID")
    private RespondentDetails respondent; //FK
    private String requestedServices;
    //@JsonIgnore
    @ManyToOne
    @JoinColumn(name="userId")
    private UserDetails user; //FK
}
