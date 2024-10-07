package com.bankapp.service.impl;

import com.bankapp.entity.BankAccountEntity;
import com.bankapp.entity.TransactionEntity;
import com.bankapp.repository.BankAccountRepository;
import com.bankapp.repository.TransactionRepository;
import com.bankapp.service.BankAccountService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Service
@Transactional
public class BankAccountServiceImpl implements BankAccountService {

    private final BankAccountRepository bankAccountRepository;
    private final TransactionRepository transactionRepository;

    public BankAccountServiceImpl(BankAccountRepository bankAccountRepository, TransactionRepository transactionRepository) {
        this.bankAccountRepository = bankAccountRepository;
        this.transactionRepository = transactionRepository;
    }

    @Override
    public BankAccountEntity createAccount(String owner, String accountNumber, double balance) {
        BankAccountEntity account = new BankAccountEntity();
        account.setOwner(owner);
        account.setAccountNumber(accountNumber);
        account.setBalance(balance);
        return bankAccountRepository.save(account);
    }

    @Override
    public BankAccountEntity findByAccountNumber(String accountNumber) {
        return bankAccountRepository.findByAccountNumber(accountNumber)
            .orElseThrow(() -> new RuntimeException("Account not found"));
    }

    @Override
    public String credit(String accountNumber, double amount) {
        return processTransaction(accountNumber, amount, true);
    }

    @Override
    public String debit(String accountNumber, double amount) {
        return processTransaction(accountNumber, amount, false);
    }

    private String processTransaction(String accountNumber, double amount, boolean isCredit) {
        BankAccountEntity account = findByAccountNumber(accountNumber);
        if (!isCredit && account.getBalance() < amount) {
            throw new RuntimeException("Insufficient balance");
        }
        double newBalance = isCredit ? account.getBalance() + amount : account.getBalance() - amount;
        account.setBalance(newBalance);
        String approvalCode = UUID.randomUUID().toString();
        postTransaction(accountNumber, createTransactionEntity(amount, approvalCode, isCredit));
        return approvalCode;
    }

    @Override
    public void postTransaction(String accountNumber, TransactionEntity transaction) {
        BankAccountEntity account = findByAccountNumber(accountNumber);
        transaction.setBankAccount(account);
        transactionRepository.save(transaction);
    }

    private TransactionEntity createTransactionEntity(double amount, String approvalCode, boolean isCredit) {
        TransactionEntity transaction = new TransactionEntity();
        transaction.setAmount(amount);
        transaction.setTransactionType(isCredit ? "DepositTransaction" : "WithdrawalTransaction");
        transaction.setApprovalCode(approvalCode);
        return transaction;
    }
}
