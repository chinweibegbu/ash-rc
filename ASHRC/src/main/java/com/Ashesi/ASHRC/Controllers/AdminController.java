package com.Ashesi.ASHRC.Controllers;


import com.Ashesi.ASHRC.Model.AdminDetails;
import com.Ashesi.ASHRC.RepositoriesDAO.LoginRepository;
import com.Ashesi.ASHRC.RepositoriesDAO.UserRepository;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    // Required repositories to help implement needed methods
    @Autowired
    private EntityManager entityManager;

    @Autowired
    public UserRepository userRepo;

    @Autowired
    LoginRepository loginRepo;


    // This method displays admin dashboard
    @GetMapping("/dashboard")
    public String displayDashboard(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        List<AdminDetails> Emp = getAdmin((String)session.getAttribute("mail"));
        model.addAttribute("loggedInAdmin",Emp.get(0));
        return "adminDashboard";
    }

    public List<AdminDetails> getAdmin(String mail) {
        Session currentSession = entityManager.unwrap(Session.class);
        String hql = "FROM AdminDetails Emp WHERE Emp.email = :email";
        Query query = currentSession.createQuery(hql);
        query.setParameter("email",mail);
        List<AdminDetails> results = query.getResultList();
        return results;
    }

    // This method displays analytics/statistics page
    @GetMapping("/analytics")
    public String displayAnalyticsPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        List<AdminDetails> Emp = getAdmin((String)session.getAttribute("mail"));
        model.addAttribute("loggedInAdmin",Emp.get(0));
        return "adminAnalytics";
    }

    @GetMapping("/respondents")
    public String displayRespondentManagementPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        List<AdminDetails> Emp = getAdmin((String)session.getAttribute("mail"));
        model.addAttribute("loggedInAdmin",Emp.get(0));
        return "RespondentManagement";
    }

    @GetMapping("/settings")
    public String displaySettings(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        List<AdminDetails> Emp = getAdmin((String)session.getAttribute("mail"));
        model.addAttribute("loggedInAdmin",Emp.get(0));
        return "Settings";
    }

    // This is the logout method, to destroy the session of the currently logged in user
    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        session.invalidate();
        return "redirect:/ASHRCportal/login";
    }
}
