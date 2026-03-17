<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Client - Saloon Management</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            darkMode: 'class',
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Outfit', 'sans-serif'],
                    },
                    animation: {
                        'fade-in-up': 'fadeInUp 0.8s ease-out'
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
        .glass-card {
            background: rgba(31, 41, 55, 0.7);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.05);
        }
        .text-gradient {
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            background-image: linear-gradient(to right, #3b82f6, #8b5cf6);
        }

        /* Animated labels floating */
        .input-group { position: relative; }
        .input-field {
            background: rgba(17, 24, 39, 0.6);
            border: 1px solid rgba(75, 85, 99, 0.4);
            color: white;
            transition: all 0.3s ease;
        }
        .input-field:focus {
            background: rgba(17, 24, 39, 0.9);
            border-color: #8b5cf6;
            box-shadow: 0 0 0 2px rgba(139, 92, 246, 0.2);
        }
        .floating-label {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #9ca3af;
            transition: all 0.3s ease;
            pointer-events: none;
            font-size: 0.875rem;
        }
        .input-field:focus ~ .floating-label,
        .input-field:not(:placeholder-shown) ~ .floating-label {
            top: 0;
            background: #1f2937;
            padding: 0 0.25rem;
            font-size: 0.75rem;
            color: #a78bfa;
            border-radius: 4px;
        }
        
        select.input-field {
            appearance: none;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%239ca3af' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 0.5rem center;
            background-repeat: no-repeat;
            background-size: 1.5em 1.5em;
        }
        select.input-field option {
            background: #1f2937;
            color: white;
        }
    </style>
</head>
<body class="bg-gray-950 text-gray-200 antialiased py-12 px-4 sm:px-6 lg:px-8 min-h-screen flex items-center justify-center relative overflow-hidden">
    
    <!-- Background Accents -->
    <div class="absolute top-[-20%] right-[-10%] w-[500px] h-[500px] bg-blue-900 rounded-full mix-blend-screen filter blur-[120px] opacity-20 z-0 pointer-events-none"></div>
    <div class="absolute bottom-[-10%] left-[-10%] w-[400px] h-[400px] bg-indigo-900 rounded-full mix-blend-screen filter blur-[100px] opacity-30 z-0 pointer-events-none"></div>

    <div class="relative z-10 w-full max-w-md glass-card rounded-2xl shadow-2xl p-8 animate-fade-in-up border-t-2 border-t-blue-500">
        
        <div class="text-center mb-8">
            <div class="mx-auto w-16 h-16 mb-4 rounded-full bg-gray-800 border border-blue-500/30 flex items-center justify-center shadow-lg shadow-blue-900/40">
                <svg class="w-8 h-8 text-blue-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                </svg>
            </div>
            <h2 class="text-3xl font-extrabold tracking-tight text-white">Update <span class="text-gradient">Client</span></h2>
            <p class="mt-2 text-sm text-gray-400">Modifying profile for ${customer.name}</p>
        </div>
        
        <form action="customers?action=update" method="post" class="space-y-6">
            <input type="hidden" name="id" value="${customer.id}" />

            <div class="input-group">
                <input id="name" name="name" type="text" value="${customer.name}" placeholder=" " required class="input-field block w-full rounded-lg py-3.5 px-4 sm:text-sm sm:leading-6 focus:outline-none">
                <label for="name" class="floating-label">Full Name</label>
            </div>

            <div class="input-group">
                <input id="email" name="email" type="email" value="${customer.email}" placeholder=" " required class="input-field block w-full rounded-lg py-3.5 px-4 sm:text-sm sm:leading-6 focus:outline-none">
                <label for="email" class="floating-label">Email Address</label>
            </div>

            <div class="input-group">
                <input id="phone" name="phone" type="tel" value="${customer.phone}" placeholder=" " required class="input-field block w-full rounded-lg py-3.5 px-4 sm:text-sm sm:leading-6 focus:outline-none">
                <label for="phone" class="floating-label">Phone Number</label>
            </div>

            <div class="input-group">
                 <select id="preferredService" name="preferredService" class="input-field block w-full rounded-lg py-3.5 pl-4 pr-10 sm:text-sm sm:leading-6 focus:outline-none focus:text-white" required>
                     <option ${customer.preferredService == 'Haircut & Styling' ? 'selected' : ''}>Haircut & Styling</option>
                     <option ${customer.preferredService == 'Hair Coloring' ? 'selected' : ''}>Hair Coloring</option>
                     <option ${customer.preferredService == 'Facial & Skincare' ? 'selected' : ''}>Facial & Skincare</option>
                     <option ${customer.preferredService == 'Massage Therapy' ? 'selected' : ''}>Massage Therapy</option>
                     <option ${customer.preferredService == 'Manicure & Pedicure' ? 'selected' : ''}>Manicure & Pedicure</option>
                 </select>
                 <label for="preferredService" class="floating-label" style="top:0; background:#1f2937; padding:0 0.25rem; font-size:0.75rem; color:#9ca3af; border-radius:4px;">Preferred Service</label>
            </div>

            <div class="pt-6 flex items-center justify-between gap-x-6 border-t border-gray-700/50 mt-8">
                <a href="customers?action=list" class="text-sm font-semibold leading-6 text-gray-400 hover:text-white transition-colors">Cancel</a>
                <button type="submit" class="rounded-full bg-gradient-to-r from-blue-600 to-indigo-600 px-6 py-3 text-sm font-semibold text-white shadow-lg hover:shadow-indigo-500/40 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-500 hover:scale-105 transition-all duration-300 w-full sm:w-auto flex items-center justify-center">
                    Save Changes
                    <svg class="ml-2 -mr-1 w-4 h-4 text-indigo-200" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                </button>
            </div>
        </form>
    </div>
</body>
</html>
