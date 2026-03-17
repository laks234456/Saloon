<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer List - Saloon Management</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Outfit', 'sans-serif'],
                    },
                    animation: {
                        'fade-in-up': 'fadeInUp 0.8s ease-out forwards'
                    },
                    keyframes: {
                        fadeInUp: {
                            '0%': { opacity: '0', transform: 'translateY(20px)' },
                            '100%': { opacity: '1', transform: 'translateY(0)' }
                        }
                    }
                }
            }
        }
    </script>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Outfit', sans-serif; }
        .glass-header {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.5);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.05);
        }
        .text-gradient {
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            background-image: linear-gradient(to right, #8b5cf6, #ec4899);
        }
    </style>
</head>
<body class="bg-slate-50 text-gray-900 antialiased min-h-screen relative overflow-x-hidden">

    <!-- Background Accents -->
    <div class="fixed top-[-10%] left-[-10%] w-96 h-96 bg-purple-200 rounded-full mix-blend-multiply filter blur-[100px] opacity-60 z-0 pointer-events-none"></div>
    <div class="fixed bottom-[-10%] right-[-10%] w-96 h-96 bg-pink-200 rounded-full mix-blend-multiply filter blur-[100px] opacity-60 z-0 pointer-events-none"></div>

    <!-- Navigation Header -->
    <header class="sticky top-0 z-50 glass-header px-6 py-4 shadow-sm">
        <div class="max-w-7xl mx-auto flex items-center justify-between">
            <div class="flex items-center gap-3">
                <div class="w-10 h-10 rounded-full bg-gradient-to-tr from-purple-500 to-pink-500 flex items-center justify-center shadow-lg">
                    <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 10l-2 1m0 0l-2-1m2 1v2.5M20 7l-2 1m2-1l-2-1m2 1v2.5M14 4l-2-1-2 1M4 7l2-1M4 7l2 1M4 7v2.5M12 21l-2-1m2 1l2-1m-2 1v-2.5M6 18l-2-1v-2.5M18 18l2-1v-2.5"></path>
                    </svg>
                </div>
                <h1 class="text-2xl font-bold tracking-tight text-gray-900 hidden sm:block">Luxe <span class="text-gradient">Saloon</span></h1>
            </div>
            <div class="flex items-center gap-4">
                <a href="index.jsp" class="text-sm font-medium text-gray-500 hover:text-gray-900 transition-colors">Home</a>
                <a href="customers?action=new" class="rounded-full bg-gradient-to-r from-purple-600 to-pink-500 px-5 py-2 text-sm font-semibold text-white shadow-lg hover:shadow-pink-500/30 hover:scale-105 transition-all duration-300">New Customer</a>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10 opacity-0 animate-fade-in-up">
        
        <div class="sm:flex sm:items-center sm:justify-between mb-8">
            <div>
                <h2 class="text-4xl font-extrabold tracking-tight text-gray-900 mb-2">Customer <span class="text-gradient">Directory</span></h2>
                <p class="text-md text-gray-500 max-w-2xl">Manage your VIP clientele, view assigned services, and track customer information seamlessly.</p>
            </div>
            <div class="mt-6 sm:mt-0 flex gap-4">
                <form action="customers" method="get" class="flex w-full sm:w-auto gap-2 items-center">
                    <input type="hidden" name="action" value="list">
                    <div class="relative w-full sm:w-72">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                        </div>
                        <input type="text" name="search" value="${searchQuery}" placeholder="Search client..." class="block w-full rounded-full border-0 py-2.5 pl-10 pr-3 text-gray-900 bg-white shadow-sm ring-1 ring-inset ring-gray-200 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-purple-500 sm:text-sm sm:leading-6 transition-all">
                    </div>
                    <button type="submit" class="rounded-full bg-white px-4 py-2.5 text-sm font-semibold text-gray-700 shadow-sm ring-1 ring-inset ring-gray-200 hover:bg-gray-50 transition duration-200">Search</button>
                    <c:if test="${not empty searchQuery}">
                        <a href="customers?action=list" class="rounded-full bg-red-50 text-red-600 px-4 py-2.5 text-sm font-semibold shadow-sm ring-1 ring-inset ring-red-200 hover:bg-red-100 transition duration-200">Clear</a>
                    </c:if>
                </form>
            </div>
        </div>
        
        <div class="mt-8 flex flex-col">
            <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                    <div class="overflow-hidden glass-card rounded-2xl">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50/50">
                                <tr>
                                    <th scope="col" class="py-4 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wider text-gray-500 sm:pl-6">ID</th>
                                    <th scope="col" class="px-3 py-4 text-left text-xs font-semibold uppercase tracking-wider text-gray-500">Client Name</th>
                                    <th scope="col" class="px-3 py-4 text-left text-xs font-semibold uppercase tracking-wider text-gray-500">Contact Email</th>
                                    <th scope="col" class="px-3 py-4 text-left text-xs font-semibold uppercase tracking-wider text-gray-500">Phone No</th>
                                    <th scope="col" class="px-3 py-4 text-left text-xs font-semibold uppercase tracking-wider text-gray-500">Scheduled Service</th>
                                    <th scope="col" class="relative py-4 pl-3 pr-4 sm:pr-6"><span class="sr-only">Actions</span></th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-200/50 text-gray-700">
                                <c:forEach var="customer" items="${listCustomer}">
                                    <tr class="hover:bg-white/50 transition-colors duration-200 group">
                                        <td class="whitespace-nowrap py-5 pl-4 pr-3 text-sm font-medium text-gray-500 sm:pl-6 font-mono text-xs"><c:out value="${customer.id}" /></td>
                                        <td class="whitespace-nowrap px-3 py-5 text-sm font-bold text-gray-900"><c:out value="${customer.name}" /></td>
                                        <td class="whitespace-nowrap px-3 py-5 text-sm"><c:out value="${customer.email}" /></td>
                                        <td class="whitespace-nowrap px-3 py-5 text-sm font-mono"><c:out value="${customer.phone}" /></td>
                                        <td class="whitespace-nowrap px-3 py-5 text-sm">
                                            <span class="inline-flex items-center rounded-full bg-purple-50 px-3 py-1 text-xs font-medium text-purple-700 ring-1 ring-inset ring-purple-600/20 shadow-sm">
                                                <svg class="mr-1.5 h-2 w-2 text-purple-600" fill="currentColor" viewBox="0 0 8 8"><circle cx="4" cy="4" r="3" /></svg>
                                                <c:out value="${customer.preferredService}" />
                                            </span>
                                        </td>
                                        <td class="relative whitespace-nowrap py-5 pl-3 pr-4 text-right text-sm font-medium sm:pr-6 opacity-0 group-hover:opacity-100 transition-opacity duration-200">
                                            <a href="customers?action=edit&id=<c:out value='${customer.id}' />" class="text-indigo-600 hover:text-indigo-800 mr-4 tracking-wide font-semibold">Edit</a>
                                            <a href="customers?action=delete&id=<c:out value='${customer.id}' />" class="text-pink-600 hover:text-pink-800 tracking-wide font-semibold" onclick="return confirm('Remove this client from the directory?');">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty listCustomer}">
                                    <tr>
                                        <td colspan="6" class="py-10 text-center text-gray-500 text-sm">
                                            No clients found.
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
