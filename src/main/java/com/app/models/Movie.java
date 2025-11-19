package com.app.models;

public class Movie {
    private int id;
    private String title;
    private String director;
    private String screenwriter;
    private String actors;
    private String studio;
    private String genre;
    private float rating;
    private String posterUrl;
    private String description;
    private String section;
    private int createdBy;  // <-- added createdBy field

    public Movie() {}

    // Updated constructor to include createdBy
    public Movie(int id, String title, String director, String screenwriter, String actors, 
                 String studio, String genre, float rating, String posterUrl, 
                 String description, String section, int createdBy) {
        this.id = id;
        this.title = title;
        this.director = director;
        this.screenwriter = screenwriter;
        this.actors = actors;
        this.studio = studio;
        this.genre = genre;
        this.rating = rating;
        this.posterUrl = posterUrl;
        this.description = description;
        this.section = section;
        this.createdBy = createdBy;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getDirector() { return director; }
    public void setDirector(String director) { this.director = director; }
    public String getScreenwriter() { return screenwriter; }
    public void setScreenwriter(String screenwriter) { this.screenwriter = screenwriter; }
    public String getActors() { return actors; }
    public void setActors(String actors) { this.actors = actors; }
    public String getStudio() { return studio; }
    public void setStudio(String studio) { this.studio = studio; }
    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }
    public float getRating() { return rating; }
    public void setRating(float rating) { this.rating = rating; }
    public String getPosterUrl() { return posterUrl; }
    public void setPosterUrl(String posterUrl) { this.posterUrl = posterUrl; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getSection() { return section; }
    public void setSection(String section) { this.section = section; }

    public int getCreatedBy() { return createdBy; }
    public void setCreatedBy(int createdBy) { this.createdBy = createdBy; }
}
