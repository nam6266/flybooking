/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.Acount;
import com.mycompany.spring_mvc_project_final.entities.Role;
import com.mycompany.spring_mvc_project_final.enums.RoleStatus;
import com.mycompany.spring_mvc_project_final.enums.UserStatus;
import java.util.HashSet;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import com.mycompany.spring_mvc_project_final.repository.AccountRepository;
import com.mycompany.spring_mvc_project_final.repository.RoleRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private AccountRepository userRepository;

    @Autowired
    private RoleRepository userRoleRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Acount acount = userRepository.getAccount(username);
        if (acount == null) {
            throw new UsernameNotFoundException(username);
        }
        Set<Role> roleNames = userRoleRepository.findByListAccount_UserName(username);
        Set<GrantedAuthority> grantList = new HashSet<>();
        if (!CollectionUtils.isEmpty(roleNames)) {
            for (Role role : roleNames) {
                GrantedAuthority authority = new SimpleGrantedAuthority(role.getRoleStatus().toString());
                grantList.add(authority);
            }
        }

        return (UserDetails) new User(acount.getEmail(), acount.getPassword(), grantList);
    }

}
