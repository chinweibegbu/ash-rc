package com.Ashesi.ASHRC.RepositoriesDAO;

import com.Ashesi.ASHRC.Model.UserDetails;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;
public interface UserRepository extends CrudRepository<UserDetails,Integer> {

    @Override
    List<UserDetails> findAll();

    // Method to get a User by Email
	Optional<UserDetails> getUserDetailsByEmail(String email);

    // Method to get a User by Email and Password
	Optional<UserDetails> getUserDetailsByEmailAndPassword(String email, String password);

    // Method to reset password
    //@Query(value= "UPDATE UserDetails SET password = :password WHERE userId= :userId",nativeQuery= true)
    //void resetUserPassword(@Param("userId") int userId, @Param("password") String newPassword);
}
