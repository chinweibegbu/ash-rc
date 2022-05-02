package com.Ashesi.ASHRC.Model;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
public class EmergencyCall {


    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int call_ID;
    private Date CallDate = new Date();
    private int phoneNumber;
    @ManyToOne
    @JoinColumn(name="respondent_ID")
    private RespondentDetails respondent; //FK
}
