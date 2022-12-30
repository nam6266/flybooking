/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.service.StationServices;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @Autowired
    public StationServices stationServices;

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String welcomePage(Model model,      
            HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        model.addAttribute("listStation", stationServices.getStation());
        return "home";
    }

    @RequestMapping("/login")
    public String loginPage(Model model, @RequestParam(value = "error", required = false) boolean error) {
        if (error) {
            model.addAttribute("message", "Login Fail!!!");
        }
        return "login";
    }

    @RequestMapping("/403")
    public String accessDenied(Model model) {
        return "403Page";
    }

    @RequestMapping(value = {"/add"})
    public String addAircraft(Model model) {
        return "management/manageaircraft";
    }
    
        @RequestMapping(value = {"/result"}, method = RequestMethod.POST)
    public String saveAircraft(Model model,
            @RequestParam(name = "name") String name,
            @RequestParam(name = "number") String number,
            @RequestParam(name = "row") int row,
            @RequestParam(name = "col") int col) {

        return "home";
    }
}
