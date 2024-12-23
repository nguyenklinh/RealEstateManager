package com.javaweb.service;

import com.javaweb.model.dto.TransactionDTO;

import java.util.List;

public interface TransactionService {
    List<TransactionDTO> findByCustomerId(Long id);
    void addTransaction(TransactionDTO transactionDTO);
    void deleteTransaction(Long id);
    void updateTransaction(TransactionDTO transactionDTO);
}
