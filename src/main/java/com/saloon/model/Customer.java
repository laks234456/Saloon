package com.saloon.model;

/**
 * Customer class extends Person to demonstrate Inheritance.
 */
public class Customer extends Person {
    private String preferredService;

    public Customer(String id, String name, String email, String phone, String preferredService) {
        super(id, name, email, phone);
        this.preferredService = preferredService;
    }

    public String getPreferredService() {
        return preferredService;
    }

    public void setPreferredService(String preferredService) {
        this.preferredService = preferredService;
    }

    @Override
    public String getRole() {
        return "Customer";
    }

    @Override
    public String toCsv() {
        return super.toCsv() + "," + preferredService;
    }
    
    public static Customer fromCsv(String csvLine) {
        String[] parts = csvLine.split(",");
        if (parts.length >= 5) {
            return new Customer(parts[0], parts[1], parts[2], parts[3], parts[4]);
        }
        return null;
    }
}
