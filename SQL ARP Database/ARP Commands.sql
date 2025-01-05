insert into artifacts (
   name,
   description,
   origin,
   yeardiscovered,
   sourceid
) values ( 'Golden Chalice',
           'A sacred chalice from medieval times.',
           'Unknown',
           1200,
           1 );

select *
  from artifacts
 where yeardiscovered < 1500;

update custodians
   set
   roleid = 3
 where custodianid = 5;

delete from artifacts
 where artifactid = 10;

drop table testingrecords;

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

select avg(yeardiscovered) as averageyear
  from artifacts;

select max(yeardiscovered) - min(yeardiscovered) as yeardifference
  from artifacts;

select sourceid,
       count(*) as artifactcount
  from artifacts
 group by sourceid;

select count(*) as totalrecords
  from maintenancerecords;

select c.name,
       r.expertise
  from custodians c
  join roles r
on c.roleid = r.roleid
 order by r.expertise;

select s.name as sourcename,
       count(a.artifactid) as artifactcount
  from artifacts a
  join sources s
on a.sourceid = s.sourceid
 group by s.name;

select sourceid,
       count(*) as artifactcount
  from artifacts
 group by sourceid
having count(*) > 1;

select a.name as artifactname,
       c.name as custodianname,
       r.expertise
  from artifacts a
  join maintenancerecords m
on a.artifactid = m.artifactid
  join custodians c
on m.custodianid = c.custodianid
  join roles r
on c.roleid = r.roleid;

select a.name as artifactname,
       (
          select count(*)
            from maintenancerecords
           where artifactid = a.artifactid
       ) as maintenancecount,
       (
          select count(*)
            from testingrecords
           where artifactid = a.artifactid
       ) as testingcount
  from artifacts a;