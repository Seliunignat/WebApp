package com.boots.controller;

import com.boots.entity.Role;
import com.boots.entity.User;
import com.boots.repository.UserRepository;
import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.access.prepost.PreFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;

    @GetMapping("/admin")
    public String userList(HttpServletRequest req, Model model) {
        model.addAttribute("allUsers", userService.allUsers());
        String username = "";
        if(req.getUserPrincipal() != null)
            username = req.getUserPrincipal().getName();
        else
            return "redirect: /login";
        User user =  userService.getUserRepository().findByUsername(username);
        if(user == null || (user!=null && (user.hasRole(new Role(2L, "ROLE_BLOCKED")))))
        {
            req.getSession().invalidate();
            return "redirect: /login";
        }
        return "admin";
    }

    @PostMapping("/admin")
    public String deleteUser(@RequestParam("isSelected") List<String> userIds,
                              @RequestParam(required = true, defaultValue = "") String action,
                              Model model) {
        if (action.equals("delete")){
            for (String userId: userIds) {
                userService.deleteUser(Long.parseLong(userId));
            }
        }
        else if(action.equals("block"))
        {
            for (String userId: userIds) {
                User user = userService.findUserById(Long.parseLong(userId));
                UserRepository userRepo =  userService.getUserRepository();
                user.getRoles().clear();
                user.getRoles().add(new Role(2L, "ROLE_BLOCKED"));
                userRepo.save(user);
            }
        }
        else if(action.equals("unblock"))
        {
            for (String userId: userIds) {
                User user = userService.findUserById(Long.parseLong(userId));
                UserRepository userRepo =  userService.getUserRepository();
                user.getRoles().clear();
                user.getRoles().add(new Role(1L, "ROLE_NOT_BLOCKED"));
                userRepo.save(user);
            }
        }
        return "redirect:/admin";
    }

    @GetMapping("/admin/gt/{userId}")
    public String gtUser(@PathVariable("userId") Long userId, Model model) {
        model.addAttribute("allUsers", userService.usergtList(userId));
        return "admin";
    }
}
