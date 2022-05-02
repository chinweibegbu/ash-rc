package com.Ashesi.ASHRC.Controllers;

import com.Ashesi.ASHRC.Model.LoginDetails;
import com.Ashesi.ASHRC.Model.UserDetails;
import com.Ashesi.ASHRC.RepositoriesDAO.LoginRepository;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

// This is the login controller to handle login operations
@Controller
@RequestMapping("/ASHRCportal")
public class LoginController {

    // Required repositories to help implement needed methods
    @Autowired
    public LoginRepository loginrepo;

    @Autowired
    private EntityManager entityManager;


    // This method allows a new login and displays the login page
    @GetMapping("/login")
    public String displayLoginPage(Model model) {
        LoginDetails newLogin = new LoginDetails();
        model.addAttribute("login_details", newLogin);
        return "loginPage";
    }

    @GetMapping("/loginError")
    public String displayLoginPageError(Model model) {
        LoginDetails newLogin = new LoginDetails();
        model.addAttribute("login_details", newLogin);
        return "ErrorLoginPage";
    }

    @GetMapping("/forgotPassword")
    public String forgotPassword(Model model){
        return "ForgotPassword";
    }


    // This method authenticates login details provided by users
    @PostMapping("/loginVerify")
    public String validateLogin(Model model,LoginDetails login_details,HttpServletRequest request) {
        Session currentSession = entityManager.unwrap(Session.class);
        // parse through employee details table in database to obtain record of user with specified username
        String hql = "FROM UserDetails E WHERE E.email = :userName and E.password= :passWord";
        Query query = currentSession.createQuery(hql);
        query.setParameter("userName", login_details.getUsername());
        query.setParameter("passWord", login_details.getPassword());
        List<UserDetails> results = query.getResultList();
        // if result is obtained call home page for employee. if not redirect to login
        if (results.size() >= 1) {
            HttpSession session=request.getSession();
            session.setAttribute("mail",results.get(0).getEmail());
            model.addAttribute("loggedInAdmin",results.get(0));
            return "adminDashboard";
        }
        // If login fails redirect to login page
        return "redirect:/ASHRCportal/loginError";
    }


}
