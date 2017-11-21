-- phpMyAdmin SQL Dump
-- version 4.4.6.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2016-01-11 16:44:46
-- 服务器版本： 5.6.24-log
-- PHP Version: 5.4.41

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `grade_systems`
--

-- --------------------------------------------------------

-- 11111111
-- 表的结构 `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `c_no` bigint(10) NOT NULL,
  `c_name` varchar(64) DEFAULT NULL,
  `c_credit` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `course`
--

INSERT INTO `course` (`c_no`, `c_name`, `c_credit`) VALUES
(1, '数据库系统概论', 5),
(2, '计算机组成原理', 4),
(3, '高数', 5);

-- --------------------------------------------------------

--
-- 表的结构 `frirelship`          

 
  
--

CREATE TABLE IF NOT EXISTS `frirelship` (
  `id` bigint(10) NOT NULL,
  `t_c_id` bigint(10) DEFAULT NULL,
  `s_no` bigint(10) DEFAULT NULL,
  `grade` int(10) DEFAULT NULL,
  `pgrade` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `frirelship`
--

INSERT INTO `frirelship` (`id`, `t_c_id`, `s_no`, `grade`, `pgrade`) VALUES
(1, 1, 3113006452, 70, 80),
(2, 2, 3113006452, 40, 80),
(3, 3, 3113006452, 0, 80),
(4, 1, 3113006453, 70, 78),
(5, 2, 3113006453, 50, 55),
(6, 3, 3113006454, 99, 99),
(7, 1, 3113006454, 99, 99);

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `s_no` bigint(10) NOT NULL,
  `s_password` varchar(64) NOT NULL,
  `s_name` varchar(64) NOT NULL,
  `s_sex` varchar(2) DEFAULT NULL,
  `s_year` varchar(64) DEFAULT NULL,
  `s_department` varchar(64) DEFAULT NULL,
  `s_major` varchar(64) DEFAULT NULL,
  `s_class` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `student`
--

INSERT INTO `student` (`s_no`, `s_password`, `s_name`, `s_sex`, `s_year`, `s_department`, `s_major`, `s_class`) VALUES
(3113006452, '0', '陈聪', '男', '2013', '计算机', '网络工程', '2'),
(3113006453, 'abc', '陈琮元', '男', '13级', '计算机学院', '网络工程', '2班'),
(3113006454, '123', '豪哥', '男', '13', '计算机', '网络工程', '2');

-- --------------------------------------------------------

--
-- 替换视图以便查看 `studentquery`
--
CREATE TABLE IF NOT EXISTS `studentquery` (
`c_no` bigint(10)
,`c_name` varchar(64)
,`grade` int(10)
,`t_name` varchar(64)
,`c_credit` int(10)
,`pgrade` int(10)
);

-- --------------------------------------------------------

--
-- 表的结构 `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `t_no` bigint(10) NOT NULL,
  `t_password` varchar(64) DEFAULT NULL,
  `t_name` varchar(64) DEFAULT NULL,
  `t_sex` varchar(2) DEFAULT NULL,
  `t_department` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `teacher`
--

INSERT INTO `teacher` (`t_no`, `t_password`, `t_name`, `t_sex`, `t_department`) VALUES
(1, '1', '老师 ', '男', '计算机');

-- --------------------------------------------------------

--
-- 表的结构 `teacourse`
--

CREATE TABLE IF NOT EXISTS `teacourse` (
  `t_c_id` bigint(10) NOT NULL,
  `t_no` bigint(10) DEFAULT NULL,
  `c_no` bigint(10) DEFAULT NULL,
  `year` varchar(64) DEFAULT NULL,
  `term` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `teacourse`
--

INSERT INTO `teacourse` (`t_c_id`, `t_no`, `c_no`, `year`, `term`) VALUES
(1, 1, 1, '2015-2016', '1'),
(2, 1, 2, '2015-2016', '2'),
(3, 1, 3, '2015-2016', '1');

-- --------------------------------------------------------

--
-- 视图结构 `studentquery`
--
DROP TABLE IF EXISTS `studentquery`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studentquery` AS select `course`.`c_no` AS `c_no`,`course`.`c_name` AS `c_name`,`frirelship`.`grade` AS `grade`,`teacher`.`t_name` AS `t_name`,`course`.`c_credit` AS `c_credit`,`frirelship`.`pgrade` AS `pgrade` from ((((`student` join `frirelship` on((`frirelship`.`s_no` = `student`.`s_no`))) join `teacourse` on((`frirelship`.`t_c_id` = `teacourse`.`t_c_id`))) join `course` on((`teacourse`.`c_no` = `course`.`c_no`))) join `teacher` on((`teacourse`.`t_no` = `teacher`.`t_no`)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`c_no`),
  ADD UNIQUE KEY `c_no` (`c_no`),
  ADD UNIQUE KEY `c_no_2` (`c_no`);

--
-- Indexes for table `frirelship`
--
ALTER TABLE `frirelship`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`s_no`),
  ADD UNIQUE KEY `s_no` (`s_no`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`t_no`),
  ADD UNIQUE KEY `t_no` (`t_no`);

--
-- Indexes for table `teacourse`
--
ALTER TABLE `teacourse`
  ADD PRIMARY KEY (`t_c_id`),
  ADD UNIQUE KEY `t_c_id` (`t_c_id`),
  ADD KEY `t_c_id_2` (`t_c_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
