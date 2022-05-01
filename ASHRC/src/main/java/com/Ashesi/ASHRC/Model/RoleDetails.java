package com.Ashesi.ASHRC.Model;


import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Data
public class RoleDetails {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int roleId;
    private String role; //admin, respondent, regular user

    @OneToMany(mappedBy = "role")
    private List<UserDetails> employee;

    @OneToMany(mappedBy = "role_")
    private List<LoginDetails> login;

}
