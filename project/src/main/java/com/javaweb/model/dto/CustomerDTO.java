package com.javaweb.model.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class CustomerDTO extends AbstractDTO{
    @NotBlank(message = "NAME_BLANK")
    private String fullName;
    private String managementStaff;
    @NotBlank(message = "PHONE_BLANK")
    private String phone;
    @Email(message = "EMAIL_NOT_VALID")
    private String email;
    private String demand;
    private String status;
    private String companyName;

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getManagementStaff() {
        return managementStaff;
    }

    public void setManagementStaff(String managementStaff) {
        this.managementStaff = managementStaff;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDemand() {
        return demand;
    }

    public void setDemand(String demand) {
        this.demand = demand;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
