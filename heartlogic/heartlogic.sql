-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 10, 2013 at 10:11 PM
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
-- Table structure for table `account_account`
--

CREATE TABLE IF NOT EXISTS `account_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `timezone` varchar(100) NOT NULL,
  `language` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `account_account`
--

INSERT INTO `account_account` (`id`, `user_id`, `timezone`, `language`) VALUES
(1, 1, '', 'en-us');

-- --------------------------------------------------------

--
-- Table structure for table `account_accountdeletion`
--

CREATE TABLE IF NOT EXISTS `account_accountdeletion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(75) NOT NULL,
  `date_requested` datetime NOT NULL,
  `date_expunged` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_accountdeletion_403f60f` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

CREATE TABLE IF NOT EXISTS `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(75) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_403f60f` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `account_emailaddress`
--

INSERT INTO `account_emailaddress` (`id`, `user_id`, `email`, `verified`, `primary`) VALUES
(1, 1, 'hasilsharma7@gmail.com', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

CREATE TABLE IF NOT EXISTS `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `sent` datetime DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirmation_1df9fea4` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `account_signupcode`
--

CREATE TABLE IF NOT EXISTS `account_signupcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `max_uses` int(10) unsigned NOT NULL,
  `expiry` datetime DEFAULT NULL,
  `inviter_id` int(11) DEFAULT NULL,
  `email` varchar(75) NOT NULL,
  `notes` longtext NOT NULL,
  `sent` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `use_count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `account_signupcode_74fccd78` (`inviter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `account_signupcoderesult`
--

CREATE TABLE IF NOT EXISTS `account_signupcoderesult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `signup_code_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_signupcoderesult_16afc873` (`signup_code_id`),
  KEY `account_signupcoderesult_403f60f` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

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
(48, 'Can delete volunteer', 16, 'delete_volunteer'),
(49, 'Can add account', 17, 'add_account'),
(50, 'Can change account', 17, 'change_account'),
(51, 'Can delete account', 17, 'delete_account'),
(52, 'Can add signup code', 18, 'add_signupcode'),
(53, 'Can change signup code', 18, 'change_signupcode'),
(54, 'Can delete signup code', 18, 'delete_signupcode'),
(55, 'Can add signup code result', 19, 'add_signupcoderesult'),
(56, 'Can change signup code result', 19, 'change_signupcoderesult'),
(57, 'Can delete signup code result', 19, 'delete_signupcoderesult'),
(58, 'Can add email address', 20, 'add_emailaddress'),
(59, 'Can change email address', 20, 'change_emailaddress'),
(60, 'Can delete email address', 20, 'delete_emailaddress'),
(61, 'Can add email confirmation', 21, 'add_emailconfirmation'),
(62, 'Can change email confirmation', 21, 'change_emailconfirmation'),
(63, 'Can delete email confirmation', 21, 'delete_emailconfirmation'),
(64, 'Can add account deletion', 22, 'add_accountdeletion'),
(65, 'Can change account deletion', 22, 'change_accountdeletion'),
(66, 'Can delete account deletion', 22, 'delete_accountdeletion');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'hasil', '', '', 'hasilsharma7@gmail.com', 'pbkdf2_sha256$10000$I4SEPZyNxhYN$GXINLr6BxUgWejpBMvP9jiiL91clkJhDvhQ0W5i1jFE=', 1, 1, 1, '2013-03-10 20:17:48', '2013-03-10 01:41:24');

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
  UNIQUE KEY `address_state_id` (`address_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  UNIQUE KEY `camp_added_by_id` (`camp_added_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bloodgroup_blood`
--

CREATE TABLE IF NOT EXISTS `bloodgroup_blood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bank_id` (`bank_id`),
  UNIQUE KEY `group_id` (`group_id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `database_pagescontent`
--

INSERT INTO `database_pagescontent` (`id`, `name`, `link`, `content`) VALUES
(1, 'Home', 'home', 'In a densely populated country like ours, it is difficult for the patient to search for a specific blood group in his locality especially with time constraints. This project provides a solution to the problem by providing the patient with all the details of the nearest blood bank or the donor of that very specific blood group through an SMS. All the patient needs to do is to send an SMS query or a request through IVR. While searching for a blood type, priority would be given to those who have already donated blood. The online database acquires data from the blood banks that are also given the access to update this data. The website would be open to all for registration and anyone willing for donating blood can register on the website providing his/her name along with contact details and the last date on which he/she had donated blood so as to keep a track on whether the user is fit for donating blood. Just by a single click all the donors will get the message so that the willing donor can contact the person in need immediately.'),
(2, 'FAQs', 'faq', 'Content of FAQs page goes here.');

-- --------------------------------------------------------

--
-- Table structure for table `database_state`
--

CREATE TABLE IF NOT EXISTS `database_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2013-03-10 20:18:10', 1, 8, '1', 'home', 2, 'Changed content.'),
(2, '2013-03-10 20:34:46', 1, 8, '1', 'home', 2, 'No fields changed.');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

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
(16, 'volunteer', 'volunteer', 'volunteer'),
(17, 'account', 'account', 'account'),
(18, 'signup code', 'account', 'signupcode'),
(19, 'signup code result', 'account', 'signupcoderesult'),
(20, 'email address', 'account', 'emailaddress'),
(21, 'email confirmation', 'account', 'emailconfirmation'),
(22, 'account deletion', 'account', 'accountdeletion');

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
('ac3a61bb4e22f538d5228589be61a66a', 'YzU2MmFjYzMxYjM5NGQzNzhmYTk0NzQxZDkzZjU3ZjE4NDhiN2EwOTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-03-24 20:17:48');

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
  `individual_request_fullfilled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hospital_where_required_id` (`hospital_where_required_id`)
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
  `units_of_blood` int(11) NOT NULL,
  `fullfilled` tinyint(1) NOT NULL,
  `fullfilled_by` varchar(50) NOT NULL,
  `priority_level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `request_added_by_bank_id` (`request_added_by_bank_id`),
  UNIQUE KEY `blood_groups_id` (`blood_groups_id`)
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
-- Constraints for table `account_account`
--
ALTER TABLE `account_account`
  ADD CONSTRAINT `user_id_refs_id_17b5ed9e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_accountdeletion`
--
ALTER TABLE `account_accountdeletion`
  ADD CONSTRAINT `user_id_refs_id_3d59a95c` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `user_id_refs_id_2e39af64` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `email_address_id_refs_id_2b7a814f` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Constraints for table `account_signupcode`
--
ALTER TABLE `account_signupcode`
  ADD CONSTRAINT `inviter_id_refs_id_6c86faad` FOREIGN KEY (`inviter_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_signupcoderesult`
--
ALTER TABLE `account_signupcoderesult`
  ADD CONSTRAINT `signup_code_id_refs_id_262b5320` FOREIGN KEY (`signup_code_id`) REFERENCES `account_signupcode` (`id`),
  ADD CONSTRAINT `user_id_refs_id_522cae80` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

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
  ADD CONSTRAINT `bank_id_refs_id_68de27d1` FOREIGN KEY (`bank_id`) REFERENCES `bankhospital_bank` (`id`),
  ADD CONSTRAINT `group_id_refs_id_21ebb671` FOREIGN KEY (`group_id`) REFERENCES `bloodgroup_bloodgroup` (`id`);

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
  ADD CONSTRAINT `hospital_where_required_id_refs_id_2b480403` FOREIGN KEY (`hospital_where_required_id`) REFERENCES `bankhospital_bank` (`id`);

--
-- Constraints for table `request_request`
--
ALTER TABLE `request_request`
  ADD CONSTRAINT `blood_groups_id_refs_id_47bc9e71` FOREIGN KEY (`blood_groups_id`) REFERENCES `bloodgroup_bloodgroup` (`id`),
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
