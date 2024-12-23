package com.javaweb.service.impl;

import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TransactionServiceImpl implements TransactionService {
    @Autowired
    private TransactionRepository transactionRepository;
    @Autowired
    private TransactionConverter transactionConverter;
    @Autowired
    private CustomerRepository customerRepository;
    @Override
    public List<TransactionDTO> findByCustomerId(Long id) {
        List<TransactionEntity> transactionEntity = transactionRepository.findByCustomerId(id);
        if(transactionEntity != null) return transactionConverter.toTransactionDTOs(transactionEntity);
        System.out.println("ok");
        return null;
    }

    @Override
    public void addTransaction(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity = transactionConverter.toTransactionEntity(transactionDTO);
        transactionEntity.setStatus("CHUA_XU_LY");
        CustomerEntity customerEntity = customerRepository.findById(transactionDTO.getCustomerId()).get();
        transactionEntity.setCustomer(customerEntity);
            transactionRepository.save(transactionEntity);
    }

    @Override
    public void deleteTransaction(Long id) {
        transactionRepository.deleteById(id);
    }

    @Override
    public void updateTransaction(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity = transactionRepository.findById(transactionDTO.getId()).get();
        transactionEntity.setStatus(transactionDTO.getStatus());
        transactionRepository.save(transactionEntity);
    }
}
