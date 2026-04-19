
-- ============================================
-- PROJECT: Hospital Analysis
-- GOAL: Analyze hospital performance in Pakistan
-- ============================================

-- Step 1: Create and select database
CREATE DATABASE hospital_analysis;
USE hospital_analysis;

-- Step 2: Create doctors table
-- Stores all doctor information
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,      -- Unique ID for each doctor
    doctor_name VARCHAR(100),        -- Name of doctor
    department VARCHAR(50),          -- Which department they work in
    experience_years INT,            -- How many years of experience
    salary DECIMAL(10,2)            -- Monthly salary
);

-- Step 3: Create patients table
-- Stores all patient information
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,      -- Unique ID for each patient
    patient_name VARCHAR(100),       -- Name of patient
    age INT,                         -- Age of patient
    disease VARCHAR(100),            -- Disease diagnosed
    department VARCHAR(50),          -- Which department they visited
    doctor_id INT,                   -- Which doctor treated them
    visit_date DATE,                 -- Date of visit
    satisfaction_rating INT,         -- Patient rating 1 to 5
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Step 4: Insert doctor data
-- 10 doctors from different departments
INSERT INTO doctors VALUES
(1, 'Dr. Ahmed Khan', 'Cardiology', 15, 250000.00),
(2, 'Dr. Fatima Ali', 'Neurology', 12, 230000.00),
(3, 'Dr. Usman Malik', 'Orthopedics', 8, 200000.00),
(4, 'Dr. Ayesha Raza', 'Pediatrics', 10, 210000.00),
(5, 'Dr. Bilal Hassan', 'Cardiology', 20, 280000.00),
(6, 'Dr. Sana Tariq', 'Neurology', 6, 180000.00),
(7, 'Dr. Kamran Shah', 'Orthopedics', 14, 220000.00),
(8, 'Dr. Nadia Qureshi', 'Pediatrics', 9, 205000.00),
(9, 'Dr. Zubair Ahmed', 'Cardiology', 18, 260000.00),
(10, 'Dr. Hira Baig', 'Neurology', 5, 170000.00);

-- Step 5: Insert patient data
-- 25 patients across different departments
INSERT INTO patients VALUES
(1, 'Ali Hassan', 45, 'Heart Disease', 'Cardiology', 1, '2024-01-05', 5),
(2, 'Sara Khan', 32, 'Migraine', 'Neurology', 2, '2024-01-07', 4),
(3, 'Ahmed Raza', 55, 'Knee Pain', 'Orthopedics', 3, '2024-01-09', 4),
(4, 'Fatima Malik', 8, 'Fever', 'Pediatrics', 4, '2024-01-11', 5),
(5, 'Usman Ali', 60, 'Heart Attack', 'Cardiology', 5, '2024-01-13', 5),
(6, 'Ayesha Tariq', 28, 'Epilepsy', 'Neurology', 6, '2024-01-15', 3),
(7, 'Bilal Shah', 48, 'Fracture', 'Orthopedics', 7, '2024-01-17', 4),
(8, 'Nadia Hassan', 5, 'Cold', 'Pediatrics', 8, '2024-01-19', 5),
(9, 'Kamran Ahmed', 52, 'Chest Pain', 'Cardiology', 9, '2024-01-21', 4),
(10, 'Hira Qureshi', 35, 'Headache', 'Neurology', 10, '2024-01-23', 3),
(11, 'Zubair Khan', 42, 'Heart Disease', 'Cardiology', 1, '2024-02-02', 5),
(12, 'Sana Ali', 29, 'Migraine', 'Neurology', 2, '2024-02-06', 4),
(13, 'Tariq Malik', 63, 'Joint Pain', 'Orthopedics', 3, '2024-02-10', 3),
(14, 'Amna Raza', 6, 'Flu', 'Pediatrics', 4, '2024-02-14', 5),
(15, 'Imran Shah', 57, 'Chest Pain', 'Cardiology', 5, '2024-02-18', 4),
(16, 'Rabia Hassan', 33, 'Epilepsy', 'Neurology', 6, '2024-02-22', 3),
(17, 'Danish Ahmed', 44, 'Fracture', 'Orthopedics', 7, '2024-02-26', 4),
(18, 'Maryam Tariq', 4, 'Fever', 'Pediatrics', 8, '2024-03-02', 5),
(19, 'Faisal Khan', 49, 'Heart Attack', 'Cardiology', 9, '2024-03-06', 5),
(20, 'Lubna Ali', 38, 'Headache', 'Neurology', 10, '2024-03-10', 4),
(21, 'Asad Malik', 51, 'Heart Disease', 'Cardiology', 1, '2024-03-14', 5),
(22, 'Huma Shah', 7, 'Cold', 'Pediatrics', 4, '2024-03-18', 5),
(23, 'Waqar Hassan', 46, 'Knee Pain', 'Orthopedics', 7, '2024-03-22', 4),
(24, 'Sadia Ahmed', 31, 'Migraine', 'Neurology', 2, '2024-03-26', 4),
(25, 'Rashid Khan', 58, 'Chest Pain', 'Cardiology', 5, '2024-03-30', 5);

-- ============================================
-- ANALYSIS QUERIES
-- ============================================

-- Query 1: Are patients satisfied with our service?
-- AVG calculates average satisfaction rating per department
-- COUNT counts total patients per department
-- This shows which department patients love the most
SELECT 
    department,
    COUNT(patient_id) AS total_patients,
    AVG(satisfaction_rating) AS avg_satisfaction
FROM patients
GROUP BY department
ORDER BY avg_satisfaction DESC;

-- Query 2: How is our staff performing?
-- COUNT counts how many patients each doctor handled
-- AVG calculates their average patient satisfaction
-- JOIN connects doctors and patients tables using doctor_id
SELECT 
    d.doctor_name,
    d.department,
    d.experience_years,
    COUNT(p.patient_id) AS total_patients,
    AVG(p.satisfaction_rating) AS avg_satisfaction
FROM doctors d
JOIN patients p
    ON d.doctor_id = p.doctor_id
GROUP BY d.doctor_name, d.department, d.experience_years
ORDER BY avg_satisfaction DESC;

-- Query 3: What diseases are we treating the most?
-- COUNT counts how many patients have each disease
-- This shows which diseases are most common
-- Helps hospital prepare resources accordingly
SELECT 
    disease,
    COUNT(patient_id) AS total_cases,
    AVG(satisfaction_rating) AS avg_satisfaction
FROM patients
GROUP BY disease
ORDER BY total_cases DESC;