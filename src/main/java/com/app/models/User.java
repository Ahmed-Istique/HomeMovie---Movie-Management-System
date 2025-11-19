package com.app.models;

import java.util.Objects;

public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private boolean isAdmin;
    private String photoUrl;
    private String about;
    private String country;

    public User() {}

    public User(int id, String name, String email, String password, boolean isAdmin,
                String photoUrl, String about, String country) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.isAdmin = isAdmin;
        this.photoUrl = photoUrl;
        this.about = about;
        this.country = country;
    }

    // Optional simpler constructor useful for hardcoded admin creation
    public User(String email, String password, boolean isAdmin) {
        this.email = email;
        this.password = password;
        this.isAdmin = isAdmin;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public boolean isAdmin() { return isAdmin; }
    public void setAdmin(boolean isAdmin) { this.isAdmin = isAdmin; }
    public String getPhotoUrl() { return photoUrl; }
    public void setPhotoUrl(String photoUrl) { this.photoUrl = photoUrl; }
    public String getAbout() { return about; }
    public void setAbout(String about) { this.about = about; }
    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }

    // toString without password
    @Override
    public String toString() {
        return "User{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", email='" + email + '\'' +
            ", isAdmin=" + isAdmin +
            ", photoUrl='" + photoUrl + '\'' +
            ", about='" + about + '\'' +
            ", country='" + country + '\'' +
            '}';
    }

    // equals based on id and email (both unique identifiers)
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;
        User user = (User) o;
        return id == user.id &&
               Objects.equals(email, user.email);
    }

    // hashCode consistent with equals
    @Override
    public int hashCode() {
        return Objects.hash(id, email);
    }
}