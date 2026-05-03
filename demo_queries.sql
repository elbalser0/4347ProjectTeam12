-- Iron District Gym — Live Demo Queries
-- CS 4347 Project Part 2  |  Team 12


-- Query 1: Member Count by Status
SELECT membership_status, COUNT(*) AS total
FROM Member
GROUP BY membership_status
ORDER BY total DESC;


-- Query 2: Trainer Roster
SELECT e.first_name || ' ' || e.last_name AS trainer,
       t.specialization
FROM Trainer t
JOIN Employee e ON t.employee_id = e.employee_id
ORDER BY e.last_name;


-- Query 3: Class Enrollments (Members + Classes + Trainers)
SELECT m.first_name || ' ' || m.last_name AS member,
       c.class_name,
       c.schedule_date,
       e.first_name || ' ' || e.last_name AS trainer
FROM ClassEnrollment ce
JOIN Member m    ON ce.member_id  = m.member_id
JOIN Class c     ON ce.class_id   = c.class_id
JOIN Trainer t   ON c.trainer_id  = t.trainer_id
JOIN Employee e  ON t.employee_id = e.employee_id
ORDER BY c.schedule_date, c.schedule_time
LIMIT 20;


-- Query 4: Revenue Breakdown by Payment Type
SELECT payment_type,
       COUNT(*)              AS transactions,
       SUM(amount)           AS total_revenue,
       ROUND(AVG(amount), 2) AS avg_amount
FROM Payment
GROUP BY payment_type
ORDER BY total_revenue DESC;


-- Query 5: Weekly Class Schedule (Jan 6–10, 2025)
SELECT c.schedule_date,
       c.schedule_time,
       c.class_name,
       r.room_name,
       e.first_name || ' ' || e.last_name AS trainer,
       COUNT(ce.enrollment_id)             AS enrolled,
       c.capacity
FROM Class c
JOIN Room r                  ON c.room_id    = r.room_id
JOIN Trainer t               ON c.trainer_id = t.trainer_id
JOIN Employee e              ON t.employee_id = e.employee_id
LEFT JOIN ClassEnrollment ce ON c.class_id   = ce.class_id
WHERE c.schedule_date BETWEEN '2025-01-06' AND '2025-01-10'
GROUP BY c.class_id, c.schedule_date, c.schedule_time,
         c.class_name, r.room_name, e.first_name, e.last_name, c.capacity
ORDER BY c.schedule_date, c.schedule_time;
