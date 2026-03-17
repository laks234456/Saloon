# SE1020 – Object Oriented Programming Assignment
## Project: Online Saloon Management System

**Developer:** [Your Name / Team Members]
**Course:** SE1020 - Object-Oriented Programming

---

## 📌 Project Overview
The **Online Saloon Management System** is a Java-based web application developed to handle customer registrations, service bookings, and client management for a premium saloon. It was purposefully built to satisfy the core requirements of the SE1020 assignment, acting as a functional "Customer Management Module" complete with a beautiful, responsive User Interface.

Instead of utilizing a relational database like MySQL, this system relies entirely on **File I/O operations** (`customers.txt`) to ensure data persistence, adhering strictly to the assignment constraints while demonstrating clear Object-Oriented structural implementations.

---

## ✅ How This Project Satisfies Assignment Requirements

### 1. Object-Oriented Programming (OOP) Concepts
The core architecture of the backend relies heavily on standard OOP principles to ensure maintainability, reusability, and abstraction:

*   **Encapsulation:** 
    *   **Implementation:** Data fields in our data models (`src/main/java/com/saloon/model/Person.java` and `Customer.java`) such as `id`, `name`, `email`, `phone`, and `preferredService` are marked as `private`. 
    *   **Why:** This prevents unauthorized direct access and modification of the object's state. Access is strictly controlled through `public` Getter and Setter methods.

*   **Inheritance:**
    *   **Implementation:** We created an abstract base class `Person` which contains general attributes relevant to any human in the system. Our `Customer` class uses the `extends` keyword to inherit from `Person`. 
    *   **Why:** This promotes code reusability. A `Customer` "is a" `Person`, automatically inheriting the common fields while defining its own unique attribute: `preferredService`.

*   **Polymorphism:**
    *   **Method Overriding:** The abstract `Person` class has a `toCsv()` method to format its data for file storage. The `Customer` subclass overrides (`@Override`) this method to invoke `super.toCsv()` and append its own `preferredService` data. 
    *   **Interfaces:** We created a generic `UserService<T>` interface. Our controller (`CustomerServlet`) programs against this interface rather than a concrete class. `FileCustomerService` implements this interface. This means the controller logic can remain entirely agnostic to *how* the data is saved (Poly-morphism: many forms of saving data).

### 2. Implement Minimum 3 CRUD Operations using File Handling
The system fully implements **all 4** CRUD (Create, Read, Update, Delete) operations using Java's `java.io` package (specifically `BufferedReader`, `BufferedWriter`, `FileReader`, and `FileWriter`), managing a file named `customers.txt`.

*   **Create (Register a new user):** Allows the saloon owner to input new client details, which are appended as a new line to `customers.txt`.
*   **Read (Search user / List users):** The system parses `customers.txt`, converting lines back into `Customer` objects, and displays them in a dynamic HTML table. A search functionality filters these objects in-memory by name or phone number.
*   **Update (Update details):** Finds a specific customer by their UUID, modifies their attributes, and rewrites the `customers.txt` file with the updated collection.
*   **Delete (Delete a user):** Removes a specific customer from the in-memory collection by UUID and overwrites the text file to reflect the deletion.

*The logic for these operations can be found in `src/main/java/com/saloon/service/FileCustomerService.java`.*

### 3. User-Friendly Interface
The application features a **minimum of 4 UIs** constructed using JSP (Java Server Pages):
1.  **`index.jsp`**: A welcoming landing page acting as an entry point.
2.  **`register.jsp`**: A form for creating new client profiles.
3.  **`users.jsp`**: A dashboard to review all clients, perform searches, and trigger edit/delete actions.
4.  **`update.jsp`**: A form pre-populated with client data for modification.

**UI Enhancements:**
We utilized **Tailwind CSS** via a CDN as permitted by the assignment guidelines (`JavaScript for UI enhancements / Tailwind CSS or Bootstrap`). The application features a "Premium Light Glassmorphism" theme, utilizing modern typography, dynamic hover animations, and floating input labels.

### 4. Development Environment & Deliverables
*   **Software / Setup:** Built in IntelliJ IDEA as a standard Maven Web Application.
*   **Technologies:** Java 11+, Servlet API, JSP API, JSTL, HTML5, and Tailwind CSS.
*   **Version Control:** The project is tracked using Git, with a logical commit history demonstrating the step-by-step development process from architecture setup to UI enhancements.
*   **Documentation:** A `Final_Report.md` is included in the project root, containing the required UML Class Diagrams and a summary of the Git history.

---

## 🚀 How to Run the Application

This project is configured with the `tomcat7-maven-plugin` to ensure grading and execution are incredibly simple without complex server configurations.

**Method 1: Using Terminal (Recommended)**
1. Open a terminal and navigate to the root directory of this project.
2. Execute the following Maven command:
   ```bash
   mvn tomcat7:run
   ```
3. Once the server starts, open a web browser and navigate to: **http://localhost:8080**

**Method 2: Using IntelliJ IDEA's built-in Server Configuration**
1. Open the project folder in IntelliJ IDEA.
2. Add a new "Tomcat Server -> Local" run configuration.
3. Under the "Deployment" tab, add the `OnlineSaloonManagement:war exploded` artifact.
4. Set the Application Context to `/`.
5. Run the configuration.

*(Note: Data will be persistently saved to `customers.txt` located in the root working directory of the project upon execution).*
