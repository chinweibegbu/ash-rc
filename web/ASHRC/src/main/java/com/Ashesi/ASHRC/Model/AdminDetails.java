package com.Ashesi.ASHRC.Model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class AdminDetails {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    @ManyToOne
    @JoinColumn(name="role_id")
    private RoleDetails role_; //FK

}
