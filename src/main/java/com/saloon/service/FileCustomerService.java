package com.saloon.service;

import com.saloon.model.Customer;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileCustomerService implements UserService<Customer> {
    
    // In a real server environment, we should use an absolute path or a robust relative path mechanism.
    // For this assignment, we use an absolute path within the workspace or a system temp folder.
    private static final String FILE_PATH = System.getProperty("user.home") + "/Desktop/tmpppp/customers.txt";

    public FileCustomerService() {
        // Ensure file exists
        try {
            File file = new File(FILE_PATH);
            if (!file.exists()) {
                file.createNewFile();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void create(Customer customer) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(customer.toCsv());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Customer read(String id) {
        return readAll().stream().filter(c -> c.getId().equals(id)).findFirst().orElse(null);
    }

    @Override
    public List<Customer> readAll() {
        List<Customer> customers = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    Customer c = Customer.fromCsv(line);
                    if (c != null) {
                        customers.add(c);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return customers;
    }

    @Override
    public void update(Customer customer) {
        List<Customer> customers = readAll();
        boolean updated = false;
        
        for (int i = 0; i < customers.size(); i++) {
            if (customers.get(i).getId().equals(customer.getId())) {
                customers.set(i, customer);
                updated = true;
                break;
            }
        }
        
        if (updated) {
            saveAll(customers);
        }
    }

    @Override
    public void delete(String id) {
        List<Customer> customers = readAll();
        boolean removed = customers.removeIf(c -> c.getId().equals(id));
        
        if (removed) {
            saveAll(customers);
        }
    }
    
    private void saveAll(List<Customer> customers) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Customer customer : customers) {
                writer.write(customer.toCsv());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
