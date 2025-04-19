package com.islington.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.regex.Pattern;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import com.islington.config.DatabaseConfig;
import com.islington.model.User;

public class UserService {

    private static final String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
    private static final Pattern EMAIL_PATTERN = Pattern.compile(EMAIL_REGEX);

    private static final String PASSWORD_REGEX = "^(?=.*[A-Za-z])(?=.*\\d).{8,}$";
    private static final Pattern PASSWORD_PATTERN = Pattern.compile(PASSWORD_REGEX);

    private static final String SECRET_KEY = "1234567890123456"; // 16-char key for AES-128

    public boolean registerUser(User user) throws SQLException, ClassNotFoundException {
        if (!isValidPassword(user.getPassword())) {
            throw new IllegalArgumentException("Password must be at least 8 characters with at least one letter and one number.");
        }

        if (!isValidEmail(user.getEmail())) {
            throw new IllegalArgumentException("Invalid email format.");
        }

        // Encrypt and encode password
        String encryptedPassword = encryptPassword(user.getPassword());
        user.setPassword(encryptedPassword);

        String query = "INSERT INTO User (FirstName, LastName, Email, Password, PhoneNumber, Address, DateJoined, UserRole) " +
                       "VALUES (?, ?, ?, ?, ?, ?, CURDATE(), ?)";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPassword());  // Now encrypted and Base64-encoded
            stmt.setString(5, user.getPhoneNumber());
            stmt.setString(6, user.getAddress());
            stmt.setString(7, user.getUserRole());

            return stmt.executeUpdate() > 0;
        }
    }

    public boolean isEmailRegistered(String email) throws SQLException, ClassNotFoundException {
        String query = "SELECT COUNT(*) FROM User WHERE Email = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            return rs.next() && rs.getInt(1) > 0;
        }
    }

    public User loginUser(String email, String password) throws SQLException, ClassNotFoundException {
        String query = "SELECT * FROM User WHERE Email = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("Password");
                String inputEncryptedPassword = encryptPassword(password);

                if (storedPassword != null && storedPassword.equals(inputEncryptedPassword)) {
                    User user = new User();
                    user.setUserId(rs.getInt("UserID"));
                    user.setFirstName(rs.getString("FirstName"));
                    user.setLastName(rs.getString("LastName"));
                    user.setEmail(rs.getString("Email"));
                    user.setPhoneNumber(rs.getString("PhoneNumber"));
                    user.setAddress(rs.getString("Address"));
                    user.setDateJoined(rs.getDate("DateJoined"));
                    user.setUserRole(rs.getString("UserRole"));
                    user.setProfileImage(rs.getString("ProfileImage"));
                    return user;
                }
            }
        }
        return null;
    }

    public boolean isValidEmail(String email) {
        return email != null && EMAIL_PATTERN.matcher(email).matches();
    }

    public boolean isValidPassword(String password) {
        return password != null && PASSWORD_PATTERN.matcher(password).matches();
    }

    private String encryptPassword(String plainText) {
        try {
            SecretKeySpec key = new SecretKeySpec(SECRET_KEY.getBytes("UTF-8"), "AES");
            Cipher cipher = Cipher.getInstance("AES");
            cipher.init(Cipher.ENCRYPT_MODE, key);
            byte[] encryptedBytes = cipher.doFinal(plainText.getBytes("UTF-8"));
            return Base64.getEncoder().encodeToString(encryptedBytes); // Safe to store in DB
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error encrypting password");
        }
    }
}
