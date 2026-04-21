-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2026 at 06:04 AM
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
-- Database: `ulab_lab_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `name`, `description`, `quantity`, `image_path`) VALUES
(11, 'keybord', 'vlo nh', 12, 'C:\\Users\\User\\OneDrive\\Documents\\Bony\\Document (1).docx');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `target_role` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_requests`
--

CREATE TABLE `password_reset_requests` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `role` enum('Student','Lab Admin') NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests_reports`
--

CREATE TABLE `requests_reports` (
  `id` int(11) NOT NULL,
  `type` enum('REQUEST','REPORT') NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `room_no` varchar(50) DEFAULT NULL,
  `equipment_name` varchar(120) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'PENDING',
  `eta` varchar(100) DEFAULT NULL,
  `cancel_reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requests_reports`
--

INSERT INTO `requests_reports` (`id`, `type`, `student_id`, `email`, `department`, `room_no`, `equipment_name`, `description`, `status`, `eta`, `cancel_reason`, `created_at`) VALUES
(6, 'REQUEST', '243014201', 'bony@ulab.edu.bd', 'CSE', '211', NULL, 'mouse problem', 'APPROVED', '44', NULL, '2026-04-07 05:43:44'),
(7, 'REPORT', '2222', 'dewan.cse@ulab.edu.bd', 'CSE', 'PB105', NULL, '1. dththddh\n2. thdtmhdth dttd', 'CANCELLED', 'done', 'hoie jabe', '2026-04-07 06:07:11'),
(8, 'REPORT', '243014201', 'bony@ulab.edu.bd', 'CSE', 'PB207', NULL, 'xxxxx', 'APPROVED', '1', NULL, '2026-04-09 18:31:21'),
(9, 'REPORT', '223014076', 'munna.cse@ulab.edu.bd', 'CSE', 'pd104', NULL, 'mouse problem', 'PENDING', NULL, NULL, '2026-04-16 18:08:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `student_id` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('Student','Lab Admin','System Admin') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `restricted_until` datetime DEFAULT NULL,
  `password_created_at` timestamp NULL DEFAULT NULL,
  `must_change_password` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `student_id`, `department`, `password`, `role`, `created_at`, `is_blocked`, `restricted_until`, `password_created_at`, `must_change_password`) VALUES
(9, 'Munna', 'munna.cse@ulab.edu.bd', '223014076', 'CSE', '12345678', 'Student', '2026-04-06 19:44:08', 0, NULL, NULL, 0),
(10, 'Bony', 'bony@ulab.edu.bd', '243014201', 'CSE', '1122', 'Lab Admin', '2026-04-07 05:40:07', 0, NULL, NULL, 0),
(11, 'Akhi', 'Akhi@ulab.edu.bd', '234566', 'CSE', '2444', 'System Admin', '2026-04-07 05:56:40', 0, NULL, NULL, 0),
(12, 'Dewan', 'dewan.cse@ulab.edu.bd', '2222', 'CSE', '123456789', 'System Admin', '2026-04-07 06:03:37', 0, NULL, NULL, 0),
(14, 'pony', 'pony@ulab.edu.bd', NULL, NULL, '1112', 'System Admin', '2026-04-09 18:26:40', 0, NULL, NULL, 1),
(15, 'fatema', 'fatema.bba@ulab.edu.bd', '2230140', 'CSE', '12', 'Student', '2026-04-16 14:40:59', 0, NULL, NULL, 0),
(16, 'babu', 'babu.bba@ulab.edu.bd', '222', 'EEE', '123', 'System Admin', '2026-04-16 17:40:40', 0, NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_requests`
--
ALTER TABLE `password_reset_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests_reports`
--
ALTER TABLE `requests_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD UNIQUE KEY `unique_student_id` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `password_reset_requests`
--
ALTER TABLE `password_reset_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `requests_reports`
--
ALTER TABLE `requests_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
