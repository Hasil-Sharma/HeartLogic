-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 12, 2013 at 08:21 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `heartlogic`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add site', 6, 'add_site'),
(17, 'Can change site', 6, 'change_site'),
(18, 'Can delete site', 6, 'delete_site'),
(19, 'Can add log entry', 7, 'add_logentry'),
(20, 'Can change log entry', 7, 'change_logentry'),
(21, 'Can delete log entry', 7, 'delete_logentry'),
(22, 'Can add pages content', 8, 'add_pagescontent'),
(23, 'Can change pages content', 8, 'change_pagescontent'),
(24, 'Can delete pages content', 8, 'delete_pagescontent'),
(25, 'Can add state', 9, 'add_state'),
(26, 'Can change state', 9, 'change_state'),
(27, 'Can delete state', 9, 'delete_state'),
(28, 'Can add bank', 10, 'add_bank'),
(29, 'Can change bank', 10, 'change_bank'),
(30, 'Can delete bank', 10, 'delete_bank'),
(31, 'Can add camp', 11, 'add_camp'),
(32, 'Can change camp', 11, 'change_camp'),
(33, 'Can delete camp', 11, 'delete_camp'),
(34, 'Can add blood group', 12, 'add_bloodgroup'),
(35, 'Can change blood group', 12, 'change_bloodgroup'),
(36, 'Can delete blood group', 12, 'delete_bloodgroup'),
(37, 'Can add blood', 13, 'add_blood'),
(38, 'Can change blood', 13, 'change_blood'),
(39, 'Can delete blood', 13, 'delete_blood'),
(40, 'Can add individual request', 14, 'add_individualrequest'),
(41, 'Can change individual request', 14, 'change_individualrequest'),
(42, 'Can delete individual request', 14, 'delete_individualrequest'),
(43, 'Can add request', 15, 'add_request'),
(44, 'Can change request', 15, 'change_request'),
(45, 'Can delete request', 15, 'delete_request'),
(46, 'Can add volunteer', 16, 'add_volunteer'),
(47, 'Can change volunteer', 16, 'change_volunteer'),
(48, 'Can delete volunteer', 16, 'delete_volunteer');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'hasil', '', '', 'hasilsharma7@gmail.com', 'pbkdf2_sha256$10000$osNl4eKpPZU4$4B7PGgGJHMpbHSOWnQChVqmh7qejn+6XxCJXpM8y3kw=', 1, 1, 1, '2013-03-12 17:10:01', '2013-03-11 18:55:09'),
(2, 'heart', '', '', 'aadf@dfa.com', 'pbkdf2_sha256$10000$FAruowaUJXBA$Wu6qDFBweM0wkLBd7MtGgyAobi7so7m6M7ZMKkRBxi0=', 0, 1, 0, '2013-03-11 23:05:46', '2013-03-11 23:05:37'),
(3, '123', '', '', 'aadf@dfa.com', 'pbkdf2_sha256$10000$NicRGlxHGKZy$cCkh9+AAJ3c9OsoSmsqqWeDK0WxgQ08Ds2N2gTqHUu0=', 0, 1, 0, '2013-03-11 23:11:08', '2013-03-11 23:08:36'),
(4, 'abc', '', '', 'rtv@fhg.com', 'pbkdf2_sha256$10000$ARlYFXUTHizF$bBDH6a3x/Eq/n2g9lKHK5w38zqGGH6ZafbhYL+inqZU=', 0, 1, 0, '2013-03-12 15:33:24', '2013-03-12 15:31:56');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bankhospital_bank`
--

CREATE TABLE IF NOT EXISTS `bankhospital_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `email_id` varchar(75) NOT NULL,
  `address_street_one` varchar(50) NOT NULL,
  `address_street_two` varchar(50) NOT NULL,
  `address_city` varchar(50) NOT NULL,
  `address_state_id` int(11) NOT NULL,
  `address_pin` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bankhospital_bank_25ededc1` (`address_state_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `bankhospital_bank`
--

INSERT INTO `bankhospital_bank` (`id`, `uid`, `type`, `name`, `username`, `phone_no`, `email_id`, `address_street_one`, `address_street_two`, `address_city`, `address_state_id`, `address_pin`) VALUES
(2, '', 1, '', 'hasil', 12435, '', 'adffds', '', '', 1, 1234),
(3, '', 0, '', '123', 12345, 'aadf@dfa.com', 'dfafadf', '', '', 1, 123),
(5, 'hgjhgjh', 0, 'abc', 'abc', 9988, 'rtv@fhg.com', 'snflsf', 'szxcv', 'sfzsfijoia', 1, 110092),
(6, 'hgjhgjh', 0, 'abc', 'abc', 9988, 'rtv@fhg.com', 'snflsf', 'szxcv', 'sfzsfijoia', 1, 110092);

-- --------------------------------------------------------

--
-- Table structure for table `bankhospital_camp`
--

CREATE TABLE IF NOT EXISTS `bankhospital_camp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `email_id` varchar(75) NOT NULL,
  `address_street_one` varchar(50) NOT NULL,
  `address_street_two` varchar(50) NOT NULL,
  `address_city` varchar(50) NOT NULL,
  `address_state` varchar(50) NOT NULL,
  `address_pin` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `camp_added_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bankhospital_camp_45cc35cd` (`camp_added_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bloodgroup_blood`
--

CREATE TABLE IF NOT EXISTS `bloodgroup_blood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) NOT NULL,
  `group` longtext NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bank_id` (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bloodgroup_bloodgroup`
--

CREATE TABLE IF NOT EXISTS `bloodgroup_bloodgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blood_group` varchar(10) NOT NULL,
  `rh_factor` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `bloodgroup_bloodgroup`
--

INSERT INTO `bloodgroup_bloodgroup` (`id`, `blood_group`, `rh_factor`) VALUES
(1, 'A', '+'),
(2, 'B', '+');

-- --------------------------------------------------------

--
-- Table structure for table `database_pagescontent`
--

CREATE TABLE IF NOT EXISTS `database_pagescontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `database_pagescontent`
--

INSERT INTO `database_pagescontent` (`id`, `name`, `link`, `content`) VALUES
(1, 'Home', 'home', '   \r\n    <div class="textarea">     \r\n       <br>\r\n        In a densely populated country like ours, it is difficult for the patient to search for a specific blood group in his locality especially with time constraints. This project provides a solution to the problem by providing the patient with all the details of the nearest blood bank or the donor of that very specific blood group through an SMS. All the patient needs to do is to send an SMS query or a request through IVR. While searching for a blood type, priority would be given to those who have already donated blood. The online database acquires data from the blood banks that are also given the access to update this data. The website would be open to all for registration and anyone willing for donating blood can register on the website providing his/her name along with contact details and the last date on which he/she had donated blood so as to keep a track on whether the user is fit for donating blood. Just by a single click all the donors will get the message so that the willing donor can contact the person in need immediately.\r\n        \r\n    </div>'),
(2, 'FAQs', 'faq', '<div class="textarea">\r\n<h2>FAQs</h2>\r\n    <hr>\r\n    <br /><br />\r\n        <div class="faq_question">\r\n    <div class="faq">\r\n    	\r\n    <h3>Q: Why should we donate blood?</h3>\r\n    \r\n    <p><font color="#000000">asddfhttgfgffyyhghghhhfhgghvgfghvh</font></p>\r\n</div><br>\r\n\r\n <div class="faq">\r\n 	\r\n    <h3>Q: Why should we donate blood?</h3>\r\n    \r\n    <p><font color="#000000">asddfhttgfgffyyhghghhhfhgghvgfghvh</font></p>\r\n</div><br>\r\n <div class="faq">\r\n 	\r\n    <h3>Q: Why should we donate blood?</h3>\r\n     \r\n    <p><font color="#000000">asddfhttgfgffyyhghghhhfhgghvgfghvh</font>\r\n    </p>\r\n \r\n</div></div>\r\n<div class="video">\r\n    <!--\r\n<video width="320" height="240" controls>\r\n  <source src="/static/images/bdc.mp4" type="video/mp4">\r\n  \r\nYour browser does not support the video tag.\r\n</video>--><iframe width="320" height="240"\r\nsrc="http://www.youtube.com/embed/Af0gk_kiGac">\r\n</iframe>\r\n</div>\r\n</div>'),
(3, 'Contact Us', 'contact_us', '<div class="textarea">\r\n\r\n<h2>CONTACT US</h2>\r\n    <hr>\r\n <p>You can mail us on the given e-mail address:\r\n    <br><br>\r\n    <font style="underline">heartlogicbitspilani@gmail.com</font>\r\n    <br><br>\r\n    or you can drop your letters at the given address:\r\n    <br>\r\n    BITS Pilani\r\n    <br>\r\n    Pilani campus;\r\n    <br>\r\n    Pilani, Rajasthan - 333031\r\n    <br>\r\n    INDIA\r\n</p>\r\n</div>');

-- --------------------------------------------------------

--
-- Table structure for table `database_state`
--

CREATE TABLE IF NOT EXISTS `database_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `database_state`
--

INSERT INTO `database_state` (`id`, `state`) VALUES
(1, 'Punjab');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2013-03-11 18:59:03', 1, 12, '1', 'BloodGroup object', 1, ''),
(2, '2013-03-11 18:59:10', 1, 12, '2', 'BloodGroup object', 1, ''),
(3, '2013-03-11 19:00:55', 1, 9, '1', 'Punjab', 1, ''),
(4, '2013-03-11 19:01:19', 1, 10, '1', 'adfas', 1, ''),
(5, '2013-03-11 19:05:49', 1, 11, '2', 'BDC', 1, ''),
(6, '2013-03-12 16:06:09', 1, 8, '3', 'contact_us', 1, ''),
(7, '2013-03-12 16:08:53', 1, 8, '1', 'home', 2, 'Changed content.'),
(8, '2013-03-12 16:16:45', 1, 8, '3', 'contact_us', 2, 'No fields changed.'),
(9, '2013-03-12 16:17:45', 1, 8, '2', 'faq', 2, 'Changed content.'),
(10, '2013-03-12 16:21:24', 1, 8, '1', 'home', 2, 'Changed content.'),
(11, '2013-03-12 16:22:49', 1, 8, '1', 'home', 2, 'Changed content.'),
(12, '2013-03-12 16:25:01', 1, 8, '1', 'home', 2, 'Changed content.'),
(13, '2013-03-12 16:27:06', 1, 8, '2', 'faq', 2, 'Changed content.'),
(14, '2013-03-12 16:35:41', 1, 8, '3', 'contact_us', 2, 'Changed content.'),
(15, '2013-03-12 16:38:21', 1, 8, '2', 'faq', 2, 'Changed content.'),
(16, '2013-03-12 16:39:38', 1, 8, '2', 'faq', 2, 'Changed content.'),
(17, '2013-03-12 16:40:15', 1, 8, '2', 'faq', 2, 'Changed content.'),
(18, '2013-03-12 17:01:55', 1, 8, '1', 'home', 2, 'Changed content.');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'content type', 'contenttypes', 'contenttype'),
(5, 'session', 'sessions', 'session'),
(6, 'site', 'sites', 'site'),
(7, 'log entry', 'admin', 'logentry'),
(8, 'pages content', 'database', 'pagescontent'),
(9, 'state', 'database', 'state'),
(10, 'bank', 'bankhospital', 'bank'),
(11, 'camp', 'bankhospital', 'camp'),
(12, 'blood group', 'bloodgroup', 'bloodgroup'),
(13, 'blood', 'bloodgroup', 'blood'),
(14, 'individual request', 'individualrequest', 'individualrequest'),
(15, 'request', 'request', 'request'),
(16, 'volunteer', 'volunteer', 'volunteer');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1e64154ca296444f5d98e8d160901b93', 'MjZkODk2NjUyNmIyMzE4ZmFiYWJjZTk5ZGYwYzc0OGJiMTg3YTY5MTqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZHECVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmliLmF1dGguYmFj\na2VuZHMuTW9kZWxCYWNrZW5kVQ1fYXV0aF91c2VyX2lkigEBdS4=\n', '2013-03-26 20:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `individualrequest_individualrequest`
--

CREATE TABLE IF NOT EXISTS `individualrequest_individualrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact_no` varchar(50) NOT NULL,
  `hospital_where_required_id` int(11) NOT NULL,
  `individual_request_fullfiled` tinyint(1) NOT NULL,
  `fullfiled_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hospital_where_required_id` (`hospital_where_required_id`),
  KEY `individualrequest_individualrequest_73e49c25` (`fullfiled_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `request_request`
--

CREATE TABLE IF NOT EXISTS `request_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `request_added_by_bank_id` int(11) NOT NULL,
  `blood_groups_id` int(11) NOT NULL,
  `units_of_blood_req` int(11) NOT NULL,
  `units_of_blood_given` varchar(100) NOT NULL,
  `fullfiled` tinyint(1) NOT NULL,
  `fullfiled_by_id` int(11) NOT NULL,
  `priority_level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `request_added_by_bank_id` (`request_added_by_bank_id`),
  UNIQUE KEY `blood_groups_id` (`blood_groups_id`),
  KEY `request_request_73e49c25` (`fullfiled_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `volunteer_volunteer`
--

CREATE TABLE IF NOT EXISTS `volunteer_volunteer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `alt_phone_no` int(11) NOT NULL,
  `address_street_one` varchar(50) NOT NULL,
  `address_street_two` varchar(50) NOT NULL,
  `address_city` varchar(50) NOT NULL,
  `address_state_id` int(11) NOT NULL,
  `address_pin` int(11) NOT NULL,
  `blood_grp_id` int(11) NOT NULL,
  `last_time_donated` date NOT NULL,
  `willing_again` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_state_id` (`address_state_id`),
  UNIQUE KEY `blood_grp_id` (`blood_grp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `bankhospital_bank`
--
ALTER TABLE `bankhospital_bank`
  ADD CONSTRAINT `address_state_id_refs_id_493cce22` FOREIGN KEY (`address_state_id`) REFERENCES `database_state` (`id`);

--
-- Constraints for table `bankhospital_camp`
--
ALTER TABLE `bankhospital_camp`
  ADD CONSTRAINT `camp_added_by_id_refs_id_4b637bfa` FOREIGN KEY (`camp_added_by_id`) REFERENCES `bankhospital_bank` (`id`);

--
-- Constraints for table `bloodgroup_blood`
--
ALTER TABLE `bloodgroup_blood`
  ADD CONSTRAINT `bank_id_refs_id_68de27d1` FOREIGN KEY (`bank_id`) REFERENCES `bankhospital_bank` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `individualrequest_individualrequest`
--
ALTER TABLE `individualrequest_individualrequest`
  ADD CONSTRAINT `fullfiled_by_id_refs_id_2b480403` FOREIGN KEY (`fullfiled_by_id`) REFERENCES `bankhospital_bank` (`id`),
  ADD CONSTRAINT `hospital_where_required_id_refs_id_2b480403` FOREIGN KEY (`hospital_where_required_id`) REFERENCES `bankhospital_bank` (`id`);

--
-- Constraints for table `request_request`
--
ALTER TABLE `request_request`
  ADD CONSTRAINT `blood_groups_id_refs_id_47bc9e71` FOREIGN KEY (`blood_groups_id`) REFERENCES `bloodgroup_bloodgroup` (`id`),
  ADD CONSTRAINT `fullfiled_by_id_refs_id_79668291` FOREIGN KEY (`fullfiled_by_id`) REFERENCES `bankhospital_bank` (`id`),
  ADD CONSTRAINT `request_added_by_bank_id_refs_id_79668291` FOREIGN KEY (`request_added_by_bank_id`) REFERENCES `bankhospital_bank` (`id`);

--
-- Constraints for table `volunteer_volunteer`
--
ALTER TABLE `volunteer_volunteer`
  ADD CONSTRAINT `address_state_id_refs_id_728ccb6c` FOREIGN KEY (`address_state_id`) REFERENCES `database_state` (`id`),
  ADD CONSTRAINT `blood_grp_id_refs_id_3f071353` FOREIGN KEY (`blood_grp_id`) REFERENCES `bloodgroup_bloodgroup` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
