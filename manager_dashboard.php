<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'manager') {
  header("Location: login.php");
  exit;
}

include 'config.php';

$name = $_SESSION['name'];
$user_id = $_SESSION['user_id'];

// Fetch notifications for the manager
$stmt = $conn->prepare("SELECT id, message, created_at, is_read FROM notifications WHERE user_id = ? ORDER BY created_at DESC");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$notifications_html = '';
$unread_count = 0;
while ($row = $result->fetch_assoc()) {
  $read_class = $row['is_read'] ? 'read' : 'unread';
  if (!$row['is_read']) $unread_count++;
  $notifications_html .= "<div class='notification $read_class'>";
  $notifications_html .= "<p>" . htmlspecialchars($row['message']) . " <span>(" . $row['created_at'] . ")</span></p>";
  if (!$row['is_read']) {
    $notifications_html .= "<button onclick=\"markNotificationRead({$row['id']})\">Mark as Read</button>";
  }
  $notifications_html .= "</div>";
}

// Fetch all leave requests with user info
$sql = "SELECT lr.id, u.name as employee_name, lr.start_date, lr.end_date, lr.reason, lr.status, lr.created_at
        FROM leave_requests lr
        JOIN users u ON lr.user_id = u.id
        ORDER BY lr.created_at DESC";

$result = $conn->query($sql);

$rows_html = '';
while ($row = $result->fetch_assoc()) {
  $status_class = 'status-' . strtolower($row['status']);
  $actions = '';
  if ($row['status'] === 'pending') {
    $actions = "
    <button onclick=\"confirmAction('approve', {$row['id']})\">Approve</button>
    <button onclick=\"confirmAction('reject', {$row['id']})\">Reject</button>";
  }
  $rows_html .= "<tr>
    <td>" . htmlspecialchars($row['employee_name']) . "</td>
    <td>{$row['start_date']}</td>
    <td>{$row['end_date']}</td>
    <td>" . htmlspecialchars($row['reason']) . "</td>
    <td class=\"$status_class\">" . ucfirst($row['status']) . "</td>
    <td>{$row['created_at']}</td>
    <td>$actions</td>
  </tr>";
}

// Load template
ob_start();
include 'templates/manager_dashboard.html';
$html = ob_get_clean();

$html = str_replace('<!-- MANAGER NAME -->', htmlspecialchars($name), $html);
$html = str_replace('<!-- LEAVE REQUEST ROWS -->', $rows_html, $html);
$html = str_replace('<!-- NOTIFICATIONS -->', $notifications_html, $html);
$html = str_replace('<!-- UNREAD_COUNT -->', $unread_count, $html);

echo $html;
?>