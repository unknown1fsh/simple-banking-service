package com.bankapp.controller;

import com.bankapp.model.request.CreditDebitRequest;
import com.bankapp.model.response.BankAccountResponse;
import com.bankapp.model.response.TransactionResponse;
import com.bankapp.entity.BankAccountEntity;
import com.bankapp.service.BankAccountService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/account/v1")
public class BankAccountController {

    private final BankAccountService bankAccountService;

    public BankAccountController(BankAccountService bankAccountService) {
        this.bankAccountService = bankAccountService;
    }

    @PostMapping("/credit/{accountNumber}")
    public ResponseEntity<TransactionResponse> creditAccount(@PathVariable String accountNumber, @RequestBody CreditDebitRequest request) {
        BankAccountEntity account = bankAccountService.findByAccountNumber(accountNumber);
        String approvalCode = bankAccountService.credit(accountNumber, request.getAmount());
        return ResponseEntity.ok(new TransactionResponse("OK", approvalCode, account.getBalance()));
    }

    @PostMapping("/debit/{accountNumber}")
    public ResponseEntity<TransactionResponse> debitAccount(@PathVariable String accountNumber, @RequestBody CreditDebitRequest request) {
        BankAccountEntity account = bankAccountService.findByAccountNumber(accountNumber);
        String approvalCode = bankAccountService.debit(accountNumber, request.getAmount());
        return ResponseEntity.ok(new TransactionResponse("OK", approvalCode, account.getBalance()));
    }

    @GetMapping("/{accountNumber}")
    public ResponseEntity<BankAccountResponse> getAccountDetails(@PathVariable String accountNumber) {
        BankAccountEntity account = bankAccountService.findByAccountNumber(accountNumber);
        return ResponseEntity.ok(new BankAccountResponse(account));
    }
}
