package com.javaweb.enums;

import org.springframework.http.HttpStatus;

public enum ErrorCode {
    CUSTOMER_NOT_FOUND(1001, "Customer not found", HttpStatus.NOT_FOUND),
    CHANGE_PASSWORD_FAIL(1002, "Change password fail",HttpStatus.BAD_REQUEST),
    ADD_OR_UPDATE_CUSTOMER_FAIL(1004, "Failed to add or update customer", HttpStatus.BAD_REQUEST),
    DELETE_CUSTOMER_FAIL(1005, "Failed to delete customer", HttpStatus.BAD_REQUEST),
    USER(1003, "User not found", HttpStatus.NOT_FOUND),
    NAME_BLANK(2001, "name cannot be blank", HttpStatus.BAD_REQUEST),
    PHONE_BLANK(2002, "phone cannot be blank", HttpStatus.BAD_REQUEST),
    EMAIL_NOT_VALID(2003, "email is not valid", HttpStatus.BAD_REQUEST),
    BUILDING_NOT_FOUND(3001, "Building not found", HttpStatus.NOT_FOUND),
    UPLOAD_FILE_FAIL(3002, "Failed to upload file", HttpStatus.INTERNAL_SERVER_ERROR),
    ASSIGNMENT_UPDATE_FAIL(3003, "Failed to update building assignment", HttpStatus.BAD_REQUEST),
    ADD_OR_UPDATE_BUILDING_FAIL(3004,"Failed to add or update building",HttpStatus.BAD_REQUEST),
    DELETE_BUILDING_FAIL(3005, "Failed to delete building", HttpStatus.BAD_REQUEST),
    SUCCESS(1000, "Success" , HttpStatus.OK),
    ;

    ErrorCode(int code, String message, HttpStatus httpStatus) {
        this.code = code;
        this.message = message;
        this.httpStatus = httpStatus;
    }

    private int code;
    private String message;
    private HttpStatus httpStatus;

    public HttpStatus getHttpStatus() {
        return httpStatus;
    }

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
