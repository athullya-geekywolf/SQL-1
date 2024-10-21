E-LEARNING PLATFORM

CREATE TABLE Students (
    StudentId INT ,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE NOT NULL,
    RegistrationDate DATE,
	CONSTRAINT PkStudent PRIMARY KEY(StudentId),
);

CREATE TABLE Instructors (
    InstructorId INT ,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) ,
    Email VARCHAR(100) UNIQUE NOT NULL,
	  PhoneNumber VARCHAR(12),
    CONSTRAINT PkInstructor PRIMARY KEY(InstructorId)
);

CREATE TABLE Courses (
    CourseId INT,
    Title VARCHAR(100) NOT NULL,
    InstructorId INT,
    CreationDate DATE ,
	  LastUpdatedDate DATE,
    Duration TIME,
    Price Decimal,
    FOREIGN KEY (InstructorId) REFERENCES Instructors(InstructorId),
	  CONSTRAINT PkCourse PRIMARY KEY(CourseId)
);

CREATE TABLE Enrollments (
    EnrollId INT PRIMARY KEY,
    StudentId INT,
    CourseId INT,
    EnrolledDate DATE,
    FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
    FOREIGN KEY (CourseId) REFERENCES Courses(CourseId)
);

CREATE TABLE Lessons (
    LessonId INT PRIMARY KEY,
    CourseId INT,
    Title VARCHAR(100) NOT NULL,
    Content TEXT,
    LessonNumber INT,
	LessonDuration TIME,
    FOREIGN KEY (CourseId) REFERENCES Courses(CourseId)
);

CREATE TABLE Quizzes (
    QuizId INT PRIMARY KEY,
    LessonId INT,
    Title VARCHAR(100) NOT NULL,
    TotalPoints INT,
    FOREIGN KEY (LessonId) REFERENCES Lessons(LessonId)
);

CREATE TABLE Assignments (
    AssignmentId INT PRIMARY KEY,
    CourseId INT,
    Title VARCHAR(100) NOT NULL,
    DueDate DATE,
    AssignmentType VARCHAR(30) NOT NULL,
    FOREIGN KEY (CourseId) REFERENCES Courses(CourseId),
	  CHECK (AssignmentType IN ('peer-reviewed', 'auto-graded', 'instructor-graded'))
);

CREATE TABLE Feedbacks (
    FeedbackID INT PRIMARY KEY ,
	  FeedbackType VARCHAR(40),
    StudentId INT,
	  CourseId INT,
	  QuizId INT,
	  AssignmentID INT,
    Remark TEXT,
    FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
    FOREIGN KEY (CourseId) REFERENCES Courses(CourseId),
	  CHECK (FeedbackType IN ('Quiz','Assignment'))
    
);

CREATE TABLE Certificates (
    CertificateId INT PRIMARY KEY,
    StudentId INT,
    CourseId INT,
    IssueDate DATE ,
    FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
    FOREIGN KEY (CourseId) REFERENCES Courses(CourseId)
);

CREATE TABLE CourseProgress (
    ProgressId INT PRIMARY KEY,
    StudentId INT,
    CourseId INT,
    ProgressPercentage DECIMAL(5, 2),
    LastAccessed DATE,
    FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
    FOREIGN KEY (CourseId) REFERENCES Courses(CourseId)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY ,
    StudentId INT,
	  CourseId INT,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    PaymentStatus VARCHAR(20), 
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
    FOREIGN KEY (CourseId) REFERENCES Courses(CourseId),
    CHECK (PaymentMethod IN ('Credit Card', 'Cash', 'Bank Transfer','UPI')), 
    CHECK (PaymentStatus IN ('Pending', 'Completed', 'Failed', 'Refunded')) 
);
