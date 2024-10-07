package com.bankapp.model.response;

import lombok.Getter;

@Getter
public class TransactionResponse {
    private String status;
    private String approvalCode;
    private double balance;

    public TransactionResponse(String status, String approvalCode, double balance) {
        this.status = status;
        this.approvalCode = approvalCode;
        this.balance = balance;
    }
}
