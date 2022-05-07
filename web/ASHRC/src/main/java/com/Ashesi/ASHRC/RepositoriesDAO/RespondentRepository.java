package com.Ashesi.ASHRC.RepositoriesDAO;

import com.Ashesi.ASHRC.Model.RespondentDetails;
import org.springframework.data.repository.CrudRepository;
import java.util.List;
import java.util.Optional;
public interface RespondentRepository extends CrudRepository<RespondentDetails,Integer> {

    @Override
    List<RespondentDetails> findAll();

    // Method to get a Respondent by Email
	Optional<RespondentDetails> getRespondentDetailsByEmail(String email);
}
