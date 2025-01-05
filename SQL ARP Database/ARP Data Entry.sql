insert into sources (
   name,
   type,
   contactinfo
) values ( 'National Museum',
           'Government',
           'museum@compas.com' ),( 'Explorers Guild',
                                   'Private Organization',
                                   'explorers@compas.com' ),( 'Antique Collectors Union',
                                                              'Private',
                                                              'collectorsunion@compas.com' ),( 'Global Archaeology Network',
                                                                                               'NGO',
                                                                                               'gan@compas.com' ),( 'Historical Artifacts Fundation'
                                                                                               ,
                                                                                                                    'Charity'
                                                                                                                    ,
                                                                                                                    'hafundation@compas.com'
                                                                                                                    ),( 'Private Donor'
                                                                                                                    ,
                                                                                                                                             'Individual'
                                                                                                                                             ,
                                                                                                                                             'private@compas.com'
                                                                                                                                             )
                                                                                                                                             ,
                                                                                                                                             (
                                                                                                                                             'Excavation Team Diamond'
                                                                                                                                             ,
                                                                                                                                                                  'Field Team'
                                                                                                                                                                  ,
                                                                                                                                                                  'teamdiamond@compas.com'
                                                                                                                                                                  )
                                                                                                                                                                  ;
insert into departments (
   name,
   overseer
) values ( 'Preservation',
           'Elena Carter' ),( 'Research',
                              'Dr. Victor Yu' ),( 'Security',
                                                  'Samantha Hall' ),( 'Logistics',
                                                                      'Michael Thompson' ),( 'Cataloging',
                                                                                             'Sophia Lee' ),( 'Maintenance',
                                                                                                              'Harold Greene'
                                                                                                              );
insert into roles (
   rolename,
   expertise
) values ( 'Research Specialist',
           'Artifact Research' ),( 'Preservation Specialist',
                                   'Conservation' ),( 'Logistics Coordinator',
                                                      'Transportation & Storage' ),( 'Security Officer',
                                                                                     'Artifact Protection' ),( 'Maintenance Technician'
                                                                                     ,
                                                                                                               'Artifact Repairs'
                                                                                                               ),( 'Cataloging Specialist'
                                                                                                               ,
                                                                                                                                  'Database Management'
                                                                                                                                  )
                                                                                                                                  ,
                                                                                                                                  (
                                                                                                                                  'Field Archaeologist'
                                                                                                                                  ,
                                                                                                                                                        'Excavation & Recovery'
                                                                                                                                                        )
                                                                                                                                                        ;
insert into custodians (
   name,
   roleid,
   departmentid
) values ( 'Alice Morgan',
           1,
           2 ),( 'James Scott',
                 2,
                 1 ),( 'Emily Davis',
                       3,
                       4 ),( 'Daniel Harris',
                             4,
                             3 ),( 'Grace Thompson',
                                   5,
                                   6 ),( 'Olivia Wilson',
                                         6,
                                         5 ),( 'Liam Moore',
                                               7,
                                               4 ),( 'Sophia Taylor',
                                                     1,
                                                     2 ),( 'Ethan White',
                                                           2,
                                                           1 ),( 'Mia Martinez',
                                                                 4,
                                                                 3 );
insert into artifacts (
   name,
   description,
   origin,
   yeardiscovered,
   sourceid
) values ( 'Golden Chalice',
           'A ceremonial chalice adorned with intricate designs.',
           'Egypt',
           1923,
           1 ),( 'Ancient Scroll',
                 'A fragile parchment containing ancient text.',
                 'China',
                 1856,
                 2 ),( 'Jeweled Dagger',
                       'A weapon encrusted with rubies and emeralds.',
                       'Persia',
                       1754,
                       3 ),( 'Bronze Shield',
                             'A well-preserved shield with engraved symbols.',
                             'Greece',
                             200,
                             4 ),( 'Ivory Statuette',
                                   'A small figurine carved from ivory.',
                                   'India',
                                   1898,
                                   5 ),( 'Ceramic Vase',
                                         'An ornate vase used in ancient rituals.',
                                         'Mesopotamia',
                                         1500,
                                         6 ),( 'Silver Coin',
                                               'A coin minted during a legendary reign.',
                                               'Rome',
                                               44,
                                               7 ),( 'Obsidian Mirror',
                                                     'A reflective surface crafted from volcanic glass.',
                                                     'Mexico',
                                                     1400,
                                                     1 ),( 'Jade Pendant',
                                                           'A necklace centerpiece crafted from jade.',
                                                           'Korea',
                                                           700,
                                                           2 ),( 'Steel Helm',
                                                                 'A medieval helmet used by knights.',
                                                                 'England',
                                                                 1405,
                                                                 3 );
insert into maintenancerecords (
   date,
   artifactcondition,
   artifactid,
   custodianid
) values ( '2024-01-15',
           'Good',
           1,
           2 ),( '2024-02-01',
                 'Fair',
                 3,
                 5 ),( '2024-02-10',
                       'Restored',
                       4,
                       1 ),( '2024-03-22',
                             'Excellent',
                             7,
                             3 ),( '2024-04-18',
                                   'Needs Repair',
                                   6,
                                   6 ),( '2024-05-05',
                                         'Good',
                                         2,
                                         4 );
insert into testingrecords (
   date,
   artifactid,
   custodianid,
   testtype,
   result
) values ( '2024-01-10',
           1,
           1,
           'Material Analysis',
           'Gold alloy with unknown impurities.' ),( '2024-01-20',
                                                     2,
                                                     3,
                                                     'Radiocarbon Dating',
                                                     'Estimated age: 1,500 years.' ),( '2024-02-05',
                                                                                       4,
                                                                                       5,
                                                                                       'Structural Integrity',
                                                                                       'Shield is stable and intact.' ),( '2024-03-01'
                                                                                       ,
                                                                                                                        7,
                                                                                                                        2,
                                                                                                                        'Chemical Analysis'
                                                                                                                        ,
                                                                                                                        'Obsidian purity at 97%.'
                                                                                                                        ),( '2024-03-15'
                                                                                                                        ,
                                                                                                                                                  5
                                                                                                                                                  ,
                                                                                                                                                  6
                                                                                                                                                  ,
                                                                                                                                                  'Artifact Authentication'
                                                                                                                                                  ,
                                                                                                                                                  'Confirmed origin: India.'
                                                                                                                                                  )
                                                                                                                                                  ,
                                                                                                                                                  (
                                                                                                                                                  '2024-04-10'
                                                                                                                                                  ,
                                                                                                                                                                             9
                                                                                                                                                                             ,
                                                                                                                                                                             7
                                                                                                                                                                             ,
                                                                                                                                                                             'Microscopic Examination'
                                                                                                                                                                             ,
                                                                                                                                                                             'No signs of modern tampering.'
                                                                                                                                                                             )
                                                                                                                                                                             ;