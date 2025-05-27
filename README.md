Group Member:
1. Rachelle Jane Pateno
2. Cherry Mae Torrepalma
3. Cherylane Paclar
4. Anthony Labo
5. Undrea Fe Llacuna
6. Paul Christian Ravidas
7. Zielpha Gean Alimbog
8. Aisah Bangki
9. Jhamaica Opura
10. Janice Tabaco
11. Vea Dalangin
12. Nicole Abigail Resuera
13. Christian Codilla
14. Novrizkie Kent Dela Cruz
15. Danilo Damalerio
16. Charles Phlegmver Morados


# Employee Leave Management System

The **Employee Leave Management System** is a web-based application built using **PHP**, **MySQL**, **HTML**, **CSS**, and **JavaScript**. It allows employees to request leaves, managers to review and manage those requests, and generate summary reports. This system provides a modular and user-friendly interface, supports role-based access, and ensures proper leave management in an organization.

---

## 📌 Features

### 🔐 Authentication
- **Login / Logout system** for both employees and managers.
- Secure session handling.
- Role-based redirection after login.

### 👤 Employee Module
- Submit leave requests by selecting start and end dates with reasons.
- View status of all submitted leave requests (Pending, Approved, Rejected).
- Dynamic feedback and form validation using JavaScript.

### 🧑‍💼 Manager Module
- View all leave requests submitted by employees.
- Approve or Reject pending requests directly from the dashboard.
- Generate leave request summary report (Approved, Rejected, Pending counts).

### 📊 Reports
- Generate real-time summaries of all leave requests.
- Segregate leave statuses for efficient HR management.

---

## 🗂️ Project Structure

employee-management-system/
│
├── css/
│ └── styles.css # Shared styling across all pages
│
├── js/
│ └── scripts.js # Client-side validation and confirmation
│
├── templates/
│ ├── employee_dashboard.html
│ ├── manager_dashboard.html
│ ├── login.html
│ ├── signup.html
│ └── report.html
│
├── config.php # Database connection file
├── employee_dashboard.php # Backend logic for employee dashboard
├── manager_dashboard.php # Backend logic for manager dashboard
├── login.php # Handles user authentication
├── logout.php # Ends session and logs out user
├── process_leave.php # Processes leave approval/rejection by manager
├── report.php # Displays leave summary report
├── signup.php # Handles user registration
├── submit_leave.php # Handles leave form submission
└── README.md # Project documentation

yaml
Copy
Edit

---

## 🛠️ Technologies Used

- **Frontend**: HTML, CSS, JavaScript
- **Backend**: PHP
- **Database**: MySQL (via XAMPP)
- **Session Management**: PHP Sessions

---

## ⚙️ Functional Overview

### HTML Templates
- Used for consistent rendering of views (`login.html`, `employee_dashboard.html`, etc.).
- Populated dynamically with PHP using `str_replace()` and output buffering (`ob_start()`).

### CSS
- Shared stylesheet (`styles.css`) provides layout, colors, form, and table styles for responsive and clean design.

### JavaScript
- Form validation for leave dates.
- Confirmation popups for approving/rejecting requests.

### PHP Scripts
- Modular scripts like `employee_dashboard.php`, `login.php`, `manager_dashboard.php`, etc., control page logic, form handling, and interaction with the MySQL database.

---

## 🧪 How to Run

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/employee-management-system.git
Set up the Environment:

Install XAMPP.

Move the project folder to htdocs.

Start Apache and MySQL in XAMPP.

Create Database:

Create a database employee_management.

Import the SQL schema (schema.sql not included in this snippet).

Run in Browser:

Navigate to http://localhost/employee-management-system/login.php.

🧩 Database Tables (Suggested Schema)
users

leave_requests

id	user_id	start_date	end_date	reason	status	created_at

🔐 Security Notes
Use password_hash() and password_verify() in production for secure password storage.

Always sanitize user input to prevent SQL Injection (prepared statements are used here).

Properly manage sessions to avoid unauthorized access.

🚀 Future Improvements
Add pagination for large number of leave requests.

Email notifications for leave approvals/rejections.

Export reports to PDF or Excel.

Dashboard analytics and charts.
