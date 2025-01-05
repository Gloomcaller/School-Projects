create table sources (
   sourceid    int,
   auto_increment primary key,
   name        varchar(100) not null,
   type        varchar(50),
   contactinfo varchar(100)
);
create table departments (
   departmentid int,
   auto_increment primary key,
   name         varchar(100) not null,
   overseer     varchar(100) not null
);
create table roles (
   roleid    int,
   auto_increment primary key,
   rolename  varchar(100) not null,
   expertise varchar(100)
);
create table custodians (
   custodianid  int,
   auto_increment primary key,
   name         varchar(100) not null,
   roleid       int not null,
   departmentid int not null,
   foreign key ( roleid )
      references roles ( roleid ),
   foreign key ( departmentid )
      references departments ( departmentid )
);
create table artifacts (
   artifactid     int,
   auto_increment primary key,
   name           varchar(100) not null,
   description    text,
   origin         varchar(100),
   yeardiscovered int,
   sourceid       int not null,
   foreign key ( sourceid )
      references sources ( sourceid )
);
create table maintenancerecords (
   recordid          int,
   auto_increment primary key,
   date              date not null,
   artifactcondition varchar(100),
   artifactid        int not null,
   custodianid       int not null,
   foreign key ( artifactid )
      references artifacts ( artifactid ),
   foreign key ( custodianid )
      references custodians ( custodianid )
);
create table testingrecords (
   testid      int,
   auto_increment primary key,
   date        date not null,
   artifactid  int not null,
   custodianid int not null,
   testtype    varchar(100),
   result      text,
   foreign key ( artifactid )
      references artifacts ( artifactid ),
   foreign key ( custodianid )
      references custodians ( custodianid )
);