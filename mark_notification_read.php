<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'manager') {
  header("Location: login.php");
  exit;
}

include 'config.php';

if (isset($_GET['id'])) {
  $id = (int)$_GET['id'];
  $user_id = $_SESSION['user_id'];

  // Update notification to mark as read
  $stmt = $conn->prepare("UPDATE notifications SET is_read = 1 WHERE id = ? AND user_id = ?");
  $stmt->bind_param("ii", $id, $user_id);
  $stmt->execute();
}

header("Location: manager_dashboard.php");
exit;
?>