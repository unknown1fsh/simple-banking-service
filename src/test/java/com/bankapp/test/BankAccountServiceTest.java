package com.bankapp.test;

import com.bankapp.entity.BankAccountEntity;
import com.bankapp.repository.BankAccountRepository;
import com.bankapp.service.impl.BankAccountServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

class BankAccountServiceTest {

    @Mock
    private BankAccountRepository bankAccountRepository;

    @InjectMocks
    private BankAccountServiceImpl bankAccountService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testCredit() {
        // Arrange
        BankAccountEntity account = new BankAccountEntity();
        account.setAccountNumber("123456789");
        account.setBalance(1000);
        
        // Mock the repository method
        when(bankAccountRepository.findByAccountNumber("123456789")).thenReturn(Optional.of(account));

        // Act
        bankAccountService.credit("123456789", 500);
        
        // Assert
        assertEquals(1500.0, account.getBalance()); // double ile double karşılaştırma
    }

    @Test
    void testDebit() {
        // Arrange
        BankAccountEntity account = new BankAccountEntity();
        account.setAccountNumber("123456789");
        account.setBalance(1000);
        
        // Mock the repository method
        when(bankAccountRepository.findByAccountNumber("123456789")).thenReturn(Optional.of(account));

        // Act
        bankAccountService.debit("123456789", 200);
        
        // Assert
        assertEquals(800.0, account.getBalance()); // double ile double karşılaştırma
    }
}
