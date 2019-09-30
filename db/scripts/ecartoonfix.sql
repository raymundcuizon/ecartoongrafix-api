-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 30, 2019 at 05:24 AM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.2.22-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecartoonfix`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `contact_name` varchar(100) NOT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `project_name` varchar(100) DEFAULT NULL,
  `license` varchar(100) NOT NULL,
  `illustration_usage` varchar(100) NOT NULL,
  `client_type` varchar(100) NOT NULL,
  `final_graphic` varchar(100) NOT NULL,
  `deadline` varchar(100) NOT NULL,
  `project_about` text NOT NULL,
  `cps_background` text NOT NULL,
  `budget` float DEFAULT NULL,
  `project_usage` text,
  `targe_audience` text,
  `colors` text,
  `look_feel` text,
  `font_lettering` text,
  `etc` text,
  `reference_photos` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `category` int(11) DEFAULT NULL,
  `filename` varchar(100) NOT NULL,
  `folder_name` varchar(100) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `status` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text,
  `thumbnail` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_images`
--

CREATE TABLE `portfolio_images` (
  `id` int(11) NOT NULL,
  `portfolio_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `process`
--

CREATE TABLE `process` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text,
  `banner` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `process_steps`
--

CREATE TABLE `process_steps` (
  `id` int(11) NOT NULL,
  `process_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `step` tinyint(2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'admin', '$2a$10$fIWcgo792jGWqldUmcDDi.D6QKBb.LFSoZ3IQlDVTe8sZysJvO6i.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `portfolio_images`
--
ALTER TABLE `portfolio_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `process_steps`
--
ALTER TABLE `process_steps`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `portfolio_images`
--
ALTER TABLE `portfolio_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `process`
--
ALTER TABLE `process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `process_steps`
--
ALTER TABLE `process_steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
