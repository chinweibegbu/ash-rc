package com.Ashesi.ASHRC.Model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity

public class RespondentIncident {


    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int ID;

    @ManyToOne
    @JoinColumn(name="incident_ID")
    private IncidentDetails incident; //FK

    @ManyToOne
    @JoinColumn(name="respondent_ID")
    private RespondentDetails respondent; //FK
    private String requestedServices;
}
