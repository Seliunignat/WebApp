package com.boots.service;

import com.boots.entity.Login;
import com.boots.entity.Role;
import com.boots.entity.User;
import com.boots.repository.RoleRepository;
import com.boots.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.*;

@Service
public class UserService implements UserDetailsService {
    @PersistenceContext
    private EntityManager em;
    @Autowired
    UserRepository userRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        return user;
    }

    public User findUserById(Long userId) {
        Optional<User> userFromDb = userRepository.findById(userId);
        return userFromDb.orElse(new User());
    }

    public List<User> allUsers() {
        return userRepository.findAll();
    }

    public boolean saveUser(User user) {
        User userFromDB = userRepository.findByUsername(user.getUsername());

        if (userFromDB != null) {
            return false;
        }

        user.setRoles(Collections.singleton(new Role(1L, "ROLE_NOT_BLOCKED")));
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRegDate(new Date().toString());
        //user.setPassword(user.getPassword());
        userRepository.save(user);
        return true;
    }

    public boolean reSaveUser(User user)
    {
        User userFromDB = userRepository.findByUsername(user.getUsername());
        if(userFromDB != null)
        {
            userRepository.save(user);
            return true;
        }
        return false;
    }

    public boolean deleteUser(Long userId) {
        if (userRepository.findById(userId).isPresent()) {
            userRepository.deleteById(userId);
            return true;
        }
        return false;
    }

    public List<User> usergtList(Long idMin) {
        return em.createQuery("SELECT u FROM User u WHERE u.id > :paramId", User.class)
                .setParameter("paramId", idMin).getResultList();
    }

    public UserRepository getUserRepository() {
        return userRepository;
    }

    public boolean blockUser(User user) {
        if (userRepository.findById(user.getId()).isPresent()) {
            //userRepository.findById(userId).setRoles(Collections.singleton(new Role(2L, "ROLE_BLOCKED")));
            //user = userRepository.findById(userId);
            user.setRoles(Collections.singleton(new Role(2L, "ROLE_BLOCKED")));
            Set<Role> roles = user.getRoles();
            //this.reSaveUser(user);
            return true;
        }
            return false;
    }

    public User validateUser(Login login) {
        List<User> users = usergtList(0l);
        for (User user: users) {
            if (user.getUsername().equals(login.getUsername()) && user.getPassword().equals(login.getPassword()))
            {
                return user;
            }
        }
        return null;
    }

}

