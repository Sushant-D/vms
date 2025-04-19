<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
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
        <h2>Register</h2>
        
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
        
        <form action="${pageContext.request.contextPath}/loginRegister" method="post" id="registerForm" onsubmit="return validateForm()">
			
    		<input type="hidden" name="action" value="register">
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" required>
                <div id="firstNameError" class="validation-message"></div>
            </div>
            
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" required>
                <div id="lastNameError" class="validation-message"></div>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required onblur="validateEmail()">
                <div id="emailError" class="validation-message"></div>
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required onkeyup="validatePassword()">
                <div id="passwordError" class="validation-message"></div>
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required onkeyup="validateConfirmPassword()" disabled>
                <div id="confirmPasswordError" class="validation-message"></div>
            </div>
            
            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber">
                <div id="phoneNumberError" class="validation-message"></div>
            </div>
            
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address">
            </div>
            
            <div class="button-group">
                <button type="submit" name="action" value="register" class="btn register">Register</button>
            </div>
            
            <p class="login-text">Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a></p>
        </form>
    </div>
    
    <div class="footer">
        Copyright @2025
    </div>
    
    <script>
        // Enable/disable confirm password field based on password field
        document.getElementById('password').addEventListener('input', function() {
            var confirmPasswordField = document.getElementById('confirmPassword');
            if (this.value.length > 0) {
                confirmPasswordField.removeAttribute('disabled');
            } else {
                confirmPasswordField.setAttribute('disabled', 'disabled');
                confirmPasswordField.value = '';
                document.getElementById('confirmPasswordError').innerHTML = '';
            }
        });
        
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
                emailError.innerHTML = 'Valid email';
                emailError.className = 'validation-message valid';
                return true;
            }
        }
        
        // Password validation
        function validatePassword() {
            var password = document.getElementById('password').value;
            var passwordError = document.getElementById('passwordError');
            var confirmPasswordField = document.getElementById('confirmPassword');
            
            // Check if password has at least 8 characters
            var isLengthValid = password.length >= 8;
            // Check if password has at least one letter
            var hasLetter = /[A-Za-z]/.test(password);
            // Check if password has at least one number
            var hasNumber = /\d/.test(password);
            
            if (!password) {
                passwordError.innerHTML = 'Password is required';
                passwordError.className = 'validation-message invalid';
                return false;
            } else if (!isLengthValid || !hasLetter || !hasNumber) {
                passwordError.innerHTML = 'Password must be at least 8 characters with at least one letter and one number';
                passwordError.className = 'validation-message invalid';
                return false;
            } else {
                passwordError.innerHTML = 'Strong password';
                passwordError.className = 'validation-message valid';
                
                // Enable confirm password field
                confirmPasswordField.removeAttribute('disabled');
                
                // Validate confirm password if it has a value
                if (confirmPasswordField.value) {
                    validateConfirmPassword();
                }
                
                return true;
            }
        }
        
        // Confirm password validation
        function validateConfirmPassword() {
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;
            var confirmPasswordError = document.getElementById('confirmPasswordError');
            
            if (!confirmPassword) {
                confirmPasswordError.innerHTML = 'Please confirm your password';
                confirmPasswordError.className = 'validation-message invalid';
                return false;
            } else if (password !== confirmPassword) {
                confirmPasswordError.innerHTML = 'Passwords do not match';
                confirmPasswordError.className = 'validation-message invalid';
                return false;
            } else {
                confirmPasswordError.innerHTML = 'Passwords match';
                confirmPasswordError.className = 'validation-message valid';
                return true;
            }
        }
        
        // Phone number validation
        function validatePhoneNumber() {
            var phoneNumber = document.getElementById('phoneNumber').value;
            var phoneNumberError = document.getElementById('phoneNumberError');
            
            // Skip validation if phone number is empty (as it's optional)
            if (!phoneNumber) {
                phoneNumberError.innerHTML = '';
                return true;
            }
            
            // Simple validation for numeric input and reasonable length
            var phoneRegex = /^\d{10,15}$/;
            if (!phoneRegex.test(phoneNumber)) {
                phoneNumberError.innerHTML = 'Please enter a valid phone number (10-15 digits)';
                phoneNumberError.className = 'validation-message invalid';
                return false;
            } else {
                phoneNumberError.innerHTML = 'Valid phone number';
                phoneNumberError.className = 'validation-message valid';
                return true;
            }
        }
        
        // Form validation before submit
        function validateForm() {
            var isEmailValid = validateEmail();
            var isPasswordValid = validatePassword();
            var isConfirmPasswordValid = validateConfirmPassword();
            var isPhoneNumberValid = validatePhoneNumber();
            
            return isEmailValid && isPasswordValid && isConfirmPasswordValid && isPhoneNumberValid;
        }
    </script>
</body>
</html>