package com.Ashesi.ASHRC.Model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class Request {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int requestId;
    @ManyToOne
    @JoinColumn(name="respondent_ID")
    private RespondentDetails respondent; //FK
    private String requestedServices;
    @ManyToOne
    @JoinColumn(name="userId")
    private UserDetails user; //FK


}
