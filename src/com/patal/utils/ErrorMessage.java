package com.patal.utils;

public class ErrorMessage {
    String errorType;
    String title;
    String from;
    String description;

    public ErrorMessage(String errorType, String title, String from, String description) {
        this.errorType = errorType;
        this.title = title;
        this.from = from;
        this.description = description;
    }

    public String getErrorType() {
        return errorType;
    }

    public void setErrorType(String errorType) {
        this.errorType = errorType;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
