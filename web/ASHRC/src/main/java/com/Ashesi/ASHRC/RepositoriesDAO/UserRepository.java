package com.Ashesi.ASHRC.RepositoriesDAO;

import com.Ashesi.ASHRC.Model.UserDetails;
import org.springframework.data.repository.CrudRepository;
import java.util.List;
import java.util.Optional;
public interface UserRepository extends CrudRepository<UserDetails,Integer> {

    @Override
    List<UserDetails> findAll();

    // Method to get a User by Email
	Optional<UserDetails> getUserDetailsByEmail(String email);
}
