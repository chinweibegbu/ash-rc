package com.Ashesi.ASHRC.Model;


import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class IncidentOffenderDetails {

    @ManyToOne
    @JoinColumn(name="incident_ID")
    private IncidentDetails incident; //FK

    @ManyToOne
    @JoinColumn(name="offender_ID")
    private OffenderDetails offender; //FK

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long incidentOffenderId;



}
