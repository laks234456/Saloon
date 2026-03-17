<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saloon Management System</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
        .hero-pattern {
            background-color: #f3f4f6;
            background-image: radial-gradient(#e5e7eb 1px, transparent 1px);
            background-size: 20px 20px;
        }
    </style>
</head>
<body class="bg-gray-50 flex items-center justify-center min-h-screen hero-pattern">
    <div class="max-w-xl w-full text-center bg-white p-10 rounded-2xl shadow-xl ring-1 ring-gray-900/5">
        <h1 class="text-5xl font-extrabold tracking-tight text-gray-900 mb-6">
            Luxe <span class="text-indigo-600">Saloon</span>
        </h1>
        <p class="text-lg text-gray-600 mb-10 leading-relaxed">
            Manage your customers effortlessly. A complete offline saloon booking and customer management solution tailored for your needs.
        </p>
        <div class="flex flex-col sm:flex-row gap-4 justify-center">
            <a href="customers?action=new" class="inline-flex justify-center rounded-lg bg-indigo-600 px-8 py-3 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 transition-all duration-200">
                Register New Customer
            </a>
            <a href="customers?action=list" class="inline-flex justify-center rounded-lg bg-white px-8 py-3 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50 transition-all duration-200">
                View Customers
            </a>
        </div>
    </div>
</body>
</html>
