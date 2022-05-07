package com.Ashesi.ASHRC.RepositoriesDAO;

import com.Ashesi.ASHRC.Model.IncidentOffenderDetails;
import org.springframework.data.repository.CrudRepository;
import java.util.List;
import java.util.Optional;
public interface IncidentOffenderRepository extends CrudRepository<IncidentOffenderDetails,Integer> {

    @Override
    List<IncidentOffenderDetails> findAll();
}
