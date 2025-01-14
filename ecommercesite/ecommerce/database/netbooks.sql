-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 05, 2020 at 07:38 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `netbooks`
--

-- --------------------------------------------------------

--
-- Table structure for table `area_master`
--

CREATE TABLE IF NOT EXISTS `area_master` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(30) DEFAULT NULL,
  `area_code` int(10) DEFAULT NULL,
  `cty_id` int(11) DEFAULT NULL,
  `st_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `area_code` (`area_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `area_master`
--

INSERT INTO `area_master` (`area_id`, `area_name`, `area_code`, `cty_id`, `st_id`) VALUES
(1, 'Maninagar', 380008, 1, 1),
(2, 'Isanpur', 380043, 1, 1),
(3, 'Gota', 382481, 1, 1),
(4, 'Ghatlodia', 380061, 1, 1),
(5, 'Satellite', 380015, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `author_master`
--

CREATE TABLE IF NOT EXISTS `author_master` (
  `athr_id` int(11) NOT NULL AUTO_INCREMENT,
  `athr_name` varchar(30) DEFAULT NULL,
  `athr_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`athr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `author_master`
--


-- --------------------------------------------------------

--
-- Table structure for table `book_author_master`
--

CREATE TABLE IF NOT EXISTS `book_author_master` (
  `bathr_id` int(11) NOT NULL AUTO_INCREMENT,
  `athr_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `book_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`bathr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `book_author_master`
--


-- --------------------------------------------------------

--
-- Table structure for table `book_master`
--

CREATE TABLE IF NOT EXISTS `book_master` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(30) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `subcat_id` int(11) DEFAULT NULL,
  `ISBN_code` int(15) DEFAULT NULL,
  `pub_id` int(11) DEFAULT NULL,
  `book_price` int(100) DEFAULT NULL,
  `book_quantity` int(50) DEFAULT NULL,
  `book_code` int(10) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `ISBN_code` (`ISBN_code`),
  UNIQUE KEY `book_code` (`book_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `book_master`
--


-- --------------------------------------------------------

--
-- Table structure for table `cart_master`
--

CREATE TABLE IF NOT EXISTS `cart_master` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_quantity` int(11) DEFAULT NULL,
  `order_price` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_delivery_date` date DEFAULT NULL,
  `order_total_amt` int(11) DEFAULT NULL,
  `order_discount_percent` int(11) DEFAULT NULL,
  `order_discount_amt` int(11) DEFAULT NULL,
  `order_net_amt` int(11) DEFAULT NULL,
  `order_status` varchar(10) DEFAULT NULL,
  `order_num` int(15) DEFAULT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `order_num` (`order_num`),
  KEY `delivery_id` (`delivery_id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cart_master`
--


-- --------------------------------------------------------

--
-- Table structure for table `category_master`
--

CREATE TABLE IF NOT EXISTS `category_master` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(30) DEFAULT NULL,
  `cat_code` int(10) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_code` (`cat_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `category_master`
--


-- --------------------------------------------------------

--
-- Table structure for table `city_master`
--

CREATE TABLE IF NOT EXISTS `city_master` (
  `cty_id` int(11) NOT NULL AUTO_INCREMENT,
  `st_id` int(11) DEFAULT NULL,
  `cty_name` varchar(30) NOT NULL,
  PRIMARY KEY (`cty_id`),
  KEY `st_id` (`st_id`),
  KEY `cty_id` (`cty_id`),
  KEY `cty_id_2` (`cty_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=737 ;

--
-- Dumping data for table `city_master`
--

INSERT INTO `city_master` (`cty_id`, `st_id`, `cty_name`) VALUES
(1, 12, 'Ahmedabad'),
(2, 12, 'Amreli'),
(3, 12, 'Anand'),
(4, 12, 'Aravalli'),
(5, 12, 'Banaskantha'),
(6, 12, 'Bharuch'),
(7, 12, 'Bhavnagar'),
(8, 12, 'Botad'),
(9, 12, 'Chhota Udaipur'),
(10, 12, 'Dahod'),
(11, 12, 'Dang'),
(12, 12, 'Devbhoomi Dwarka'),
(13, 12, 'Gandhinagar'),
(14, 12, 'Gir Somnath'),
(15, 12, 'Jamnagar'),
(16, 12, 'Junagadh'),
(17, 12, 'Kheda'),
(18, 12, 'Kutch'),
(19, 12, 'Mahisagar'),
(20, 12, 'Mehsana'),
(21, 12, 'Morbi'),
(22, 12, 'Narmada'),
(23, 12, 'Navsari'),
(24, 12, 'Panchmahal'),
(25, 12, 'Patan'),
(26, 12, 'Porbandar'),
(27, 12, 'Rajkot'),
(28, 12, 'Sabarkantha'),
(29, 12, 'Surat'),
(30, 12, 'Surendranagar'),
(31, 12, 'Tapi'),
(32, 12, 'Vadodara'),
(33, 12, 'Valsad'),
(34, 1, 'Nicobar'),
(35, 1, 'North Middle Andaman'),
(36, 1, 'South Andaman'),
(37, 2, 'Anantapur'),
(38, 2, 'Chittoor'),
(39, 2, 'East Godavari'),
(40, 2, 'Guntur'),
(41, 2, 'Kadapa'),
(42, 2, 'Krishna'),
(43, 2, 'Kurnool'),
(44, 2, 'Nellore'),
(45, 2, 'Prakasam'),
(46, 2, 'Srikakulam'),
(47, 2, 'Visakhapatnam'),
(48, 2, 'Vizianagaram'),
(49, 2, 'West Godavari'),
(50, 2, 'Nellore'),
(51, 2, 'Prakasam'),
(52, 2, 'Srikakulam'),
(53, 2, 'Visakhapatnam'),
(54, 2, 'Vizianagaram'),
(55, 2, 'West Godavari'),
(56, 3, 'Anjaw'),
(57, 3, 'Central Siang'),
(58, 3, 'Changlang'),
(59, 3, 'Dibang Valley'),
(60, 3, 'East Kameng'),
(61, 3, 'East Siang'),
(62, 3, 'Kamle'),
(63, 3, 'Kra Daadi'),
(64, 3, 'Kurung Kumey'),
(65, 3, 'Lepa Rada'),
(66, 3, 'Lohit'),
(67, 3, 'Longding'),
(68, 3, 'Lower Dibang Valley'),
(69, 3, 'Lower Siang'),
(70, 3, 'Lower Subansiri'),
(71, 3, 'Namsai'),
(72, 3, 'Pakke Kessang'),
(73, 3, 'Papum Pare'),
(74, 3, 'Shi Yomi'),
(75, 3, 'Tawang'),
(76, 3, 'Tirap'),
(77, 3, 'Upper Siang'),
(78, 3, 'Upper Subansiri'),
(79, 3, 'West Kameng'),
(80, 3, 'West Siang'),
(81, 4, 'Baksa'),
(82, 4, 'Barpeta'),
(83, 4, 'Biswanath'),
(84, 4, 'Bongaigaon'),
(85, 4, 'Cachar'),
(86, 4, 'Charaideo'),
(87, 4, 'Chirang'),
(88, 4, 'Darrang'),
(89, 4, 'Dhemaji'),
(90, 4, 'Dhubri'),
(91, 4, 'Dibrugarh'),
(92, 4, 'Dima Hasao'),
(93, 4, 'Goalpara'),
(94, 4, 'Golaghat'),
(95, 4, 'Hailakandi'),
(96, 4, 'Hojai'),
(97, 4, 'Jorhat'),
(98, 4, 'Kamrup'),
(99, 4, 'Kamrup Metropolitan'),
(100, 4, 'Karbi Anglong'),
(101, 4, 'Karimganj'),
(102, 4, 'Kokrajhar'),
(103, 4, 'Lakhimpur'),
(104, 4, 'Majuli'),
(105, 4, 'Morigaon'),
(106, 4, 'Nagaon'),
(107, 4, 'Nalbari'),
(108, 4, 'Sivasagar'),
(109, 4, 'Sonitpur'),
(110, 4, 'South Salmara-Mankachar'),
(111, 4, 'Tinsukia'),
(112, 4, 'Udalguri'),
(113, 4, 'West Karbi Anglong'),
(114, 5, 'Araria'),
(115, 5, 'Arwal'),
(116, 5, 'Aurangabad'),
(117, 5, 'Banka'),
(118, 5, 'Begusarai'),
(119, 5, 'Bhagalpur'),
(120, 5, 'Bhojpur'),
(121, 5, 'Buxar'),
(122, 5, 'Darbhanga'),
(123, 5, 'East Champaran'),
(124, 5, 'Gaya'),
(125, 5, 'Gopalganj'),
(126, 5, 'Jamui'),
(127, 5, 'Jehanabad'),
(128, 5, 'Kaimur'),
(129, 5, 'Katihar'),
(130, 5, 'Khagaria'),
(131, 5, 'Kishanganj'),
(132, 5, 'Lakhisarai'),
(133, 5, 'Madhepura'),
(134, 5, 'Madhubani'),
(135, 5, 'Munger'),
(136, 5, 'Muzaffarpur'),
(137, 5, 'Nalanda'),
(138, 5, 'Nawada'),
(139, 5, 'Patna'),
(140, 5, 'Purnia'),
(141, 5, 'Rohtas'),
(142, 5, 'Saharsa'),
(143, 5, 'Samastipur'),
(144, 5, 'Saran'),
(145, 5, 'Sheikhpura'),
(146, 5, 'Sheohar'),
(147, 5, 'Sitamarhi'),
(148, 5, 'Siwan'),
(149, 5, 'Supaul'),
(150, 5, 'Vaishali'),
(151, 5, 'West Champaran'),
(152, 6, 'Chandigarh'),
(153, 7, 'Balod'),
(154, 7, 'Baloda Bazar'),
(155, 7, 'Balrampur'),
(156, 7, 'Bastar'),
(157, 7, 'Bemetara'),
(158, 7, 'Bijapur'),
(159, 7, 'Bilaspur'),
(160, 7, 'Dantewada'),
(161, 7, 'Dhamtari'),
(162, 7, 'Durg'),
(163, 7, 'Gariaband'),
(164, 7, 'Janjgir Champa'),
(165, 7, 'Jashpur'),
(166, 7, 'Kabirdham'),
(167, 7, 'Kanker'),
(168, 7, 'Kondagaon'),
(169, 7, 'Korba'),
(170, 7, 'Koriya'),
(171, 7, 'Mahasamund'),
(172, 7, 'Mungeli'),
(173, 7, 'Narayanpur'),
(174, 7, 'Raigarh'),
(175, 7, 'Raipur'),
(176, 7, 'Rajnandgaon'),
(177, 7, 'Sukma'),
(178, 7, 'Surajpur'),
(179, 7, 'Surguja'),
(180, 8, 'Dadra Nagar Haveli'),
(181, 9, 'Daman'),
(182, 9, 'Diu'),
(183, 10, 'Central Delhi'),
(184, 10, 'East Delhi'),
(185, 10, 'New Delhi'),
(186, 10, 'North Delhi'),
(187, 10, 'North East Delhi'),
(188, 10, 'North West Delhi'),
(189, 10, 'Shahdara'),
(190, 10, 'South Delhi'),
(191, 10, 'South East Delhi'),
(192, 10, 'South West Delhi'),
(193, 10, 'West Delhi'),
(194, 11, 'North Goa'),
(195, 11, 'South Goa'),
(196, 13, 'Ambala'),
(197, 13, 'Bhiwani'),
(198, 13, 'Charkhi Dadri'),
(199, 13, 'Faridabad'),
(200, 13, 'Fatehabad'),
(201, 13, 'Gurugram'),
(202, 13, 'Hisar'),
(203, 13, 'Jhajjar'),
(204, 13, 'Jind'),
(205, 13, 'Kaithal'),
(206, 13, 'Karnal'),
(207, 13, 'Kurukshetra'),
(208, 13, 'Mahendragarh'),
(209, 13, 'Mewat'),
(210, 13, 'Palwal'),
(211, 13, 'Panchkula'),
(212, 13, 'Panipat'),
(213, 13, 'Rewari'),
(214, 13, 'Rohtak'),
(215, 13, 'Sirsa'),
(216, 13, 'Sonipat'),
(217, 13, 'Yamunanagar'),
(218, 14, 'Bilaspur'),
(219, 14, 'Chamba'),
(220, 14, 'Hamirpur'),
(221, 14, 'Kangra'),
(222, 14, 'Kinnaur'),
(223, 14, 'Kullu'),
(224, 14, 'Lahaul Spiti'),
(225, 14, 'Mandi'),
(226, 14, 'Shimla'),
(227, 14, 'Sirmaur'),
(228, 14, 'Solan'),
(229, 14, 'Una'),
(230, 15, 'Anantnag'),
(231, 15, 'Bandipora'),
(232, 15, 'Baramulla'),
(233, 15, 'Budgam'),
(234, 15, 'Doda'),
(235, 15, 'Ganderbal'),
(236, 15, 'Jammu'),
(237, 15, 'Kathua'),
(238, 15, 'Kishtwar'),
(239, 15, 'Kulgam'),
(240, 15, 'Kupwara'),
(241, 15, 'Poonch'),
(242, 15, 'Pulwama'),
(243, 15, 'Rajouri'),
(244, 15, 'Ramban'),
(245, 15, 'Reasi'),
(246, 15, 'Samba'),
(247, 15, 'Shopian'),
(248, 15, 'Srinagar'),
(249, 15, 'Udhampur'),
(250, 16, 'Bokaro'),
(251, 16, 'Chatra'),
(252, 16, 'Deoghar'),
(253, 16, 'Dhanbad'),
(254, 16, 'Dumka'),
(255, 16, 'East Singhbhum'),
(256, 16, 'Garhwa'),
(257, 16, 'Giridih'),
(258, 16, 'Godda'),
(259, 16, 'Gumla'),
(260, 16, 'Hazaribagh'),
(261, 16, 'Jamtara'),
(262, 16, 'Khunti'),
(263, 16, 'Koderma'),
(264, 16, 'Latehar'),
(265, 16, 'Lohardaga'),
(266, 16, 'Pakur'),
(267, 16, 'Palamu'),
(268, 16, 'Ramgarh'),
(269, 16, 'Ranchi'),
(270, 16, 'Sahebganj'),
(271, 16, 'Seraikela Kharsawan'),
(272, 16, 'Simdega'),
(273, 16, 'West Singhbhum'),
(274, 17, 'Bagalkot'),
(275, 17, 'Bangalore Rural'),
(276, 17, 'Bangalore Urban'),
(277, 17, 'Belgaum'),
(278, 17, 'Bellary'),
(279, 17, 'Bidar'),
(280, 17, 'Chamarajanagar'),
(281, 17, 'Chikkaballapur'),
(282, 17, 'Chikkamagaluru'),
(283, 17, 'Chitradurga'),
(284, 17, 'Dakshina Kannada'),
(285, 17, 'Davanagere'),
(286, 17, 'Dharwad'),
(287, 17, 'Gadag'),
(288, 17, 'Gulbarga'),
(289, 17, 'Hassan'),
(290, 17, 'Haveri'),
(291, 17, 'Kodagu'),
(292, 17, 'Kolar'),
(293, 17, 'Koppal'),
(294, 17, 'Mandya'),
(295, 17, 'Mysore'),
(296, 17, 'Raichur'),
(297, 17, 'Ramanagara'),
(298, 17, 'Shimoga'),
(299, 17, 'Tumkur'),
(300, 17, 'Udupi'),
(301, 17, 'Uttara Kannada'),
(302, 17, 'Vijayapura '),
(303, 17, 'Yadgir'),
(304, 18, 'Alappuzha'),
(305, 18, 'Ernakulam'),
(306, 18, 'Idukki'),
(307, 18, 'Kannur'),
(308, 18, 'Kasaragod'),
(309, 18, 'Kollam'),
(310, 18, 'Kottayam'),
(311, 18, 'Kozhikode'),
(312, 18, 'Malappuram'),
(313, 18, 'Palakkad'),
(314, 18, 'Pathanamthitta'),
(315, 18, 'Thiruvananthapuram'),
(316, 18, 'Thrissur'),
(317, 18, 'Wayanad'),
(318, 19, 'Kargil'),
(319, 19, 'Leh'),
(320, 19, 'Lakshadweep'),
(321, 20, 'Agar Malwa'),
(322, 20, 'Alirajpur'),
(323, 20, 'Anuppur'),
(324, 20, 'Ashoknagar'),
(325, 20, 'Balaghat'),
(326, 20, 'Barwani'),
(327, 20, 'Betul'),
(328, 20, 'Bhind'),
(329, 20, 'Bhopal'),
(330, 20, 'Burhanpur'),
(331, 20, 'Chhatarpur'),
(332, 20, 'Chhindwara'),
(333, 20, 'Damoh'),
(334, 20, 'Datia'),
(335, 20, 'Dewas'),
(336, 20, 'Dhar'),
(337, 20, 'Dindori'),
(338, 20, 'Guna'),
(339, 20, 'Gwalior'),
(340, 20, 'Harda'),
(341, 20, 'Hoshangabad'),
(342, 20, 'Indore'),
(343, 20, 'Jabalpur'),
(344, 20, 'Jhabua'),
(345, 20, 'Katni'),
(346, 20, 'Khandwa'),
(347, 20, 'Khargone'),
(348, 20, 'Mandla'),
(349, 20, 'Mandsaur'),
(350, 20, 'Morena'),
(351, 20, 'Narsinghpur'),
(352, 20, 'Neemuch'),
(353, 20, 'Niwari'),
(354, 20, 'Panna'),
(355, 20, 'Raisen'),
(356, 20, 'Rajgarh'),
(357, 20, 'Ratlam'),
(358, 20, 'Rewa'),
(359, 20, 'Sagar'),
(360, 20, 'Satna'),
(361, 20, 'Sehore'),
(362, 20, 'Seoni'),
(363, 20, 'Shahdol'),
(364, 20, 'Shajapur'),
(365, 20, 'Sheopur'),
(366, 20, 'Shivpuri'),
(367, 20, 'Sidhi'),
(368, 20, 'Singrauli'),
(369, 20, 'Tikamgarh'),
(370, 20, 'Ujjain'),
(371, 20, 'Umaria'),
(372, 20, 'Vidisha'),
(373, 21, 'Ahmednagar'),
(374, 21, 'Akola'),
(375, 21, 'Amravati'),
(376, 21, 'Aurangabad'),
(377, 21, 'Beed'),
(378, 21, 'Bhandara'),
(379, 21, 'Buldhana'),
(380, 21, 'Chandrapur'),
(381, 21, 'Dhule'),
(382, 21, 'Gadchiroli'),
(383, 21, 'Gondia'),
(384, 21, 'Hingoli'),
(385, 21, 'Jalgaon'),
(386, 21, 'Jalna'),
(387, 21, 'Kolhapur'),
(388, 21, 'Latur'),
(389, 21, 'Mumbai City'),
(390, 21, 'Mumbai Suburban'),
(391, 21, 'Nagpur'),
(392, 21, 'Nanded'),
(393, 21, 'Nandurbar'),
(394, 21, 'Nashik'),
(395, 21, 'Osmanabad'),
(396, 21, 'Palghar'),
(397, 21, 'Parbhani'),
(398, 21, 'Pune'),
(399, 21, 'Raigad'),
(400, 21, 'Ratnagiri'),
(401, 21, 'Sangli'),
(402, 21, 'Satara'),
(403, 21, 'Sindhudurg'),
(404, 21, 'Solapur'),
(405, 21, 'Thane'),
(406, 21, 'Wardha'),
(407, 21, 'Washim'),
(408, 21, 'Yavatmal'),
(409, 22, 'Bishnupur'),
(410, 22, 'Chandel'),
(411, 22, 'Churachandpur'),
(412, 22, 'Imphal East'),
(413, 22, 'Imphal West'),
(414, 22, 'Jiribam'),
(415, 22, 'Kakching'),
(416, 22, 'Kamjong'),
(417, 22, 'Kangpokpi'),
(418, 22, 'Noney'),
(419, 22, 'Pherzawl'),
(420, 22, 'Senapati'),
(421, 22, 'Tamenglong'),
(422, 22, 'Tengnoupal'),
(423, 22, 'Thoubal'),
(424, 22, 'Ukhrul'),
(425, 23, 'East Garo Hills'),
(426, 23, 'East Jaintia Hills'),
(427, 23, 'East Khasi Hills'),
(428, 23, 'North Garo Hills'),
(429, 23, 'Ri Bhoi'),
(430, 23, 'South Garo Hills'),
(431, 23, 'South West Garo Hills'),
(432, 23, 'South West Khasi Hills'),
(433, 23, 'West Garo Hills'),
(434, 23, 'West Jaintia Hills'),
(435, 23, 'West Khasi Hills'),
(436, 24, 'Aizawl'),
(437, 24, 'Champhai'),
(438, 24, 'Kolasib'),
(439, 24, 'Lawngtlai'),
(440, 24, 'Lunglei'),
(441, 24, 'Mamit'),
(442, 24, 'Saiha'),
(443, 24, 'Serchhip'),
(444, 25, 'Dimapur'),
(445, 25, 'Kiphire'),
(446, 25, 'Kohima'),
(447, 25, 'Longleng'),
(448, 25, 'Mokokchung'),
(449, 25, 'Mon'),
(450, 25, 'Noklak'),
(451, 25, 'Peren'),
(452, 25, 'Phek'),
(453, 25, 'Tuensang'),
(454, 25, 'Wokha'),
(455, 25, 'Zunheboto'),
(456, 26, 'Angul'),
(457, 26, 'Balangir'),
(458, 26, 'Balasore'),
(459, 26, 'Bargarh'),
(460, 26, 'Bhadrak'),
(461, 26, 'Boudh'),
(462, 26, 'Cuttack'),
(463, 26, 'Debagarh'),
(464, 26, 'Dhenkanal'),
(465, 26, 'Gajapati'),
(466, 26, 'Ganjam'),
(467, 26, 'Jagatsinghpur'),
(468, 26, 'Jajpur'),
(469, 26, 'Jharsuguda'),
(470, 26, 'Kalahandi'),
(471, 26, 'Kandhamal'),
(472, 26, 'Kendrapara'),
(473, 26, 'Kendujhar'),
(474, 26, 'Khordha'),
(475, 26, 'Koraput'),
(476, 26, 'Malkangiri'),
(477, 26, 'Mayurbhanj'),
(478, 26, 'Nabarangpur'),
(479, 26, 'Nayagarh'),
(480, 26, 'Nuapada'),
(481, 26, 'Puri'),
(482, 26, 'Rayagada'),
(483, 26, 'Sambalpur'),
(484, 26, 'Subarnapur'),
(485, 26, 'Sundergarh'),
(486, 27, 'Karaikal'),
(487, 27, 'Mahe'),
(488, 27, 'Puducherry'),
(489, 27, 'Yanam'),
(490, 28, 'Amritsar'),
(491, 28, 'Barnala'),
(492, 28, 'Bathinda'),
(493, 28, 'Faridkot'),
(494, 28, 'Fatehgarh Sahib'),
(495, 28, 'Fazilka'),
(496, 28, 'Firozpur'),
(497, 28, 'Gurdaspur'),
(498, 28, 'Hoshiarpur'),
(499, 28, 'Jalandhar'),
(500, 28, 'Kapurthala'),
(501, 28, 'Ludhiana'),
(502, 28, 'Mansa'),
(503, 28, 'Moga'),
(504, 28, 'Mohali'),
(505, 28, 'Muktsar'),
(506, 28, 'Pathankot'),
(507, 28, 'Patiala'),
(508, 28, 'Rupnagar'),
(509, 28, 'Sangrur'),
(510, 28, 'Shaheed Bhagat Singh Nagar'),
(511, 28, 'Tarn Taran'),
(512, 29, 'Ajmer'),
(513, 29, 'Alwar'),
(514, 29, 'Banswara'),
(515, 29, 'Baran'),
(516, 29, 'Barmer'),
(517, 29, 'Bharatpur'),
(518, 29, 'Bhilwara'),
(519, 29, 'Bikaner'),
(520, 29, 'Bundi'),
(521, 29, 'Chittorgarh'),
(522, 29, 'Churu'),
(523, 29, 'Dausa'),
(524, 29, 'Dholpur'),
(525, 29, 'Dungarpur'),
(526, 29, 'Hanumangarh'),
(527, 29, 'Jaipur'),
(528, 29, 'Jaisalmer'),
(529, 29, 'Jalore'),
(530, 29, 'Jhalawar'),
(531, 29, 'Jhunjhunu'),
(532, 29, 'Jodhpur'),
(533, 29, 'Karauli'),
(534, 29, 'Kota'),
(535, 29, 'Nagaur'),
(536, 29, 'Pali'),
(537, 29, 'Pratapgarh'),
(538, 29, 'Rajsamand'),
(539, 29, 'Sawai Madhopur'),
(540, 29, 'Sikar'),
(541, 29, 'Sirohi'),
(542, 29, 'Sri Ganganagar'),
(543, 29, 'Tonk'),
(544, 29, 'Udaipur'),
(545, 30, 'East Sikkim'),
(546, 30, 'North Sikkim'),
(547, 30, 'South Sikkim'),
(548, 30, 'West Sikkim'),
(549, 31, 'Ariyalur'),
(550, 31, 'Chengalpattu'),
(551, 31, 'Chennai'),
(552, 31, 'Coimbatore'),
(553, 31, 'Cuddalore'),
(554, 31, 'Dharmapuri'),
(555, 31, 'Dindigul'),
(556, 31, 'Erode'),
(557, 31, 'Kallakurichi'),
(558, 31, 'Kanchipuram'),
(559, 31, 'Kanyakumari'),
(560, 31, 'Karur'),
(561, 31, 'Krishnagiri'),
(562, 31, 'Madurai'),
(563, 31, 'Nagapattinam'),
(564, 31, 'Namakkal'),
(565, 31, 'Nilgiris'),
(566, 31, 'Perambalur'),
(567, 31, 'Pudukkottai'),
(568, 31, 'Ramanathapuram'),
(569, 31, 'Salem'),
(570, 31, 'Sivaganga'),
(571, 31, 'Tenkasi'),
(572, 31, 'Thanjavur'),
(573, 31, 'Theni'),
(574, 31, 'Thoothukudi'),
(575, 31, 'Tiruchirappalli'),
(576, 31, 'Tirunelveli'),
(577, 31, 'Tiruppur'),
(578, 31, 'Tiruvallur'),
(579, 31, 'Tiruvannamalai'),
(580, 31, 'Tiruvarur'),
(581, 31, 'Vellore'),
(582, 31, 'Viluppuram'),
(583, 31, 'Virudhunagar'),
(584, 32, 'Adilabad'),
(585, 32, 'Bhadradri Kothagudem'),
(586, 32, 'Hyderabad'),
(587, 32, 'Jagtial'),
(588, 32, 'Jangaon'),
(589, 32, 'Jayashankar'),
(590, 32, 'Jogulamba'),
(591, 32, 'Kamareddy'),
(592, 32, 'Karimnagar'),
(593, 32, 'Khammam'),
(594, 32, 'Komaram Bheem'),
(595, 32, 'Mahabubabad'),
(596, 32, 'Mahbubnagar'),
(597, 32, 'Mancherial'),
(598, 32, 'Medak'),
(599, 32, 'Medchal'),
(600, 32, 'Mulugu'),
(601, 32, 'Nagarkurnool'),
(602, 32, 'Nalgonda'),
(603, 32, 'Narayanpet'),
(604, 32, 'Nirmal'),
(605, 32, 'Nizamabad'),
(606, 32, 'Peddapalli'),
(607, 32, 'Rajanna Sircilla'),
(608, 32, 'Ranga Reddy'),
(609, 32, 'Sangareddy'),
(610, 32, 'Siddipet'),
(611, 32, 'Suryapet'),
(612, 32, 'Vikarabad'),
(613, 32, 'Wanaparthy'),
(614, 32, 'Warangal Rural'),
(615, 32, 'Warangal Urban'),
(616, 32, 'Yadadri Bhuvanagiri'),
(617, 33, 'Dhalai'),
(618, 33, 'Gomati'),
(619, 33, 'Khowai'),
(620, 33, 'North Tripura'),
(621, 33, 'Sepahijala'),
(622, 33, 'South Tripura'),
(623, 33, 'Unakoti'),
(624, 33, 'West Tripura'),
(625, 34, 'Agra'),
(626, 34, 'Aligarh'),
(627, 34, 'Ambedkar Nagar'),
(628, 34, 'Amethi'),
(629, 34, 'Amroha'),
(630, 34, 'Auraiya'),
(631, 34, 'Ayodhya'),
(632, 34, 'Azamgarh'),
(633, 34, 'Baghpat'),
(634, 34, 'Bahraich'),
(635, 34, 'Ballia'),
(636, 34, 'Balrampur'),
(637, 34, 'Banda'),
(638, 34, 'Barabanki'),
(639, 34, 'Bareilly'),
(640, 34, 'Basti'),
(641, 34, 'Bhadohi'),
(642, 34, 'Bijnor'),
(643, 34, 'Budaun'),
(644, 34, 'Bulandshahr'),
(645, 34, 'Chandauli'),
(646, 34, 'Chitrakoot'),
(647, 34, 'Deoria'),
(648, 34, 'Etah'),
(649, 34, 'Etawah'),
(650, 34, 'Farrukhabad'),
(651, 34, 'Fatehpur'),
(652, 34, 'Firozabad'),
(653, 34, 'Gautam Buddha Nagar'),
(654, 34, 'Ghaziabad'),
(655, 34, 'Ghazipur'),
(656, 34, 'Gonda'),
(657, 34, 'Gorakhpur'),
(658, 34, 'Hamirpur'),
(659, 34, 'Hapur'),
(660, 34, 'Hardoi'),
(661, 34, 'Hathras'),
(662, 34, 'Jalaun'),
(663, 34, 'Jaunpur'),
(664, 34, 'Jhansi'),
(665, 34, 'Kannauj'),
(666, 34, 'Kanpur Dehat'),
(667, 34, 'Kanpur Nagar'),
(668, 34, 'Kasganj'),
(669, 34, 'Kaushambi'),
(670, 34, 'Kheri'),
(671, 34, 'Kushinagar'),
(672, 34, 'Lalitpur'),
(673, 34, 'Lucknow'),
(674, 34, 'Maharajganj'),
(675, 34, 'Mahoba'),
(676, 34, 'Mainpuri'),
(677, 34, 'Mathura'),
(678, 34, 'Mau'),
(679, 34, 'Meerut'),
(680, 34, 'Mirzapur'),
(681, 34, 'Moradabad'),
(682, 34, 'Muzaffarnagar'),
(683, 34, 'Pilibhit'),
(684, 34, 'Pratapgarh'),
(685, 34, 'Prayagraj'),
(686, 34, 'Raebareli'),
(687, 34, 'Rampur'),
(688, 34, 'Saharanpur'),
(689, 34, 'Sambhal'),
(690, 34, 'Sant Kabir Nagar'),
(691, 34, 'Shahjahanpur'),
(692, 34, 'Shamli'),
(693, 34, 'Shravasti'),
(694, 34, 'Siddharthnagar'),
(695, 34, 'Sitapur'),
(696, 34, 'Sonbhadra'),
(697, 34, 'Sultanpur'),
(698, 34, 'Unnao'),
(699, 34, 'Varanasi'),
(700, 35, 'Almora'),
(701, 35, 'Bageshwar'),
(702, 35, 'Chamoli'),
(703, 35, 'Champawat'),
(704, 35, 'Dehradun'),
(705, 35, 'Haridwar'),
(706, 35, 'Nainital'),
(707, 35, 'Pauri'),
(708, 35, 'Pithoragarh'),
(709, 35, 'Rudraprayag'),
(710, 35, 'Tehri'),
(711, 35, 'Udham Singh Nagar'),
(712, 35, 'Uttarkashi'),
(713, 36, 'Alipurduar'),
(714, 36, 'Bankura'),
(715, 36, 'Birbhum'),
(716, 36, 'Cooch Behar'),
(717, 36, 'Dakshin Dinajpur'),
(718, 36, 'Darjeeling'),
(719, 36, 'Hooghly'),
(720, 36, 'Howrah'),
(721, 36, 'Jalpaiguri'),
(722, 36, 'Jhargram'),
(723, 36, 'Kalimpong'),
(724, 36, 'Kolkata'),
(725, 36, 'Malda'),
(726, 36, 'Murshidabad'),
(727, 36, 'Nadia'),
(728, 36, 'North 24 Parganas'),
(729, 36, 'Paschim Bardhaman'),
(730, 36, 'Paschim Medinipur'),
(731, 36, 'Purba Bardhaman'),
(732, 36, 'Purba Medinipur'),
(733, 36, 'Purulia'),
(734, 36, 'South 24 Parganas'),
(735, 36, 'Uttar Dinajpur'),
(736, 37, 'gdfgdfgdfg');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_person_master`
--

CREATE TABLE IF NOT EXISTS `delivery_person_master` (
  `delivery_id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_person` varchar(30) DEFAULT NULL,
  `delivery_gender` varchar(10) DEFAULT NULL,
  `delivery_dob` date DEFAULT NULL,
  `delivery_id_proof` int(11) DEFAULT NULL,
  `delivery_email` varchar(30) DEFAULT NULL,
  `delivery_contact` int(10) DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  UNIQUE KEY `delivery_id_proof` (`delivery_id_proof`,`delivery_email`,`delivery_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `delivery_person_master`
--


-- --------------------------------------------------------

--
-- Table structure for table `feedback_master`
--

CREATE TABLE IF NOT EXISTS `feedback_master` (
  `feed_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `feed_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`feed_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `feedback_master`
--


-- --------------------------------------------------------

--
-- Table structure for table `order_master`
--

CREATE TABLE IF NOT EXISTS `order_master` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_delivery_date` date DEFAULT NULL,
  `order_quantity` int(50) DEFAULT NULL,
  `order_price` int(11) DEFAULT NULL,
  `order_total_amt` int(11) DEFAULT NULL,
  `order_discount_percent` int(11) DEFAULT NULL,
  `order_net_amt` int(11) DEFAULT NULL,
  `order_discount_amt` int(11) DEFAULT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `order_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_num` (`order_num`),
  KEY `book_id` (`book_id`),
  KEY `user_id` (`user_id`),
  KEY `book_id_2` (`book_id`),
  KEY `user_id_2` (`user_id`),
  KEY `user_id_3` (`user_id`),
  KEY `user_id_4` (`user_id`),
  KEY `user_id_5` (`user_id`),
  KEY `delivery_id` (`delivery_id`),
  KEY `delivery_id_2` (`delivery_id`),
  KEY `delivery_id_3` (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `order_master`
--


-- --------------------------------------------------------

--
-- Table structure for table `publication_master`
--

CREATE TABLE IF NOT EXISTS `publication_master` (
  `pub_id` int(11) NOT NULL AUTO_INCREMENT,
  `pub_name` varchar(30) DEFAULT NULL,
  `pub_address` varchar(50) DEFAULT NULL,
  `pub_email` varchar(50) DEFAULT NULL,
  `pub_contact` int(10) DEFAULT NULL,
  `reg_no` int(20) DEFAULT NULL,
  `pub_password` int(20) DEFAULT NULL,
  PRIMARY KEY (`pub_id`),
  UNIQUE KEY `pub_email` (`pub_email`,`pub_contact`,`reg_no`,`pub_password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `publication_master`
--


-- --------------------------------------------------------

--
-- Table structure for table `state_master`
--

CREATE TABLE IF NOT EXISTS `state_master` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `st_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `state_master`
--

INSERT INTO `state_master` (`st_id`, `st_name`) VALUES
(1, 'Andaman Nicobar'),
(2, 'Andhra Pradesh'),
(3, 'Arunachal Pradesh'),
(4, 'Assam'),
(5, 'Bihar'),
(6, 'Chandigarh'),
(7, 'Chhattisgarh'),
(8, 'Dadra Nagar Haveli'),
(9, 'Daman Diu'),
(10, 'Delhi'),
(11, 'Goa'),
(12, 'Gujarat'),
(13, 'Haryana'),
(14, 'Himachal Pradesh'),
(15, 'Jammu Kashmir'),
(16, 'Jharkhand'),
(17, 'Karnataka'),
(18, 'Kerala'),
(19, 'Lakshadweep'),
(20, 'Madhya Pradesh'),
(21, 'Maharashtra'),
(22, 'Manipur'),
(23, 'Meghalaya'),
(24, 'Mizoram'),
(25, 'Nagaland'),
(26, 'Odisha'),
(27, 'Puducherry'),
(28, 'Punjab'),
(29, 'Rajasthan'),
(30, 'Sikkim'),
(31, 'Tamil Nadu'),
(32, 'Telangana'),
(33, 'Tripura'),
(34, 'Uttar Pradesh'),
(35, 'Uttarakhand'),
(36, 'West Bengal'),
(37, 'state check');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory_master`
--

CREATE TABLE IF NOT EXISTS `subcategory_master` (
  `subcat_id` int(11) NOT NULL AUTO_INCREMENT,
  `subcat_name` varchar(50) DEFAULT NULL,
  `subcat_code` int(10) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`subcat_id`),
  UNIQUE KEY `subcat_code` (`subcat_code`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `subcategory_master`
--


-- --------------------------------------------------------

--
-- Table structure for table `test_master`
--

CREATE TABLE IF NOT EXISTS `test_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `activate_code` varchar(100) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`,`password`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `test_master`
--

INSERT INTO `test_master` (`id`, `firstname`, `lastname`, `email`, `password`, `activate_code`, `created_on`) VALUES
(1, 'Yash', 'Patel', 'yash@gmail.com', '1234', 'AuidCohWqyBj', '2020-01-05'),
(2, 'ayush', 'patel', 'smashgamersyt@gmail.com', '12345', 'kMxGTUhPwRm1', '2020-01-05'),
(3, 'om', 'patel', 'om@gmail.com', '123456', 'gCU3SWa5VKZQ', '2020-01-05');

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

CREATE TABLE IF NOT EXISTS `user_master` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(80) DEFAULT NULL,
  `user_address` varchar(100) DEFAULT NULL,
  `st_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `user_contact` int(10) DEFAULT NULL,
  `user_gender` varchar(10) DEFAULT NULL,
  `user_dob` date DEFAULT NULL,
  `user_email` varchar(80) DEFAULT NULL,
  `user_password` varchar(20) DEFAULT NULL,
  `user_isactive` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_address` (`user_address`,`st_id`,`city_id`,`area_id`,`user_contact`,`user_email`,`user_password`),
  KEY `st_id` (`st_id`),
  KEY `st_id_2` (`st_id`),
  KEY `st_id_3` (`st_id`),
  KEY `st_id_4` (`st_id`),
  KEY `city_id` (`city_id`),
  KEY `area_id` (`area_id`),
  KEY `area_id_2` (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `user_master`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_master`
--
ALTER TABLE `cart_master`
  ADD CONSTRAINT `cart_master_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book_master` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_master_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_master` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_master_ibfk_3` FOREIGN KEY (`delivery_id`) REFERENCES `delivery_person_master` (`delivery_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `city_master`
--
ALTER TABLE `city_master`
  ADD CONSTRAINT `city_master_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `state_master` (`st_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback_master`
--
ALTER TABLE `feedback_master`
  ADD CONSTRAINT `feedback_master_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_master` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_master`
--
ALTER TABLE `order_master`
  ADD CONSTRAINT `order_master_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book_master` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_master_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_master` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_master_ibfk_3` FOREIGN KEY (`delivery_id`) REFERENCES `delivery_person_master` (`delivery_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcategory_master`
--
ALTER TABLE `subcategory_master`
  ADD CONSTRAINT `subcategory_master_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category_master` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_master`
--
ALTER TABLE `user_master`
  ADD CONSTRAINT `user_master_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `state_master` (`st_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_master_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `city_master` (`cty_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_master_ibfk_3` FOREIGN KEY (`area_id`) REFERENCES `area_master` (`area_id`) ON DELETE CASCADE ON UPDATE CASCADE;
