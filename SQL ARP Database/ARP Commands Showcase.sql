INSERT INTO artifacts (
    name,
    description,
    origin,
    yeardiscovered,
    sourceid
) 
VALUES (
    'Golden Chalice',
    'A sacred chalice from medieval times.',
    'Unknown',
    1200,
    1
);

SELECT 
    *
FROM
    artifacts
WHERE
    yeardiscovered < 1500;

UPDATE custodians 
SET 
    roleid = 3
WHERE
    custodianid = 5;

DELETE FROM artifacts 
WHERE
    artifactid = 10;

DROP TABLE testingrecords;

CREATE TABLE testingrecords (
    testid      INT,
    auto_increment PRIMARY KEY,
    date        DATE NOT NULL,
    artifactid  INT NOT NULL,
    custodianid INT NOT NULL,
    testtype    VARCHAR(100),
    result      TEXT,
    FOREIGN KEY (artifactid) REFERENCES artifacts (artifactid),
    FOREIGN KEY (custodianid) REFERENCES custodians (custodianid)
);

SELECT 
    AVG(yeardiscovered) AS averageyear
FROM
    artifacts;

SELECT 
    MAX(yeardiscovered) - MIN(yeardiscovered) AS yeardifference
FROM
    artifacts;

SELECT 
    sourceid, COUNT(*) AS artifactcount
FROM
    artifacts
GROUP BY 
    sourceid;

SELECT 
    COUNT(*) AS totalrecords
FROM
    maintenancerecords;

SELECT 
    c.name, r.expertise
FROM
    custodians c
JOIN
    roles r ON c.roleid = r.roleid
ORDER BY 
    r.expertise;

SELECT 
    s.name AS sourcename, COUNT(a.artifactid) AS artifactcount
FROM
    artifacts a
JOIN
    sources s ON a.sourceid = s.sourceid
GROUP BY 
    s.name;

SELECT 
    sourceid, COUNT(*) AS artifactcount
FROM
    artifacts
GROUP BY 
    sourceid
HAVING 
    COUNT(*) > 1;

SELECT 
    a.name AS artifactname, c.name AS custodianname, r.expertise
FROM
    artifacts a
JOIN
    maintenancerecords m ON a.artifactid = m.artifactid
JOIN
    custodians c ON m.custodianid = c.custodianid
JOIN
    roles r ON c.roleid = r.roleid;

SELECT 
    a.name AS artifactname,
    (SELECT 
        COUNT(*)
     FROM
        maintenancerecords
     WHERE
        artifactid = a.artifactid) AS maintenancecount,
    (SELECT 
        COUNT(*)
     FROM
        testingrecords
     WHERE
        artifactid = a.artifactid) AS testingcount
FROM
    artifacts a;
