package com.Ashesi.ASHRC.RepositoriesDAO;

import com.Ashesi.ASHRC.Model.UserDetails;
import org.springframework.data.repository.CrudRepository;
import java.util.List;
public interface UserRepository extends CrudRepository<UserDetails,Long> {

    @Override
    List<UserDetails> findAll();
}
