# Hospital Patient Flow & Emergency Analytics

## 📌 Project Overview

Hospital Patient Flow & Emergency Analytics is a MySQL-based data analytics project designed to manage and analyze hospital operations.

The project models real-world hospital data such as patients, doctors, departments, appointments, emergency cases, admissions, and treatments. SQL queries are used to generate insights that can help understand patient flow, emergency workload, departmental admissions, treatment costs, and hospital operations.

## 🎯 Objectives

* Manage hospital information using a relational database.
* Analyze patient and emergency data using SQL.
* Understand departmental workload and admission patterns.
* Analyze emergency severity and waiting times.
* Identify treatment cost patterns.
* Generate useful reports using SQL queries.

## 🛠️ Technologies Used

* MySQL
* SQL
* MySQL Workbench

## 🗄️ Database Structure

The database contains seven related tables:

* `patient` — Stores patient information.
* `department` — Stores hospital department information.
* `doctor` — Stores doctor details and specializations.
* `appointment` — Stores patient appointments with doctors.
* `emergency` — Stores emergency cases, severity, waiting time, and outcomes.
* `admission` — Stores patient admission and discharge information.
* `treatment` — Stores treatments provided by doctors and their costs.

## 🔗 Table Relationships

```text
Patient
   │
   ├── Appointment ─── Doctor ─── Department
   │
   ├── Emergency
   │
   ├── Admission ─── Department
   │
   └── Treatment ─── Doctor
```

Primary keys and foreign keys are used to maintain relationships between the tables.

## 📊 SQL Concepts Demonstrated

The project demonstrates:

* SELECT
* WHERE
* ORDER BY
* COUNT()
* SUM()
* AVG()
* GROUP BY
* HAVING
* JOIN
* CASE statements
* Subqueries
* DATEDIFF()
* Primary Keys
* Foreign Keys

## 🔍 Key Analysis Performed

The project answers practical hospital-related questions such as:

* How many patients are registered?
* How are patients distributed by gender and city?
* How many emergency cases occur at each severity level?
* What is the average emergency waiting time?
* Which departments have the highest number of admissions?
* Which patients are currently admitted?
* What is the average hospital stay?
* Which treatments cost more than the average treatment cost?
* Which doctors have performed the most treatments?

## 📁 Project Files

```text
Hospital-Patient-Flow-Analytics/
│
├── hospital_patient_flow_analytics.sql
└── README.md
```

## 🚀 How to Run

1. Install MySQL and MySQL Workbench.
2. Open `hospital_patient_flow_analytics.sql`.
3. Execute the database and table creation statements.
4. Insert the sample hospital data.
5. Run the analysis queries to generate hospital insights.

## 💡 Project Outcome

The project demonstrates how relational databases and SQL can be used to transform hospital operational data into meaningful analytical information for decision-making.
