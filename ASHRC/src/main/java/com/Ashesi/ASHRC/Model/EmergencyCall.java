package com.Ashesi.ASHRC.Model;


import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
public class EmergencyCall {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int callId;
    private Date callDate = new Date();
    private int phoneNumber;
    @ManyToOne
    @JoinColumn(name="respondent_ID")
    private RespondentDetails respondent; //FK
    private String requestedServices;
}
