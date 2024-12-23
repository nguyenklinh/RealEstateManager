package com.javaweb.api.admin;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import com.javaweb.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "customerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerAPI {
    @Autowired
    private CustomerService customerService;

    @PostMapping
    public ResponseEntity<CustomerEntity> addOrUpdateCustomer(@ModelAttribute CustomerDTO customerDTO){
        CustomerEntity savedCustomer = customerService.addOrUpdateCustomer(customerDTO);
        return ResponseEntity.ok(savedCustomer);
    }
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO result = customerService.listStaffs(id);
        return result;
    }
    @DeleteMapping
    @ResponseStatus(HttpStatus.NO_CONTENT) // Trả về mã 204 khi xóa thành công
    public void deleteCustomer(@RequestBody List<Long> ids){
        //xuong db xoa theo iD
        customerService.deleteCustomersByIds(ids);
        System.out.println("ok");
    }
}
