<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <style>
        .error-message {
            color: red;
            margin-bottom: 10px;
        }
        .success-message {
            color: green;
            margin-bottom: 10px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group .error {
            border: 1px solid red;
        }
        .validation-message {
            font-size: 12px;
            margin-top: 5px;
        }
        .invalid {
            color: red;
        }
        .valid {
            color: green;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        
        <% if(request.getAttribute("errorMessage") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>
        
        <% if(request.getAttribute("successMessage") != null) { %>
            <div class="success-message">
                <%= request.getAttribute("successMessage") %>
            </div>
        <% } %>
        
        <form action="loginRegister" method="post" id="loginForm" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required onblur="validateEmail()">
                <div id="emailError" class="validation-message"></div>
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                <div id="passwordError" class="validation-message"></div>
            </div>
            
            <div class="button-group">
                <button type="submit" name="action" value="login" class="btn login">Login</button>
            </div>
            
            <p class="register-text">Don't have an account? <a href="${pageContext.request.contextPath}/register">Register here</a></p>
        </form>
    </div>
    
    <div class="footer">
        Copyright @2025
    </div>
    
    <script>
        // Email validation
        function validateEmail() {
            var email = document.getElementById('email').value;
            var emailError = document.getElementById('emailError');
            var emailRegex = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$/;
            
            if (!email) {
                emailError.innerHTML = 'Email is required';
                emailError.className = 'validation-message invalid';
                return false;
            } else if (!emailRegex.test(email)) {
                emailError.innerHTML = 'Please enter a valid email address';
                emailError.className = 'validation-message invalid';
                return false;
            } else {
                emailError.innerHTML = '';
                return true;
            }
        }
        
        // Form validation before submit
        function validateForm() {
            var email = document.getElementById('email').value;
            var password = document.getElementById('password').value;
            var emailError = document.getElementById('emailError');
            var passwordError = document.getElementById('passwordError');
            var isValid = true;
            
            // Validate email
            if (!validateEmail()) {
                isValid = false;
            }
            
            // Validate password (simple check if it's empty)
            if (!password) {
                passwordError.innerHTML = 'Password is required';
                passwordError.className = 'validation-message invalid';
                isValid = false;
            } else {
                passwordError.innerHTML = '';
            }
            
            return isValid;
        }
    </script>
</body>
</html>