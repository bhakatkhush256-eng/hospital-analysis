# 🏥 Hospital Analysis Project (SQL)

![Project Banner](https://img.shields.io/badge/Project-Hospital%20Analysis-blue?style=for-the-badge)

![SQL](https://img.shields.io/badge/Language-SQL-orange?style=for-the-badge)


---

## 📌 Overview

This project analyzes hospital performance data using **SQL**. It focuses on understanding:

* 🧑‍⚕️ Doctor performance
* 🧑‍🦽 Patient satisfaction
* 🦠 Disease trends

The goal is to simulate a real-world healthcare analytics scenario and extract meaningful insights for decision-making.

---

## 🎯 Objectives

✔ Measure patient satisfaction across departments
✔ Evaluate doctor performance using patient feedback
✔ Identify most common diseases in the hospital
✔ Practice real-world SQL concepts (JOIN, GROUP BY, Aggregations)

---

## 🗄️ Database Structure

### 🧑‍⚕️ Doctors Table

| Column           | Description               |
| ---------------- | ------------------------- |
| doctor_id        | Unique ID for each doctor |
| doctor_name      | Name of doctor            |
| department       | Medical department        |
| experience_years | Years of experience       |
| salary           | Monthly salary            |

---

### 🧑‍🦽 Patients Table

| Column              | Description                |
| ------------------- | -------------------------- |
| patient_id          | Unique ID for each patient |
| patient_name        | Name of patient            |
| age                 | Age of patient             |
| disease             | Diagnosed disease          |
| department          | Department visited         |
| doctor_id           | Assigned doctor            |
| visit_date          | Date of visit              |
| satisfaction_rating | Rating (1–5)               |

---

## 🔗 Relationships

* Each patient is linked to a doctor via `doctor_id`
* One doctor → Many patients (One-to-Many relationship)

---

## 📊 Analysis & Insights

### ⭐ 1. Patient Satisfaction by Department

```sql
SELECT
    department,
    COUNT(patient_id) AS total_patients,
    AVG(satisfaction_rating) AS avg_satisfaction
FROM patients
GROUP BY department
ORDER BY avg_satisfaction DESC;
```

📈 **Insight:** Identifies which departments provide the best patient experience.

---

### 🧑‍⚕️ 2. Doctor Performance Analysis

```sql
SELECT
    d.doctor_name,
    d.department,
    d.experience_years,
    COUNT(p.patient_id) AS total_patients,
    AVG(p.satisfaction_rating) AS avg_satisfaction
FROM doctors d
JOIN patients p ON d.doctor_id = p.doctor_id
GROUP BY d.doctor_name, d.department, d.experience_years
ORDER BY avg_satisfaction DESC;
```

📈 **Insight:** Shows top-performing doctors based on workload and patient feedback.

---

### 🦠 3. Disease Distribution Analysis

```sql
SELECT
    disease,
    COUNT(patient_id) AS total_cases,
    AVG(satisfaction_rating) AS avg_satisfaction
FROM patients
GROUP BY disease
ORDER BY total_cases DESC;
```

📈 **Insight:** Helps identify most common diseases in the hospital.

---

## 🧠 Skills Demonstrated

* 🗃️ Database Design
* 🔗 SQL Joins
* 📊 Aggregation Functions (AVG, COUNT)
* 📌 GROUP BY & ORDER BY
* 🧩 Real-world data modeling

---

## 💼 Business Value

This project helps hospitals:

* Improve patient satisfaction 😊
* Track doctor performance 🧑‍⚕️
* Optimize resource allocation 🏥
* Understand disease patterns 🦠

---

## 👨‍💻 Author

**Khushi**
Data Analyst 📊
Skills: SQL | Excel | Python  | Power BI 

---

