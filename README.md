# Foundation-of-Computer-Science
## Encoding and Decoding
###Secure Encoding & Decoding App (Docker + Python)
- A simple Python project that demonstrates data encoding and decoding techniques used in modern web communication.
The application supports Base64 encoding, URL encoding, and Base64 decoding and runs inside a Docker container.
This project helps beginners understand how encoding is used in web protocols, APIs, and data transmission.
### Technologies Used
- Python3
- Docker
- Base64 Encoding
- Base64 Decoding
- URL Encdoing
- Command Line Interface
## How thw Program Work
1. Encode Text
2. Decode Base64
3. Exit Program
When text is entered, it converts the text into:
Base64 encoded format
URL encoded format
These formats are commonly used in:
Web authentication
API communication
Email transmission
Data transfer across HTTP/HTTPS
## Code for encoding and decoding
```

import base64
import urllib.parse

def encode_text(text):
    """Encode text to Base64 and URL format"""
    base64_encoded = base64.b64encode(text.encode()).decode()
    url_encoded = urllib.parse.quote(text)
    return base64_encoded, url_encoded

def decode_text(base64_text):
    """Decode Base64 text"""
    try:
        decoded = base64.b64decode(base64_text).decode()
        return decoded
    except Exception as e:
        return f"Error decoding: {e}"

def main():
    while True:
        print("\n=== Simple Encoding & Decoding ===")
        print("1. Encode Text")
        print("2. Decode Base64")
        print("3. Exit")
        choice = input("Enter your choice (1/2/3): ")

        if choice == "1":
            text = input("Enter text to encode: ")
            base64_encoded, url_encoded = encode_text(text)
            print(f"Base64 Encoded: {base64_encoded}")
            print(f"URL Encoded: {url_encoded}")
        elif choice == "2":
            base64_text = input("Enter Base64 text to decode: ")
            decoded = decode_text(base64_text)
            print(f"Decoded Text: {decoded}")
        elif choice == "3":
            print("Exiting... Goodbye!")
            break
        else:
            print("Invalid choice. Please enter 1, 2, or 3.")

if __name__ == "__main__":
    main()
```
### Output
```
=== Simple Encoding & Decoding ===
1. Encode Text
2. Decode Base64
3. Exit
Enter your choice (1/2/3): 1
Enter text to encode: Ritisha
Base64 Encoded: Uml0aXNoYQ==
URL Encoded: Ritisha

1. Encode Text
2. Decode Base64
3. Exit
Enter your choice (1/2/3): 2
Enter Base64 text to decode: Uml0aXNoYQ==
Decoded Text: Ritisha
```

## Database and Normalization
A comprehensive laboratory demonstration of database normalization (1NF, 2NF, 3NF) and fee-based access control implementation using MySQL in Docker containers. This project simulates a real-world school management system where student in school club data are stored.
## Overview
This project demonstrates:
1. Databse Normalization
2. Real-world Application
3. Docker Deployment
## Learning Objectives
Identify unnormalized data and anomalies
Apply First, Second, and Third Normal Forms
Implement normalized schemas using SQL
Simulate real-world database behavior
Understand normalization as a security mechanism
## Database Schema
### Unnormalized Form
```
student_club (StudentID, StudentName, Email, ClubName, ClubRoom, ClubMentor, JoinDate)
```
### First Normal Form (1NF)
- StudentID (Primary Key)
- ClubName (Primary key)
### Second Normal form (2NF)
- Student (StudentID, StudentName, Email)
- Club ( ClubName, ClubRoom, ClubMentor)
- Membership( StudentID, ClubName, JoinDate)
### Third Normal Form(3NF)
- Student (StudentID, StudentName, Email)
- Club ( ClubName, ClubRoom, ClubMentor)
- Membership( StudentID, ClubName, JoinDate)
## Usage Instructions
### Running Individual SQL Scripts
Step 1: Create Unnormalized Table
```

CREATE TABLE student_club(
    -> StudentID INT,
    -> StudentName VARCHAR(50),
    -> Email VARCHAR(50),
    -> ClubName VARCHAR(50),
    -> ClubRoom VARCHAR(50),
    -> ClubMentor VARCHAR(50),
    -> JoinDate DATE
    -> ;

describe student_club;

INSERT INTO student_club
    -> (StudentID, StudentName, Email, ClubName, ClubRoom, ClubMentor, JoinDate)
    -> VALUES
    -> (1, 'Asha', 'asha@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-10'),
    -> (2, 'Bikash', 'bikash@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-12'),
    -> (1, 'Asha', 'asha@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-15'),
    -> (3, 'Nisha', 'nisha@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-20'),
    -> (4, 'Rohan', 'rohan@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '2024-01-18'),
    -> (5, 'Suman', 'suman@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-22'),
    -> (2, 'Bikash', 'bikash@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '2024-01-25'),
    -> (6, 'Pooja', 'pooja@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-27'),
    -> (3, 'Nisha', 'nisha@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '2024-01-28'),
    -> (7, 'Aman', 'aman@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '2024-01-30');
```
Step 2: Apply Normalization
#### For 1NF
```
 ALTER TABLE student_club 
	->ADD PRIMARY KEY (StudentID, ClubName);
```
#### For 2NF and 3NF
-Creating table first
```
CREATE TABLE Student(
    -> StudentID INT PRIMARY KEY,
    -> StudentName VARCHAR(50),
    -> Email VARCHAR(50)
    -> );

CREATE TABLE Club (
    ->     ClubName VARCHAR(50) PRIMARY KEY,
    ->     ClubRoom VARCHAR(50),
    ->     ClubMentor VARCHAR(50)
    -> );

CREATE TABLE Membership (
    ->     StudentID INT,
    ->     ClubName VARCHAR(50),
    ->     JoinDate DATE,
    ->     PRIMARY KEY (StudentID, ClubName),
    ->     FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    ->     FOREIGN KEY (ClubName) REFERENCES Club(ClubName)
    -> );
```
- Inserting values
```
INSERT INTO Student (StudentID, StudentName, Email)
    -> VALUES
    -> (1, 'Asha', 'asha@email.com'),
    -> (2, 'Bikash', 'bikash@email.com'),
    -> (3, 'Nisha', 'nisha@email.com'),
    -> (4, 'Rohan', 'rohan@email.com'),
    -> (5, 'Suman', 'suman@email.com'),
    -> (6, 'Pooja', 'pooja@email.com'),
    -> (7, 'Aman', 'aman@email.com');

INSERT INTO Club (ClubName, ClubRoom, ClubMentor)
    -> VALUES
    -> ('Music Club', 'R101', 'Mr. Raman'),
    -> ('Sports Club', 'R202', 'Ms. Sita'),
    -> ('Drama Club', 'R303', 'Mr. Kiran'),
    -> ('Coding Club', 'Lab1', 'Mr. Anil');
INSERT INTO Membership (StudentID, ClubName, JoinDate)
    -> VALUES
    -> (1, 'Music Club', '2024-01-10'),
    -> (2, 'Sports Club', '2024-01-12'),
    -> (1, 'Sports Club', '2024-01-15'),
    -> (3, 'Music Club', '2024-01-20'),
    -> (4, 'Drama Club', '2024-01-18'),
    -> (5, 'Music Club', '2024-01-22'),
    -> (2, 'Drama Club', '2024-01-25'),
    -> (6, 'Sports Club', '2024-01-27'),
    -> (3, 'Coding Club', '2024-01-28'),
    -> (7, 'Coding Club', '2024-01-30');
```
### Expected Output
### Test Case 1: 
```
select * from student_club;
```
#### Expected Output
```
+-----------+-------------+------------------+-------------+----------+------------+------------+
| StudentID | StudentName | Email            | ClubName    | ClubRoom | ClubMentor | JoinDate   |
+-----------+-------------+------------------+-------------+----------+------------+------------+
|         1 | Asha        | asha@email.com   | Music Club  | R101     | Mr. Raman  | 2024-01-10 |
|         2 | Bikash      | bikash@email.com | Sports Club | R202     | Ms. Sita   | 2024-01-12 |
|         1 | Asha        | asha@email.com   | Sports Club | R202     | Ms. Sita   | 2024-01-15 |
|         3 | Nisha       | nisha@email.com  | Music Club  | R101     | Mr. Raman  | 2024-01-20 |
|         4 | Rohan       | rohan@email.com  | Drama Club  | R303     | Mr. Kiran  | 2024-01-18 |
|         5 | Suman       | suman@email.com  | Music Club  | R101     | Mr. Raman  | 2024-01-22 |
|         2 | Bikash      | bikash@email.com | Drama Club  | R303     | Mr. Kiran  | 2024-01-25 |
|         6 | Pooja       | pooja@email.com  | Sports Club | R202     | Ms. Sita   | 2024-01-27 |
|         3 | Nisha       | nisha@email.com  | Coding Club | Lab1     | Mr. Anil   | 2024-01-28 |
|         7 | Aman        | aman@email.com   | Coding Club | Lab1     | Mr. Anil   | 2024-01-30 |
+-----------+-------------+------------------+-------------+----------+------------+------------+
```
### Test Case 2:
```
select * from Student;
```
### Expected Output
```
+-----------+-------------+------------------+
| StudentID | StudentName | Email            |
+-----------+-------------+------------------+
|         1 | Asha        | asha@email.com   |
|         2 | Bikash      | bikash@email.com |
|         3 | Nisha       | nisha@email.com  |
|         4 | Rohan       | rohan@email.com  |
|         5 | Suman       | suman@email.com  |
|         6 | Pooja       | pooja@email.com  |
|         7 | Aman        | aman@email.com   |
+-----------+-------------+------------------+
```
### Test Case 3:
```
select * from Club;
```
### Expected Output
```
+-------------+----------+------------+
| ClubName    | ClubRoom | ClubMentor |
+-------------+----------+------------+
| Coding Club | Lab1     | Mr. Anil   |
| Drama Club  | R303     | Mr. Kiran  |
| Music Club  | R101     | Mr. Raman  |
| Sports Club | R202     | Ms. Sita   |
+-------------+----------+------------+
```
### Test Case 4:
```
select * from Membership;
```
### Expected Output
```
+-----------+-------------+------------+
| StudentID | ClubName    | JoinDate   |
+-----------+-------------+------------+
|         1 | Music Club  | 2024-01-10 |
|         1 | Sports Club | 2024-01-15 |
|         2 | Drama Club  | 2024-01-25 |
|         2 | Sports Club | 2024-01-12 |
|         3 | Coding Club | 2024-01-28 |
|         3 | Music Club  | 2024-01-20 |
|         4 | Drama Club  | 2024-01-18 |
|         5 | Music Club  | 2024-01-22 |
|         6 | Sports Club | 2024-01-27 |
|         7 | Coding Club | 2024-01-30 |
+-----------+-------------+------------+
```
### Test Case 4:
#### VErification
```
+-----------+-------------+------------------+-------------+------------+----------+------------+
| StudentID | StudentName | Email            | ClubName    | JoinDate   | ClubRoom | ClubMentor |
+-----------+-------------+------------------+-------------+------------+----------+------------+
|         3 | Nisha       | nisha@email.com  | Coding Club | 2024-01-28 | Lab1     | Mr. Anil   |
|         7 | Aman        | aman@email.com   | Coding Club | 2024-01-30 | Lab1     | Mr. Anil   |
|         2 | Bikash      | bikash@email.com | Drama Club  | 2024-01-25 | R303     | Mr. Kiran  |
|         4 | Rohan       | rohan@email.com  | Drama Club  | 2024-01-18 | R303     | Mr. Kiran  |
|         1 | Asha        | asha@email.com   | Music Club  | 2024-01-10 | R101     | Mr. Raman  |
|         3 | Nisha       | nisha@email.com  | Music Club  | 2024-01-20 | R101     | Mr. Raman  |
|         5 | Suman       | suman@email.com  | Music Club  | 2024-01-22 | R101     | Mr. Raman  |
|         1 | Asha        | asha@email.com   | Sports Club | 2024-01-15 | R202     | Ms. Sita   |
|         2 | Bikash      | bikash@email.com | Sports Club | 2024-01-12 | R202     | Ms. Sita   |
|         6 | Pooja       | pooja@email.com  | Sports Club | 2024-01-27 | R202     | Ms. Sita   |
+-----------+-------------+------------------+-------------+------------+----------+------------+
```
### Taste Case 5:
```
select * from student_club;
```
### Expected Output
```
+-----------+-------------+------------------+-------------+----------+------------+------------+
| StudentID | StudentName | Email            | ClubName    | ClubRoom | ClubMentor | JoinDate   |
+-----------+-------------+------------------+-------------+----------+------------+------------+
|         1 | Asha        | asha@email.com   | Music Club  | R101     | Mr. Raman  | 2024-01-10 |
|         2 | Bikash      | bikash@email.com | Sports Club | R202     | Ms. Sita   | 2024-01-12 |
|         1 | Asha        | asha@email.com   | Sports Club | R202     | Ms. Sita   | 2024-01-15 |
|         3 | Nisha       | nisha@email.com  | Music Club  | R101     | Mr. Raman  | 2024-01-20 |
|         4 | Rohan       | rohan@email.com  | Drama Club  | R303     | Mr. Kiran  | 2024-01-18 |
|         5 | Suman       | suman@email.com  | Music Club  | R101     | Mr. Raman  | 2024-01-22 |
|         2 | Bikash      | bikash@email.com | Drama Club  | R303     | Mr. Kiran  | 2024-01-25 |
|         6 | Pooja       | pooja@email.com  | Sports Club | R202     | Ms. Sita   | 2024-01-27 |
|         3 | Nisha       | nisha@email.com  | Coding Club | Lab1     | Mr. Anil   | 2024-01-28 |
|         7 | Aman        | aman@email.com   | Coding Club | Lab1     | Mr. Anil   | 2024-01-30 |
+-----------+-------------+------------------+-------------+----------+------------+------------+
```
### Author
-Ritisha Shrestha
