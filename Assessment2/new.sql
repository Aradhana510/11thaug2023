-- Drop the database if it exists
DROP DATABASE IF EXISTS ExerciseDb;

-- Create the database
CREATE DATABASE ExerciseDb;

-- Switch to the new database
USE ExerciseDb;

-- Create the Publisher table
CREATE TABLE Publisher (
    PID INT PRIMARY KEY AUTO_INCREMENT,
    PublisherName VARCHAR(255) NOT NULL
);

-- Create the Category table
CREATE TABLE Category (
    CID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(255) NOT NULL
);

-- Create the Author table
CREATE TABLE Author (
    AID INT PRIMARY KEY AUTO_INCREMENT,
    AuthorName VARCHAR(255) NOT NULL
);

-- Create the Book table
CREATE TABLE Book (
    BID INT PRIMARY KEY AUTO_INCREMENT,
    BName VARCHAR(255) NOT NULL,
    BPrice DECIMAL(10, 2) NOT NULL,
    AuthorID INT,
    PublisherID INT,
    CategoryID INT,
    FOREIGN KEY (AuthorID) REFERENCES Author(AID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CID)
);

-- Insert records into Category table
INSERT INTO Category (CategoryName) VALUES
    ('Fiction'),
    ('Non-Fiction'),
    ('Mystery');

-- Insert records into Author table
INSERT INTO Author (AuthorName) VALUES
    ('J.K. Rowling'),
    ('Stephen King'),
    ('Jane Austen');

-- Insert records into Book table
INSERT INTO Book (BName, BPrice, AuthorID, PublisherID, CategoryID) VALUES
    ('Harry Potter and the Sorcerer''s Stone', 19.99, 1, 1, 1),
    ('The Shining', 15.99, 2, 2, 2),
    ('Pride and Prejudice', 12.99, 3, 3, 1),
    ('Harry Potter and the Chamber of Secrets', 21.99, 1, 1, 1),
    ('It', 18.99, 2, 2, 2),
    ('Sense and Sensibility', 14.99, 3, 3, 1);

-- Retrieve book details with Author, Publisher, and Category
SELECT
    Book.BID,
    Book.BName,
    Book.BPrice,
    Author.AuthorName,
    Publisher.PublisherName,
    Category.CategoryName
FROM
    Book
JOIN Author ON Book.AuthorID = Author.AID
JOIN Publisher ON Book.PublisherID = Publisher.PID
JOIN Category ON Book.CategoryID = Category.CID;
