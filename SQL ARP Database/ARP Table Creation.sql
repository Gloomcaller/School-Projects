CREATE TABLE Sources (
    SourceID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Type VARCHAR(50),
    ContactInfo VARCHAR(100)
);
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Overseer VARCHAR(100) NOT NULL
);
CREATE TABLE Roles (
    RoleID INT AUTO_INCREMENT PRIMARY KEY,
    RoleName VARCHAR(100) NOT NULL,
    Expertise VARCHAR(100)
);
CREATE TABLE Custodians (
    CustodianID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    RoleID INT NOT NULL,
    DepartmentID INT NOT NULL,
    FOREIGN KEY (RoleID)
        REFERENCES Roles (RoleID),
    FOREIGN KEY (DepartmentID)
        REFERENCES Departments (DepartmentID)
);
CREATE TABLE Artifacts (
    ArtifactID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Origin VARCHAR(100),
    YearDiscovered INT,
    SourceID INT NOT NULL,
    FOREIGN KEY (SourceID)
        REFERENCES Sources (SourceID)
);
CREATE TABLE MaintenanceRecords (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE NOT NULL,
    ArtifactCondition VARCHAR(100),
    ArtifactID INT NOT NULL,
    CustodianID INT NOT NULL,
    FOREIGN KEY (ArtifactID)
        REFERENCES Artifacts (ArtifactID),
    FOREIGN KEY (CustodianID)
        REFERENCES Custodians (CustodianID)
);
CREATE TABLE TestingRecords (
    TestID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE NOT NULL,
    ArtifactID INT NOT NULL,
    CustodianID INT NOT NULL,
    TestType VARCHAR(100),
    Result TEXT,
    FOREIGN KEY (ArtifactID)
        REFERENCES Artifacts (ArtifactID),
    FOREIGN KEY (CustodianID)
        REFERENCES Custodians (CustodianID)
);