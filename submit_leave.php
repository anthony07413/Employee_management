<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'employee') {
  header("Location: login.php");
  exit;
}

include 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $user_id = $_SESSION['user_id'];
  $start_date = $_POST['start_date'] ?? '';
  $end_date = $_POST['end_date'] ?? '';
  $reason = $_POST['reason'] ?? '';

  if ($start_date && $end_date && $reason) {
    // Insert leave request
    $stmt = $conn->prepare("INSERT INTO leave_requests (user_id, start_date, end_date, reason, status, created_at) VALUES (?, ?, ?, ?, 'pending', NOW())");
    $stmt->bind_param("isss", $user_id, $start_date, $end_date, $reason);
    $stmt->execute();
    $leave_id = $conn->insert_id; // Get the ID of the newly inserted leave request

    // Get employee name
    $stmt = $conn->prepare("SELECT name FROM users WHERE id = ?");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $employee = $result->fetch_assoc();
    $employee_name = $employee['name'];

    // Create notification for all managers
    $stmt = $conn->prepare("SELECT id FROM users WHERE role = 'manager'");
    $stmt->execute();
    $result = $stmt->get_result();
    
    $message = "$employee_name has submitted a leave request from $start_date to $end_date.";
    while ($manager = $result->fetch_assoc()) {
      $manager_id = $manager['id'];
      $stmt = $conn->prepare("INSERT INTO notifications (user_id, message, created_at) VALUES (?, ?, NOW())");
      $stmt->bind_param("is", $manager_id, $message);
      $stmt->execute();
    }
  }
}

header("Location: employee_dashboard.php");
exit;
?>