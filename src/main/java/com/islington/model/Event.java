package com.islington.model;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.LocalDateTime;

public class Event {
    private int eventId;
    private int createdByUserId;
    private LocalDateTime dateCreated;
    private Integer lastModifiedByUserId;
    private LocalDateTime lastModifiedDate;
    private String eventName;
    private LocalDate eventDate;
    private String eventLocation;
    private String eventDescription;
    private LocalTime startTime;
    private LocalTime endTime;
    private int volunteersNeeded;
    private int volunteersApplied;
    private int volunteersApproved;
    private String eventStatus;
    private String eventCategory;
    
    // Default constructor
    public Event() {
        this.volunteersApplied = 0;
        this.volunteersApproved = 0;
        this.eventStatus = "upcoming";
        this.dateCreated = LocalDateTime.now();
    }
    
    // Constructor with essential fields
    public Event(String eventName, LocalDate eventDate, String eventLocation, 
                String eventDescription, int volunteersNeeded, int createdByUserId) {
        this();
        this.eventName = eventName;
        this.eventDate = eventDate;
        this.eventLocation = eventLocation;
        this.eventDescription = eventDescription;
        this.volunteersNeeded = volunteersNeeded;
        this.createdByUserId = createdByUserId;
    }
    
    // Getters and Setters
    public int getEventId() {
        return eventId;
    }
    
    public void setEventId(int eventId) {
        this.eventId = eventId;
    }
    
    public int getCreatedByUserId() {
        return createdByUserId;
    }
    
    public void setCreatedByUserId(int createdByUserId) {
        this.createdByUserId = createdByUserId;
    }
    
    public LocalDateTime getDateCreated() {
        return dateCreated;
    }
    
    public void setDateCreated(LocalDateTime dateCreated) {
        this.dateCreated = dateCreated;
    }
    
    public Integer getLastModifiedByUserId() {
        return lastModifiedByUserId;
    }
    
    public void setLastModifiedByUserId(Integer lastModifiedByUserId) {
        this.lastModifiedByUserId = lastModifiedByUserId;
    }
    
    public LocalDateTime getLastModifiedDate() {
        return lastModifiedDate;
    }
    
    public void setLastModifiedDate(LocalDateTime lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }
    
    public String getEventName() {
        return eventName;
    }
    
    public void setEventName(String eventName) {
        this.eventName = eventName;
    }
    
    public LocalDate getEventDate() {
        return eventDate;
    }
    
    public void setEventDate(LocalDate eventDate) {
        this.eventDate = eventDate;
    }
    
    public String getEventLocation() {
        return eventLocation;
    }
    
    public void setEventLocation(String eventLocation) {
        this.eventLocation = eventLocation;
    }
    
    public String getEventDescription() {
        return eventDescription;
    }
    
    public void setEventDescription(String eventDescription) {
        this.eventDescription = eventDescription;
    }
    
    public LocalTime getStartTime() {
        return startTime;
    }
    
    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }
    
    public LocalTime getEndTime() {
        return endTime;
    }
    
    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }
    
    public int getVolunteersNeeded() {
        return volunteersNeeded;
    }
    
    public void setVolunteersNeeded(int volunteersNeeded) {
        this.volunteersNeeded = volunteersNeeded;
    }
    
    public int getVolunteersApplied() {
        return volunteersApplied;
    }
    
    public void setVolunteersApplied(int volunteersApplied) {
        this.volunteersApplied = volunteersApplied;
    }
    
    public int getVolunteersApproved() {
        return volunteersApproved;
    }
    
    public void setVolunteersApproved(int volunteersApproved) {
        this.volunteersApproved = volunteersApproved;
    }
    
    public String getEventStatus() {
        return eventStatus;
    }
    
    public void setEventStatus(String eventStatus) {
        this.eventStatus = eventStatus;
    }
    
    public String getEventCategory() {
        return eventCategory;
    }
    
    public void setEventCategory(String eventCategory) {
        this.eventCategory = eventCategory;
    }
}