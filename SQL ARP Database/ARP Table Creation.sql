CREATE TABLE sources (
    sourceid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    contactinfo VARCHAR(100)
);

CREATE TABLE departments (
    departmentid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    overseer VARCHAR(100) NOT NULL
);

CREATE TABLE roles (
    roleid INT AUTO_INCREMENT PRIMARY KEY,
    rolename VARCHAR(100) NOT NULL,
    expertise VARCHAR(100)
);

CREATE TABLE custodians (
    custodianid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    roleid INT NOT NULL,
    departmentid INT NOT NULL,
    FOREIGN KEY (roleid) REFERENCES roles(roleid),
    FOREIGN KEY (departmentid) REFERENCES departments(departmentid)
);

CREATE TABLE artifacts (
    artifactid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    origin VARCHAR(100),
    yeardiscovered INT,
    sourceid INT NOT NULL,
    FOREIGN KEY (sourceid) REFERENCES sources(sourceid)
);

CREATE TABLE maintenancerecords (
    recordid INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    artifactcondition VARCHAR(100),
    artifactid INT NOT NULL,
    custodianid INT NOT NULL,
    FOREIGN KEY (artifactid) REFERENCES artifacts(artifactid),
    FOREIGN KEY (custodianid) REFERENCES custodians(custodianid)
);

CREATE TABLE testingrecords (
    testid INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    artifactid INT NOT NULL,
    custodianid INT NOT NULL,
    testtype VARCHAR(100),
    result TEXT,
    FOREIGN KEY (artifactid) REFERENCES artifacts(artifactid),
    FOREIGN KEY (custodianid) REFERENCES custodians(custodianid)
);
