package com.javaweb.converter;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class TransactionConverter {
    @Autowired
    private ModelMapper modelMapper;
    public TransactionDTO toTransactionDTO(TransactionEntity transactionEntity) {
        return modelMapper.map(transactionEntity, TransactionDTO.class);
    }
    public TransactionEntity toTransactionEntity(TransactionDTO transactionDTO) {
        return modelMapper.map(transactionDTO, TransactionEntity.class);
    }
    public List<TransactionDTO> toTransactionDTOs(List<TransactionEntity> transactionEntities) {
        return transactionEntities.stream().map(this::toTransactionDTO).collect(Collectors.toList());
    }
}
