# Iron District Gym — Demo Query Explanations
CS 4347 Project Part 2 | Team 12

---

## Query 1: Member Count by Status

**What it does:**
Counts how many members fall into each membership status category (Active, Cancelled, Expired, Paused). Results are sorted from highest to lowest count.

**Why it matters:**
This gives an at-a-glance snapshot of the gym's membership health. For example, seeing 43 out of 50 members as Active shows strong retention and is a key business metric for investors.

**Tables used:** `Member`

---

## Query 2: Trainer Roster

**What it does:**
Lists every trainer at the gym along with their area of specialization. Trainer names are pulled by joining the Trainer table with the Employee table, since trainers are a subtype of employee.

**Why it matters:**
Demonstrates the gym's range of expertise — from Strength Training and CrossFit to Yoga and Zumba. Shows that the database tracks staff roles and specializations in a structured way.

**Tables used:** `Trainer`, `Employee`

---

## Query 3: Class Enrollments

**What it does:**
Shows which members are enrolled in which classes and who is teaching them. Connects four tables together to produce a unified view of member, class, date, and trainer.

**Why it matters:**
This is the core operational query of the gym — it answers "who is showing up, to what class, and with which trainer." It demonstrates the relational power of the database by linking Members, Classes, Trainers, and Employees in a single result.

**Tables used:** `ClassEnrollment`, `Member`, `Class`, `Trainer`, `Employee`

---

## Query 4: Revenue Breakdown by Payment Type

**What it does:**
Groups all payment records by type (Membership, Personal Training, Fee, Adjustment) and calculates the total number of transactions, total revenue, and average payment amount for each category.

**Why it matters:**
Shows exactly where the gym's money comes from. Membership payments make up the bulk of revenue ($4,289), while Personal Training sessions add a significant secondary income stream ($1,125). This kind of aggregate analysis is essential for financial reporting and business planning.

**Tables used:** `Payment`

---

## Query 5: Weekly Class Schedule (Jan 6–10, 2025)

**What it does:**
Displays the full class schedule for a given week, including the date, time, class name, which room it is in, which trainer is leading it, how many members are currently enrolled, and the total capacity of the class.

**Why it matters:**
This is the most complete operational view in the database. It allows gym managers to see at a glance which classes are filling up, which rooms are in use, and how trainers are allocated across the week. The enrolled vs. capacity column immediately highlights availability.

**Tables used:** `Class`, `Room`, `Trainer`, `Employee`, `ClassEnrollment`
