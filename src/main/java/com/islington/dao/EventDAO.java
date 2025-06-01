package com.islington.dao;

import com.islington.config.DatabaseConfig;
import com.islington.model.Event;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class EventDAO {
    
    public boolean saveEvent(Event event) {
        String sql = "INSERT INTO event (CreatedByUserID, DateCreated, EventName, EventDate, " +
                    "EventLocation, EventDescription, StartTime, EndTime, VolunteersNeeded, " +
                    "VolunteersApplied, VolunteersApproved, EventStatus, EventCategory) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, event.getCreatedByUserId());
            stmt.setTimestamp(2, Timestamp.valueOf(event.getDateCreated()));
            stmt.setString(3, event.getEventName());
            stmt.setDate(4, Date.valueOf(event.getEventDate()));
            stmt.setString(5, event.getEventLocation());
            stmt.setString(6, event.getEventDescription());
            
            // Handle optional time fields
            if (event.getStartTime() != null) {
                stmt.setTime(7, Time.valueOf(event.getStartTime()));
            } else {
                stmt.setNull(7, Types.TIME);
            }
            
            if (event.getEndTime() != null) {
                stmt.setTime(8, Time.valueOf(event.getEndTime()));
            } else {
                stmt.setNull(8, Types.TIME);
            }
            
            stmt.setInt(9, event.getVolunteersNeeded());
            stmt.setInt(10, event.getVolunteersApplied());
            stmt.setInt(11, event.getVolunteersApproved());
            stmt.setString(12, event.getEventStatus());
            stmt.setString(13, event.getEventCategory());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean updateEvent(Event event) {
        String sql = "UPDATE event SET EventName = ?, EventDate = ?, EventLocation = ?, " +
                "EventDescription = ?, VolunteersNeeded = ?, StartTime = ?, EndTime = ?, " +
                "EventCategory = ?, EventStatus = ?, LastModifiedByUserID = ?, LastModifiedDate = ? " +
                "WHERE EventID = ?";
        
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            // Set parameters in the correct order matching the SQL
            stmt.setString(1, event.getEventName());                    // EventName
            stmt.setDate(2, Date.valueOf(event.getEventDate()));        // EventDate
            stmt.setString(3, event.getEventLocation());               // EventLocation
            stmt.setString(4, event.getEventDescription());            // EventDescription
            stmt.setInt(5, event.getVolunteersNeeded());               // VolunteersNeeded
            
            // Handle optional time fields
            if (event.getStartTime() != null) {
                stmt.setTime(6, Time.valueOf(event.getStartTime()));   // StartTime
            } else {
                stmt.setNull(6, Types.TIME);
            }
            
            if (event.getEndTime() != null) {
                stmt.setTime(7, Time.valueOf(event.getEndTime()));     // EndTime
            } else {
                stmt.setNull(7, Types.TIME);
            }
            
            stmt.setString(8, event.getEventCategory());               // EventCategory
            stmt.setString(9, event.getEventStatus());                // EventStatus
            stmt.setInt(10, event.getLastModifiedByUserId());          // LastModifiedByUserID
            stmt.setTimestamp(11, Timestamp.valueOf(LocalDateTime.now())); // LastModifiedDate
            stmt.setInt(12, event.getEventId());                       // WHERE EventID = ?
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error updating event: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    public Event getEventById(int eventId) {
    	System.out.println("=== getEventById Debug ===");
        System.out.println("Looking for event ID: " + eventId);
        
        String sql = "SELECT * FROM event WHERE EventID = ?";
        System.out.println("SQL Query: " + sql);
        
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, eventId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                System.out.println("Event found! Building Event object...");
                
                Event event = new Event();
                
                // Debug each field as we retrieve it
                int id = rs.getInt("EventID");
                System.out.println("- event_id: " + id);
                event.setEventId(id);
                
                String name = rs.getString("EventName");
                System.out.println("- event_name: " + name);
                event.setEventName(name);
                
                // Check if event_date column exists and handle it
                try {
                    Date eventDate = rs.getDate("EventDate");
                    System.out.println("- event_date: " + eventDate);
                    if (eventDate != null) {
                        event.setEventDate(eventDate.toLocalDate());
                    }
                } catch (SQLException e) {
                    System.out.println("- event_date column issue: " + e.getMessage());
                }
                
                String location = rs.getString("EventLocation");
                System.out.println("- event_location: " + location);
                event.setEventLocation(location);
                
                String description = rs.getString("EventDescription");
                System.out.println("- event_description: " + (description != null ? description.substring(0, Math.min(50, description.length())) + "..." : "null"));
                event.setEventDescription(description);
                
                int volunteersNeeded = rs.getInt("VolunteersNeeded");
                System.out.println("- volunteers_needed: " + volunteersNeeded);
                event.setVolunteersNeeded(volunteersNeeded);
                
                // Optional fields with null checks
                try {
                    int volunteersApplied = rs.getInt("VolunteersApplied");
                    System.out.println("- volunteers_applied: " + volunteersApplied);
                    event.setVolunteersApplied(volunteersApplied);
                } catch (SQLException e) {
                    System.out.println("- volunteers_applied column not found or error: " + e.getMessage());
                    event.setVolunteersApplied(0);
                }
                
                try {
                    int volunteersApproved = rs.getInt("VolunteersApproved");
                    System.out.println("- volunteers_approved: " + volunteersApproved);
                    event.setVolunteersApproved(volunteersApproved);
                } catch (SQLException e) {
                    System.out.println("- volunteers_approved column not found or error: " + e.getMessage());
                    event.setVolunteersApproved(0);
                }
                
                // Handle optional time fields
                try {
                    Time startTime = rs.getTime("StartTime");
                    System.out.println("- start_time: " + startTime);
                    if (startTime != null) {
                        event.setStartTime(startTime.toLocalTime());
                    }
                } catch (SQLException e) {
                    System.out.println("- start_time column issue: " + e.getMessage());
                }
                
                try {
                    Time endTime = rs.getTime("EndTime");
                    System.out.println("- end_time: " + endTime);
                    if (endTime != null) {
                        event.setEndTime(endTime.toLocalTime());
                    }
                } catch (SQLException e) {
                    System.out.println("- end_time column issue: " + e.getMessage());
                }
                
                try {
                    String category = rs.getString("EventCategory");
                    System.out.println("- event_category: " + category);
                    event.setEventCategory(category);
                } catch (SQLException e) {
                    System.out.println("- event_category column issue: " + e.getMessage());
                }
                
                try {
                    String status = rs.getString("EventStatus");
                    System.out.println("- event_status: " + status);
                    event.setEventStatus(status);
                } catch (SQLException e) {
                    System.out.println("- event_status column issue: " + e.getMessage());
                }
                
                try {
                    int createdBy = rs.getInt("CreatedByUserID");
                    System.out.println("- created_by_user_id: " + createdBy);
                    event.setCreatedByUserId(createdBy);
                } catch (SQLException e) {
                    System.out.println("- created_by_user_id column issue: " + e.getMessage());
                }
                
                try {
                    int lastModifiedBy = rs.getInt("LastModifiedByUserID");
                    System.out.println("- last_modified_by_user_id: " + lastModifiedBy);
                    event.setLastModifiedByUserId(lastModifiedBy);
                } catch (SQLException e) {
                    System.out.println("- last_modified_by_user_id column issue: " + e.getMessage());
                }
                
                try {
                    Timestamp dateCreated = rs.getTimestamp("DateCreated");
                    System.out.println("- date_created: " + dateCreated);
                    if (dateCreated != null) {
                        event.setDateCreated(dateCreated.toLocalDateTime());
                    }
                } catch (SQLException e) {
                    System.out.println("- date_created column issue: " + e.getMessage());
                }
                
                System.out.println("Event object created successfully!");
                System.out.println("=== End getEventById Debug ===");
                return event;
            } else {
                System.out.println("No event found with ID: " + eventId);
                System.out.println("=== End getEventById Debug ===");
            }
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    public List<Event> getAllEvents() {
        List<Event> events = new ArrayList<>();
        String sql = "SELECT * FROM event ORDER BY EventDate DESC";
        
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                events.add(mapResultSetToEvent(rs));
            }
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return events;
    }
    
    public boolean deleteEvent(int eventId) {
        String sql = "DELETE FROM event WHERE EventID = ?";
        
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, eventId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    private Event mapResultSetToEvent(ResultSet rs) throws SQLException {
        Event event = new Event();
        
        event.setEventId(rs.getInt("EventID"));
        event.setCreatedByUserId(rs.getInt("CreatedByUserID"));
        
        Timestamp dateCreated = rs.getTimestamp("DateCreated");
        if (dateCreated != null) {
            event.setDateCreated(dateCreated.toLocalDateTime());
        }
        
        int lastModifiedByUserId = rs.getInt("LastModifiedByUserID");
        if (!rs.wasNull()) {
            event.setLastModifiedByUserId(lastModifiedByUserId);
        }
        
        Timestamp lastModifiedDate = rs.getTimestamp("LastModifiedDate");
        if (lastModifiedDate != null) {
            event.setLastModifiedDate(lastModifiedDate.toLocalDateTime());
        }
        
        event.setEventName(rs.getString("EventName"));
        
        Date eventDate = rs.getDate("EventDate");
        if (eventDate != null) {
            event.setEventDate(eventDate.toLocalDate());
        }
        
        event.setEventLocation(rs.getString("EventLocation"));
        event.setEventDescription(rs.getString("EventDescription"));
        
        Time startTime = rs.getTime("StartTime");
        if (startTime != null) {
            event.setStartTime(startTime.toLocalTime());
        }
        
        Time endTime = rs.getTime("EndTime");
        if (endTime != null) {
            event.setEndTime(endTime.toLocalTime());
        }
        
        event.setVolunteersNeeded(rs.getInt("VolunteersNeeded"));
        event.setVolunteersApplied(rs.getInt("VolunteersApplied"));
        event.setVolunteersApproved(rs.getInt("VolunteersApproved"));
        event.setEventStatus(rs.getString("EventStatus"));
        event.setEventCategory(rs.getString("EventCategory"));
        
        return event;
    }
    
    public boolean eventExists(int eventId) {
        String sql = "SELECT COUNT(*) FROM event WHERE EventID = ?";
        System.out.println("Checking if event exists with ID: " + eventId);
        
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, eventId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                int count = rs.getInt(1);
                System.out.println("Event count for ID " + eventId + ": " + count);
                return count > 0;
            }
            
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error checking if event exists: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    
}