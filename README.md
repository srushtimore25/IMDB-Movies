# IMDB-Movies
Contains SQL queries for IMDB movie data analysis using a structured movie and director database.
# PRSQ-02 – IMDB Movies

This repository contains a set of SQL problem-solving queries for analyzing the **IMDB Movie Database** using structured data involving movies and directors.

## 🧾 Problem Statements Covered

- a) Get all data about movies  
- b) Get all data about directors  
- c) Count total number of movies  
- d) Find directors: James Cameron, Luc Besson, John Woo  
- e) List all directors whose names start with 'S'  
- f) Count of female directors  
- g) 10th alphabetically sorted woman director  
- h) Top 3 most popular movies  
- i) Top 3 most bankable movies (by revenue)  
- j) Highest average voted movie since Jan 1, 2000  
- k) Movies directed by Brenda Chapman  
- l) Director who made the most movies  
- m) Most bankable director (by revenue)

---

## 🔗 SQL Connection Info

- **Host:** `<YOUR_HOST_HERE>`
- **Username:** `<YOUR_USERNAME_HERE>`
- **Password:** `<YOUR_PASSWORD_HERE>`
- **Database Name:** `<YOUR_DATABASE_NAME_HERE>`
  



---

## 📊 Schema Details

### **Table: directors**
- `id` – Director's ID (Primary Key)  
- `name` – Director's name  
- `gender` – 0/2 = Male, 1 = Female  
- `department` – Department  

### **Table: movies**
- `uid` – Movie UID  
- `original_title`, `title` – Movie names  
- `budget`, `revenue` – Financial data  
- `popularity`, `vote_average`, `vote_count`  
- `release_date`, `overview`, `tagline`  
- `director_id` – To be joined with `directors.id`

**Note**: Replace the `id` in movies with `uid` and use `director_id` → `id` to join with directors.

---

