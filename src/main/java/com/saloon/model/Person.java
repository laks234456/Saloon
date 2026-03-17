package com.saloon.model;

/**
 * Abstract class representing a generic Person in the system.
 * Demonstrates Abstraction and Encapsulation.
 */
public abstract class Person {
    private String id;
    private String name;
    private String email;
    private String phone;

    public Person(String id, String name, String email, String phone) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    // Abstract method to demonstrate Polymorphism when overridden
    public abstract String getRole();

    // Converts details to a comma-separated format for file storage
    public String toCsv() {
        return id + "," + name + "," + email + "," + phone;
    }
}
