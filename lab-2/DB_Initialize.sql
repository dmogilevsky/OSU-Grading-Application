CREATE TABLE [Course] (
    [CourseId] INTEGER NOT NULL PRIMARY KEY,
    [Subject] VARCHAR(10) NOT NULL,
    [CourseNumber] INTEGER NOT NULL,
    [CourseName] VARCHAR(100) NULL,
    [Units] INTEGER NOT NULL,
    [AcademicCareer] VARCHAR(50) NOT NULL,
    [ClassAttributes] VARCHAR(1000) NOT NULL

);

CREATE TABLE [Sections] (
    [SectionId] INTEGER NOT NULL PRIMARY KEY,
    [CourseId] INTEGER NOT NULL,
    [SectionNumber] INTEGER NOT NULL,
    [Campus] TEXT NOT NULL,
    [YearOffered] INTEGER NOT NULL,
    [Term] TEXT NOT NULL,
    [InstructionMode] VARCHAR(20) NULL,
    [Instructors] VARCHAR(200) NULL,
    [Building] VARCHAR(50) NULL,
    [RoomNumber] INTEGER NULL,
    [Days] VARCHAR(10) NULL,
    [StartTime] VARCHAR(50) NULL,
    [EndTime] VARCHAR(50) NULL,
    [StartDate] VARCHAR(50) NOT NULL,
    [EndDate] VARCHAR(50) NOT NULL,
    FOREIGN KEY(CourseId) REFERENCES Course(CourseId)
);