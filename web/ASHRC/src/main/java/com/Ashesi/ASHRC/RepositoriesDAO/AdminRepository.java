package com.Ashesi.ASHRC.RepositoriesDAO;

import com.Ashesi.ASHRC.Model.AdminDetails;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AdminRepository extends CrudRepository<AdminDetails,Long> {

    @Override
    List<AdminDetails> findAll();

}
