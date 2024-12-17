INSERT INTO Artifacts (Name, Description, Origin, YearDiscovered, SourceID) 
VALUES ('Golden Chalice', 'A sacred chalice from medieval times.', 'Unknown', 1200, 1);

SELECT * 
FROM Artifacts 
WHERE YearDiscovered < 1500;

UPDATE Custodians 
SET RoleID = 3 
WHERE CustodianID = 5;

DELETE FROM Artifacts 
WHERE ArtifactID = 10;

DROP TABLE TestingRecords;

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

SELECT AVG(YearDiscovered) AS AverageYear 
FROM Artifacts;

SELECT MAX(YearDiscovered) - MIN(YearDiscovered) AS YearDifference 
FROM Artifacts;

SELECT SourceID, COUNT(*) AS ArtifactCount 
FROM Artifacts 
GROUP BY SourceID;

SELECT COUNT(*) AS TotalRecords 
FROM MaintenanceRecords;

SELECT c.Name, r.Expertise 
FROM Custodians c 
JOIN Roles r ON c.RoleID = r.RoleID 
ORDER BY r.Expertise;

SELECT s.Name AS SourceName, COUNT(a.ArtifactID) AS ArtifactCount 
FROM Artifacts a 
JOIN Sources s ON a.SourceID = s.SourceID 
GROUP BY s.Name;

SELECT SourceID, COUNT(*) AS ArtifactCount 
FROM Artifacts 
GROUP BY SourceID 
HAVING COUNT(*) > 1;

SELECT a.Name AS ArtifactName, c.Name AS CustodianName, r.Expertise 
FROM Artifacts a 
JOIN MaintenanceRecords m ON a.ArtifactID = m.ArtifactID 
JOIN Custodians c ON m.CustodianID = c.CustodianID 
JOIN Roles r ON c.RoleID = r.RoleID;

SELECT a.Name AS ArtifactName, 
       (SELECT COUNT(*) FROM MaintenanceRecords WHERE ArtifactID = a.ArtifactID) AS MaintenanceCount,
       (SELECT COUNT(*) FROM TestingRecords WHERE ArtifactID = a.ArtifactID) AS TestingCount
FROM Artifacts a;