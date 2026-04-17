
-- Iron District Gym Membership Management System
-- CREATE TABLE Script  |  CS 4347 Project Part 2  |  Team 12
-- DBMS: PostgreSQL
-- Run this file first, then seed.sql


DROP TABLE IF EXISTS PersonalTrainingSession;
DROP TABLE IF EXISTS ClassEnrollment;
DROP TABLE IF EXISTS Class;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS Trainer;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS MembershipPlan;

-- 1. MembershipPlan
-- No foreign keys — create first

CREATE TABLE MembershipPlan (
    plan_id         SERIAL          PRIMARY KEY,
    plan_name       VARCHAR(50)     NOT NULL,
    price           DECIMAL(10, 2)  NOT NULL CHECK (price >= 0.00),
    duration_months INTEGER         NOT NULL CHECK (duration_months BETWEEN 1 AND 24),
    access_level    VARCHAR(20)     NOT NULL CHECK (access_level IN ('Basic', 'Standard', 'Premium'))
);

-- 2. Employee
-- No foreign keys

CREATE TABLE Employee (
    employee_id       SERIAL       PRIMARY KEY,
    first_name        VARCHAR(50)  NOT NULL,
    last_name         VARCHAR(50)  NOT NULL,
    role              VARCHAR(20)  NOT NULL CHECK (role IN ('Trainer', 'Front Desk', 'Cleaner')),
    employment_status VARCHAR(10)  NOT NULL CHECK (employment_status IN ('Active', 'Inactive'))
);

-- ============================================================
-- 3. Trainer
-- Subtype of Employee — employee_id must be unique (one employee = one trainer record)
-- ============================================================
CREATE TABLE Trainer (
    trainer_id      SERIAL       PRIMARY KEY,
    employee_id     INTEGER      NOT NULL UNIQUE REFERENCES Employee(employee_id),
    specialization  VARCHAR(100) NOT NULL
);

-- 4. Room
-- No foreign keys

CREATE TABLE Room (
    room_id    SERIAL       PRIMARY KEY,
    room_name  VARCHAR(100) NOT NULL UNIQUE,
    capacity   INTEGER      NOT NULL CHECK (capacity BETWEEN 1 AND 100),
    purpose    VARCHAR(100) NOT NULL
);

-- 5. Member
-- FK: plan_id -> MembershipPlan

CREATE TABLE Member (
    member_id  SERIAL       PRIMARY KEY,
    first_name VARCHAR(50)  NOT NULL,
    last_name  VARCHAR(50)  NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE,
    phone      VARCHAR(20)  NOT NULL,
    join_date  DATE         NOT NULL,
    plan_id    INTEGER      NOT NULL REFERENCES MembershipPlan(plan_id)
);

-- 6. Payment
-- FK: member_id -> Member

CREATE TABLE Payment (
    payment_id   SERIAL          PRIMARY KEY,
    member_id    INTEGER         NOT NULL REFERENCES Member(member_id),
    amount       DECIMAL(10, 2)  NOT NULL CHECK (amount >= -9999.99),
    payment_date DATE            NOT NULL,
    payment_type VARCHAR(20)     NOT NULL CHECK (payment_type IN ('Membership', 'Personal Training', 'Fee', 'Adjustment'))
);

-- 7. Class
-- FK: trainer_id -> Trainer, room_id -> Room
-- Unique constraint: a trainer cannot lead two classes at the same date+time

CREATE TABLE Class (
    class_id      SERIAL       PRIMARY KEY,
    class_name    VARCHAR(100) NOT NULL,
    schedule_date DATE         NOT NULL,
    schedule_time TIME         NOT NULL,
    capacity      INTEGER      NOT NULL CHECK (capacity BETWEEN 1 AND 100),
    trainer_id    INTEGER      NOT NULL REFERENCES Trainer(trainer_id),
    room_id       INTEGER      NOT NULL REFERENCES Room(room_id),
    UNIQUE (trainer_id, schedule_date, schedule_time)
);

-- 8. ClassEnrollment
-- FK: member_id -> Member, class_id -> Class
-- Unique constraint: a member cannot enroll in the same class twice
-- Check: enrollment_date must be on or before the class schedule_date

CREATE TABLE ClassEnrollment (
    enrollment_id   SERIAL   PRIMARY KEY,
    member_id       INTEGER  NOT NULL REFERENCES Member(member_id),
    class_id        INTEGER  NOT NULL REFERENCES Class(class_id),
    enrollment_date DATE     NOT NULL,
    UNIQUE (member_id, class_id)
);

-- 9. PersonalTrainingSession
-- FK: member_id -> Member, trainer_id -> Trainer
-- Unique constraint: a member cannot have two sessions with the same trainer on the same day

CREATE TABLE PersonalTrainingSession (
    session_id   SERIAL          PRIMARY KEY,
    member_id    INTEGER         NOT NULL REFERENCES Member(member_id),
    trainer_id   INTEGER         NOT NULL REFERENCES Trainer(trainer_id),
    session_date DATE            NOT NULL,
    duration     INTEGER         NOT NULL CHECK (duration > 0),
    cost         DECIMAL(10, 2)  NOT NULL CHECK (cost >= 0.00),
    UNIQUE (member_id, trainer_id, session_date)
);
