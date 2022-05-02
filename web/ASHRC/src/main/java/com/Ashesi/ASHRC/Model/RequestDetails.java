package com.Ashesi.ASHRC.Model;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
public class RequestDetails {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int request_ID;
    private String requestDetails;
    @ManyToOne
    @JoinColumn(name="userId")
    private UserDetails user; //FK
    @ManyToOne
    @JoinColumn(name="respondent_ID")
    private RespondentDetails respondent; //FK
}
