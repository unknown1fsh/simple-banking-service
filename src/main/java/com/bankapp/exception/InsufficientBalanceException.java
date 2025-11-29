package com.bankapp.exception;

public class InsufficientBalanceException extends RuntimeException {
    public InsufficientBalanceException(String message) {
        super(message);
    }
    
    public InsufficientBalanceException(double balance, double amount) {
        super(String.format("Insufficient balance. Current balance: %.2f, Required amount: %.2f", balance, amount));
    }
}

