# 🏋️‍♂️ Gym Membership System – SQL Project  

## 📌 Overview  
The **Gym Membership System** is a SQL-based database project designed to streamline and automate the core operations of a gym. It centralizes all gym-related information, ensuring accuracy, efficiency and automation in managing **members, trainers, subscriptions, payments, classes, attendance, equipment and feedback**.  

This project demonstrates complete **database design, implementation, and querying** using SQL.  


## 🎯 Objectives  
- Simplify **member and trainer management**.  
- Automate **subscriptions and payments**.  
- Track **attendance, classes and equipment usage**.  
- Maintain **structured and accurate records**.  
- Provide **queries and reports** for decision-making.  


## 🗄️ Database Design  

### **Entities / Tables (11 total)**  
1. **Members** – personal details of gym members.  
2. **Trainers** – trainer info & specialization.  
3. **Membership Plans** – plan name, duration, price.  
4. **Subscriptions** – plan assignment & status.  
5. **Payments** – payment history & methods.  
6. **Attendance** – member participation in classes.  
7. **Equipment** – equipment details, condition, quantity.  
8. **Classes** – class name, trainer, schedule & day.  
9. **Feedback** – member ratings & comments for trainers.  
10. **Trainer Schedule** – trainer availability & timings.  
11. **Admins** – admin login credentials & contact info.  

📌 Includes **Primary Keys, Foreign Keys, Constraints (CHECK, UNIQUE, NOT NULL), Views, Joins, Aggregations and Advanced Queries**.  


## 🛠️ Technologies Used  
- **SQL** (DDL, DML, Joins, Views, Constraints)  
- **MySQL** (compatible with any SQL RDBMS)  
- **ER Diagram** (visual representation of entities & relationships)  


## 📂 Features Implemented  
- Create and manage gym **members & trainers**.  
- Define **membership plans** with duration & pricing.  
- Track **subscriptions** with start/end date and status.  
- Record **payments** (Cash, Card, UPI).  
- Maintain **equipment inventory** and condition.  
- Manage **classes, schedules and attendance**.  
- Collect **feedback** with ratings & comments.  
- Generate **reports** using SQL queries.  


## 📝 Sample Queries  

### 1. List members with their enrolled class:  
    ```sql
    SELECT M.first_name, M.last_name, C.class_name
    FROM Members M

### 2. Count members in each class:
    ```sql
    SELECT C.class_name, COUNT(A.member_id) AS total_members
    FROM Classes C
    LEFT JOIN Attendance A ON C.class_id = A.class_id
    GROUP BY C.class_name;

### 3. Top 3 members with highest total payments:
    ```sql
    SELECT M.first_name, M.last_name, SUM(P.amount) AS total_payment
    FROM Members M
    JOIN Subscriptions S ON M.member_id = S.member_id
    JOIN Payments P ON S.subscription_id = P.subscription_id
    GROUP BY M.member_id
    ORDER BY total_payment DESC
    LIMIT 3;


## 🚀 Future Enhancements

- Integration with web & mobile applications.
- Real-time notifications for payments and schedules.
- Analytics dashboard for admins & trainers.
- Biometric / RFID-based attendance tracking.
- Support for multi-branch gym networks.


## 👨‍💻 Author

- Thamizh Jaisankar
- 📧 thamizhjaisankar@gmail.com
- 🔗 [Portfolio](https://portfolio-fawn-beta-24.vercel.app/) | [GitHub](https://github.com/Thamizhjaisankar-git) | [LinkedIn](https://www.linkedin.com/in/thamizhjaisankar/)
