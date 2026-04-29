-- Iron District Gym Membership Management System
-- Seed Data Script  |  CS 4347 Project Part 2  |  Team 12
-- DBMS: PostgreSQL


-- Table size estimates (seed rows vs. realistic scale)
-- MembershipPlan:          3 rows  (3 plan types, static)
-- Employee:               30 rows  (25-30 active at any time)
-- Trainer:                12 rows  (12 active trainers)
-- Room:                    6 rows  (6 rooms in facility, static)
-- Member:                 50 rows  (~2,000 active members, 1,200 new/year)
-- Class:                  20 rows  (~3,600 sessions/year, 70/week)
-- ClassEnrollment:       150 rows  (~54,000 records/year, avg 15/session)
-- Payment:               100 rows  (~30,000 transactions/year)
-- PersonalTrainingSession: 50 rows  (~5,000 sessions/year, 95/week)



-- 1. MembershipPlan  (3 rows)

INSERT INTO MembershipPlan (plan_id, plan_name, price, duration_months, access_level) VALUES
(1, 'Basic',    29.99, 1, 'Basic'),
(2, 'Standard', 49.99, 1, 'Standard'),
(3, 'Premium',  79.99, 1, 'Premium');


-- 2. Employee  (30 rows: 12 Trainers, 10 Front Desk, 8 Cleaners)

INSERT INTO Employee (employee_id, first_name, last_name, role, employment_status) VALUES
(1,  'Marcus',   'Rivera',     'Trainer',     'Active'),
(2,  'Jordan',   'Bennett',    'Trainer',     'Active'),
(3,  'Alexis',   'Chen',       'Trainer',     'Active'),
(4,  'Priya',    'Kapoor',     'Trainer',     'Active'),
(5,  'Sofia',    'Delgado',    'Trainer',     'Active'),
(6,  'Tyler',    'Owens',      'Trainer',     'Active'),
(7,  'Camille',  'Nguyen',     'Trainer',     'Active'),
(8,  'Darius',   'Brooks',     'Trainer',     'Active'),
(9,  'Elena',    'Petrov',     'Trainer',     'Active'),
(10, 'Kwame',    'Asante',     'Trainer',     'Active'),
(11, 'Nadia',    'Torres',     'Trainer',     'Active'),
(12, 'Liam',     'Fitzgerald', 'Trainer',     'Active'),
(13, 'Hannah',   'Kim',        'Front Desk',  'Active'),
(14, 'Omar',     'Rashid',     'Front Desk',  'Active'),
(15, 'Brianna',  'Wallace',    'Front Desk',  'Active'),
(16, 'Carlos',   'Mendoza',    'Front Desk',  'Active'),
(17, 'Yuki',     'Tanaka',     'Front Desk',  'Active'),
(18, 'Derek',    'Coleman',    'Front Desk',  'Active'),
(19, 'Fatima',   'Hassan',     'Front Desk',  'Inactive'),
(20, 'Patrick',  'Sullivan',   'Front Desk',  'Active'),
(21, 'Renee',    'Dupont',     'Front Desk',  'Inactive'),
(22, 'Samira',   'Okafor',     'Front Desk',  'Active'),
(23, 'Tony',     'Greco',      'Cleaner',     'Active'),
(24, 'Maria',    'Santos',     'Cleaner',     'Active'),
(25, 'Jerome',   'Jackson',    'Cleaner',     'Active'),
(26, 'Ling',     'Wu',         'Cleaner',     'Active'),
(27, 'Blessing', 'Adeyemi',    'Cleaner',     'Active'),
(28, 'Rick',     'Hoffman',    'Cleaner',     'Inactive'),
(29, 'Vera',     'Morozova',   'Cleaner',     'Active'),
(30, 'Pablo',    'Vega',       'Cleaner',     'Active');


-- 3. Trainer  (12 rows — each references a unique Employee)

INSERT INTO Trainer (trainer_id, employee_id, specialization) VALUES
(1,  1,  'Strength Training'),
(2,  2,  'Powerlifting'),
(3,  3,  'HIIT'),
(4,  4,  'Yoga'),
(5,  5,  'Pilates'),
(6,  6,  'Spin'),
(7,  7,  'Cardio'),
(8,  8,  'Boxing'),
(9,  9,  'CrossFit'),
(10, 10, 'Zumba'),
(11, 11, 'Functional Fitness'),
(12, 12, 'Flexibility & Stretching');


-- 4. Room  (6 rows — matches facility description in proposal)

INSERT INTO Room (room_id, room_name, capacity, purpose) VALUES
(1, 'Group Fitness Studio A', 40, 'Group Fitness'),
(2, 'Group Fitness Studio B', 35, 'Group Fitness'),
(3, 'Spin Studio',            25, 'Spin'),
(4, 'Yoga Room',              20, 'Yoga'),
(5, 'Personal Training Room',  8, 'Personal Training'),
(6, 'Multipurpose Room',      30, 'Multipurpose');


-- 5. Member  (50 rows)
-- Plans cycle 2-3-1 so all three plans are well represented

INSERT INTO Member (member_id, first_name, last_name, email, phone, join_date, plan_id, membership_status) VALUES
(1,  'James',     'Carter',     'jcarter@email.com',     '214-555-0101', '2022-03-15', 2, 'Active'),
(2,  'Aisha',     'Williams',   'awilliams@email.com',   '214-555-0102', '2022-05-22', 3, 'Active'),
(3,  'Noah',      'Garcia',     'ngarcia@email.com',     '214-555-0103', '2022-07-10', 1, 'Expired'),
(4,  'Olivia',    'Martinez',   'omartinez@email.com',   '214-555-0104', '2022-09-01', 2, 'Active'),
(5,  'Ethan',     'Robinson',   'erobinson@email.com',   '214-555-0105', '2022-11-14', 3, 'Active'),
(6,  'Mia',       'Clark',      'mclark@email.com',      '214-555-0106', '2023-01-08', 1, 'Cancelled'),
(7,  'Liam',      'Lewis',      'llewis@email.com',      '214-555-0107', '2023-02-20', 2, 'Paused'),
(8,  'Sophia',    'Lee',        'slee@email.com',        '214-555-0108', '2023-03-05', 3, 'Active'),
(9,  'Mason',     'Walker',     'mwalker@email.com',     '214-555-0109', '2023-04-17', 1, 'Active'),
(10, 'Isabella',  'Hall',       'ihall@email.com',       '214-555-0110', '2023-05-29', 2, 'Active'),
(11, 'Logan',     'Allen',      'lallen@email.com',      '214-555-0111', '2023-06-12', 3, 'Active'),
(12, 'Emma',      'Young',      'eyoung@email.com',      '214-555-0112', '2023-07-04', 1, 'Expired'),
(13, 'Lucas',     'Hernandez',  'lhernandez@email.com',  '214-555-0113', '2023-08-19', 2, 'Active'),
(14, 'Ava',       'King',       'aking@email.com',       '214-555-0114', '2023-09-03', 3, 'Active'),
(15, 'Jackson',   'Wright',     'jwright@email.com',     '214-555-0115', '2023-10-25', 1, 'Active'),
(16, 'Harper',    'Scott',      'hscott@email.com',      '214-555-0116', '2023-11-11', 2, 'Active'),
(17, 'Aiden',     'Torres',     'atorres@email.com',     '214-555-0117', '2023-12-07', 3, 'Active'),
(18, 'Evelyn',    'Nguyen',     'enguyen@email.com',     '214-555-0118', '2024-01-15', 1, 'Cancelled'),
(19, 'Sebastian', 'Hill',       'shill@email.com',       '214-555-0119', '2024-02-28', 2, 'Active'),
(20, 'Abigail',   'Flores',     'aflores@email.com',     '214-555-0120', '2024-03-09', 3, 'Active'),
(21, 'Mateo',     'Green',      'mgreen@email.com',      '214-555-0121', '2024-04-01', 1, 'Active'),
(22, 'Ella',      'Adams',      'eadams@email.com',      '214-555-0122', '2024-04-22', 2, 'Active'),
(23, 'Henry',     'Nelson',     'hnelson@email.com',     '214-555-0123', '2024-05-14', 3, 'Paused'),
(24, 'Scarlett',  'Baker',      'sbaker@email.com',      '214-555-0124', '2024-05-30', 1, 'Active'),
(25, 'Alexander', 'Carter',     'acarter@email.com',     '214-555-0125', '2024-06-18', 2, 'Active'),
(26, 'Grace',     'Mitchell',   'gmitchell@email.com',   '214-555-0126', '2024-07-04', 3, 'Active'),
(27, 'Daniel',    'Perez',      'dperez@email.com',      '214-555-0127', '2024-07-20', 1, 'Active'),
(28, 'Chloe',     'Roberts',    'croberts@email.com',    '214-555-0128', '2024-08-05', 2, 'Active'),
(29, 'Michael',   'Turner',     'mturner@email.com',     '214-555-0129', '2024-08-19', 3, 'Active'),
(30, 'Penelope',  'Phillips',   'pphillips@email.com',   '214-555-0130', '2024-09-02', 1, 'Active'),
(31, 'Owen',      'Campbell',   'ocampbell@email.com',   '214-555-0131', '2024-09-16', 2, 'Active'),
(32, 'Riley',     'Parker',     'rparker@email.com',     '214-555-0132', '2024-10-01', 3, 'Active'),
(33, 'William',   'Evans',      'wevans@email.com',      '214-555-0133', '2024-10-15', 1, 'Cancelled'),
(34, 'Layla',     'Edwards',    'ledwards@email.com',    '214-555-0134', '2024-10-29', 2, 'Active'),
(35, 'Benjamin',  'Collins',    'bcollins@email.com',    '214-555-0135', '2024-11-12', 3, 'Active'),
(36, 'Zoey',      'Stewart',    'zstewart@email.com',    '214-555-0136', '2024-11-26', 1, 'Active'),
(37, 'Elijah',    'Sanchez',    'esanchez@email.com',    '214-555-0137', '2024-12-10', 2, 'Active'),
(38, 'Nora',      'Morris',     'nmorris@email.com',     '214-555-0138', '2024-12-24', 3, 'Active'),
(39, 'James',     'Rogers',     'jrogers@email.com',     '214-555-0139', '2025-01-07', 1, 'Active'),
(40, 'Lily',      'Reed',       'lreed@email.com',       '214-555-0140', '2025-01-14', 2, 'Active'),
(41, 'Gabriel',   'Cook',       'gcook@email.com',       '214-555-0141', '2025-01-21', 3, 'Active'),
(42, 'Hannah',    'Morgan',     'hmorgan@email.com',     '214-555-0142', '2025-01-28', 1, 'Active'),
(43, 'Oliver',    'Bell',       'obell@email.com',       '214-555-0143', '2025-02-04', 2, 'Active'),
(44, 'Addison',   'Murphy',     'amurphy@email.com',     '214-555-0144', '2025-02-11', 3, 'Active'),
(45, 'Carter',    'Bailey',     'cbailey@email.com',     '214-555-0145', '2025-02-18', 1, 'Active'),
(46, 'Audrey',    'Rivera',     'arivera@email.com',     '214-555-0146', '2025-02-25', 2, 'Active'),
(47, 'Wyatt',     'Cooper',     'wcooper@email.com',     '214-555-0147', '2025-03-04', 3, 'Active'),
(48, 'Brooklyn',  'Richardson', 'brichardson@email.com', '214-555-0148', '2025-03-11', 1, 'Active'),
(49, 'Dylan',     'Cox',        'dcox@email.com',        '214-555-0149', '2025-03-18', 2, 'Active'),
(50, 'Leah',      'Howard',     'lhoward@email.com',     '214-555-0150', '2025-03-25', 3, 'Active');


-- 6. Class  (20 rows)
-- Business rules enforced:
--   • No trainer leads two classes at the same date+time
--   • Each class assigned to exactly one trainer and one room
--   • Capacity does not exceed room capacity

INSERT INTO Class (class_id, class_name, schedule_date, schedule_time, capacity, trainer_id, room_id) VALUES
(1,  'Yoga Flow',             '2025-01-06', '09:00:00', 20, 4,  4),
(2,  'HIIT Blast',            '2025-01-06', '10:00:00', 30, 3,  1),
(3,  'Spin Cycle',            '2025-01-06', '11:00:00', 25, 6,  3),
(4,  'Zumba Dance',           '2025-01-07', '09:00:00', 35, 10, 1),
(5,  'Pilates Core',          '2025-01-07', '10:00:00', 20, 5,  2),
(6,  'Boxing Basics',         '2025-01-08', '18:00:00', 15, 8,  6),
(7,  'Strength Circuit',      '2025-01-09', '07:00:00', 30, 1,  1),
(8,  'Cardio Burn',           '2025-01-09', '09:00:00', 35, 7,  2),
(9,  'CrossFit WOD',          '2025-01-10', '06:00:00', 20, 9,  6),
(10, 'Morning Stretch',       '2025-01-10', '08:00:00', 20, 12, 4),
(11, 'Functional Fitness',    '2025-01-13', '17:00:00', 30, 11, 1),
(12, 'Power Hour',            '2025-01-13', '18:00:00', 15, 2,  6),
(13, 'Evening Yoga',          '2025-01-14', '19:00:00', 20, 4,  4),
(14, 'Spin Express',          '2025-01-14', '07:00:00', 25, 6,  3),
(15, 'HIIT Advanced',         '2025-01-15', '06:00:00', 25, 3,  1),
(16, 'Dance Cardio',          '2025-01-15', '09:00:00', 30, 10, 2),
(17, 'Core Strength',         '2025-01-16', '12:00:00', 20, 1,  6),
(18, 'Boxing Drills',         '2025-01-17', '18:00:00', 15, 8,  6),
(19, 'Pilates Flow',          '2025-01-20', '10:00:00', 20, 5,  4),
(20, 'CrossFit Fundamentals', '2025-01-20', '17:00:00', 20, 9,  1);


-- 7. ClassEnrollment  (150 rows)
-- Business rules enforced:
--   * enrollment_date <= class schedule_date
--   * No member enrolled in the same class more than once

INSERT INTO ClassEnrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
-- Class 1: Yoga Flow  01-06  (8 enrollments, cap 20)
(1,   1,  1, '2024-12-20'),
(2,   2,  1, '2024-12-21'),
(3,   4,  1, '2024-12-22'),
(4,   8,  1, '2024-12-23'),
(5,   11, 1, '2024-12-24'),
(6,   14, 1, '2024-12-28'),
(7,   20, 1, '2024-12-29'),
(8,   26, 1, '2024-12-30'),
-- Class 2: HIIT Blast  01-06  (10 enrollments, cap 30)
(9,   3,  2, '2024-12-20'),
(10,  5,  2, '2024-12-21'),
(11,  7,  2, '2024-12-22'),
(12,  9,  2, '2024-12-23'),
(13,  10, 2, '2024-12-24'),
(14,  12, 2, '2024-12-26'),
(15,  15, 2, '2024-12-27'),
(16,  17, 2, '2024-12-28'),
(17,  19, 2, '2024-12-30'),
(18,  22, 2, '2025-01-02'),
-- Class 3: Spin Cycle  01-06  (8 enrollments, cap 25)
(19,  6,  3, '2024-12-18'),
(20,  13, 3, '2024-12-19'),
(21,  16, 3, '2024-12-20'),
(22,  21, 3, '2024-12-21'),
(23,  24, 3, '2024-12-23'),
(24,  27, 3, '2024-12-24'),
(25,  30, 3, '2024-12-28'),
(26,  33, 3, '2025-01-03'),
-- Class 4: Zumba Dance  01-07  (10 enrollments, cap 35)
(27,  1,  4, '2024-12-15'),
(28,  2,  4, '2024-12-16'),
(29,  6,  4, '2024-12-17'),
(30,  10, 4, '2024-12-18'),
(31,  14, 4, '2024-12-19'),
(32,  18, 4, '2024-12-21'),
(33,  22, 4, '2024-12-22'),
(34,  26, 4, '2024-12-24'),
(35,  30, 4, '2024-12-25'),
(36,  34, 4, '2025-01-02'),
-- Class 5: Pilates Core  01-07  (7 enrollments, cap 20)
(37,  3,  5, '2024-12-10'),
(38,  7,  5, '2024-12-11'),
(39,  11, 5, '2024-12-12'),
(40,  15, 5, '2024-12-14'),
(41,  19, 5, '2024-12-16'),
(42,  23, 5, '2024-12-20'),
(43,  27, 5, '2024-12-22'),
-- Class 6: Boxing Basics  01-08  (6 enrollments, cap 15)
(44,  4,  6, '2024-12-20'),
(45,  8,  6, '2024-12-21'),
(46,  12, 6, '2024-12-22'),
(47,  16, 6, '2024-12-23'),
(48,  20, 6, '2024-12-24'),
(49,  24, 6, '2024-12-28'),
-- Class 7: Strength Circuit  01-09  (9 enrollments, cap 30)
(50,  5,  7, '2024-12-20'),
(51,  9,  7, '2024-12-21'),
(52,  13, 7, '2024-12-22'),
(53,  17, 7, '2024-12-23'),
(54,  21, 7, '2024-12-24'),
(55,  25, 7, '2024-12-27'),
(56,  29, 7, '2024-12-28'),
(57,  33, 7, '2025-01-02'),
(58,  37, 7, '2025-01-05'),
-- Class 8: Cardio Burn  01-09  (8 enrollments, cap 35)
(59,  2,  8, '2024-12-15'),
(60,  6,  8, '2024-12-16'),
(61,  10, 8, '2024-12-17'),
(62,  14, 8, '2024-12-18'),
(63,  18, 8, '2024-12-19'),
(64,  22, 8, '2024-12-21'),
(65,  26, 8, '2024-12-22'),
(66,  30, 8, '2024-12-24'),
-- Class 9: CrossFit WOD  01-10  (7 enrollments, cap 20)
(67,  1,  9, '2024-12-20'),
(68,  5,  9, '2024-12-21'),
(69,  9,  9, '2024-12-22'),
(70,  13, 9, '2024-12-23'),
(71,  17, 9, '2024-12-26'),
(72,  21, 9, '2024-12-28'),
(73,  25, 9, '2025-01-03'),
-- Class 10: Morning Stretch  01-10  (6 enrollments, cap 20)
(74,  3,  10, '2024-12-20'),
(75,  7,  10, '2024-12-21'),
(76,  11, 10, '2024-12-22'),
(77,  15, 10, '2024-12-28'),
(78,  19, 10, '2025-01-02'),
(79,  23, 10, '2025-01-05'),
-- Class 11: Functional Fitness  01-13  (8 enrollments, cap 30)
(80,  4,  11, '2024-12-28'),
(81,  8,  11, '2024-12-29'),
(82,  12, 11, '2024-12-30'),
(83,  16, 11, '2025-01-03'),
(84,  20, 11, '2025-01-05'),
(85,  24, 11, '2025-01-07'),
(86,  28, 11, '2025-01-09'),
(87,  32, 11, '2025-01-10'),
-- Class 12: Power Hour  01-13  (6 enrollments, cap 15)
(88,  6,  12, '2024-12-20'),
(89,  10, 12, '2024-12-22'),
(90,  14, 12, '2024-12-28'),
(91,  18, 12, '2025-01-02'),
(92,  22, 12, '2025-01-05'),
(93,  26, 12, '2025-01-08'),
-- Class 13: Evening Yoga  01-14  (7 enrollments, cap 20)
(94,  2,  13, '2025-01-02'),
(95,  4,  13, '2025-01-03'),
(96,  8,  13, '2025-01-05'),
(97,  12, 13, '2025-01-07'),
(98,  16, 13, '2025-01-09'),
(99,  20, 13, '2025-01-10'),
(100, 24, 13, '2025-01-11'),
-- Class 14: Spin Express  01-14  (8 enrollments, cap 25)
(101, 1,  14, '2025-01-02'),
(102, 3,  14, '2025-01-03'),
(103, 5,  14, '2025-01-05'),
(104, 7,  14, '2025-01-06'),
(105, 9,  14, '2025-01-07'),
(106, 11, 14, '2025-01-08'),
(107, 13, 14, '2025-01-09'),
(108, 15, 14, '2025-01-11'),
-- Class 15: HIIT Advanced  01-15  (7 enrollments, cap 25)
(109, 17, 15, '2025-01-05'),
(110, 19, 15, '2025-01-06'),
(111, 21, 15, '2025-01-07'),
(112, 23, 15, '2025-01-08'),
(113, 25, 15, '2025-01-09'),
(114, 27, 15, '2025-01-10'),
(115, 29, 15, '2025-01-11'),
-- Class 16: Dance Cardio  01-15  (8 enrollments, cap 30)
(116, 31, 16, '2025-01-05'),
(117, 33, 16, '2025-01-06'),
(118, 35, 16, '2025-01-07'),
(119, 37, 16, '2025-01-08'),
(120, 39, 16, '2025-01-09'),
(121, 41, 16, '2025-01-10'),
(122, 43, 16, '2025-01-11'),
(123, 45, 16, '2025-01-12'),
-- Class 17: Core Strength  01-16  (6 enrollments, cap 20)
(124, 32, 17, '2025-01-05'),
(125, 34, 17, '2025-01-06'),
(126, 36, 17, '2025-01-07'),
(127, 38, 17, '2025-01-08'),
(128, 40, 17, '2025-01-09'),
(129, 42, 17, '2025-01-10'),
-- Class 18: Boxing Drills  01-17  (6 enrollments, cap 15)
(130, 44, 18, '2025-01-05'),
(131, 46, 18, '2025-01-06'),
(132, 48, 18, '2025-01-07'),
(133, 50, 18, '2025-01-08'),
(134, 2,  18, '2025-01-09'),
(135, 6,  18, '2025-01-10'),
-- Class 19: Pilates Flow  01-20  (7 enrollments, cap 20)
(136, 47, 19, '2025-01-10'),
(137, 49, 19, '2025-01-11'),
(138, 1,  19, '2025-01-12'),
(139, 3,  19, '2025-01-13'),
(140, 5,  19, '2025-01-14'),
(141, 7,  19, '2025-01-15'),
(142, 9,  19, '2025-01-16'),
-- Class 20: CrossFit Fundamentals  01-20  (8 enrollments, cap 20)
(143, 11, 20, '2025-01-10'),
(144, 13, 20, '2025-01-11'),
(145, 15, 20, '2025-01-12'),
(146, 17, 20, '2025-01-13'),
(147, 19, 20, '2025-01-14'),
(148, 21, 20, '2025-01-15'),
(149, 23, 20, '2025-01-16'),
(150, 25, 20, '2025-01-17');


-- 8. Payment  (100 rows)
-- Amounts match each member's current plan price:
--   Basic=$29.99  Standard=$49.99  Premium=$79.99
-- PT payments use a flat $75.00 session rate

INSERT INTO Payment (payment_id, member_id, amount, payment_date, payment_type) VALUES
-- Initial membership payments (1 per member, rows 1–50)
(1,  1,  49.99, '2022-03-15', 'Membership'),
(2,  2,  79.99, '2022-05-22', 'Membership'),
(3,  3,  29.99, '2022-07-10', 'Membership'),
(4,  4,  49.99, '2022-09-01', 'Membership'),
(5,  5,  79.99, '2022-11-14', 'Membership'),
(6,  6,  29.99, '2023-01-08', 'Membership'),
(7,  7,  49.99, '2023-02-20', 'Membership'),
(8,  8,  79.99, '2023-03-05', 'Membership'),
(9,  9,  29.99, '2023-04-17', 'Membership'),
(10, 10, 49.99, '2023-05-29', 'Membership'),
(11, 11, 79.99, '2023-06-12', 'Membership'),
(12, 12, 29.99, '2023-07-04', 'Membership'),
(13, 13, 49.99, '2023-08-19', 'Membership'),
(14, 14, 79.99, '2023-09-03', 'Membership'),
(15, 15, 29.99, '2023-10-25', 'Membership'),
(16, 16, 49.99, '2023-11-11', 'Membership'),
(17, 17, 79.99, '2023-12-07', 'Membership'),
(18, 18, 29.99, '2024-01-15', 'Membership'),
(19, 19, 49.99, '2024-02-28', 'Membership'),
(20, 20, 79.99, '2024-03-09', 'Membership'),
(21, 21, 29.99, '2024-04-01', 'Membership'),
(22, 22, 49.99, '2024-04-22', 'Membership'),
(23, 23, 79.99, '2024-05-14', 'Membership'),
(24, 24, 29.99, '2024-05-30', 'Membership'),
(25, 25, 49.99, '2024-06-18', 'Membership'),
(26, 26, 79.99, '2024-07-04', 'Membership'),
(27, 27, 29.99, '2024-07-20', 'Membership'),
(28, 28, 49.99, '2024-08-05', 'Membership'),
(29, 29, 79.99, '2024-08-19', 'Membership'),
(30, 30, 29.99, '2024-09-02', 'Membership'),
(31, 31, 49.99, '2024-09-16', 'Membership'),
(32, 32, 79.99, '2024-10-01', 'Membership'),
(33, 33, 29.99, '2024-10-15', 'Membership'),
(34, 34, 49.99, '2024-10-29', 'Membership'),
(35, 35, 79.99, '2024-11-12', 'Membership'),
(36, 36, 29.99, '2024-11-26', 'Membership'),
(37, 37, 49.99, '2024-12-10', 'Membership'),
(38, 38, 79.99, '2024-12-24', 'Membership'),
(39, 39, 29.99, '2025-01-07', 'Membership'),
(40, 40, 49.99, '2025-01-14', 'Membership'),
(41, 41, 79.99, '2025-01-21', 'Membership'),
(42, 42, 29.99, '2025-01-28', 'Membership'),
(43, 43, 49.99, '2025-02-04', 'Membership'),
(44, 44, 79.99, '2025-02-11', 'Membership'),
(45, 45, 29.99, '2025-02-18', 'Membership'),
(46, 46, 49.99, '2025-02-25', 'Membership'),
(47, 47, 79.99, '2025-03-04', 'Membership'),
(48, 48, 29.99, '2025-03-11', 'Membership'),
(49, 49, 49.99, '2025-03-18', 'Membership'),
(50, 50, 79.99, '2025-03-25', 'Membership'),
-- Monthly renewals (rows 51–80, older members renewing in Jan 2025)
(51, 1,  49.99, '2025-01-15', 'Membership'),
(52, 2,  79.99, '2025-01-15', 'Membership'),
(53, 3,  29.99, '2025-01-15', 'Membership'),
(54, 4,  49.99, '2025-01-15', 'Membership'),
(55, 5,  79.99, '2025-01-15', 'Membership'),
(56, 6,  29.99, '2025-01-15', 'Membership'),
(57, 7,  49.99, '2025-02-20', 'Membership'),
(58, 8,  79.99, '2025-02-20', 'Membership'),
(59, 9,  29.99, '2025-02-20', 'Membership'),
(60, 10, 49.99, '2025-02-20', 'Membership'),
(61, 11, 79.99, '2025-03-12', 'Membership'),
(62, 12, 29.99, '2025-03-12', 'Membership'),
(63, 13, 49.99, '2025-03-12', 'Membership'),
(64, 14, 79.99, '2025-03-12', 'Membership'),
(65, 15, 29.99, '2025-03-25', 'Membership'),
(66, 16, 49.99, '2025-03-25', 'Membership'),
(67, 17, 79.99, '2025-03-25', 'Membership'),
(68, 18, 29.99, '2025-04-01', 'Membership'),
(69, 19, 49.99, '2025-04-01', 'Membership'),
(70, 20, 79.99, '2025-04-01', 'Membership'),
(71, 21, 29.99, '2025-04-05', 'Membership'),
(72, 22, 49.99, '2025-04-05', 'Membership'),
(73, 23, 79.99, '2025-04-05', 'Membership'),
(74, 24, 29.99, '2025-04-10', 'Membership'),
(75, 25, 49.99, '2025-04-10', 'Membership'),
(76, 26, 79.99, '2025-04-10', 'Membership'),
(77, 27, 29.99, '2025-04-14', 'Membership'),
(78, 28, 49.99, '2025-04-14', 'Membership'),
(79, 29, 79.99, '2025-04-14', 'Membership'),
(80, 30, 29.99, '2025-04-14', 'Membership'),
-- Personal Training payments (rows 81–95)
(81,  1,  75.00, '2025-01-08', 'Personal Training'),
(82,  5,  75.00, '2025-01-10', 'Personal Training'),
(83,  8,  90.00, '2025-01-12', 'Personal Training'),
(84,  11, 75.00, '2025-01-15', 'Personal Training'),
(85,  14, 60.00, '2025-01-17', 'Personal Training'),
(86,  17, 75.00, '2025-01-20', 'Personal Training'),
(87,  20, 90.00, '2025-01-22', 'Personal Training'),
(88,  23, 75.00, '2025-01-25', 'Personal Training'),
(89,  26, 60.00, '2025-02-01', 'Personal Training'),
(90,  29, 75.00, '2025-02-05', 'Personal Training'),
(91,  32, 75.00, '2025-02-10', 'Personal Training'),
(92,  35, 90.00, '2025-02-14', 'Personal Training'),
(93,  38, 75.00, '2025-02-18', 'Personal Training'),
(94,  41, 60.00, '2025-03-01', 'Personal Training'),
(95,  44, 75.00, '2025-03-07', 'Personal Training'),
-- Fees and Adjustments (rows 96–100)
(96,  3,  10.00,  '2025-01-20', 'Fee'),
(97,  7,  15.00,  '2025-02-03', 'Fee'),
(98,  12, 10.00,  '2025-02-17', 'Fee'),
(99,  18, -10.00, '2025-03-05', 'Adjustment'),
(100, 25, -15.00, '2025-03-19', 'Adjustment');


-- 9. PersonalTrainingSession  (50 rows)
-- Business rules enforced:
--   * Each session links exactly one member + one trainer
--   * No member has two sessions with the same trainer on the same date
--   * Duration: 30, 45, or 60 minutes
--   * Cost: $60.00 (30 min), $75.00 (45 min), $90.00 (60 min)

INSERT INTO PersonalTrainingSession (session_id, member_id, trainer_id, session_date, duration, cost) VALUES
(1,  1,  1,  '2025-01-08', 45, 75.00),
(2,  5,  3,  '2025-01-10', 60, 90.00),
(3,  8,  4,  '2025-01-12', 45, 75.00),
(4,  11, 7,  '2025-01-15', 30, 60.00),
(5,  14, 2,  '2025-01-17', 60, 90.00),
(6,  17, 9,  '2025-01-20', 45, 75.00),
(7,  20, 6,  '2025-01-22', 30, 60.00),
(8,  23, 11, '2025-01-25', 60, 90.00),
(9,  26, 8,  '2025-02-01', 45, 75.00),
(10, 29, 1,  '2025-02-05', 30, 60.00),
(11, 32, 5,  '2025-02-10', 45, 75.00),
(12, 35, 10, '2025-02-14', 60, 90.00),
(13, 38, 3,  '2025-02-18', 45, 75.00),
(14, 41, 12, '2025-03-01', 30, 60.00),
(15, 44, 7,  '2025-03-07', 45, 75.00),
(16, 2,  9,  '2025-01-09', 60, 90.00),
(17, 4,  6,  '2025-01-11', 45, 75.00),
(18, 6,  2,  '2025-01-14', 30, 60.00),
(19, 9,  11, '2025-01-16', 60, 90.00),
(20, 12, 4,  '2025-01-19', 45, 75.00),
(21, 15, 8,  '2025-01-21', 45, 75.00),
(22, 18, 1,  '2025-01-23', 30, 60.00),
(23, 21, 5,  '2025-01-27', 60, 90.00),
(24, 24, 3,  '2025-01-30', 45, 75.00),
(25, 27, 12, '2025-02-03', 30, 60.00),
(26, 30, 9,  '2025-02-06', 45, 75.00),
(27, 33, 7,  '2025-02-11', 60, 90.00),
(28, 36, 10, '2025-02-15', 45, 75.00),
(29, 39, 2,  '2025-02-19', 30, 60.00),
(30, 42, 6,  '2025-02-22', 60, 90.00),
(31, 45, 4,  '2025-02-25', 45, 75.00),
(32, 48, 11, '2025-03-02', 30, 60.00),
(33, 50, 1,  '2025-03-05', 45, 75.00),
(34, 3,  8,  '2025-01-13', 60, 90.00),
(35, 7,  3,  '2025-01-18', 45, 75.00),
(36, 10, 5,  '2025-01-24', 30, 60.00),
(37, 13, 12, '2025-01-28', 60, 90.00),
(38, 16, 9,  '2025-02-04', 45, 75.00),
(39, 19, 2,  '2025-02-08', 30, 60.00),
(40, 22, 7,  '2025-02-12', 45, 75.00),
(41, 25, 10, '2025-02-16', 60, 90.00),
(42, 28, 4,  '2025-02-20', 45, 75.00),
(43, 31, 6,  '2025-02-24', 30, 60.00),
(44, 34, 1,  '2025-02-27', 60, 90.00),
(45, 37, 11, '2025-03-03', 45, 75.00),
(46, 40, 3,  '2025-03-06', 30, 60.00),
(47, 43, 8,  '2025-03-09', 45, 75.00),
(48, 46, 5,  '2025-03-12', 60, 90.00),
(49, 49, 12, '2025-03-15', 45, 75.00),
(50, 47, 9,  '2025-03-18', 30, 60.00);
