package com.bankapp.exception;

public class AccountNotFoundException extends RuntimeException {
    public AccountNotFoundException(String message) {
        super(message);
    }
    
    public AccountNotFoundException(String accountNumber, Throwable cause) {
        super("Account not found with account number: " + accountNumber, cause);
    }
}

