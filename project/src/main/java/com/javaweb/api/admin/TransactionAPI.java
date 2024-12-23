package com.javaweb.api.admin;

import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "transactionAPIOfAdmin")
@RequestMapping("/api/transaction")
public class TransactionAPI {
    @Autowired
    private TransactionService transactionService;
    @PostMapping
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void addTransaction(@ModelAttribute TransactionDTO transactionDTO){
        transactionService.addTransaction(transactionDTO);
    }
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteTransaction(@PathVariable("id") Long id){
        transactionService.deleteTransaction(id);
    }
    @PutMapping()
    public ResponseEntity<?> updateTransaction(@RequestBody List<TransactionDTO> transactionDTOs){
        for(TransactionDTO transactionDTO: transactionDTOs){
            transactionService.updateTransaction(transactionDTO);
        }
        return ResponseEntity.ok().build();
    }
}
