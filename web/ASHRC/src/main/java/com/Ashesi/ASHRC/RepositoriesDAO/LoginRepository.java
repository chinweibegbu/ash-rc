package com.Ashesi.ASHRC.RepositoriesDAO;

import com.Ashesi.ASHRC.Model.LoginDetails;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LoginRepository extends CrudRepository<LoginDetails,Long> {

    @Override
    List<LoginDetails> findAll();

}
