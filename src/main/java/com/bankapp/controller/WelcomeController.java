package com.bankapp.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class WelcomeController {

    @GetMapping("/api")
    public ResponseEntity<Map<String, Object>> apiInfo() {
        Map<String, Object> response = new HashMap<>();
        response.put("message", "Banking Service API");
        response.put("version", "1.0.0");
        response.put("status", "running");
        response.put("endpoints", Map.of(
            "GET /account/v1/{accountNumber}", "Get account details",
            "POST /account/v1/credit/{accountNumber}", "Credit account (deposit)",
            "POST /account/v1/debit/{accountNumber}", "Debit account (withdraw)"
        ));
        response.put("testUI", "Visit http://localhost:8080/ to access the test interface");
        return ResponseEntity.ok(response);
    }

    @GetMapping("/health")
    public ResponseEntity<Map<String, String>> health() {
        Map<String, String> response = new HashMap<>();
        response.put("status", "UP");
        response.put("service", "Banking Service");
        return ResponseEntity.ok(response);
    }
}

