package com.javaweb.model.response;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class ApiResponse <T>{
    private int code;
    private boolean success;
    private String message;
    private T result;
    public static <T> builder<T> builder(){
        return new builder<>();
    }
    public static class builder<T>{
        private int code;
        private boolean success;
        private String message;
        private T result;
        public builder<T> code(int code){
            this.code = code;
            return this;
        }
        public builder<T> success(boolean success){
            this.success = success;
            return this;
        }
        public builder<T> message(String message){
            this.message = message;
            return this;
        }
        public builder<T> result(T result){
            this.result = result;
            return this;
        }
        public ApiResponse<T> build(){
            ApiResponse<T> apiResponse = new ApiResponse<>();
            apiResponse.setCode(this.code);
            apiResponse.setSuccess(this.success);
            apiResponse.setMessage(this.message);
            apiResponse.setResult(this.result);
            return apiResponse;
        }
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getResult() {
        return result;
    }

    public void setResult(T result) {
        this.result = result;
    }
}
