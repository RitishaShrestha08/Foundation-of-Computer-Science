-- College Club Membership Management
USE CLUB;

-- Part 1: Unnormalized Table

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

select * from student_club;

-- Part 2 : First Normal Form (1NF)

 ALTER TABLE student_club 
	->ADD PRIMARY KEY (StudentID, ClubName);

-- Part 3: Second Normal Form (2NF)

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
CREATE TABLE Membership (     
	->StudentID INT, 
	->ClubName VARCHAR(50),     
	->JoinDate DATE,    
	-> PRIMARY KEY (StudentID, ClubName),     
	->FOREIGN KEY (StudentID) REFERENCES Student(StudentID),     
	->FOREIGN KEY (ClubName) REFERENCES Club(ClubName) 
	->);
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

-- Part 4 : Verification query ( Reconstruct original table)
SELECT
    ->     s.StudentID,
    ->     s.StudentName,
    ->     s.Email,
    ->     m.ClubName,
    ->     m.JoinDate,
    ->     c.ClubRoom,
    ->     c.ClubMentor
    -> FROM Student s
    -> JOIN Membership m ON s.StudentID = m.StudentID
    -> JOIN Club c ON m.ClubName = c.ClubName;