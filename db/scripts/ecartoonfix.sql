-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 05, 2019 at 05:09 AM
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
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'initdata\r\n', NULL, NULL);

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

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `contact_name`, `company_name`, `phone_number`, `website`, `project_name`, `license`, `illustration_usage`, `client_type`, `final_graphic`, `deadline`, `project_about`, `cps_background`, `budget`, `project_usage`, `targe_audience`, `colors`, `look_feel`, `font_lettering`, `etc`, `reference_photos`, `status`, `created_at`) VALUES
(1, '1', '1', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1', 1, '1', '1', '1', '1', '1', '1', '(32,31)', 1, '2019-10-05 03:55:56'),
(2, '1', '1', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1', 1, '1', '1', '1', '1', '1', '1', '(33,34)', 1, '2019-10-05 03:55:59'),
(3, '1', '1', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1', 1, '1', '1', '1', '1', '1', '1', '(35,36)', 1, '2019-10-05 03:56:01'),
(4, '1', '1', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1', 1, '1', '1', '1', '1', '1', '1', '(37,38)', 1, '2019-10-05 03:56:02'),
(5, '1', '1', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1', 1, '1', '1', '1', '1', '1', '1', NULL, 1, '2019-10-05 03:58:40');

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
(1, 'How much does it cost?', ' much does it cost?', 'It depends on what kind of project. Every project is unique and our rate is designed to fit your specific need & requirement. In order for us to accurately estimate, please fill up the request quote page here and let us talk.', 1, '2019-10-05 10:48:05', '2019-10-05 10:48:05');

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
(1, NULL, NULL, 3, 'Ygcf7fY6nCj0.png', 'artwork_vtVvemltaaq3', 0, 1),
(2, NULL, NULL, 3, 'VflmspNa7vXQ.pdf', 'artwork_vtVvemltaaq3', 0, 1),
(3, NULL, 'B', 3, 'hXBrvyzsa6VD.pdf', 'artwork_MmBmmVcsdYDl', 0, 1),
(4, NULL, 'C', 3, 'qUneUGxwTLMD.jpeg', 'artwork_MmBmmVcsdYDl', 0, 1),
(5, NULL, 'A', 3, 'eIQqrDARWSSE.png', 'artwork_MmBmmVcsdYDl', 0, 1),
(6, NULL, NULL, 1, 'banner_JaK1NZoMaJjX.png', 'TlZg1leWTxHj', 0, 1),
(7, NULL, NULL, 1, 'banner_CN2RRMt5aa2e.png', 'wVqEfFVuGroJ', 0, 1),
(8, NULL, NULL, 1, 'banner_QBUshnpTCT9g.png', 'guR5WyaRhuT3', 0, 1),
(9, NULL, NULL, 1, 'banner_e5dmmhYE5II1.png', 'akzz5KCtIqL0', 0, 1),
(10, NULL, NULL, 1, 'banner_CrTpeeY3oCqT.png', '8DswbvvItBXU', 0, 1),
(11, NULL, NULL, 1, 'banner_pzxe5UcHEBrD.png', 'KbIjcQH5cBXX', 0, 1),
(12, NULL, NULL, 1, 'banner_XwVYYj9r4L5n.png', 'DeL5MfDdU22x', 0, 1),
(13, NULL, NULL, 1, 'banner_sX5LbXHOcXq5.png', 'oxQGZzPICb4i', 0, 1),
(14, NULL, NULL, 1, 'banner_g7fzaxHxMASX.png', 'EiXkCFHepcJu', 0, 1),
(15, NULL, NULL, 1, 'banner_J1FSmgFV6AW3.png', 'Thogbo0ANvXl', 0, 1),
(16, NULL, NULL, 1, 'banner_2itSdgkdxDcy.png', 'iOGdXLekdE0m', 0, 1),
(17, NULL, NULL, 1, 'banner_UlIi3NXxdrNR.png', 'Ko8BcFVT0iPu', 0, 1),
(18, NULL, NULL, 1, 'banner_1zLSCuzp0kIT.png', 'LgGk27DKzQuJ', 0, 1),
(19, NULL, NULL, 1, 'banner_5FD112fvfOSd.png', 'SZpfgUAtmSmn', 0, 1),
(20, NULL, NULL, 1, 'banner_B2AuXkMhwe4u.png', 'URiJAeTI4vr6', 0, 1),
(21, NULL, NULL, 1, 'banner_9ZXY3SdjKUmg.png', 'Xu1uFREsThdu', 0, 1),
(22, NULL, NULL, 1, 'banner_REUC8HM1KwTQ.png', '2s2YjXcgxUI2', 0, 1),
(23, NULL, NULL, 1, 'banner_PvHHyEKZNUku.png', 'feBRvTVETiiU', 0, 1),
(24, NULL, NULL, 1, 'banner_2bH8nG2bo9KL.png', 'tLV0LGvrFQH7', 0, 1),
(25, NULL, NULL, 1, 'banner_bhUYD2dkytvH.png', 'LyO9mR1G0nF9', 0, 1),
(26, NULL, NULL, 1, 'banner_nzVCXqG4cyD5.png', '04era2owoENf', 0, 1),
(27, NULL, NULL, 1, 'banner_J8wvdxifFieR.png', 'zzY68Ak0FNbI', 0, 1),
(28, NULL, NULL, 1, 'banner_3imts1sec2Tj.png', 'm3GXXEszlpI7', 0, 1),
(29, NULL, NULL, 1, 'banner_RUyCVgQ63YYB.png', 'bnNYwtd9YhzB', 0, 1),
(30, NULL, NULL, 1, 'banner_tDFeAEu13cQX.png', 'cHsOsdrS5CgT', 0, 1),
(31, NULL, NULL, 3, 'vUiY9JE2Ls2K.png', 'wBxPk5MEf5q2', 0, 1),
(32, NULL, NULL, 3, 'uRjrKyzDGFkU.png', 'wBxPk5MEf5q2', 0, 1),
(33, NULL, NULL, 3, 'Gk1JU0HFIGSb.png', 'aoJFy67ABHQQ', 0, 1),
(34, NULL, NULL, 3, 'JDRQjBR58OID.png', 'aoJFy67ABHQQ', 0, 1),
(35, NULL, NULL, 3, 'JfgUvs1DRkaE.png', 'QrYb65B2wOES', 0, 1),
(36, NULL, NULL, 3, 'MDDlWw1C7QXw.png', 'QrYb65B2wOES', 0, 1),
(37, NULL, NULL, 3, 'skQOul2YbhEd.png', 'f5lCYR8yNfi3', 0, 1),
(38, NULL, NULL, 3, '2XTNRZbDGtRf.png', 'f5lCYR8yNfi3', 0, 1);

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

--
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`id`, `name`, `slug`, `description`, `thumbnail`, `created_at`, `status`, `updated_at`) VALUES
(1, 'sample protfolio a', 'sample-protfolio-a', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 6, '2019-10-04 23:53:25', 1, '2019-10-04 23:53:25'),
(2, 'sample protfolio b', 'sample-protfolio-b', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 7, '2019-10-04 23:53:29', 1, '2019-10-04 23:53:29'),
(3, 'sample protfolio c', 'sample-protfolio-c', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 8, '2019-10-04 23:53:35', 1, '2019-10-04 23:53:35'),
(4, 'sample protfolio d', 'sample-protfolio-d', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 9, '2019-10-04 23:53:40', 1, '2019-10-04 23:53:40'),
(5, 'sample protfolio e', 'sample-protfolio-e', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 10, '2019-10-04 23:53:44', 1, '2019-10-04 23:53:44'),
(6, 'sample protfolio f', 'sample-protfolio-f', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 11, '2019-10-04 23:53:48', 1, '2019-10-04 23:53:48'),
(7, 'sample protfolio g', 'sample-protfolio-g', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 12, '2019-10-04 23:53:52', 1, '2019-10-04 23:53:52'),
(8, 'sample protfolio h', 'sample-protfolio-h', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 13, '2019-10-04 23:53:57', 1, '2019-10-04 23:53:57'),
(9, 'sample protfolio i', 'sample-protfolio-i', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 14, '2019-10-04 23:54:01', 1, '2019-10-04 23:54:01'),
(10, 'sample protfolio j', 'sample-protfolio-j', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 15, '2019-10-04 23:54:05', 1, '2019-10-04 23:54:05'),
(11, 'sample protfolio k', 'sample-protfolio-k', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 16, '2019-10-04 23:54:09', 1, '2019-10-04 23:54:09'),
(12, 'sample protfolio l', 'sample-protfolio-l', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 17, '2019-10-04 23:54:12', 1, '2019-10-04 23:54:12'),
(13, 'sample protfolio m', 'sample-protfolio-m', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 18, '2019-10-04 23:54:15', 1, '2019-10-04 23:54:15'),
(14, 'sample protfolio o', 'sample-protfolio-o', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 19, '2019-10-04 23:54:19', 1, '2019-10-04 23:54:19'),
(15, 'sample protfolio p', 'sample-protfolio-p', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 20, '2019-10-04 23:54:22', 1, '2019-10-04 23:54:22'),
(16, 'sample protfolio q', 'sample-protfolio-q', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 21, '2019-10-04 23:54:38', 1, '2019-10-04 23:54:38'),
(17, 'sample protfolio r', 'sample-protfolio-r', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 22, '2019-10-04 23:54:42', 1, '2019-10-04 23:54:42'),
(18, 'sample protfolio s', 'sample-protfolio-s', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 23, '2019-10-04 23:54:45', 1, '2019-10-04 23:54:45'),
(19, 'sample protfolio t', 'sample-protfolio-t', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 24, '2019-10-04 23:54:49', 1, '2019-10-04 23:54:49'),
(20, 'sample protfolio u', 'sample-protfolio-u', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 25, '2019-10-04 23:54:53', 1, '2019-10-04 23:54:53'),
(21, 'sample protfolio v', 'sample-protfolio-v', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 26, '2019-10-04 23:54:56', 1, '2019-10-04 23:54:56'),
(22, 'sample protfolio w', 'sample-protfolio-w', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 27, '2019-10-04 23:55:00', 1, '2019-10-04 23:55:00'),
(23, 'sample protfolio x', 'sample-protfolio-x', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 28, '2019-10-04 23:55:03', 1, '2019-10-04 23:55:03'),
(24, 'sample protfolio y', 'sample-protfolio-y', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 29, '2019-10-04 23:55:08', 1, '2019-10-04 23:55:08'),
(25, 'sample protfolio z', 'sample-protfolio-z', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Auctor elit sed vulputate mi sit amet mauris commodo. Aliquet nibh praesent tristique magna. Commodo elit at imperdiet dui accumsan sit amet. Praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla. Id semper risus in hendrerit gravida rutrum quisque non tellus. Consectetur adipiscing elit duis tristique sollicitudin nibh. Consectetur adipiscing elit pellentesque habitant morbi. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Placerat in egestas erat imperdiet sed euismod nisi. Amet mauris commodo quis imperdiet massa tincidunt. Nunc aliquet bibendum enim facilisis gravida neque convallis a.', 30, '2019-10-04 23:55:12', 1, '2019-10-04 23:55:12');

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

--
-- Dumping data for table `portfolio_images`
--

INSERT INTO `portfolio_images` (`id`, `portfolio_id`, `image_id`, `status`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 1, 0, '2019-10-04 15:52:05', '2019-10-04 15:52:05'),
(2, 6, 2, 1, 0, '2019-10-04 15:52:05', '2019-10-04 15:52:05'),
(3, 6, 3, 1, 0, '2019-10-04 15:53:28', '2019-10-04 15:53:28'),
(4, 6, 4, 1, 0, '2019-10-04 15:53:29', '2019-10-04 15:53:29'),
(5, 6, 5, 1, 0, '2019-10-04 15:53:29', '2019-10-04 15:53:29');

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
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'initdata', NULL, NULL);

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
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `services`
--
ALTER TABLE `services`
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
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `portfolio_images`
--
ALTER TABLE `portfolio_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
