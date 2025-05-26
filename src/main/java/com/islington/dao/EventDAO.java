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
        String sql = "UPDATE event SET LastModifiedByUserID = ?, LastModifiedDate = ?, " +
                    "EventName = ?, EventDate = ?, EventLocation = ?, EventDescription = ?, " +
                    "StartTime = ?, EndTime = ?, VolunteersNeeded = ?, EventStatus = ?, " +
                    "EventCategory = ? WHERE EventID = ?";
        
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, event.getLastModifiedByUserId());
            stmt.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
            stmt.setString(3, event.getEventName());
            stmt.setDate(4, Date.valueOf(event.getEventDate()));
            stmt.setString(5, event.getEventLocation());
            stmt.setString(6, event.getEventDescription());
            
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
            stmt.setString(10, event.getEventStatus());
            stmt.setString(11, event.getEventCategory());
            stmt.setInt(12, event.getEventId());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public Event getEventById(int eventId) {
        String sql = "SELECT * FROM events WHERE EventID = ?";
        
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, eventId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return mapResultSetToEvent(rs);
            }
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    public List<Event> getAllEvents() {
        List<Event> events = new ArrayList<>();
        String sql = "SELECT * FROM events ORDER BY EventDate DESC";
        
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
        String sql = "DELETE FROM events WHERE EventID = ?";
        
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
}