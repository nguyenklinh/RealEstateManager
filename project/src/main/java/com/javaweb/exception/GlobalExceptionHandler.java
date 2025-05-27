package com.javaweb.exception;

import com.javaweb.enums.ErrorCode;
import com.javaweb.model.response.ApiResponse;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.sql.SQLIntegrityConstraintViolationException;


@ControllerAdvice

public class GlobalExceptionHandler {
//    @ExceptionHandler(RuntimeException.class)
//    ResponseEntity<ApiResponse> handleRuntimeException(RuntimeException e) {
//        ApiResponse apiResponse = new ApiResponse();
//        apiResponse.setCode(1001);
//        apiResponse.setMessage(e.getMessage());
//        return ResponseEntity.badRequest().body(apiResponse);
//    }
    @ExceptionHandler(MethodArgumentNotValidException.class)
    ResponseEntity<ApiResponse<?>> handlingValidation(MethodArgumentNotValidException e){
        String enumKey = e.getBindingResult().getFieldError().getDefaultMessage();
        ErrorCode errorCode = ErrorCode.valueOf(enumKey);
        ApiResponse<?> apiResponse = ApiResponse.builder()
                .code(errorCode.getCode())
                .success(false)
                .message(errorCode.getMessage())
                .build();
        System.out.println(apiResponse);
        return ResponseEntity
                .status(errorCode.getHttpStatus())
                .body(apiResponse);
    }
    @ExceptionHandler(ConstraintViolationException.class)
    ResponseEntity<ApiResponse<?>> handlingValidationUser(MethodArgumentNotValidException e){
        ApiResponse<?> apiResponse = ApiResponse.builder()
                .code(ErrorCode.SQL_INTEGRITY_CONSTRAINT_VIOLATION.getCode())
                .success(false)
                .message(ErrorCode.SQL_INTEGRITY_CONSTRAINT_VIOLATION.getMessage())
                .build();
        return ResponseEntity
                .status(ErrorCode.SQL_INTEGRITY_CONSTRAINT_VIOLATION.getHttpStatus())
                .body(apiResponse);
    }

    @ExceptionHandler(BindException.class)
    ResponseEntity<ApiResponse<?>> handlingValidation(BindException e){
        String enumKey = e.getBindingResult().getFieldError().getDefaultMessage();
        ErrorCode errorCode = ErrorCode.valueOf(enumKey);
        ApiResponse<?> apiResponse = ApiResponse.builder()
                .code(errorCode.getCode())
                .success(false)
                .message(errorCode.getMessage())
                .build();
        System.out.println(apiResponse);
        return ResponseEntity
                .status(errorCode.getHttpStatus())
                .body(apiResponse);
    }
    @ExceptionHandler(MyException.class)
    ResponseEntity<ApiResponse<?>> handleMyException(MyException e) {
        ErrorCode errorCode = e.getErrorCode();
        ApiResponse<?> apiResponse = ApiResponse.builder()
                .code(errorCode.getCode())
                .success(false)
                .message(errorCode.getMessage())
                .build();
        return ResponseEntity
                .status(errorCode.getHttpStatus())
                .body(apiResponse);
    }
}
