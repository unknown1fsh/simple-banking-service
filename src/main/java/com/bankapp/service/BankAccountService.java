package com.bankapp.service;

import com.bankapp.entity.BankAccountEntity;
import com.bankapp.entity.TransactionEntity;

public interface BankAccountService {
    BankAccountEntity createAccount(String owner, String accountNumber, double balance);
    BankAccountEntity findByAccountNumber(String accountNumber);
    String credit(String accountNumber, double amount);
    String debit(String accountNumber, double amount);
    void postTransaction(String accountNumber, TransactionEntity transaction);
}
