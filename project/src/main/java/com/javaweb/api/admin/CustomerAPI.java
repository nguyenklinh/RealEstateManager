package com.javaweb.api.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.enums.ErrorCode;
import com.javaweb.exception.MyException;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.ApiResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import com.javaweb.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController(value = "customerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerAPI {
    @Autowired
    private CustomerService customerService;

    @PostMapping
    public ResponseEntity<?> addOrUpdateCustomer(@Valid @RequestBody CustomerDTO customerDTO){
        try {
            CustomerEntity savedCustomer = customerService.addOrUpdateCustomer(customerDTO);
            return ResponseEntity.ok(ApiResponse.builder()
                    .success(true)
                    .message(SystemConstant.UPDATE_SUCCESS)
                    .result(savedCustomer)
                    .build());
        }catch (Exception e){
          throw new MyException(ErrorCode.ADD_OR_UPDATE_CUSTOMER_FAIL);
        }
    }
    @GetMapping("/{id}/staffs")
    public ResponseEntity<?> loadStaffs(@PathVariable Long id){
        ResponseDTO result = customerService.listStaffs(id);
        return ResponseEntity.ok(ApiResponse.builder()
                .success(true)
                .message(SystemConstant.LOAD_SUCCESS)
                .result(result)
                .build());
    }
    @DeleteMapping
    public ResponseEntity<?> deleteCustomer(@RequestBody List<Long> ids){
        try {
            customerService.deleteCustomersByIds(ids);
            return ResponseEntity.ok(ApiResponse.builder()
                    .success(true)
                    .message(SystemConstant.DELETE_SUCCESS)
                    .build());
        }catch (Exception e){
            throw new MyException(ErrorCode.DELETE_CUSTOMER_FAIL);
        }
    }
}
