package com.islington.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.islington.config.DatabaseConfig;
import com.islington.model.Event;

public class EventService {
    
    public List<Event> getAllEvents() throws ClassNotFoundException {
        List<Event> events = new ArrayList<>();
        String sql = "SELECT e.*, COUNT(a.ApplicationID) as assigned_volunteers " +
                     "FROM Event e " +
                     "LEFT JOIN Application a ON e.EventID = a.EventID AND a.ApplicationStatus = 'approved' " +
                     "GROUP BY e.EventID " +
                     "ORDER BY e.EventDate DESC";
        
        try (Connection conn = DatabaseConfig.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Event event = extractEventFromResultSet(rs);
//                event.setVolunteersAssigned(rs.getInt("assigned_volunteers"));
                events.add(event);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return events;
    }
    
    public Event getEventById(int eventId) throws ClassNotFoundException {
        Event event = null;
        String sql = "SELECT e.*, COUNT(a.ApplicationID) as assigned_volunteers " +
                     "FROM Event e " +
                     "LEFT JOIN Application a ON e.EventID = a.EventID AND a.ApplicationStatus = 'approved' " +
                     "WHERE e.EventID = ? " +
                     "GROUP BY e.EventID";
        
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, eventId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                event = extractEventFromResultSet(rs);
//                event.setVolunteersAssigned(rs.getInt("assigned_volunteers"));
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return event;
    }
    
    public boolean createEvent(Event event) throws ClassNotFoundException {
        String sql = "INSERT INTO Event (EventName, EventDate, Location, Description, VolunteersNeeded) " +
                     "VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setString(1, event.getEventName());
//            pstmt.setDate(2, event.getEventDate());
//            pstmt.setString(3, event.getLocation());
//            pstmt.setString(4, event.getDescription());
            pstmt.setInt(5, event.getVolunteersNeeded());
            
            int affectedRows = pstmt.executeUpdate();
            
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        event.setEventId(generatedKeys.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    public boolean updateEvent(Event event) throws ClassNotFoundException {
        String sql = "UPDATE Event SET EventName = ?, EventDate = ?, Location = ?, " +
                     "Description = ?, VolunteersNeeded = ? WHERE EventID = ?";
        
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, event.getEventName());
//            pstmt.setDate(2, event.getEventDate());
//            pstmt.setString(3, event.getLocation());
//            pstmt.setString(4, event.getDescription());
            pstmt.setInt(5, event.getVolunteersNeeded());
            pstmt.setInt(6, event.getEventId());
            
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    public boolean deleteEvent(int eventId) throws ClassNotFoundException {
        // First check if there are any approved applications for this event
        if (hasApprovedApplications(eventId)) {
            return false; // Cannot delete events with approved applications
        }
        
        // Then delete any pending applications
        deletePendingApplications(eventId);
        
        // Finally delete the event
        String sql = "DELETE FROM Event WHERE EventID = ?";
        
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, eventId);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    private boolean hasApprovedApplications(int eventId) throws ClassNotFoundException {
        String sql = "SELECT COUNT(*) FROM Application WHERE EventID = ? AND ApplicationStatus = 'approved'";
        
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, eventId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    private void deletePendingApplications(int eventId) throws ClassNotFoundException {
        String sql = "DELETE FROM Application WHERE EventID = ? AND ApplicationStatus = 'pending'";
        
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, eventId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    private Event extractEventFromResultSet(ResultSet rs) throws SQLException {
        Event event = new Event();
        event.setEventId(rs.getInt("EventID"));
        event.setEventName(rs.getString("EventName"));
//        event.setEventDate(rs.getDate("EventDate"));
//        event.setLocation(rs.getString("Location"));
//        event.setDescription(rs.getString("Description"));
        event.setVolunteersNeeded(rs.getInt("VolunteersNeeded"));
        return event;
    }
}