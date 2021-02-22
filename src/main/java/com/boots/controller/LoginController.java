package com.boots.controller;

import com.boots.entity.Login;
import com.boots.entity.User;
import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


public class LoginController {
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String showLogin(HttpServletRequest request, HttpServletResponse response, Model model) {
        model.addAttribute("login", new Login());
        //ModelAndView mav = new ModelAndView("login");
        //mav.addObject("login", new Login());
       // return mav;
        return "login";
    }

    @PostMapping("/login")
    public String loginProcess(@RequestParam(required = true, defaultValue = "") String action,  Model model) {
        ModelAndView mav = null;
        //User user = userService.validateUser(login);
        User user = null;
        if (null != user) {
            mav = new ModelAndView("welcome");
            mav.addObject("firstname", user.getUsername());
        } else {
            mav = new ModelAndView("login");
            mav.addObject("message", "Username or Password is wrong!!");
        }

        return "";
    }

}
