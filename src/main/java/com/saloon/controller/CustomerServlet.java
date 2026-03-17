package com.saloon.controller;

import com.saloon.model.Customer;
import com.saloon.service.FileCustomerService;
import com.saloon.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet("/customers")
public class CustomerServlet extends HttpServlet {

    private UserService<Customer> customerService;

    @Override
    public void init() throws ServletException {
        // Instantiate the file-based service
        customerService = new FileCustomerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            case "list":
            default:
                listCustomers(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "insert";
        }

        switch (action) {
            case "insert":
                insertCustomer(request, response);
                break;
            case "update":
                updateCustomer(request, response);
                break;
            default:
                listCustomers(request, response);
                break;
        }
    }

    private void listCustomers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> listCustomer = customerService.readAll();
        
        // Handle Search functionality
        String searchQuery = request.getParameter("search");
        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            listCustomer.removeIf(c -> !c.getName().toLowerCase().contains(searchQuery.toLowerCase()) && 
                                       !c.getPhone().contains(searchQuery));
        }

        request.setAttribute("listCustomer", listCustomer);
        request.setAttribute("searchQuery", searchQuery);
        request.getRequestDispatcher("users.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Customer existingCustomer = customerService.read(id);
        request.setAttribute("customer", existingCustomer);
        request.getRequestDispatcher("update.jsp").forward(request, response);
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = UUID.randomUUID().toString().substring(0, 8);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String preferredService = request.getParameter("preferredService");

        Customer newCustomer = new Customer(id, name, email, phone, preferredService);
        customerService.create(newCustomer);
        response.sendRedirect("customers?action=list");
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String preferredService = request.getParameter("preferredService");

        Customer customer = new Customer(id, name, email, phone, preferredService);
        customerService.update(customer);
        response.sendRedirect("customers?action=list");
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        customerService.delete(id);
        response.sendRedirect("customers?action=list");
    }
}
