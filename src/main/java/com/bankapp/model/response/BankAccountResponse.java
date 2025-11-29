package com.bankapp.model.response;

import com.bankapp.entity.BankAccountEntity;
import com.bankapp.model.dto.TransactionDTO;
import lombok.Getter;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Getter
public class BankAccountResponse {
    private String accountNumber;
    private String owner;
    private double balance;
    private String createDate;
    private List<TransactionDTO> transactions;

    public BankAccountResponse(BankAccountEntity account) {
        if (account == null) {
            throw new IllegalArgumentException("Account cannot be null");
        }
        this.accountNumber = account.getAccountNumber();
        this.owner = account.getOwner();
        this.balance = account.getBalance();
        this.createDate = formatDate(account.getCreateDate());
        this.transactions = account.getTransactions() != null 
            ? account.getTransactions().stream()
                .map(TransactionDTO::new)
                .collect(Collectors.toList())
            : Collections.emptyList();
    }

    private String formatDate(LocalDateTime date) {
        if (date == null) {
            return null;
        }
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        return date.format(formatter);
    }
}
