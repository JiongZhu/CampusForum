package com.qxczh.common.exception;


public class ServiceProcessException extends RuntimeException {

    public ServiceProcessException(String message) {
        super(message);
    }

    public ServiceProcessException(String message, Throwable cause) {
        super(message, cause);
    }


}
