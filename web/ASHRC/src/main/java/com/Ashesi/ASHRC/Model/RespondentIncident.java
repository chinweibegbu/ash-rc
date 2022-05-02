package com.Ashesi.ASHRC.Model;

import javax.persistence.*;

public class RespondentIncident {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long RespondentIncidentId;

    @ManyToOne
    @JoinColumn(name="respondent_ID")
    private RespondentDetails respondent; //FK

    @ManyToOne
    @JoinColumn(name="incident_ID")
    private IncidentDetails incident; //FK

}
