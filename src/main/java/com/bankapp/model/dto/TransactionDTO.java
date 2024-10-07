package com.bankapp.model.dto;

import com.bankapp.entity.TransactionEntity;
import lombok.Getter;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter
public class TransactionDTO {
    private String date;
    private double amount;
    private String type;
    private String approvalCode;

    public TransactionDTO(TransactionEntity transaction) {
        this.date = formatDate(transaction.getDate());
        this.amount = transaction.getAmount();
        this.type = transaction.getTransactionType();
        this.approvalCode = transaction.getApprovalCode();
    }

    private String formatDate(LocalDateTime date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        return date.format(formatter);
    }
}
