package com.Ashesi.ASHRC.RepositoriesDAO;

import com.Ashesi.ASHRC.Model.OffenderDetails;
import org.springframework.data.repository.CrudRepository;
import java.util.List;
import java.util.Optional;
public interface OffenderRepository extends CrudRepository<OffenderDetails,Integer> {

    @Override
    List<OffenderDetails> findAll();

    // Method to get a Offender by Email
	Optional<OffenderDetails> getOffenderDetailsByEmail(String email);
}
