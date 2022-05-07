package com.Ashesi.ASHRC.RepositoriesDAO;

import com.Ashesi.ASHRC.Model.Request;
import com.Ashesi.ASHRC.Model.RespondentDetails;
import com.Ashesi.ASHRC.Model.UserDetails;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface RequestRepository extends JpaRepository<Request,Integer> {
    // Method to get incidents associated with a particular user
	Optional<List<Request>> getRequestByUser(UserDetails user);

    // Method to get incidents associated with a particular respondent
    Optional<List<Request>> getRequestByRespondent(RespondentDetails respondent);
}
