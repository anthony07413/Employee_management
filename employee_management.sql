-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2025 at 05:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` text NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `user_id`, `start_date`, `end_date`, `reason`, `status`, `created_at`) VALUES
(2, 12, '2025-05-28', '2025-05-29', 'Headache', 'rejected', '2025-05-27 21:49:55'),
(3, 12, '2025-05-28', '2025-05-29', 'Headache', 'approved', '2025-05-27 21:50:18'),
(4, 13, '2025-06-03', '2025-06-04', 'Nothing', 'rejected', '2025-05-27 22:12:17'),
(5, 12, '2024-12-05', '2025-01-11', 'lain akung buot saimo sir', 'approved', '2025-05-27 22:30:13'),
(6, 13, '2025-06-06', '2025-06-07', 'Stomach Ache', 'rejected', '2025-05-28 11:22:12'),
(7, 13, '2025-06-01', '2025-06-02', 'Headache', 'approved', '2025-05-28 11:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `is_read`, `created_at`) VALUES
(1, 1, 'Christian Codilla has submitted a leave request from 2025-06-03 to 2025-06-04.', 0, '2025-05-27 22:12:17'),
(2, 2, 'Christian Codilla has submitted a leave request from 2025-06-03 to 2025-06-04.', 0, '2025-05-27 22:12:17'),
(3, 5, 'Christian Codilla has submitted a leave request from 2025-06-03 to 2025-06-04.', 0, '2025-05-27 22:12:17'),
(4, 8, 'Christian Codilla has submitted a leave request from 2025-06-03 to 2025-06-04.', 0, '2025-05-27 22:12:17'),
(5, 1, 'Nicole Abigail Resuera has submitted a leave request from 2024-12-05 to 2025-01-11.', 1, '2025-05-27 22:30:13'),
(6, 2, 'Nicole Abigail Resuera has submitted a leave request from 2024-12-05 to 2025-01-11.', 1, '2025-05-27 22:30:13'),
(7, 5, 'Nicole Abigail Resuera has submitted a leave request from 2024-12-05 to 2025-01-11.', 0, '2025-05-27 22:30:13'),
(8, 8, 'Nicole Abigail Resuera has submitted a leave request from 2024-12-05 to 2025-01-11.', 0, '2025-05-27 22:30:13'),
(9, 1, 'Christian Codilla has submitted a leave request from 2025-06-06 to 2025-06-07.', 0, '2025-05-28 11:22:12'),
(10, 2, 'Christian Codilla has submitted a leave request from 2025-06-06 to 2025-06-07.', 1, '2025-05-28 11:22:12'),
(11, 5, 'Christian Codilla has submitted a leave request from 2025-06-06 to 2025-06-07.', 0, '2025-05-28 11:22:12'),
(12, 8, 'Christian Codilla has submitted a leave request from 2025-06-06 to 2025-06-07.', 0, '2025-05-28 11:22:12'),
(13, 1, 'Christian Codilla has submitted a leave request from 2025-06-01 to 2025-06-02.', 0, '2025-05-28 11:23:47'),
(14, 2, 'Christian Codilla has submitted a leave request from 2025-06-01 to 2025-06-02.', 1, '2025-05-28 11:23:47'),
(15, 5, 'Christian Codilla has submitted a leave request from 2025-06-01 to 2025-06-02.', 0, '2025-05-28 11:23:47'),
(16, 8, 'Christian Codilla has submitted a leave request from 2025-06-01 to 2025-06-02.', 0, '2025-05-28 11:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('employee','manager') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`) VALUES
(1, 'Anthony Labo', 'acuramanthony@gmail.com', '$2y$10$JwpGlLdCA64ZTdreefV/ZecN93jbwY6bnctoJBW.u4Ut4BRtT7sY.', 'manager'),
(2, 'Undrea Fe Llacuna', 'feundrea@gmail.com', '$2y$10$oI/PDPEMCrZ4m9xzbZ2ifOOh5XpG6g4EZXlH6tCxHJ1AZy8K8tSYa', 'manager'),
(3, 'Jhamaica Opura', '128836120274soco@gmail.com', '$2y$10$TPlifu5snj57wPV4xwvBmeLsZcjMKoQsA6kknZBIjxdbAw.Bos5bO', 'employee'),
(4, 'Danilo Damalerio', 'damaleriodanilo91@gmail.com', '$2y$10$mwkv0TDH7EY1WBrQFHeOv.tk1L4u3zKB1Oc8Kyuw.m/mejjkU0tEO', 'employee'),
(5, 'Cherylane Paclar', 'cherylanepaclar06@gmail.com', '$2y$10$.ujsjg8m9/3J4EniQ9LBk.IDz8uNlSM2FGi6Fp66OZqvwQUYccOXS', 'manager'),
(6, 'Aisah Bangki', 'aizabangki@gmail.com', '$2y$10$Yn5KakH/1x5.wms1LbRPA.3YymBfew/CDbkskLlpyHDuuASDiYHiG', 'employee'),
(7, 'Charles Phlegmver Morados', 'princecharlzmorados@gmail.com', '$2y$10$e0ti63ha9pq/lMQzHFl/HuLZ0buw8vn9GewOFZOpO1Z0aHAtGWQTe', 'employee'),
(8, 'Rachelle Jane Pateno', 'patenorachellejane@gmail.com', '$2y$10$YawRGR6/YsqdYazVKCOVCe9f.C7.SxCRsZnrioqX06T7zkXGXAeqS', 'manager'),
(9, 'Zielpha Gean Alimbog', 'zielphageanalimbog@gmail.com', '$2y$10$S6liql4g.1R/7fp8YN8ywOhVUmT2SmxFocz70vHURNv1NcRv2r9pC', 'employee'),
(10, 'Paul Christian Ravidas', 'paulsaba125@gmail.com', '$2y$10$ZlPNJQRmSTZmskW7quPY6OregZUEDXBqyAvmvr0biuOcAXa4i5Jgy', 'employee'),
(11, 'Cherry Mae Torrepalma', 'cherrymaetorrepalma@gmail.com', '$2y$10$ZcTbbT7szN6uvKiH/XPc7OSMvP2iMyZQ9V6FD4n1nxZBl08L8Iqui', 'employee'),
(12, 'Nicole Abigail Resuera', 'nicoleabigail@gmail.com', '$2y$10$6FqoRf4Zkh73bPRQ65bWveRLjWVEq1CivX6wYrVZVxCIMPR4YWYQK', 'employee'),
(13, 'Christian Codilla', 'christiancodilla@gmail.com', '$2y$10$SPwaNsRXXeIG/X7TQeaq2ewdEkNo4yCbjDXE0dsdGNHQXCOCZUYBK', 'employee'),
(14, 'Novrizkie Kent Dela Cruz', 'novrizkiedelacruz@gmail.com', '$2y$10$JxHPyIKcGrzerVkP7.eUKepWvISJRYG/ERYrSGO9L2S4KZ4e3Lf0G', 'employee'),
(15, 'Janice Tabaco', 'janicetabaco@gmail.com', '$2y$10$s7HlVb0d/7WnK0doAE2M8.3okgkLpCanGc2wCITBuEJXvn4GCeBo6', 'employee'),
(16, 'Vea Dalangin', 'veadalangin@gmail.com', '$2y$10$vJJGDhnQROCUCFbhh5x24eXbQiVKZsnMwpkr.9cjkKG3ZXCyo/f6e', 'employee');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `leave_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
