CREATE DATABASE hospital_analytics;
show databases;
USE hospital_analytics;
CREATE TABLE patient(
patient_id int primary key,
patient_name varchar(100),
age int,
gender varchar(10),
city varchar(50)
);
INSERT INTO patient
VALUES
(1, 'Rahul Sharma', 45, 'Male', 'Hyderabad'),
(2, 'Ananya Reddy', 32, 'Female', 'Warangal'),
(3, 'Vikram Rao', 61, 'Male', 'Hyderabad'),
(4, 'Sneha Patel', 27, 'Female', 'Secunderabad'),
(5, 'Arjun Kumar', 54, 'Male', 'Nalgonda'),
(6, 'Meera Reddy', 38, 'Female', 'Hyderabad'),
(7, 'Kiran Das', 67, 'Male', 'Karimnagar'),
(8, 'Priya Sharma', 29, 'Female', 'Warangal'),
(9, 'Rohit Verma', 41, 'Male', 'Hyderabad'),
(10, 'Lakshmi Rao', 73, 'Female', 'Secunderabad');
SELECT * FROM patient;
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
INSERT INTO department
VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(4, 'Pediatrics'),
(5, 'General Medicine'),
(6, 'Emergency');
SELECT * FROM department;
CREATE TABLE doctor (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    department_id INT,
    specialization VARCHAR(100),
    experience_years INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);
INSERT INTO doctor
VALUES
(101, 'Dr. Priya Rao', 1, 'Cardiologist', 12),
(102, 'Dr. Arjun Mehta', 1, 'Cardiologist', 8),
(103, 'Dr. Ravi Kumar', 2, 'Neurologist', 15),
(104, 'Dr. Neha Sharma', 2, 'Neurologist', 7),
(105, 'Dr. Vikram Singh', 3, 'Orthopedic Surgeon', 11),
(106, 'Dr. Anjali Reddy', 4, 'Pediatrician', 9),
(107, 'Dr. Kiran Rao', 5, 'General Physician', 14),
(108, 'Dr. Sneha Patel', 5, 'General Physician', 6),
(109, 'Dr. Rahul Verma', 6, 'Emergency Physician', 10);
SELECT * FROM doctor;
CREATE TABLE appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_status VARCHAR(30),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);
INSERT INTO appointment
VALUES
(1001, 1, 101, '2026-08-01', 'Completed'),
(1002, 2, 107, '2026-08-02', 'Completed'),
(1003, 3, 103, '2026-08-03', 'Completed'),
(1004, 4, 106, '2026-08-04', 'Completed'),
(1005, 5, 105, '2026-08-05', 'Cancelled'),
(1006, 6, 108, '2026-08-06', 'Completed'),
(1007, 7, 103, '2026-08-07', 'Completed'),
(1008, 8, 107, '2026-08-08', 'Completed'),
(1009, 9, 109, '2026-08-09', 'Completed'),
(1010, 10, 101, '2026-08-10', 'Completed'),
(1011, 1, 101, '2026-08-15', 'Completed'),
(1012, 3, 103, '2026-08-16', 'Completed'),
(1013, 6, 108, '2026-08-17', 'Cancelled'),
(1014, 9, 109, '2026-08-18', 'Completed'),
(1015, 2, 107, '2026-08-19', 'Completed');
SELECT * FROM appointment;
SELECT *
FROM appointment
WHERE appointment_status = 'Completed';
SELECT
    p.patient_name,
    d.doctor_name,
    a.appointment_date,
    a.appointment_status
FROM appointment a
JOIN patient p
    ON a.patient_id = p.patient_id
JOIN doctor d
    ON a.doctor_id = d.doctor_id;
CREATE TABLE emergency (
    emergency_id INT PRIMARY KEY,
    patient_id INT,
    arrival_time DATETIME,
    emergency_type VARCHAR(100),
    severity VARCHAR(20),
    waiting_time_minutes INT,
    outcome VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);
INSERT INTO emergency
VALUES
(5001, 1, '2026-08-20 09:15:00', 'Chest Pain', 'Critical', 8, 'Admitted'),
(5002, 2, '2026-08-20 10:30:00', 'High Fever', 'Moderate', 22, 'Treated'),
(5003, 3, '2026-08-20 11:10:00', 'Breathing Difficulty', 'Critical', 5, 'Admitted'),
(5004, 4, '2026-08-21 08:45:00', 'Fracture', 'Moderate', 35, 'Treated'),
(5005, 5, '2026-08-21 12:20:00', 'Severe Headache', 'High', 18, 'Admitted'),
(5006, 6, '2026-08-21 14:05:00', 'Abdominal Pain', 'Moderate', 27, 'Treated'),
(5007, 7, '2026-08-22 16:40:00', 'Chest Pain', 'Critical', 6, 'Admitted'),
(5008, 8, '2026-08-22 18:15:00', 'Allergic Reaction', 'High', 12, 'Treated'),
(5009, 9, '2026-08-23 20:30:00', 'Accident Injury', 'Critical', 10, 'Admitted'),
(5010, 10, '2026-08-24 07:50:00', 'Breathing Difficulty', 'High', 15, 'Admitted');
SELECT * FROM emergency;
SELECT *
FROM emergency
ORDER BY waiting_time_minutes DESC;
SELECT AVG(waiting_time_minutes) AS average_waiting_time
FROM emergency;
SELECT *
FROM emergency
WHERE severity = 'Critical';
SELECT
    p.patient_name,
    e.emergency_type,
    e.severity,
    e.waiting_time_minutes,
    e.outcome
FROM emergency e
JOIN patient p
    ON e.patient_id = p.patient_id;
CREATE TABLE admission (
    admission_id INT PRIMARY KEY,
    patient_id INT,
    department_id INT,
    admission_date DATE,
    discharge_date DATE,
    room_number VARCHAR(20),
    treatment_cost DECIMAL(10,2),
    admission_status VARCHAR(30),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);
INSERT INTO admission
VALUES
(7001, 1, 1, '2026-08-20', '2026-08-24', 'C101', 45000.00, 'Discharged'),
(7002, 3, 2, '2026-08-20', '2026-08-25', 'N205', 62000.00, 'Discharged'),
(7003, 5, 2, '2026-08-21', '2026-08-27', 'N206', 38000.00, 'Admitted'),
(7004, 7, 1, '2026-08-22', '2026-08-26', 'C102', 55000.00, 'Discharged'),
(7005, 9, 6, '2026-08-23', '2026-08-25', 'E301', 28000.00, 'Discharged'),
(7006, 10, 5, '2026-08-24', NULL, 'G105', 22000.00, 'Admitted'),
(7007, 2, 5, '2026-08-20', '2026-08-22', 'G106', 18000.00, 'Discharged'),
(7008, 4, 3, '2026-08-21', '2026-08-23', 'O110', 32000.00, 'Discharged');
SELECT * FROM admission;
SELECT
    AVG(DATEDIFF(discharge_date, admission_date))
    AS average_stay_days
FROM admission
WHERE discharge_date IS NOT NULL;
SELECT
    d.department_name,
    SUM(a.treatment_cost) AS total_cost
FROM admission a
JOIN department d
    ON a.department_id = d.department_id
GROUP BY d.department_name;
SELECT
    p.patient_name,
    a.admission_date,
    a.room_number
FROM admission a
JOIN patient p
    ON a.patient_id = p.patient_id
WHERE a.admission_status = 'Admitted';
CREATE TABLE treatment (
    treatment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    treatment_type VARCHAR(100),
    treatment_date DATE,
    cost DECIMAL(10,2),
    treatment_status VARCHAR(30),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);
INSERT INTO treatment
VALUES
(9001, 1, 101, 'Cardiac Evaluation', '2026-08-20', 12000.00, 'Completed'),
(9002, 3, 103, 'Neurological Assessment', '2026-08-20', 15000.00, 'Completed'),
(9003, 5, 104, 'Migraine Treatment', '2026-08-21', 8500.00, 'Completed'),
(9004, 7, 101, 'Cardiac Monitoring', '2026-08-22', 18000.00, 'Completed'),
(9005, 9, 109, 'Emergency Trauma Care', '2026-08-23', 22000.00, 'Completed'),
(9006, 10, 107, 'Respiratory Treatment', '2026-08-24', 10000.00, 'Ongoing'),
(9007, 2, 107, 'General Health Checkup', '2026-08-20', 5000.00, 'Completed'),
(9008, 4, 105, 'Fracture Treatment', '2026-08-21', 16000.00, 'Completed'),
(9009, 6, 108, 'Abdominal Examination', '2026-08-21', 7500.00, 'Completed'),
(9010, 8, 106, 'Pediatric Consultation', '2026-08-22', 6000.00, 'Completed'),
(9011, 1, 101, 'Follow-up Consultation', '2026-08-24', 4000.00, 'Completed'),
(9012, 3, 103, 'Neurological Follow-up', '2026-08-25', 7000.00, 'Completed');
SELECT * FROM treatment;
SELECT COUNT(*) AS total_patients
FROM patient;
SELECT
    gender,
    COUNT(*) AS patient_count
FROM patient
GROUP BY gender;
SELECT
    city,
    COUNT(*) AS patient_count
FROM patient
GROUP BY city
ORDER BY patient_count DESC;
-- ==========================================
-- BASIC HOSPITAL ANALYTICS
-- ==========================================

-- Admissions by Department
SELECT
    d.department_name,
    COUNT(*) AS total_admissions
FROM admission a
JOIN department d
    ON a.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_admissions DESC;
SELECT
    d.department_name,
    COUNT(*) AS total_admissions,
    SUM(a.treatment_cost) AS total_cost
FROM admission a
JOIN department d
    ON a.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_cost DESC;
SELECT
    d.department_name,
    COUNT(*) AS total_admissions
FROM admission a
JOIN department d
    ON a.department_id = d.department_id
GROUP BY d.department_name
HAVING COUNT(*) > 1
ORDER BY total_admissions DESC;
-- ==========================================
-- CASE & OPERATIONAL CLASSIFICATION
-- ==========================================
SELECT
    emergency_id,
    emergency_type,
    severity,
    CASE
        WHEN severity = 'Critical' THEN 'Immediate Attention'
        WHEN severity = 'High' THEN 'Urgent'
        WHEN severity = 'Moderate' THEN 'Normal'
        ELSE 'Unknown'
    END AS priority_level
FROM emergency;
SELECT
    e.emergency_id,
    p.patient_name,
    e.emergency_type,
    e.severity,
    e.waiting_time_minutes,
    CASE
        WHEN e.severity = 'Critical'
             AND e.waiting_time_minutes > 10
            THEN 'Critical - Delayed'
        WHEN e.severity = 'Critical'
            THEN 'Critical - Prompt'
        WHEN e.waiting_time_minutes > 30
            THEN 'Long Wait'
        ELSE 'Normal'
    END AS emergency_status
FROM emergency e
JOIN patient p
    ON e.patient_id = p.patient_id;
-- ==========================================
-- SUBQUERIES
-- ==========================================
SELECT
    treatment_id,
    treatment_type,
    cost
FROM treatment
WHERE cost > (
    SELECT AVG(cost)
    FROM treatment
);
SELECT
    p.patient_name,
    t.treatment_type,
    t.cost
FROM treatment t
JOIN patient p
    ON t.patient_id = p.patient_id
WHERE t.cost > (
    SELECT AVG(cost)
    FROM treatment
)
ORDER BY t.cost DESC;
SELECT
    d.doctor_name,
    COUNT(t.treatment_id) AS treatment_count
FROM treatment t
JOIN doctor d
    ON t.doctor_id = d.doctor_id
GROUP BY d.doctor_id, d.doctor_name
HAVING COUNT(t.treatment_id) > (
    SELECT AVG(treatment_count)
    FROM (
        SELECT COUNT(*) AS treatment_count
        FROM treatment
        GROUP BY doctor_id
    ) AS doctor_stats
)
ORDER BY treatment_count DESC;