<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Customer - Saloon Management</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>body { font-family: 'Inter', sans-serif; }</style>
</head>
<body class="bg-gray-50 text-gray-900 antialiased py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md mx-auto bg-white rounded-xl shadow-md overflow-hidden p-8 ring-1 ring-gray-200 border-t-4 border-indigo-600">
        <div class="text-center mb-8">
            <h2 class="text-3xl font-bold tracking-tight text-gray-900">Update Customer</h2>
            <p class="mt-2 text-sm text-gray-600">Modifying profile for ${customer.name}</p>
        </div>
        
        <form action="customers?action=update" method="post" class="space-y-6">
            <input type="hidden" name="id" value="${customer.id}" />

            <div>
                <label for="name" class="block text-sm font-medium text-gray-700">Full Name</label>
                <div class="mt-1">
                    <input id="name" name="name" type="text" value="${customer.name}" required class="block w-full rounded-md border-0 py-2.5 px-3 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 bg-gray-50 focus:bg-white transition-colors">
                </div>
            </div>

            <div>
                <label for="email" class="block text-sm font-medium text-gray-700">Email Address</label>
                <div class="mt-1">
                    <input id="email" name="email" type="email" value="${customer.email}" required class="block w-full rounded-md border-0 py-2.5 px-3 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 bg-gray-50 focus:bg-white transition-colors">
                </div>
            </div>

            <div>
                <label for="phone" class="block text-sm font-medium text-gray-700">Phone</label>
                <div class="mt-1">
                    <input id="phone" name="phone" type="tel" value="${customer.phone}" required class="block w-full rounded-md border-0 py-2.5 px-3 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 bg-gray-50 focus:bg-white transition-colors">
                </div>
            </div>

            <div>
                 <label for="preferredService" class="block text-sm font-medium text-gray-700">Preferred Service</label>
                 <select id="preferredService" name="preferredService" class="mt-1 block w-full rounded-md border-0 py-2.5 pl-3 pr-10 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-indigo-600 sm:text-sm sm:leading-6 bg-gray-50 focus:bg-white transition-colors">
                     <option ${customer.preferredService == 'Haircut & Styling' ? 'selected' : ''}>Haircut & Styling</option>
                     <option ${customer.preferredService == 'Hair Coloring' ? 'selected' : ''}>Hair Coloring</option>
                     <option ${customer.preferredService == 'Facial & Skincare' ? 'selected' : ''}>Facial & Skincare</option>
                     <option ${customer.preferredService == 'Massage Therapy' ? 'selected' : ''}>Massage Therapy</option>
                     <option ${customer.preferredService == 'Manicure & Pedicure' ? 'selected' : ''}>Manicure & Pedicure</option>
                 </select>
            </div>

            <div class="pt-4 flex items-center justify-between gap-x-6">
                <a href="customers?action=list" class="text-sm font-semibold leading-6 text-gray-600 hover:text-gray-900">Cancel</a>
                <button type="submit" class="rounded-md bg-indigo-600 px-6 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 transition-all duration-200">
                    Update Details
                </button>
            </div>
        </form>
    </div>
</body>
</html>
