package com.Ashesi.ASHRC.RepositoriesDAO;

import com.Ashesi.ASHRC.Model.IncidentDetails;
import com.Ashesi.ASHRC.Model.UserDetails;
import com.Ashesi.ASHRC.Model.RespondentDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface IncidentRepository extends JpaRepository<IncidentDetails,Integer> {
    // Method to get incidents associated with a particular user
	Optional<List<IncidentDetails>> getIncidentDetailsByUser(UserDetails user);

    // Method to get incidents associated with a particular respondent
    Optional<List<IncidentDetails>> getIncidentDetailsByRespondent(RespondentDetails respondent);

    @Query("SELECT i from IncidentDetails i where i.isReport = true")
    Optional<List<IncidentDetails>> getIncidentReports();
}
