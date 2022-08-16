package com.techelevator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPageController {

    @RequestMapping("/")
    public String getMainPage() {
        return "mainPage";
    }

    @RequestMapping("/users/{userName}")
    public String getLoggedInMainPage() {
        return "mainPage";
    }

}
