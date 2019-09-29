-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 29, 2019 at 06:55 AM
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

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `title`, `question`, `answer`, `status`, `created_at`, `updated_at`) VALUES
(1, 'sample', 'question', 'answer', 1, '2019-09-28 01:31:57', '2019-09-28 01:31:57'),
(2, 'sample', 'question', 'answer', 1, '2019-09-28 01:34:31', '2019-09-28 01:34:31'),
(3, 'sample', 'question', 'answer', 1, '2019-09-28 01:41:15', '2019-09-28 01:41:15'),
(4, 'sample', 'question', 'answer', 1, '2019-09-28 08:33:13', '2019-09-28 08:33:13'),
(5, 'sample', 'question', 'answer', 1, '2019-09-28 08:33:31', '2019-09-28 08:33:31'),
(6, 'sample', 'question', 'answer', 1, '2019-09-28 08:34:03', '2019-09-28 08:34:03'),
(7, 'sample', '', '', 1, '2019-09-28 08:44:36', '2019-09-28 08:44:36'),
(8, 'sample', '', '', 1, '2019-09-28 08:51:11', '2019-09-28 08:51:11'),
(9, 'sample', '', '', 1, '2019-09-28 08:51:57', '2019-09-28 08:51:57'),
(10, 'sample', '', '', 1, '2019-09-28 08:52:23', '2019-09-28 08:52:23'),
(11, 'sample', '', '', 1, '2019-09-28 08:54:32', '2019-09-28 08:54:32');

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

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `title`, `description`, `category`, `filename`, `folder_name`, `deleted`, `status`) VALUES
(35, 'title 2', 'sample 2', 2, '0CiBU5KHu265.png', '1sZq38oLriK4', 0, 1),
(36, 'title 1', 'sample 1', 2, '7oV1HINIHd6V.png', '1sZq38oLriK4', 0, 1),
(37, NULL, NULL, 1, 'GhfVB3girH8u.png', 'jMpNrJdJqkHH', 0, 1),
(38, NULL, NULL, 1, 'WVTnNb8vwFxr.png', '4OdtXywtFEto', 0, 1),
(39, NULL, NULL, 1, 'wpsP9wHaNngu.png', 'Rgxoetl2w1bQ', 0, 1),
(40, NULL, NULL, 1, 'Q8wGYNBXWsNn.png', 'DZ7yPvmkHDTk', 0, 1),
(43, NULL, NULL, 1, 'lXvPhJc4N4N3.png', 'TDpOG7tFHOSH', 0, 1),
(44, 'title 1', 'sample 1', 2, 'rC9yEsZkkHxn.png', '7djQrOawLIvD', 0, 1),
(45, 'title 2', 'sample 2', 2, 'qPiAn2QjKqMn.png', '7djQrOawLIvD', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `thumbnail` int(11) DEFAULT NULL,
  `banner` int(11) DEFAULT NULL,
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
  `type` tinyint(1) NOT NULL,
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

--
-- Dumping data for table `process`
--

INSERT INTO `process` (`id`, `name`, `slug`, `description`, `banner`, `created_at`, `status`, `updated_at`) VALUES
(5, 'Sample Process 1', 'sample-process-1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 40, '2019-09-29 12:08:31', 1, '2019-09-29 12:08:31'),
(8, 'Sample Process 2', 'sample-process-2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 43, '2019-09-29 12:10:31', 1, '2019-09-29 12:10:31');

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

--
-- Dumping data for table `process_steps`
--

INSERT INTO `process_steps` (`id`, `process_id`, `image_id`, `step`, `status`, `deleted`, `created_at`, `updated_at`) VALUES
(25, 5, 45, 2, 1, 0, '2019-09-29 12:17:25', '2019-09-29 12:17:25'),
(26, 5, 44, 1, 1, 0, '2019-09-29 12:17:25', '2019-09-29 12:17:25');

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
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `process_steps`
--
ALTER TABLE `process_steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
