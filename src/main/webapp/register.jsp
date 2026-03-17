<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Customer - Saloon Management</title>
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
            background-image: linear-gradient(to right, #a855f7, #ec4899);
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
            border-color: #a855f7;
            box-shadow: 0 0 0 2px rgba(168, 85, 247, 0.2);
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
            color: #d8b4fe;
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
    <div class="absolute top-[-20%] right-[-10%] w-[500px] h-[500px] bg-pink-900 rounded-full mix-blend-screen filter blur-[120px] opacity-20 z-0 pointer-events-none"></div>
    <div class="absolute bottom-[-10%] left-[-10%] w-[400px] h-[400px] bg-indigo-900 rounded-full mix-blend-screen filter blur-[100px] opacity-30 z-0 pointer-events-none"></div>

    <div class="relative z-10 w-full max-w-md glass-card rounded-2xl shadow-2xl p-8 animate-fade-in-up border-t-2 border-t-purple-500">
        
        <div class="text-center mb-8">
            <div class="mx-auto w-16 h-16 mb-4 rounded-full bg-gray-800 border border-purple-500/30 flex items-center justify-center shadow-lg shadow-purple-900/40">
                <svg class="w-8 h-8 text-purple-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                </svg>
            </div>
            <h2 class="text-3xl font-extrabold tracking-tight text-white">Client <span class="text-gradient">Intake</span></h2>
            <p class="mt-2 text-sm text-gray-400">Register a new profile in the directory.</p>
        </div>
        
        <form action="customers?action=insert" method="post" class="space-y-6">
            
            <div class="input-group">
                <input id="name" name="name" type="text" placeholder=" " required class="input-field block w-full rounded-lg py-3.5 px-4 sm:text-sm sm:leading-6 focus:outline-none">
                <label for="name" class="floating-label">Full Name</label>
            </div>

            <div class="input-group">
                <input id="email" name="email" type="email" placeholder=" " required class="input-field block w-full rounded-lg py-3.5 px-4 sm:text-sm sm:leading-6 focus:outline-none">
                <label for="email" class="floating-label">Email Address</label>
            </div>

            <div class="input-group">
                <input id="phone" name="phone" type="tel" placeholder=" " required class="input-field block w-full rounded-lg py-3.5 px-4 sm:text-sm sm:leading-6 focus:outline-none">
                <label for="phone" class="floating-label">Phone Number</label>
            </div>

            <div class="input-group">
                 <select id="preferredService" name="preferredService" class="input-field block w-full rounded-lg py-3.5 pl-4 pr-10 sm:text-sm sm:leading-6 focus:outline-none focus:text-white" required>
                     <option value="" disabled selected hidden></option>
                     <option>Haircut & Styling</option>
                     <option>Hair Coloring</option>
                     <option>Facial & Skincare</option>
                     <option>Massage Therapy</option>
                     <option>Manicure & Pedicure</option>
                 </select>
                 <label for="preferredService" class="floating-label" style="top:0; background:#1f2937; padding:0 0.25rem; font-size:0.75rem; color:#9ca3af; border-radius:4px;">Preferred Service</label>
            </div>

            <div class="pt-6 flex items-center justify-between gap-x-6 border-t border-gray-700/50 mt-8">
                <a href="index.jsp" class="text-sm font-semibold leading-6 text-gray-400 hover:text-white transition-colors">Cancel</a>
                <button type="submit" class="rounded-full bg-gradient-to-r from-purple-600 to-pink-600 px-6 py-3 text-sm font-semibold text-white shadow-lg hover:shadow-pink-500/40 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-purple-500 hover:scale-105 transition-all duration-300 w-full sm:w-auto flex items-center justify-center">
                    Register Client
                    <svg class="ml-2 -mr-1 w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
                </button>
            </div>
        </form>
    </div>
</body>
</html>
