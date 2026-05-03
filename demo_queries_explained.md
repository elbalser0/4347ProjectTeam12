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

## Query 4: Revenue Breakdown by Membership Plan (January 2025)

**What it does:**
Joins the MembershipPlan, Member, and Payment tables to calculate the total number of membership payments made in January 2025 for each plan. It then multiplies that count by the plan's price to derive total revenue per plan.

**Why it matters:**
Shows exactly how much each membership tier contributed to revenue during the month. By isolating payment_type = 'Membership' and filtering to January 2025, it gives a focused monthly snapshot useful for financial reporting and evaluating which plans are most popular and profitable.
**Tables used:** 'MembershipPlan', 'Member', 'Payment'

---

## Query 5: Weekly Class Schedule (Jan 6–10, 2025)

**What it does:**
Displays the full class schedule for a given week, including the date, time, class name, which room it is in, which trainer is leading it, how many members are currently enrolled, and the total capacity of the class.

**Why it matters:**
This is the most complete operational view in the database. It allows gym managers to see at a glance which classes are filling up, which rooms are in use, and how trainers are allocated across the week. The enrolled vs. capacity column immediately highlights availability.

**Tables used:** `Class`, `Room`, `Trainer`, `Employee`, `ClassEnrollment`
