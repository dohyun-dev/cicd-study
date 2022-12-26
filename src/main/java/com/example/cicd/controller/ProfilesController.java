package com.example.cicd.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;

@RequestMapping("/api")
@RestController
@RequiredArgsConstructor
public class ProfilesController {

    private final Environment env;

    @GetMapping("/profile")
    public String getProfile() {
        return Arrays.stream(env.getActiveProfiles()).findFirst().orElse("");
    }

    @GetMapping("/hello")
    public String hello() {
        return "hello";
    }
}
