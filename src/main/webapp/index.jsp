<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saloon Management System</title>
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
                        'blob': 'blob 7s infinite',
                        'fade-in-up': 'fadeInUp 1s ease-out'
                    },
                    keyframes: {
                        blob: {
                            '0%': { transform: 'translate(0px, 0px) scale(1)' },
                            '33%': { transform: 'translate(30px, -50px) scale(1.1)' },
                            '66%': { transform: 'translate(-20px, 20px) scale(0.9)' },
                            '100%': { transform: 'translate(0px, 0px) scale(1)' }
                        },
                        fadeInUp: {
                            '0%': { opacity: '0', transform: 'translateY(20px)' },
                            '100%': { opacity: '1', transform: 'translateY(0)' }
                        }
                    }
                }
            }
        }
    </script>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Outfit', sans-serif; }
        .glass-panel {
            background: rgba(17, 24, 39, 0.7);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .text-gradient {
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            background-image: linear-gradient(to right, #a855f7, #ec4899);
        }
    </style>
</head>
<body class="bg-gray-950 flex items-center justify-center min-h-screen relative overflow-hidden text-white font-sans">
    
    <!-- Animated Background Blobs -->
    <div class="absolute top-0 -left-4 w-72 h-72 bg-purple-600 rounded-full mix-blend-multiply filter blur-2xl opacity-30 animate-blob"></div>
    <div class="absolute top-0 -right-4 w-72 h-72 bg-pink-600 rounded-full mix-blend-multiply filter blur-2xl opacity-30 animate-blob animation-delay-2000"></div>
    <div class="absolute -bottom-8 left-20 w-72 h-72 bg-indigo-600 rounded-full mix-blend-multiply filter blur-2xl opacity-30 animate-blob animation-delay-4000"></div>

    <!-- Main Content -->
    <div class="relative z-10 max-w-2xl w-full text-center p-12 rounded-3xl shadow-2xl glass-panel animate-fade-in-up">
        
        <!-- Icon / Logo Area -->
        <div class="mx-auto w-20 h-20 mb-8 rounded-full bg-gradient-to-tr from-purple-500 to-pink-500 flex items-center justify-center shadow-lg shadow-pink-500/30 transform hover:scale-110 transition duration-300">
            <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 10l-2 1m0 0l-2-1m2 1v2.5M20 7l-2 1m2-1l-2-1m2 1v2.5M14 4l-2-1-2 1M4 7l2-1M4 7l2 1M4 7v2.5M12 21l-2-1m2 1l2-1m-2 1v-2.5M6 18l-2-1v-2.5M18 18l2-1v-2.5"></path>
            </svg>
        </div>

        <h1 class="text-6xl font-extrabold tracking-tight mb-6 text-white">
            Luxe <span class="text-gradient">Saloon</span>
        </h1>
        
        <p class="text-xl text-gray-300 mb-10 leading-relaxed font-light px-4">
            Manage your customers effortlessly. A complete offline saloon booking and customer management solution tailored for your premium styling needs.
        </p>
        
        <div class="flex flex-col sm:flex-row gap-6 justify-center">
            <a href="customers?action=new" class="group relative inline-flex justify-center items-center rounded-full bg-gradient-to-r from-purple-600 to-pink-600 px-8 py-4 text-md font-semibold text-white shadow-lg lg:hover:shadow-pink-500/50 hover:scale-105 transition-all duration-300">
                Register New Customer
                <svg class="ml-2 w-5 h-5 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6"></path></svg>
            </a>
            <a href="customers?action=list" class="inline-flex items-center justify-center rounded-full bg-gray-800/80 px-8 py-4 text-md font-semibold text-gray-200 shadow-sm border border-gray-700 hover:bg-gray-700 hover:text-white transition-all duration-300 hover:scale-105">
                View Customers
            </a>
        </div>
    </div>
</body>
</html>
