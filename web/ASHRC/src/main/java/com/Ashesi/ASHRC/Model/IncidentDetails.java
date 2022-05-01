package com.Ashesi.ASHRC.Model;


import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
public class IncidentDetails {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int incident_ID;
    private Date date = new Date();
    private String periodOfIncident;
    private String incidentDetails;
    @ManyToOne
    @JoinColumn(name="role_id")
    private RoleDetails role_; //FK
    private boolean isWhistleBlower;
    private boolean isReport;
    @ManyToOne
    @JoinColumn(name="respondent_ID")
    private RespondentDetails respondent; //FK
    private String requestedServices;
    @ManyToOne
    @JoinColumn(name="userId")
    private UserDetails user; //FK
}
