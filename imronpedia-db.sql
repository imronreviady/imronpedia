-- phpMyAdmin SQL Dump
-- version 5.2.0-rc1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 14, 2023 at 04:40 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imronpedia`
--

-- --------------------------------------------------------

--
-- Table structure for table `hex_acc_del_requests`
--

CREATE TABLE `hex_acc_del_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `reason` varchar(2) NOT NULL DEFAULT '5',
  `message` varchar(600) NOT NULL DEFAULT '',
  `time` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_admins`
--

CREATE TABLE `hex_admins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hex_admins`
--

INSERT INTO `hex_admins` (`id`, `user_id`, `time`) VALUES
(1, 1, '1681895952');

-- --------------------------------------------------------

--
-- Table structure for table `hex_admin_sessions`
--

CREATE TABLE `hex_admin_sessions` (
  `id` int(11) NOT NULL,
  `login_sess_id` int(11) NOT NULL DEFAULT '0',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `time` varchar(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_announcements`
--

CREATE TABLE `hex_announcements` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `message` varchar(600) NOT NULL DEFAULT '',
  `title` varchar(150) NOT NULL DEFAULT '',
  `url` varchar(500) NOT NULL DEFAULT '',
  `type` enum('success','info','warning','error') DEFAULT NULL,
  `static` enum('Y','N') NOT NULL DEFAULT 'N',
  `message_type` enum('system','custom') NOT NULL DEFAULT 'system',
  `slug` varchar(40) NOT NULL DEFAULT 'none',
  `json_data` varchar(3000) NOT NULL DEFAULT '{}',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hex_announcements`
--

INSERT INTO `hex_announcements` (`id`, `user_id`, `message`, `title`, `url`, `type`, `static`, `message_type`, `slug`, `json_data`, `time`) VALUES
(1, 2, 'We use cookies on this website to ensure the functionality of the application and to improve user experience. By using the site, you agree to our cookie policy!', 'Cookie policy', '', 'info', 'Y', 'system', 'none', '{}', '1684038837');

-- --------------------------------------------------------

--
-- Table structure for table `hex_backups`
--

CREATE TABLE `hex_backups` (
  `id` int(11) NOT NULL,
  `backup_dir` varchar(80) NOT NULL DEFAULT '',
  `files_backup` varchar(120) NOT NULL DEFAULT '',
  `sql_backup` varchar(120) NOT NULL DEFAULT '',
  `file_size` varchar(50) NOT NULL DEFAULT '0',
  `sql_size` varchar(50) NOT NULL DEFAULT '0',
  `time` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_basket`
--

CREATE TABLE `hex_basket` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `prod_id` int(11) NOT NULL DEFAULT '0',
  `var_id` int(11) DEFAULT NULL,
  `var_type` enum('single','color','size','color_size') NOT NULL DEFAULT 'single',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `time` varchar(15) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_blocked_users`
--

CREATE TABLE `hex_blocked_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_chat_conversations`
--

CREATE TABLE `hex_chat_conversations` (
  `id` int(11) NOT NULL,
  `user_one` int(11) NOT NULL DEFAULT '0',
  `user_two` int(11) NOT NULL DEFAULT '0',
  `time` int(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_chat_messages`
--

CREATE TABLE `hex_chat_messages` (
  `id` int(11) NOT NULL,
  `sent_by` int(11) NOT NULL DEFAULT '0',
  `sent_to` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  `message` varchar(3000) NOT NULL DEFAULT '',
  `media_file` varchar(1000) NOT NULL DEFAULT '',
  `media_type` varchar(25) NOT NULL DEFAULT 'none',
  `seen` varchar(25) NOT NULL DEFAULT '0',
  `deleted_fs1` enum('Y','N') NOT NULL DEFAULT 'N',
  `deleted_fs2` enum('Y','N') NOT NULL DEFAULT 'N',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_checkout_transactions`
--

CREATE TABLE `hex_checkout_transactions` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `seller_id` int(11) NOT NULL DEFAULT '0',
  `buyer_id` int(11) NOT NULL DEFAULT '0',
  `amount` varchar(11) NOT NULL DEFAULT '0.00',
  `prod_id` int(11) NOT NULL DEFAULT '0',
  `var_id` int(11) NOT NULL DEFAULT '0',
  `var_type` enum('single','color','size','color_size') NOT NULL DEFAULT 'single',
  `status` enum('success','failed') NOT NULL,
  `method` varchar(15) NOT NULL DEFAULT 'none',
  `stripe_pid` varchar(220) NOT NULL DEFAULT '',
  `paypal_pid` varchar(220) NOT NULL DEFAULT '',
  `wallet_pid` varchar(220) NOT NULL DEFAULT '',
  `cod_pid` varchar(220) NOT NULL DEFAULT '',
  `market_rate` int(3) NOT NULL DEFAULT '0',
  `time` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_config`
--

CREATE TABLE `hex_config` (
  `id` int(11) NOT NULL,
  `title` varchar(220) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(3000) NOT NULL DEFAULT '',
  `regex` varchar(300) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hex_config`
--

INSERT INTO `hex_config` (`id`, `title`, `name`, `value`, `regex`) VALUES
(1, 'Market default language', 'language', 'indonesia', ''),
(2, '', 'theme', 'v1', ''),
(3, '', 'validation', 'off', ''),
(4, 'Market name', 'name', 'ImronPedia', ''),
(5, 'Market e-mail address', 'email', 'imronpedia@gmail.com', ''),
(6, 'SMTP Server type', 'smtp_or_mail', 'mail', '/^(smtp|mail)$/'),
(7, 'SMTP Host', 'smtp_host', '', ''),
(8, 'SMTP Password', 'smtp_password', '', ''),
(9, 'SMTP Encription type', 'smtp_encryption', 'ssl', '/^(ssl|tls)$/'),
(10, 'SMTP Port', 'smtp_port', '42', '/^[0-9]{1,11}$/'),
(11, 'SMTP User', 'smtp_username', '', ''),
(12, 'Stripe API Public key', 'stripe_api_key', '', ''),
(13, 'Stripe API Secret key', 'stripe_api_pass', '', ''),
(14, 'Market sale rate', 'market_sale_rate', '5', '/^[0-9]{1,3}$/'),
(15, 'PayPal API Public key', 'paypal_api_key', '', ''),
(16, 'PayPal API Secret key', 'paypal_api_pass', '', ''),
(17, 'PayPal Payment Mode', 'paypal_mode', 'sandbox', ''),
(20, 'Market currency', 'market_currency', 'idr', '/^[a-z]{2,5}$/'),
(21, 'Min payout request amount', 'min_payout', '50', '/^[0-9]{1,11}(\\.[0-9]{1,2}){0,1}$/'),
(22, 'Product max price', 'max_sale_price', '1000', '/^[0-9]{1,11}(\\.[0-9]{1,2}){0,1}$/'),
(23, 'Product min price', 'min_sale_price', '50', '/^[0-9]{1,11}(\\.[0-9]{1,2}){0,1}$/'),
(24, 'Payout Period', 'payout_period', '60', '/^[0-9]{1,2}$/'),
(25, 'Market title', 'title', 'ImronPedia', ''),
(26, 'Market description', 'description', 'ImronPedia - Marketplace Platform', ''),
(27, 'Market keywords', 'keywords', 'marketplace,ecommerce,shopping,ebusiness,ecom,store,online store,online business,ecommerce website,shopping cart,ecommunity,ecommerce platform', ''),
(28, 'Google Maps API', 'google_maps_api', '', ''),
(29, 'Company address', 'company_address', 'Company address', ''),
(30, 'Company contacts info', 'contacts_info', 'Imronpedia, Cilangkap, Tapos, Depok', '{32,3000}'),
(31, '', 'last_sitemap_update', '', ''),
(32, '', 'last_backup', '', ''),
(33, 'Google analytics', 'google_analytics', '', ''),
(34, 'Order cancellation fee', 'order_cancellation_fee', '45', '/^[0-9]{1,11}(\\.[0-9]{1,2}){0,1}$/'),
(35, '', 'script_version', '1.0.1', ''),
(36, '', 'db_lc', '1684048484', ''),
(37, 'Facebook API ID', 'facebook_api_id', '', ''),
(38, 'Facebook API Key', 'facebook_api_key', '', ''),
(39, 'Twitter API ID', 'twitter_api_id', '', ''),
(40, 'Twitter API Key', 'twitter_api_key', '', ''),
(41, 'Google API ID', 'google_api_id', '', ''),
(42, 'Google API Key', 'google_api_key', '', ''),
(43, 'Server mode', 'server_mode', 'production', '/^(debug|production)$/'),
(44, 'Account validation', 'acc_validation', 'off', '/^(on|off)$/'),
(45, 'Site favicon', 'site_favicon', 'upload/images/favicon.png', ''),
(46, 'Site logo', 'site_logo', 'upload/images/logo.png', ''),
(47, 'Amazon S3 Storage', 'as3_storage', 'off', '/^(on|off)$/'),
(48, 'AS3 bucket name', 'as3_bucket_name', 'imronpedia df', ''),
(49, 'Amazon S3 API key', 'as3_api_key', ' df', ''),
(50, 'Amazon S3 API secret key', 'as3_api_secret_key', '', ''),
(51, 'AS3 bucket region', 'as3_bucket_region', '', ''),
(52, 'Delete from server', 'as3_onup_delete', 'yes', '/^(yes|no)$/'),
(53, 'Product description max length', 'prod_max_desc', '600', '/^[0-9]{1,5}$/'),
(54, 'Product description min length', 'prod_min_desc', '32', '/^[0-9]{1,5}$/'),
(55, 'Product name minimum length', 'prod_min_name', '45', '/^[0-9]{1,3}$/'),
(56, 'Product name maximum length', 'prod_max_name', '144', '/^[0-9]{1,3}$/'),
(58, 'Maximum number of product images', 'prod_max_images', '25', '/^[0-9]{1,2}$/'),
(59, 'Minimum number of product images', 'prod_min_images', '1', '/^[0-9]{1,2}$/'),
(60, 'Maximum number of user wishlists', 'user_max_wls', '10', '/^[0-9]{1,2}$/'),
(62, 'Currency symbol position', 'curr_symbol_position', 'before', '/^(before|after)$/'),
(63, 'PayPal gateway status', 'paypal_gateway_status', 'on', '/^(on|off)$/'),
(64, 'Stripe gateway status', 'stripe_gateway_status', 'on', '/^(on|off)$/'),
(65, 'Wallet gateway status', 'wallet_gateway_status', 'on', '/^(on|off)$/'),
(66, 'COD gateway status', 'cod_gateway_status', 'on', '/^(on|off)$/'),
(67, 'Min balance top up amount', 'min_topup', '500', '/^[0-9]{1,11}(\\.[0-9]{1,2}){0,1}$/');

-- --------------------------------------------------------

--
-- Table structure for table `hex_currencies`
--

CREATE TABLE `hex_currencies` (
  `id` int(11) NOT NULL,
  `curr_name` varchar(55) NOT NULL DEFAULT '',
  `curr_code` varchar(6) NOT NULL DEFAULT 'usd',
  `curr_symbol` varchar(5) CHARACTER SET utf8mb4 NOT NULL DEFAULT '$'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hex_currencies`
--

INSERT INTO `hex_currencies` (`id`, `curr_name`, `curr_code`, `curr_symbol`) VALUES
(12, 'Indonesia rupiah', 'idr', 'Rp.');

-- --------------------------------------------------------

--
-- Table structure for table `hex_data_sessions`
--

CREATE TABLE `hex_data_sessions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `json` text,
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hex_data_sessions`
--

INSERT INTO `hex_data_sessions` (`id`, `user_id`, `json`, `time`) VALUES
(1, 1, '[]', '1681896137'),
(2, 2, '[]', '1684038838');

-- --------------------------------------------------------

--
-- Table structure for table `hex_deliv_addresses`
--

CREATE TABLE `hex_deliv_addresses` (
  `id` int(11) NOT NULL,
  `full_name` varchar(60) NOT NULL DEFAULT '',
  `phone` varchar(18) NOT NULL DEFAULT '',
  `street` varchar(100) NOT NULL DEFAULT '',
  `off_apt` varchar(60) NOT NULL DEFAULT '',
  `country_id` int(3) NOT NULL DEFAULT '0',
  `state` varchar(50) NOT NULL DEFAULT '',
  `city` varchar(60) NOT NULL DEFAULT '',
  `zip_postal` varchar(10) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `time` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_langs`
--

CREATE TABLE `hex_langs` (
  `id` int(11) NOT NULL,
  `lang_key` varchar(500) NOT NULL DEFAULT '',
  `indonesia` varchar(500) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hex_langs`
--

INSERT INTO `hex_langs` (`id`, `lang_key`, `indonesia`) VALUES
(1, 'search_products', 'Cari produk'),
(2, 'notifications', 'Notifikasi'),
(3, 'show_all', 'Tampilkan semua'),
(4, 'control_panel', 'Panel kontrol'),
(5, 'profile', 'Profil'),
(6, 'my_orders', 'Pesanan saya'),
(7, 'settings', 'Pengaturan'),
(8, 'help', 'Bantuan'),
(9, 'wishlist', 'Wishlist'),
(10, 'logout', 'Logout'),
(11, 'basket', 'Basket'),
(12, 'all_categories', 'All categories'),
(13, 'men_s_fashion', 'Men\\&#039;s fashion'),
(14, 'women_s_fashion', 'Women\\&#039;s fashion'),
(15, 'electronics', 'Electronics'),
(16, 'footwear', 'Footwear'),
(17, 'children_s_products', 'Children\\&#039;s products'),
(18, 'sports_and_fitness', 'Sports and Fitness'),
(19, 'health_and_beauty', 'Health and beauty'),
(20, 'repair_products', 'Repair Products'),
(21, 'auto_products', 'Auto products'),
(22, 'sales', 'Sales'),
(23, 'home', 'Home'),
(24, 'catalog', 'Catalog'),
(26, 'household_products', 'Household products'),
(27, 'childen_s_goods', 'Childen\\&#039;s goods'),
(29, 'goods_for_pets', 'Goods for pets'),
(30, 'garden', 'Garden'),
(31, 'sports___fintness', 'Sports &amp; Fintness'),
(32, 'hobby_goods', 'Hobby goods'),
(33, 'loading._please_wait...', 'Loading. Please wait...'),
(34, 'load_more_products', 'Load more products'),
(35, 'sorting', 'Sorting'),
(36, 'default', 'Default'),
(37, 'at_an_increasing_price', 'At an increasing price'),
(38, 'at_a_decreasing_price', 'At a decreasing price'),
(39, 'by_novelty', 'By novelty'),
(40, 'by_rating', 'By rating'),
(41, 'by_sales', 'By sales'),
(42, 'price', 'Price'),
(43, 'any', 'Any'),
(44, 'from', 'From'),
(45, 'to', 'To'),
(46, 'apply', 'Apply'),
(47, 'brand', 'Brand'),
(48, 'all', 'All'),
(49, 'name', 'Name'),
(50, 'enter_brand_name', 'Enter brand name'),
(51, 'title', 'Title'),
(52, 'search', 'Search'),
(53, 'enter_a_name_to_search', 'Enter a name to search'),
(54, 'condition', 'Condition'),
(55, 'new', 'New'),
(56, 'used', 'Used'),
(57, 'modified', 'Modified'),
(58, 'delivery', 'Delivery'),
(59, 'free', 'Free'),
(60, 'paid', 'Paid'),
(61, 'time_of_delivery', 'Time of delivery'),
(62, 'delivery_in_1_business_day', 'Delivery in 1 business day'),
(63, 'delivery_within_2-3_business_days', 'Delivery within 2-3 business days'),
(64, 'delivery_within_4-7_business_days', 'Delivery within 4-7 business days'),
(65, 'delivery_within_8-15_business_days', 'Delivery within 8-15 business days'),
(68, 'afghanistan', 'Afghanistan'),
(70, 'algeria', 'Algeria'),
(71, 'american_samoa', 'American Samoa'),
(72, 'andorra', 'Andorra'),
(73, 'angola', 'Angola'),
(74, 'anguilla', 'Anguilla'),
(75, 'antarctica', 'Antarctica'),
(76, 'antigua_and_or_barbuda', 'Antigua and/or Barbuda'),
(77, 'argentina', 'Argentina'),
(78, 'armenia', 'Armenia'),
(79, 'aruba', 'Aruba'),
(80, 'australia', 'Australia'),
(81, 'austria', 'Austria'),
(82, 'azerbaijan', 'Azerbaijan'),
(83, 'bahamas', 'Bahamas'),
(84, 'bahrain', 'Bahrain'),
(86, 'barbados', 'Barbados'),
(87, 'belarus', 'Belarus'),
(88, 'belgium', 'Belgium'),
(89, 'belize', 'Belize'),
(90, 'benin', 'Benin'),
(91, 'bermuda', 'Bermuda'),
(92, 'bhutan', 'Bhutan'),
(93, 'bolivia', 'Bolivia'),
(94, 'bosnia_and_herzegovina', 'Bosnia and Herzegovina'),
(95, 'botswana', 'Botswana'),
(96, 'bouvet_island', 'Bouvet Island'),
(97, 'brazil', 'Brazil'),
(98, 'brunei_darussalam', 'Brunei Darussalam'),
(99, 'bulgaria', 'Bulgaria'),
(100, 'burkina_faso', 'Burkina Faso'),
(101, 'burundi', 'Burundi'),
(102, 'cambodia', 'Cambodia'),
(103, 'cameroon', 'Cameroon'),
(104, 'cape_verde', 'Cape Verde'),
(105, 'cayman_islands', 'Cayman Islands'),
(106, 'central_african_republic', 'Central African Republic'),
(107, 'chad', 'Chad'),
(108, 'chile', 'Chile'),
(109, 'china', 'China'),
(110, 'christmas_island', 'Christmas Island'),
(111, 'cocos_(keeling)_islands', 'Cocos (Keeling) Islands'),
(112, 'colombia', 'Colombia'),
(113, 'comoros', 'Comoros'),
(114, 'congo', 'Congo'),
(115, 'cook_islands', 'Cook Islands'),
(116, 'costa_rica', 'Costa Rica'),
(117, 'croatia_(hrvatska)', 'Croatia (Hrvatska)'),
(118, 'cuba', 'Cuba'),
(119, 'cyprus', 'Cyprus'),
(120, 'czech_republic', 'Czech Republic'),
(121, 'denmark', 'Denmark'),
(122, 'djibouti', 'Djibouti'),
(123, 'dominica', 'Dominica'),
(124, 'dominican_republic', 'Dominican Republic'),
(125, 'east_timor', 'East Timor'),
(126, 'ecuador', 'Ecuador'),
(127, 'egypt', 'Egypt'),
(128, 'el_salvador', 'El Salvador'),
(129, 'equatorial_guinea', 'Equatorial Guinea'),
(130, 'eritrea', 'Eritrea'),
(131, 'estonia', 'Estonia'),
(132, 'ethiopia', 'Ethiopia'),
(133, 'falkland_islands_(malvinas)', 'Falkland Islands (Malvinas)'),
(134, 'faroe_islands', 'Faroe Islands'),
(135, 'fiji', 'Fiji'),
(136, 'finland', 'Finland'),
(137, 'france', 'France'),
(138, 'france__metropolitan', 'France, Metropolitan'),
(139, 'french_guiana', 'French Guiana'),
(140, 'french_polynesia', 'French Polynesia'),
(141, 'french_southern_territories', 'French Southern Territories'),
(142, 'gabon', 'Gabon'),
(143, 'gambia', 'Gambia'),
(144, 'georgia', 'Georgia'),
(145, 'germany', 'Germany'),
(146, 'ghana', 'Ghana'),
(147, 'gibraltar', 'Gibraltar'),
(148, 'greece', 'Greece'),
(149, 'greenland', 'Greenland'),
(150, 'grenada', 'Grenada'),
(151, 'guadeloupe', 'Guadeloupe'),
(152, 'guam', 'Guam'),
(153, 'guatemala', 'Guatemala'),
(154, 'guinea', 'Guinea'),
(155, 'guinea-bissau', 'Guinea-Bissau'),
(156, 'guyana', 'Guyana'),
(157, 'haiti', 'Haiti'),
(158, 'heard_and_mc_donald_islands', 'Heard and Mc Donald Islands'),
(159, 'honduras', 'Honduras'),
(160, 'hong_kong', 'Hong Kong'),
(161, 'hungary', 'Hungary'),
(162, 'iceland', 'Iceland'),
(163, 'india', 'India'),
(164, 'indonesia', 'Indonesia'),
(165, 'iran_(islamic_republic_of)', 'Iran (Islamic Republic of)'),
(166, 'iraq', 'Iraq'),
(167, 'ireland', 'Ireland'),
(168, 'israel', 'Israel'),
(169, 'italy', 'Italy'),
(170, 'ivory_coast', 'Ivory Coast'),
(171, 'jamaica', 'Jamaica'),
(172, 'japan', 'Japan'),
(173, 'jordan', 'Jordan'),
(174, 'kazakhstan', 'Kazakhstan'),
(175, 'kenya', 'Kenya'),
(176, 'kiribati', 'Kiribati'),
(177, 'korea__democratic_people_s_republic_of', 'Korea, Democratic People\\&#039;s Republic of'),
(178, 'korea__republic_of', 'Korea, Republic of'),
(179, 'kosovo', 'Kosovo'),
(180, 'kuwait', 'Kuwait'),
(181, 'kyrgyzstan', 'Kyrgyzstan'),
(182, 'lao_people_s_democratic_republic', 'Lao People\\&#039;s Democratic Republic'),
(183, 'latvia', 'Latvia'),
(184, 'lebanon', 'Lebanon'),
(185, 'lesotho', 'Lesotho'),
(186, 'liberia', 'Liberia'),
(187, 'libyan_arab_jamahiriya', 'Libyan Arab Jamahiriya'),
(188, 'liechtenstein', 'Liechtenstein'),
(189, 'lithuania', 'Lithuania'),
(190, 'luxembourg', 'Luxembourg'),
(191, 'macau', 'Macau'),
(192, 'macedonia', 'Macedonia'),
(193, 'madagascar', 'Madagascar'),
(194, 'malawi', 'Malawi'),
(195, 'malaysia', 'Malaysia'),
(196, 'maldives', 'Maldives'),
(197, 'mali', 'Mali'),
(198, 'malta', 'Malta'),
(199, 'marshall_islands', 'Marshall Islands'),
(200, 'martinique', 'Martinique'),
(201, 'mauritania', 'Mauritania'),
(202, 'mauritius', 'Mauritius'),
(203, 'mayotte', 'Mayotte'),
(204, 'mexico', 'Mexico'),
(205, 'micronesia__federated_states_of', 'Micronesia, Federated States of'),
(206, 'moldova__republic_of', 'Moldova, Republic of'),
(207, 'monaco', 'Monaco'),
(208, 'mongolia', 'Mongolia'),
(209, 'montenegro', 'Montenegro'),
(210, 'montserrat', 'Montserrat'),
(211, 'morocco', 'Morocco'),
(212, 'mozambique', 'Mozambique'),
(213, 'myanmar', 'Myanmar'),
(214, 'namibia', 'Namibia'),
(215, 'nauru', 'Nauru'),
(216, 'nepal', 'Nepal'),
(217, 'netherlands', 'Netherlands'),
(218, 'netherlands_antilles', 'Netherlands Antilles'),
(219, 'new_caledonia', 'New Caledonia'),
(220, 'new_zealand', 'New Zealand'),
(221, 'nicaragua', 'Nicaragua'),
(222, 'niger', 'Niger'),
(223, 'nigeria', 'Nigeria'),
(224, 'niue', 'Niue'),
(225, 'norfork_island', 'Norfork Island'),
(226, 'northern_mariana_islands', 'Northern Mariana Islands'),
(227, 'norway', 'Norway'),
(228, 'oman', 'Oman'),
(229, 'pakistan', 'Pakistan'),
(230, 'palau', 'Palau'),
(231, 'panama', 'Panama'),
(232, 'papua_new_guinea', 'Papua New Guinea'),
(233, 'paraguay', 'Paraguay'),
(234, 'peru', 'Peru'),
(235, 'philippines', 'Philippines'),
(236, 'pitcairn', 'Pitcairn'),
(237, 'poland', 'Poland'),
(238, 'portugal', 'Portugal'),
(239, 'puerto_rico', 'Puerto Rico'),
(240, 'qatar', 'Qatar'),
(241, 'reunion', 'Reunion'),
(242, 'romania', 'Romania'),
(244, 'rwanda', 'Rwanda'),
(245, 'saint_kitts_and_nevis', 'Saint Kitts and Nevis'),
(246, 'saint_lucia', 'Saint Lucia'),
(247, 'saint_vincent_and_the_grenadines', 'Saint Vincent and the Grenadines'),
(248, 'samoa', 'Samoa'),
(249, 'san_marino', 'San Marino'),
(250, 'sao_tome_and_principe', 'Sao Tome and Principe'),
(251, 'saudi_arabia', 'Saudi Arabia'),
(252, 'senegal', 'Senegal'),
(253, 'serbia', 'Serbia'),
(254, 'seychelles', 'Seychelles'),
(255, 'sierra_leone', 'Sierra Leone'),
(256, 'singapore', 'Singapore'),
(257, 'slovakia', 'Slovakia'),
(258, 'slovenia', 'Slovenia'),
(259, 'solomon_islands', 'Solomon Islands'),
(260, 'somalia', 'Somalia'),
(261, 'south_africa', 'South Africa'),
(262, 'south_georgia_south_sandwich_islands', 'South Georgia South Sandwich Islands'),
(263, 'spain', 'Spain'),
(264, 'sri_lanka', 'Sri Lanka'),
(265, 'st._helena', 'St. Helena'),
(266, 'st._pierre_and_miquelon', 'St. Pierre and Miquelon'),
(267, 'sudan', 'Sudan'),
(268, 'suriname', 'Suriname'),
(269, 'svalbarn_and_jan_mayen_islands', 'Svalbarn and Jan Mayen Islands'),
(270, 'swaziland', 'Swaziland'),
(271, 'sweden', 'Sweden'),
(272, 'switzerland', 'Switzerland'),
(273, 'syrian_arab_republic', 'Syrian Arab Republic'),
(274, 'taiwan', 'Taiwan'),
(275, 'tajikistan', 'Tajikistan'),
(276, 'tanzania__united_republic_of', 'Tanzania, United Republic of'),
(277, 'thailand', 'Thailand'),
(278, 'togo', 'Togo'),
(279, 'tokelau', 'Tokelau'),
(280, 'tonga', 'Tonga'),
(281, 'trinidad_and_tobago', 'Trinidad and Tobago'),
(282, 'tunisia', 'Tunisia'),
(283, 'turkey', 'Turkey'),
(284, 'turkmenistan', 'Turkmenistan'),
(285, 'turks_and_caicos_islands', 'Turks and Caicos Islands'),
(286, 'tuvalu', 'Tuvalu'),
(287, 'uganda', 'Uganda'),
(289, 'united_arab_emirates', 'United Arab Emirates'),
(290, 'united_kingdom', 'United Kingdom'),
(291, 'united_states_minor_outlying_islands', 'United States minor outlying islands'),
(292, 'uruguay', 'Uruguay'),
(293, 'uzbekistan', 'Uzbekistan'),
(294, 'vanuatu', 'Vanuatu'),
(295, 'vatican_city_state', 'Vatican City State'),
(296, 'venezuela', 'Venezuela'),
(297, 'vietnam', 'Vietnam'),
(298, 'yemen', 'Yemen'),
(299, 'yugoslavia', 'Yugoslavia'),
(300, 'zaire', 'Zaire'),
(301, 'zambia', 'Zambia'),
(302, 'zimbabwe', 'Zimbabwe'),
(303, 'seller_country', 'Seller Country'),
(304, 'reset_filter', 'Reset filter'),
(305, 'no_products_found_', 'No products found!'),
(306, 'sorry__there_are_no_products_in_this_category_yet', 'Sorry, there are no products in this category yet'),
(307, 'continue_shopping', 'Continue shopping'),
(308, 'you_have_reached_the_end_of_this_list', 'You have reached the end of this list'),
(309, 'load_more_products.', 'Load more products.'),
(310, 'sorry__we_did_not_find_anything', 'Sorry, we did not find anything'),
(311, 'please_try_another_search_term.', 'Please try another search term.'),
(312, 'wishlists', 'Wishlists'),
(313, 'all_items', 'All items'),
(314, 'your_wishlists', 'Your wishlists'),
(315, 'create_wish_list', 'Create wish list'),
(316, 'favorite', 'Favorite'),
(317, 'sundry', 'Sundry'),
(318, 'buy_later', 'Buy later'),
(319, 'birthday', 'Birthday'),
(320, 'gift_ideas', 'Gift Ideas'),
(326, 'category', 'Category'),
(328, 'this_wish_list_is_empty', 'This wish list is empty'),
(329, 'shop_now', 'Shop now'),
(331, 'to_add_a_product_to_your_favorites__click__on_the_product_pa', 'To add a product to your favorites, click {%svg_icon%} on the product page'),
(333, 'your_wishlist_is_empty', 'Your wishlist is empty'),
(334, 'sorry__we_did_not_find_anything.', 'Sorry, we did not find anything.'),
(335, 'name_the_new_list', 'Name the new list'),
(336, 'list_title', 'List title'),
(337, 'for_example', 'For example'),
(338, 'my_wishlist', 'My wishlist'),
(339, 'accessories', 'Accessories'),
(340, 'for_children', 'For children'),
(341, 'wedding', 'Wedding'),
(342, 'for_school', 'For school'),
(343, 'for_business', 'For business'),
(344, 'cancel', 'Cancel'),
(345, 'create', 'Create'),
(346, 'please_enter_a_name_for_the_new_wishlist_', 'Please enter a name for the new wishlist!'),
(347, 'the_new_wishlist_has_been_created_successfully.', 'The new wishlist has been created successfully.'),
(348, 'the_list_name_you_entered_is_too_short._please_check_your_de', 'The list name you entered is too short. Please check your details!'),
(349, 'you_already_have_a_wish_list_with_this_name._please_choose_a', 'You already have a wish list with this name. Please choose a different name!'),
(350, 'the_list_name_can_not_be_more_than_20_characters_long', 'The list name can not be more than 20 characters long'),
(351, 'delete_this_list', 'Delete this list'),
(352, 'edit', 'Edit'),
(353, 'rename', 'Rename'),
(354, 'choose_a_new_list_name', 'Choose a new list name'),
(355, 'save', 'Save'),
(356, 'your_wish_list_has_been_renamed_successfully._please_wait_..', 'Your wish list has been renamed successfully. Please wait ..'),
(357, 'confirm_your_action', 'Confirm your action'),
(358, 'delete_this_wishlist_', 'Delete this wishlist?'),
(359, 'are_you_sure_you_want_to_delete_this_wish_list__note._wish_l', 'Are you sure you want to delete this wish list? Note. Wish lists are permanently deleted'),
(360, 'yes__delete', 'Yes, delete'),
(361, 'your_wish_list_has_been_removed_successfully._please_wait_..', 'Your wish list has been removed successfully. Please wait ..'),
(362, 'product_has_been_successfully_removed_from_your_wishlist', 'Product has been successfully removed from your wishlist'),
(363, 'discount', 'Discount'),
(364, 'no', 'No'),
(365, 'total', 'Total'),
(366, 'color', 'Color'),
(367, 'quantity', 'Quantity'),
(368, 'your_basket_is_empty_', 'Your basket is empty!'),
(369, 'click_the_button_below_to_go_shopping', 'Click the button below to go shopping'),
(370, 'delivery_address', 'Delivery address'),
(372, 'saved_addresses', 'Saved Addresses'),
(373, 'add_new', 'Add new'),
(374, 'default_delivery_address', 'Default delivery address'),
(375, 'saved_delivery_addresses_list', 'Saved delivery addresses list'),
(376, 'select', 'Select'),
(377, 'add_new_delivery_address', 'Add new delivery address'),
(378, 'delete', 'Delete'),
(379, 'contact_information', 'Contact Information'),
(380, 'the_full_name_of_the_recipient', 'The full name of the recipient'),
(381, 'telephone_number', 'Telephone number'),
(382, 'street_name', 'Street name'),
(383, 'house__apartment__etc.', 'House, Apartment, etc.'),
(384, 'shipping_country', 'Shipping country'),
(385, 'area___territory___region', 'Area / Territory / Region'),
(386, 'city___town', 'City / Town'),
(387, 'postcode', 'Postcode'),
(388, 'e-mail_address', 'E-mail address'),
(389, 'set_as_default_shipping_address', 'Set as default shipping address'),
(390, 'add_address', 'Add Address'),
(391, 'please_select_the_products_you_want_to_include_in_the_order_', 'Please select the products you want to include in the order!'),
(392, 'please_enter_your_password_to_continue_', 'Please enter your password to continue!'),
(403, 'please_provide_your_name_in_english_as_in_your_id_(first_nam', 'Please provide your name in English as in your ID (first name, last name, middle name)'),
(404, 'the_full_name_field_length_must_be_between_6_-_32_characters', 'The full name field length must be between 6 - 32 characters'),
(405, 'the_contact_telephone_field_is_required_', 'The contact telephone field is required!'),
(406, 'the_address_street_name_field_is_required_', 'The address street name field is required!'),
(407, 'phone_number_you_entered_is_not_vlaid_', 'Phone number you entered is not vlaid!'),
(408, 'the_street_name_field_length_must_be_between_6_-_60_characte', 'The street name field length must be between 6 - 60 characters!'),
(409, 'please_enter_your_apartment_or_office_address', 'Please enter your apartment or office address'),
(410, 'the_office_apartment_field_length_must_be_between_6_-_60_cha', 'The office/apartment field length must be between 6 - 60 characters'),
(411, 'delivery_country_is_requred._please_select_the_shipping_coun', 'Delivery country is requred. Please select the shipping country!'),
(412, 'the_country_name_you_selected_is_not_valid_', 'The country name you selected is not valid!'),
(413, 'please_enter_your_country_state_name_', 'Please enter your country state name!'),
(414, 'the_address_city_name_field_is_required_', 'The address city name field is required!'),
(416, 'the_city_name_field_length_must_be_between_4_-_60_characters', 'The city name field length must be between 4 - 60 characters!'),
(417, 'please_enter_your_postal_(zip)_code_number_', 'Please enter your postal (ZIP) code number!'),
(418, 'invalid_zip_postal_code._please_check_your_details.', 'Invalid zip/postal code. Please check your details.'),
(419, 'please_eneter_your_contact_e-mail_address_', 'Please eneter your contact E-Mail address!'),
(420, 'your_new_delivery_address_has_been_successfully_saved._pleas', 'Your new delivery address has been successfully saved. Please wait'),
(421, 'address_has_been_changed_successfully._please_wait...', 'Address has been changed successfully. Please wait...'),
(422, 'address_has_been_deleted_successfully_', 'Address has been deleted successfully!'),
(423, 'items_in_the_basket', 'Items in the basket'),
(424, 'select_all_products', 'Select all products'),
(425, 'delete_selected', 'Delete selected'),
(426, 'okey_', 'Okey!'),
(427, 'change_address', 'Change address'),
(429, 'are_you_sure_you_want_to_delete_this_item__if_not__click____', 'Are you sure you want to delete this item? If not, click “Cancel” to save your basket for later or add this product to your wishlist!'),
(430, 'yes__delete_it_', 'Yes, delete it!'),
(431, 'no__cancel', 'No, cancel'),
(432, 'are_you_sure_you_want_to_remove_all_selected_items_from_the_', 'Are you sure you want to remove all selected items from the basket? If not, click Cancel to save your basket for later or add these items to your wishlist!'),
(433, 'enter_your_password', 'Enter your password'),
(434, 'your_password_is_required_to_confirm_payment', 'Your password is required to confirm payment'),
(435, 'enter_your_account_password', 'Enter your account password'),
(436, 'confirm', 'Confirm'),
(437, 'this_item_was_successfully_deleted_from_your_card', 'This item was successfully deleted from your card'),
(438, 'the_items_was_successfully_deleted_from_your_card', 'The items was successfully deleted from your card'),
(439, 'order_summary', 'Order Summary'),
(440, 'choose_a_payment_method', 'Choose a payment method'),
(441, 'pay_order', 'Pay Order'),
(442, 'payment_methods', 'Payment Methods'),
(443, 'we_will_refund_if_the_order_is_not_received_or_does_not_matc', 'We will refund if the order is not received or does not match the description.'),
(444, 'customer_service', 'Customer service'),
(445, 'bank_card', 'Bank card'),
(446, 'qiwi_wallet', 'Qiwi Wallet'),
(447, 'yandex_money', 'Yandex money'),
(449, 'the_payment_was_successfully_created._please_wait..', 'The payment was successfully created. Please wait..'),
(450, 'redirection_to_the_paypal__please_wait...', 'Redirection to the Paypal, please wait...'),
(453, 'get_help', 'Get help'),
(454, 'like_on_a_picture', 'Like on a picture'),
(455, 'has_placed_an_order_for_your_product', 'has placed an order for your product'),
(456, 'thanks_for_your_payment', 'Thanks for your payment'),
(457, 'your_payment_was_successfully_accepted_and_orders_was_send_t', 'Your payment was successfully accepted,and orders was send to the sellers'),
(458, 'the_password_you_entered_is_not_valid._please_check_your_det', 'The password you entered is not valid. Please check your details'),
(459, 'your_account_does_not_have_sufficient_funds_to_pay_for_goods', 'Your account does not have sufficient funds to pay for goods!'),
(461, 'terms_of_use', 'Terms of Use'),
(462, 'about_us', 'About us'),
(463, 'contact_us', 'Contact us'),
(464, 'merchant_terms', 'Merchant terms'),
(465, 'all_rights_reserved', 'All rights reserved'),
(466, 'trading_items', 'Trading Items'),
(467, 'best_products', 'Best Products'),
(468, 'most_sold_products', 'Most Sold Products'),
(469, 'rating___reviews', 'Rating &amp; Reviews'),
(470, 'last_seen', 'Last seen'),
(471, 'load_more_prodcuts', 'Load more prodcuts'),
(472, 'no_reviews_found', 'No reviews found'),
(473, 'there_are_no_any_reviews_for_this_profile_yet', 'There are no any reviews for this profile yet'),
(474, 'empty_store', 'Empty store'),
(475, 'this_profile_has_no_trading_items', 'This profile has no trading items'),
(476, 'customer_ratings_and_reviews', 'Customer ratings and reviews'),
(477, 'feedback_filter', 'Feedback Filter'),
(478, 'excellent', 'Excellent'),
(479, 'very_well', 'Very well'),
(480, 'good', 'Good'),
(481, 'poor', 'Poor'),
(482, 'bad', 'Bad'),
(483, 'all_reviews', 'All reviews'),
(484, 'customer_reviews', 'Customer Reviews'),
(485, 'show_the_following_reviews', 'Show the following reviews'),
(486, 'verified_user', 'Verified User'),
(487, 'share_this_item', 'Share this item'),
(488, 'or_copy_the_link_below', 'Or copy the link below'),
(489, 'add_to_cart', 'Add to cart'),
(490, 'added', 'Added'),
(491, 'buy_now', 'Buy now'),
(492, 'description', 'Description'),
(493, 'logistic_information', 'Logistic Information'),
(494, 'product_category', 'Product category'),
(495, 'product_brand', 'Product brand'),
(496, 'product_origin', 'Product origin'),
(497, 'product_model_number', 'Product model number'),
(498, 'weight_of_packing', 'Weight of packing'),
(499, 'package_size', 'Package size'),
(500, 'similar_products', 'Similar products'),
(510, 'shipping_cost', 'Shipping cost'),
(511, 'in_one_business_day', 'in one business day'),
(512, 'in_5_-_15_business_days', 'in 5 - 15 business days'),
(513, 'in_2_-_3_business_days', 'in 2 - 3 business days'),
(514, 'in_4_-_7_business_days', 'in 4 - 7 business days'),
(515, 'in_within_1_month', 'in within 1 month'),
(516, 'in_within_2_months', 'in within 2 months'),
(517, 'in_within_3_months', 'in within 3 months'),
(518, 'qantity', 'Qantity'),
(519, 'please_select_(wish_list)_for_this_product_', 'Please select (Wish List) for this product!'),
(520, 'you_have_already_ordered_this_product_from_this_seller__so_y', 'You have already ordered this product from this seller, so you cannot order it twice from the same seller'),
(521, 'this_item_has_been_added_to_the_basket_', 'This item has been added to the basket!'),
(522, 'shippings_cost', 'Shippings cost'),
(523, 'in_1_business_day', 'in 1 business day'),
(524, 'size', 'Size'),
(525, 'not_selected', 'Not selected'),
(526, 'size_not_selected._please_select_a_size', 'Size not selected. Please select a size'),
(527, 'this_item_has_been_added_to_the_basket', 'This item has been added to the basket'),
(528, 'report_this_product', 'Report this product'),
(529, 'report_offence_to_the_site_administration', 'Report offence to the site Administration'),
(530, 'attention__your_report_is_strictly_confidential_and_not_visi', 'Attention! Your report is strictly confidential and not visible to other users.'),
(531, 'no_color_selected._please_select_a_color', 'No color selected. Please select a color'),
(532, 'describe_the_reason_of_your_report', 'Describe the reason of your report'),
(533, 'send_report', 'Send report'),
(534, 'rate___review', 'Rate &amp; Review'),
(535, 'rate_and_leave_your_review_about_this_product', 'Rate and leave your review about this product'),
(536, 'note__your_rating___review_will_be_published_under_this_prod', 'Note! Your rating &amp; review will be published under this product'),
(537, 'share_your_thoughts_with_other_customers', 'Share your thoughts with other customers'),
(538, 'leave_feedback', 'Leave feedback'),
(539, 'product_reviews', 'Product Reviews'),
(540, 'write_a_review', 'Write a review'),
(541, 'no_reviews_yet', 'No reviews yet'),
(543, 'leave_reviews_and_points.and_help_us_provide_complete_and_tr', 'Leave reviews and points.{%br_line%}And help us provide complete and truthful product information'),
(544, 'delete_this_review', 'Delete this review'),
(545, 'add_this_product_to_wish_list', 'Add this product to wish list'),
(546, 'please_select_the_wish_list_you_want_to_add_this_product_or_', 'Please select the wish list you want to add this product or create new'),
(547, 'or_come_up_with_a_new_list_name', 'Or come up with a new list name'),
(548, 'maximum_name_length_20_characters', 'Maximum name length 20 characters'),
(549, 'select_wishlist', 'Select wishlist'),
(550, 'wishlist_name', 'Wishlist name'),
(551, 'create__and_add', 'Create, and Add'),
(552, 'add_to', 'Add to'),
(553, 'error__invalid_request_data._list_name_is_invalid_or_missing', 'Error: Invalid request data. List name is invalid or missing'),
(554, 'the_list_name_can_not_be_more_than_20_characters_long.', 'The list name can not be more than 20 characters long.'),
(555, 'product_successfully_added_to_your_new_wishlist.', 'Product successfully added to your new wishlist.'),
(556, 'product_successfully_added_to_your_wishlist.', 'Product successfully added to your wishlist.'),
(557, 'not_approved', 'Not approved'),
(558, 'this_product_has_not_yet_been_approved_by_the_market', 'This product has not yet been approved by the market'),
(559, 'go_to_seller_profile', 'Go to seller profile'),
(560, 'no_rating_selected._please_select_a_review_rating', 'No rating selected. Please select a review rating'),
(561, 'the_description_is_too_short._please_write_the_main_thing_ab', 'The description is too short. please write the main thing about the problem'),
(562, 'the_review_you_wrote_is_too_short', 'The review you wrote is too short'),
(563, 'the_review_you_wrote_is_too_long', 'The review you wrote is too long'),
(564, 'there_is_no_report_description._please_describe_the_reason_o', 'There is no report description. Please describe the reason of your report.'),
(565, 'the_description_is_too_short._please_check_your_details.', 'The description is too short. Please check your details.'),
(566, 'the_report_you_wrote_is_too_long._maximum_report_length_shou', 'The report you wrote is too long. Maximum report length should be no more than 1200 characters'),
(567, 'thank_you_for_your_report._we_have_received_your_feedback__a', 'Thank you for your report. We have received your feedback, and will soon be reviewing it.'),
(568, 'you_cannot_attach_more_than_5_images_to_this_review.', 'You cannot attach more than 5 images to this review.'),
(569, 'your_notifications', 'Your notifications'),
(570, 'select_all_notifications', 'Select all notifications'),
(571, 'load_more', 'Load more'),
(572, 'you_have_reached_the_end_of_the_list', 'You have reached the end of the list'),
(573, 'you_have_not_any_notifications', 'You have not any notifications'),
(574, 'no_notifications', 'No notifications'),
(575, 'here_you_will_see_all_the_history_of_your_notifications', 'Here you will see all the history of your notifications'),
(576, 'go_to_home_page', 'Go to home page'),
(577, 'search_contacts', 'Search Contacts'),
(578, 'last_active', 'Last active'),
(579, 'select_messages', 'Select Messages'),
(580, 'clear_chat', 'Clear chat'),
(581, 'delete_chat', 'Delete chat'),
(582, 'selected_messages', 'Selected messages'),
(583, 'write_a_message_and_hit_enter', 'Write a message and hit Enter'),
(584, 'you_have_no_contacts', 'You have no contacts'),
(585, 'no_contacts_found', 'No contacts found'),
(586, 'no_messages', 'No messages'),
(587, 'please_select_a_chat_to_start_messaging', 'Please select a chat to start messaging'),
(588, 'are_you_sure_you_want_to_delete_all_messages_in_the_chat_wit', 'Are you sure you want to delete all messages in the chat with {%interloc_name%}? Note this action can not be undone!'),
(591, 'please_wait', 'Please wait'),
(592, 'are_you_sure_you_want_to_delete_this_chat_with___chat_histor', 'Are you sure you want to delete this chat with {%interloc_name%}? Chat history will also be delete. Please note this action can not be undone!'),
(593, 'do_you_want_to_delete_this_message_from___please_note_this_a', 'Do you want to delete this message from {%interloc_name%}? Please note this action can not be undone!'),
(594, 'no_results_found', 'No results found'),
(596, 'total_goods', 'Total goods'),
(597, 'more_information', 'More information'),
(598, 'merchants', 'Merchants'),
(599, 'total_sales', 'Total sales'),
(600, 'total_users', 'Total Users'),
(601, 'annual_sales_and_revenue_analytics', 'Annual sales and revenue analytics'),
(602, 'january', 'January'),
(603, 'february', 'February'),
(604, 'march', 'March'),
(605, 'april', 'April'),
(606, 'may', 'May'),
(607, 'june', 'June'),
(608, 'july', 'July'),
(609, 'august', 'August'),
(610, 'september', 'September'),
(611, 'october', 'October'),
(612, 'november', 'November'),
(613, 'december', 'December'),
(614, 'commission_income', 'Commission income'),
(615, 'products', 'Products'),
(616, 'balance', 'Balance'),
(617, 'new_orders', 'New orders'),
(618, 'customers', 'Customers'),
(619, 'weekly_monetization_statistics', 'Weekly Monetization Statistics'),
(620, 'short_info', 'Short info'),
(621, 'total_sales_revenue', 'Total sales revenue'),
(622, 'total_revenue_for_the_year', 'Total revenue for the year'),
(623, 'total_monthly_income', 'Total Monthly Income'),
(624, 'total_customers', 'Total customers'),
(625, 'total_orders', 'Total orders'),
(626, 'total_products', 'Total products'),
(627, 'total_reviews', 'Total reviews'),
(628, 'top_selling_products', 'Top Selling Products'),
(629, 'sunday', 'Sunday'),
(630, 'monday', 'Monday'),
(631, 'tuesday', 'Tuesday'),
(632, 'wedesday', 'Wedesday'),
(633, 'thusday', 'Thusday'),
(634, 'friday', 'Friday'),
(635, 'saturday', 'Saturday'),
(636, 'orders', 'Orders'),
(638, 'dashboard', 'Dashboard'),
(639, 'customer_orders', 'Customer orders'),
(640, 'draft', 'Draft'),
(641, 'add_product', 'Add Product'),
(642, 'wallet', 'Wallet'),
(643, 'withdrawals', 'Withdrawals'),
(645, 'account_deleting', 'Account deleting'),
(646, 'system', 'System'),
(647, 'users', 'Users'),
(648, 'reports', 'Reports'),
(649, 'payments', 'Payments'),
(650, 'payouts', 'Payouts'),
(651, 'checkouts', 'Checkouts'),
(652, 'new_updates', 'New Updates'),
(653, 'new_products', 'New products'),
(654, 'tools', 'Tools'),
(655, 'announcements', 'Announcements'),
(656, 'sitemap', 'SiteMap'),
(657, 'backup', 'Backup'),
(658, 'global_settings', 'Global settings'),
(659, 'site_settings', 'Site settings'),
(660, 'payment_settings', 'Payment settings'),
(661, 'e-mail_settings', 'E-mail settings'),
(662, 'documentation', 'Documentation'),
(663, 'policy', 'Policy'),
(664, 'terms', 'Terms'),
(665, 'account', 'Account'),
(666, 'account_settings', 'Account Settings'),
(676, 'home_page', 'Home Page'),
(678, 'my_products', 'My products'),
(679, 'user_mode', 'User mode'),
(680, 'admin_mode', 'Admin mode'),
(681, 'you_are_now_logged_in_as___please_be_careful_all_the_actions', 'You are now logged in as {%uname%}, please be careful all the actions that you will carry out will be generated on this user\\&#039;s account!'),
(682, 'please_note', 'Please note'),
(684, 'this_function_is_available_only_to_the_site_administrator', 'This function is available only to the site administrator'),
(686, 'finish_session', 'Finish session'),
(687, 'customers_orders', 'Customers orders'),
(688, 'list_of_all_customer_orders', 'List of all customer orders'),
(689, 'search_for_orders_by_customer_name', 'Search for orders by customer name'),
(690, 'customer_name', 'Customer name'),
(691, 'total_amount', 'Total amount'),
(692, 'status', 'Status'),
(693, 'placed', 'Placed'),
(694, 'actions', 'Actions'),
(695, 'no_orders_found', 'No orders found'),
(696, 'you_have_no_orders_from_users_yet._if_our_users_place_an_ord', 'You have no orders from users yet. If our users place an order for your product, you will receive a notification of receipt of the order'),
(697, 'show_details', 'Show Details'),
(698, 'nothing_found_by_your_search_terms._please_try_again_with_so', 'Nothing found by your search terms. Please try again with some diffirent keywords'),
(699, 'my_order_list', 'My order list'),
(700, 'search_for_orders_by_seller_name', 'Search for orders by seller name'),
(701, 'seller_name', 'Seller name'),
(702, 'you_have_no_orders_yet._in_order_to_place_an_order_in_the_fi', 'You have no orders yet. In order to place an order in the first place, you must purchase (pay) the goods on the checkout page.'),
(703, 'show_invoice', 'Show invoice'),
(704, 'products_management', 'Products management'),
(705, 'list_of_my_products', 'List of my products'),
(706, 'search_for_products_by_name', 'Search for products by name'),
(707, 'poster', 'Poster'),
(708, 'product_name', 'Product name'),
(709, 'sold', 'Sold'),
(710, 'profit', 'Profit'),
(711, 'action', 'Action'),
(712, 'add_new_product', 'Add New Product'),
(713, 'no_products_found.', 'No products found.'),
(714, 'to_add_a_new_product__open_the_page_using_the_link_in_the_me', 'To add a new product, open the page using the link in the menu \\&quot;Add a new product\\&quot;'),
(715, 'active', 'Active'),
(716, 'items', 'Items'),
(717, 'unsaved', 'Unsaved'),
(718, 'view', 'View'),
(719, 'nothing_found_by_your_search_term_._please_try_again_with_so', 'Nothing found by your search term {%search_query%}. Please try again with some diffirent keywords'),
(720, 'nothing_found', 'Nothing found'),
(722, 'products_draft_list', 'Products draft list'),
(723, 'draft_products', 'Draft Products'),
(724, 'no_products_found', 'No products found'),
(725, 'your_new_product_item_has_been_successfully_created_and_wait', 'Your new product item has been successfully created and waiting for moderator approval!'),
(726, 'your_new_product_item_has_been_successfully_created_', 'Your new product item has been successfully created!'),
(727, 'your_changes_to_this_product_has_been_successfully_saved_', 'Your changes to this product has been successfully saved!'),
(728, 'add_a_new_product', 'Add a new product'),
(729, 'product_basic_information', 'Product Basic Information'),
(730, 'product_name._e.g._men_s_t-shirt_etc', 'Product name. E.g. Men\\&#039;s t-shirt etc'),
(731, 'product_condition', 'Product condition'),
(732, 'enter_product_description', 'Enter product description'),
(733, 'product_pricing___shipping', 'Product Pricing &amp; Shipping'),
(734, 'regular_price', 'Regular price'),
(735, 'only_numeric_value_is_allowed._e.g._149.99', 'Only numeric value is allowed. E.g. 149.99'),
(736, 'sale_price', 'Sale price'),
(738, 'free_shipping', 'Free Shipping'),
(739, 'buyer_pays', 'Buyer Pays'),
(740, 'shipping_fee', 'Shipping fee'),
(741, 'enter_the_shipping_fee_amount._for_example', 'Enter the shipping fee amount. For Example'),
(743, 'shipping_time', 'Shipping time'),
(744, 'select_shipping_time_estimate', 'Select shipping time estimate'),
(745, 'ready_to_ship_in_1_business_day', 'Ready to ship in 1 Business Day'),
(746, 'ready_to_ship_in_2-3_business_days', 'Ready to ship in 2-3 Business Days'),
(747, 'ready_to_ship_in_4-7_business_days', 'Ready to ship in 4-7 Business Days'),
(748, 'ready_to_ship_in_8-15_business_days', 'Ready to ship in 8-15 Business Days'),
(749, 'prodcut_logistics_information', 'Prodcut Logistics Information'),
(750, 'origin', 'Origin'),
(751, 'enter_product_origin_country_name', 'Enter product origin country name'),
(752, 'enter_product_brand_name', 'Enter product brand name'),
(753, 'model_number', 'Model number'),
(754, 'enter_product_model_number', 'Enter product model number'),
(755, 'weight', 'Weight'),
(757, 'length', 'Length'),
(759, 'width', 'Width'),
(761, 'height', 'Height'),
(763, 'product_poster___photos', 'Product Poster &amp; Photos'),
(764, 'click_to_upload', 'Click to upload'),
(765, 'follow_basic_image_requirements', 'Follow basic image requirements'),
(766, 'image_size_should_be_800x800', 'Image size should be 800x800'),
(767, 'product_image_type_must_be_a_professional_photo_or_cover', 'Product image type must be a professional photo or cover'),
(768, 'product_image_format_must_be__jpeg__png__gif__tiff', 'Product image format must be: JPEG, PNG, GIF, TIFF'),
(769, 'follow_the_frame_and_provide_important_information_', 'Follow the frame and provide important information!'),
(770, 'respect_copyrights_to_photos_and_images_', 'Respect copyrights to photos and images!'),
(771, 'images', 'Images'),
(772, 'add_product_gallery_images', 'Add product gallery images'),
(773, 'note__products_with_good_and_clear_photos_are_sold_faster_', 'Note: Products with good and clear photos are sold faster!'),
(774, 'prodcut_variations', 'Prodcut variations'),
(775, 'type_of_variation', 'Type of variation'),
(776, 'single_variant_product', 'Single variant product'),
(777, 'color_variant_product', 'Color variant product'),
(778, 'size_variant_product', 'Size variant product'),
(779, 'color___size_variant_product', 'Color &amp; Size variant product'),
(780, 'leave__single_variant_product__if_the_product_has_no_options', 'Leave [Single variant product] if the product has no options'),
(781, 'please_select_sizing_type', 'Please select sizing type'),
(782, 'men_s_apparel', 'Men\\&#039;s Apparel'),
(783, 'women_s_apparel', 'Women\\&#039;s Apparel'),
(784, 'baby_and_children_apparel', 'Baby and Children Apparel'),
(785, 'baby_and_children_shoes', 'Baby and Children Shoes'),
(786, 'other_apparel_sizes', 'Other apparel sizes'),
(787, 'numeric_dimensions', 'Numeric dimensions'),
(788, 'men_s_shoes', 'Men\\&#039;s Shoes'),
(789, 'women_s_shoes', 'Women\\&#039;s Shoes'),
(790, 'memory_capacity', 'Memory capacity'),
(791, 'area_dimensions', 'Area dimensions'),
(792, 'length_dimensions', 'Length dimensions'),
(793, 'voltage_units', 'Voltage units'),
(794, 'wattage_units', 'Wattage units'),
(795, 'weight_units', 'Weight units'),
(796, 'litre_capacity', 'Litre capacity'),
(797, 'sizing__please_select_a_measurement_type_for_your_product_op', '{%bold%}Sizing{%bold_%}: Please select a measurement type for your product options'),
(798, 'add_product_option', 'Add Product Option'),
(799, 'product_options', 'Product Options'),
(808, 'you_missed_product_name._please_enter_product_name', 'You missed product name. Please enter product name'),
(809, 'the_product_name_you_entered_is_too_short._please_check_your', 'The product name you entered is too short. Please check your details'),
(810, 'the_product_name_you_entered_is_too_long._please_check_your_', 'The product name you entered is too long. Please check your details'),
(811, 'the_product_condition_is_required._please_check_your_details', 'The product condition is required. Please check your details'),
(812, 'the_product_condition_you_selected_is_not_valid._please_chec', 'The product condition you selected is not valid. Please check your details'),
(813, 'the_product_category_is_required._please_check_your_details', 'The product category is required. Please check your details'),
(814, 'the_product_category_you_selected_is_not_valid._please_check', 'The product category you selected is not valid. Please check your details'),
(815, 'the_product_description_is_field_required._please_check_your', 'The product description is field required. Please check your details'),
(816, 'the_product_description_you_wrote_is_too_short.', 'The product description you wrote is too short.'),
(817, 'the_product_description_you_wrote_is_too_long.', 'The product description you wrote is too long.'),
(818, 'the_product_regular_price_field_is_required.', 'The product regular price field is required.'),
(819, 'the_product_regular_price_you_entered_is_too_low.', 'The product regular price you entered is too low.'),
(820, 'the_product_regular_price_you_entered_is_too_high.', 'The product regular price you entered is too high.'),
(821, 'the_product_sale_price_field_is_required_', 'The product sale price field is required!'),
(822, 'the_product_sale_price_you_entered_is_too_low.', 'The product sale price you entered is too low.'),
(823, 'the_product_sale_price_you_entered_is_too_high.', 'The product sale price you entered is too high.'),
(824, 'the_regular_price_of_the_goods_and_the_sale_price_cannot_be_', 'The regular price of the goods and the sale price cannot be the same!'),
(825, 'the_product_quantity_field_is_required_', 'The product quantity field is required!'),
(826, 'the_product_quantity_you_entered_is_too_high._max_quantity_v', 'The product quantity you entered is too high. Max quantity value is 1200'),
(827, 'the_product_shipping_cost_field_is_required_', 'The product shipping cost field is required!'),
(828, 'the_product_shipping_cost_you_selected_is_not_valid.', 'The product shipping cost you selected is not valid.'),
(829, 'the_product_shipping_fee_amount_is_missing_or_invalid._pleas', 'The product shipping fee amount is missing or invalid. Please check your details'),
(830, 'the_product_shipping_time_is_required_', 'The product shipping time is required!'),
(831, 'the_product_shipping_time_estimate_you_selected_is_not_valid', 'The product shipping time estimate you selected is not valid.'),
(833, 'the_product_origin_country_name_you_entered_is_not_valid.', 'The product origin country name you entered is not valid.'),
(837, 'the_product_brand_name_you_entered_is_not_valid_', 'The product brand name you entered is not valid!'),
(839, 'the_product_model_number_you_entered_is_not_valid_', 'The product model number you entered is not valid!'),
(843, 'the_product_package_weight_value_you_entered_is_not_valid_', 'The product package weight value you entered is not valid!'),
(845, 'the_product_package_length_value_you_entered_is_not_valid_', 'The product package length value you entered is not valid!'),
(847, 'the_product_package_width_value_you_entered_is_not_valid_', 'The product package width value you entered is not valid!'),
(849, 'the_product_package_height_value_you_entered_is_not_valid_', 'The product package height value you entered is not valid!'),
(850, 'the_product_poster_image_is_required._please_select_product_', 'The product poster image is required. Please select product main image!'),
(851, 'the_product_poster_image_file_not_found_or_invalid', 'The product poster image file not found or invalid'),
(854, 'the_product_variation_type_is_missing_or_invalid.', 'The product variation type is missing or invalid.'),
(855, 'the_product_variation_type_you_selected_is_not_valid_', 'The product variation type you selected is not valid!'),
(856, 'your_changes_to_this_product_item_has_been_successfully_save', 'Your changes to this product item has been successfully saved and waiting for moderator approval!'),
(857, 'product_color_variation', 'Product color variation'),
(858, 'please_select_a_color_variation_image_for_your_product_and_s', 'Please select a color variation image for your product and select a color name for this product variant'),
(861, 'enter_the_product_regular_price', 'Enter the product regular price'),
(862, 'enter_the_product_sale_price', 'Enter the product sale price'),
(864, 'logistics', 'Logistics'),
(865, 'keep_default_logistics_info', 'Keep default logistics info'),
(866, 'add_custom_logistics_info', 'Add custom logistics info'),
(867, 'enter_a_custom_logistics_info', 'Enter a custom logistics info'),
(868, 'the_product_origin_country_name', 'The product origin country name'),
(869, 'enter_the_product_brand_name', 'Enter the product brand name'),
(870, 'please_wait_for_the_upload_of_the_previous_image_to_complete', 'Please wait for the upload of the previous image to complete!'),
(872, 'add_variant', 'Add variant'),
(873, 'maroon', 'Maroon'),
(874, 'dark_red', 'Dark Red'),
(875, 'fire_brick', 'Fire Brick'),
(876, 'red', 'Red'),
(877, 'salmon', 'Salmon'),
(878, 'tomato', 'Tomato'),
(879, 'coral', 'Coral'),
(880, 'orange_red', 'Orange Red'),
(881, 'chocolate', 'Chocolate'),
(882, 'sandy_brown', 'Sandy Brown'),
(883, 'dark_orange', 'Dark Orange'),
(884, 'orange', 'Orange'),
(885, 'dark_goldenrod', 'Dark Goldenrod'),
(886, 'goldenrod', 'Goldenrod'),
(887, 'gold', 'Gold'),
(888, 'olive', 'Olive'),
(889, 'yellow', 'Yellow'),
(890, 'yellow_green', 'Yellow Green'),
(891, 'green_yellow', 'Green Yellow'),
(892, 'chartreuse', 'Chartreuse'),
(893, 'lawn_green', 'Lawn Green'),
(894, 'green', 'Green'),
(895, 'lime', 'Lime'),
(896, 'lime_green', 'Lime Green'),
(897, 'spring_green', 'Spring Green'),
(898, 'medium_spring_green', 'Medium Spring Green'),
(899, 'turquoise', 'Turquoise'),
(900, 'light_sea_green', 'Light Sea Green'),
(901, 'medium_turquoise', 'Medium Turquoise'),
(902, 'teal', 'Teal'),
(903, 'dark_cyan', 'Dark Cyan'),
(904, 'cyan', 'Cyan'),
(905, 'dark_turquoise', 'Dark Turquoise'),
(906, 'deep_sky_blue', 'Deep Sky Blue'),
(907, 'dodger_blue', 'Dodger Blue'),
(908, 'royal_blue', 'Royal Blue'),
(909, 'navy', 'Navy'),
(910, 'dark_blue', 'Dark Blue'),
(911, 'medium_blue', 'Medium Blue'),
(912, 'blue', 'Blue'),
(913, 'blue_violet', 'Blue Violet'),
(914, 'dark_orchid', 'Dark Orchid'),
(915, 'dark_violet', 'Dark Violet'),
(916, 'purple', 'Purple'),
(917, 'dark_magenta', 'Dark Magenta'),
(918, 'magenta', 'Magenta'),
(919, 'medium_violet_red', 'Medium Violet Red'),
(920, 'deep_pink', 'Deep Pink'),
(921, 'hot_pink', 'Hot Pink'),
(922, 'crimson', 'Crimson'),
(923, 'brown', 'Brown'),
(924, 'indian_red', 'Indian Red'),
(925, 'rosy_brown', 'Rosy Brown'),
(926, 'light_coral', 'Light Coral'),
(927, 'snow', 'Snow'),
(928, 'misty_rose', 'Misty Rose'),
(929, 'dark_salmon', 'Dark Salmon'),
(930, 'light_salmon', 'Light Salmon'),
(931, 'sienna', 'Sienna'),
(932, 'sea_shell', 'Sea Shell'),
(933, 'saddle_brown', 'Saddle Brown'),
(934, 'peachpuff', 'Peachpuff'),
(935, 'linen', 'Linen'),
(936, 'bisque', 'Bisque'),
(937, 'burlywood', 'Burlywood'),
(938, 'tan', 'Tan'),
(939, 'antique_white', 'Antique White'),
(940, 'navajo_white', 'Navajo White'),
(941, 'blanched_almond', 'Blanched Almond'),
(942, 'papaya_whip', 'Papaya Whip'),
(943, 'moccasin', 'Moccasin'),
(944, 'wheat', 'Wheat'),
(945, 'oldlace', 'Oldlace'),
(946, 'floral_white', 'Floral White'),
(947, 'cornsilk', 'Cornsilk'),
(948, 'khaki', 'Khaki'),
(949, 'lemon_chiffon', 'Lemon Chiffon'),
(950, 'pale_goldenrod', 'Pale Goldenrod'),
(951, 'dark_khaki', 'Dark Khaki'),
(952, 'beige', 'Beige'),
(953, 'light_goldenrod_yellow', 'Light Goldenrod Yellow'),
(954, 'light_yellow', 'Light Yellow'),
(955, 'ivory', 'Ivory'),
(956, 'olive_drab', 'Olive Drab'),
(957, 'dark_olive_green', 'Dark Olive Green'),
(958, 'dark_sea_green', 'Dark Sea Green'),
(959, 'dark_green', 'Dark Green'),
(960, 'forest_green', 'Forest Green'),
(961, 'light_green', 'Light Green'),
(962, 'pale_green', 'Pale Green'),
(963, 'honeydew', 'Honeydew'),
(964, 'sea_green', 'Sea Green'),
(965, 'medium_sea_green', 'Medium Sea Green'),
(966, 'mintcream', 'Mintcream'),
(967, 'medium_aquamarine', 'Medium Aquamarine'),
(968, 'aquamarine', 'Aquamarine'),
(969, 'dark_slate_gray', 'Dark Slate Gray'),
(970, 'pale_turquoise', 'Pale Turquoise'),
(971, 'light_cyan', 'Light Cyan'),
(972, 'azure', 'Azure'),
(973, 'cadet_blue', 'Cadet Blue'),
(974, 'powder_blue', 'Powder Blue'),
(975, 'light_blue', 'Light Blue'),
(976, 'sky_blue', 'Sky Blue'),
(977, 'lightsky_blue', 'Lightsky Blue'),
(978, 'steel_blue', 'Steel Blue'),
(979, 'alice_blue', 'Alice Blue'),
(980, 'slate_gray', 'Slate Gray'),
(981, 'light_slate_gray', 'Light Slate Gray'),
(982, 'lightsteel_blue', 'Lightsteel Blue'),
(983, 'cornflower_blue', 'Cornflower Blue'),
(984, 'lavender', 'Lavender'),
(985, 'ghost_white', 'Ghost White'),
(986, 'midnight_blue', 'Midnight Blue'),
(987, 'slate_blue', 'Slate Blue'),
(988, 'dark_slate_blue', 'Dark Slate Blue'),
(989, 'medium_slate_blue', 'Medium Slate Blue'),
(990, 'medium_purple', 'Medium Purple'),
(991, 'indigo', 'Indigo'),
(992, 'medium_orchid', 'Medium Orchid'),
(993, 'plum', 'Plum'),
(994, 'violet', 'Violet'),
(995, 'thistle', 'Thistle'),
(996, 'orchid', 'Orchid'),
(997, 'lavender_blush', 'Lavender Blush'),
(998, 'paleviolet_red', 'PaleViolet Red'),
(999, 'pink', 'Pink'),
(1000, 'light_pink', 'Light Pink'),
(1001, 'black', 'Black'),
(1002, 'dim_gray', 'Dim Gray'),
(1003, 'gray', 'Gray'),
(1004, 'dark_gray', 'Dark Gray'),
(1005, 'silver', 'Silver'),
(1006, 'light_grey', 'Light Grey'),
(1007, 'gainsboro', 'Gainsboro'),
(1008, 'white_smoke', 'White Smoke'),
(1009, 'white', 'White'),
(1010, 'the_color_name_is_required._please_select_color_name_', 'The color name is required. Please select color name!'),
(1011, 'the_color_name_you_selected_is_not_valid_', 'The color name you selected is not valid!'),
(1012, 'already_exists', 'Already Exists'),
(1013, 'the_regular_price_field_is_required_', 'The regular price field is required!'),
(1014, 'the_regular_price_you_entered_is_too_high.', 'The regular price you entered is too high.'),
(1015, 'the_regular_price_you_entered_is_too_low.', 'The regular price you entered is too low.'),
(1016, 'the_sale_price_field_is_required_', 'The sale price field is required!'),
(1017, 'the_sale_price_you_entered_is_too_low.', 'The sale price you entered is too low.'),
(1018, 'the_sale_price_you_entered_is_too_high.', 'The sale price you entered is too high.'),
(1019, 'max_quantity_value_is_1200', 'Max quantity value is 1200'),
(1020, 'please_select_a_color-coded_image_for_your_product_variation', 'Please select a color-coded image for your product variation!'),
(1021, 'the_product_variation_color-coded_image_file_not_found_or_in', 'The product variation color-coded image file not found or invalid!'),
(1022, 'your_new_product_variation_item_has_been_successfully_added_', 'Your new product variation item has been successfully added!'),
(1026, 'please_select_a_product_sizing_type_before_adding_the_produc', 'Please select a product sizing type before adding the product variation!'),
(1027, 'you_can_not_change_the_variation_type_of_your_product__as_yo', 'You can not change the variation type of your product, as you have already added ({%number%}) product variants of a different type. In order to change the variation type of this product, first you must to remove the previously added options'),
(1028, 'product_variations_list', 'Product variations list'),
(1029, 'image', 'Image'),
(1030, 'delete_this_option', 'Delete this option'),
(1031, 'close_and_continue', 'Close and Continue'),
(1032, 'product_size_variation', 'Product size variation'),
(1033, 'you_cannot_add_more_than_20_units_of_measure._please_select_', 'You cannot add more than 20 units of measure. Please select one of them'),
(1034, 'additional', 'Additional'),
(1035, 'add_extra_size', 'Add extra size'),
(1037, 'add_custom_size_unit', 'Add custom size unit'),
(1038, 'the_size_is_required_please_select_product_size', 'The size is required Please select product size'),
(1039, 'the_size_value_you_selected_is_not_valid_', 'The size value you selected is not valid!'),
(1040, 'this_size_option_already_exists_', 'This size option already exists!'),
(1041, 'product_color___size_variation', 'Product color &amp; size variation'),
(1042, 'please_select_the_color_name', 'Please select the color name'),
(1043, 'sizing', 'Sizing'),
(1044, 'combination_options', 'Combination Options'),
(1045, 'no_combination_options_yet', 'No combination options yet'),
(1046, 'a_list_of_combination_options_will_be_displayed_here__in_ord', 'A list of combination options will be displayed here, in order to add a combination, select the color of the variant and all available sizes to the selected color of the variant'),
(1047, 'collapse_all', 'Collapse all'),
(1048, 'expand_all', 'Expand all'),
(1049, 'please_select_a_color_variation_image_for_your_product.', 'Please select a color variation image for your product.');
INSERT INTO `hex_langs` (`id`, `lang_key`, `indonesia`) VALUES
(1050, 'please_select_a_color_name_for_this_product_variant.', 'Please select a color name for this product variant.'),
(1051, 'edit_product', 'Edit product'),
(1052, 'save_draft', 'Save draft'),
(1053, 'save_changes', 'Save changes'),
(1054, 'the_variable_product_type_must_have_at_least_one_variant_', 'The variable product type must have at least one variant!'),
(1055, 'store_control_panel', 'Store control panel'),
(1056, 'store_customers', 'Store customers'),
(1057, 'store_customers_list', 'Store customers list'),
(1058, 'search_by_customer_name', 'Search by customer name'),
(1059, 'customer', 'Customer'),
(1060, 'e-mail', 'E-Mail'),
(1061, 'phone', 'Phone'),
(1062, 'country', 'Country'),
(1063, 'last_order', 'Last order'),
(1064, 'no_customers_found', 'No customers found'),
(1065, 'you_have_no_customers_yet._this_page_will_display_the_list_o', 'You have no customers yet. This page will display the list of customers in your store.'),
(1066, 'account_wallet', 'Account wallet'),
(1067, 'wallet_management_dashboard', 'Wallet management dashboard'),
(1069, 'current_balance', 'Current balance'),
(1070, 'today_s_income', 'Today\\&#039;s income'),
(1071, 'monthly_income', 'Monthly income'),
(1072, 'total_revenue', 'Total revenue'),
(1074, 'purchases', 'Purchases'),
(1075, 'account_transactions_history', 'Account transactions history'),
(1076, 'search_for_transactions_by_username', 'Search for transactions by username'),
(1077, 'paid_amount', 'Paid amount'),
(1078, 'seller', 'Seller'),
(1079, 'date', 'Date'),
(1080, 'no_transactions_found', 'No transactions found'),
(1081, 'you_have_no_account_transactions_yet._on_this_page__a_list_o', 'You have no account transactions yet. On this page, a list of all transactions of your account will be displayed.'),
(1082, 'top_up_balance', 'Top up balance'),
(1083, 'the_amount_you_intend_to_pay_will_replenish_the_balance_of_y', 'The amount you intend to pay will replenish the balance of your account and can only be used in this account.'),
(1084, 'balance_replenishment_is_carried_out_using_the_paypal_paymen', 'Balance replenishment is carried out using the PayPal payment system'),
(1085, 'transferring_funds_from_this_account_to_a_bank_account_is_ca', 'Transferring funds from this account to a bank account is carried out only through the administration of the market'),
(1086, 'top_up_amount', 'Top up amount'),
(1087, 'continue', 'Continue'),
(1088, 'top_up_your_account_balance', 'Top up your account balance'),
(1089, 'pay_to__', 'Pay to: {%site_name%}'),
(1090, 'payment_created_successfully._please_wait._redirecting_...', 'Payment created successfully. Please wait. Redirecting ...'),
(1091, 'error__top_up_transaction_failed_', 'Error: Top up transaction failed!'),
(1092, 'your_account_balance_replenishment_failed._please_wait_and_t', 'Your account balance replenishment failed. Please wait and try your request again later!'),
(1093, 'please_enter_the_top_up_amount', 'Please enter the top up amount'),
(1094, 'top-up_completed_successfully_', 'Top-up completed successfully!'),
(1095, 'your_account_wallet_has_been_successfully_replenished__and_n', 'Your account wallet has been successfully replenished, and now your balance is: {%balance%}'),
(1096, 'manage_new_market_products', 'Manage new market products'),
(1097, 'list_of_all_non-approved_market_products', 'List of all non-approved market products'),
(1098, 'approve', 'Approve'),
(1099, 'product_has_been_moved_to_the_list_of_approved_products', 'Product has been moved to the list of approved products'),
(1100, 'account_removal_requests_management', 'Account removal requests management'),
(1101, 'list_of_all_account_deletion_requests', 'List of all account deletion requests'),
(1102, 'reason', 'Reason'),
(1103, 'requested_date', 'Requested date'),
(1104, 'no_requests_found', 'No requests found'),
(1105, 'there_are_no_account_deletion_requests_yet._this_page_will_r', 'There are no account deletion requests yet. This page will receive requests from users to delete their accounts!'),
(1106, 'other_reasons', 'Other reasons'),
(1107, 'pending', 'Pending'),
(1108, 'user_info', 'User Info'),
(1109, 'temporary_session', 'Temporary session'),
(1110, 'reject_request', 'Reject request'),
(1111, 'i_have_a_duplicate_account', 'I have a duplicate account'),
(1112, 'troubles_in_getting_started', 'Troubles in getting started'),
(1113, 'i_don_t_find_it_useful', 'I don\\&#039;t find it useful'),
(1114, 'can_not_find_buyers', 'Can not find buyers'),
(1115, 'requested_at', 'Requested at'),
(1116, 'user_profile_page', 'User profile page'),
(1117, 'removal_reason', 'Removal Reason'),
(1118, 'close_request_message', 'Close request message'),
(1119, 'this_user_has_not_provided_any_additional_information_about_', 'This user has not provided any additional information about his departure'),
(1120, 'are_you_sure_that_you_want_to_delete_this_account__note_that', 'Are you sure that you want to delete this account? Note that this action is undonable!'),
(1121, 'market_products_management', 'Market products management'),
(1122, 'list_of_all_market_products', 'List of all market products'),
(1123, 'variations', 'Variations'),
(1124, 'options', 'Options'),
(1125, 'single', 'Single'),
(1126, 'market_sellers', 'Market sellers'),
(1127, 'list_of_market_sellers', 'List of market sellers'),
(1128, 'search_by_seller_name', 'Search by seller name'),
(1129, 'selling_items', 'Selling items'),
(1130, 'last_payout', 'Last payout'),
(1131, 'no_sellers_found', 'No sellers found'),
(1132, 'you_have_no_sellers_yet._on_this_page_will_be_displayed_list', 'You have no sellers yet. On this page will be displayed list of all market sellers.'),
(1133, 'visit_the_store', 'Visit the store'),
(1134, 'market_users', 'Market users'),
(1135, 'list_of_market_users', 'List of market users'),
(1136, 'search_by_username', 'Search by username'),
(1137, 'user_name', 'User Name'),
(1138, 'ip', 'IP'),
(1139, 'no_users_found', 'No users found'),
(1140, 'you_have_no_users_yet._a_list_of_all_market_users_will_be_di', 'You have no users yet. A list of all market users will be displayed on this page.'),
(1141, 'manage_customer_s_reports', 'Manage customer\\&#039;s reports'),
(1142, 'list_of_all_reports_from_users', 'List of all reports from users'),
(1143, 'search_reporter_by_name', 'Search reporter by name'),
(1144, 'reporter', 'Reporter'),
(1145, 'product', 'Product'),
(1146, 'unviewed', 'Unviewed'),
(1147, 'product_page', 'Product page'),
(1148, 'seller_profile', 'Seller profile'),
(1149, 'viewed', 'Viewed'),
(1150, 'no_reports_found', 'No reports found'),
(1151, 'there_are_no_reports_yet._this_page_will_display_a_list_of_p', 'There are no reports yet. This page will display a list of product reports from users'),
(1152, 'reported_at', 'Reported at'),
(1153, 'report_message', 'Report Message'),
(1154, 'close_report_message', 'Close report message'),
(1155, 'are_you_sure_that_you_want_to_delete_this_report__note_that_', 'Are you sure that you want to delete this report? Note that this action is undonable!'),
(1156, 'market_payouts', 'Market payouts'),
(1157, 'total_requests', 'Total requests'),
(1158, 'unpaid', 'Unpaid'),
(1159, 'annual_market_monetization_statistics', 'Annual market monetization statistics'),
(1160, 'no_payouts_found', 'No payouts found'),
(1161, 'you_have_no_payment_requests_yet._this_page_will_display_a_l', 'You have no payment requests yet. This page will display a list of requests for payment of funds, from market sellers!'),
(1162, 'pay', 'Pay'),
(1163, 'decline', 'Decline'),
(1164, 'are_you_sure_you_want_to_reject_this_request__please_note_th', 'Are you sure you want to reject this request? Please note that this action cannot be undone!'),
(1165, 'yes__decline_it_', 'Yes, Decline it!'),
(1166, 'list_of_requests_from_sellers_for_payout', 'List of requests from sellers for payout'),
(1167, 'requestor', 'Requestor'),
(1168, 'paypal-payment_link', 'PayPal-Payment Link'),
(1169, 'amount', 'Amount'),
(1170, 'your_withdrawal_request_has_been_declined_by_the_administrat', 'Your withdrawal request has been declined by the administration of the market!'),
(1171, 'payout_request_is_declined_', 'Payout request is declined!'),
(1173, 'customer_checkouts_management', 'Customer checkouts management'),
(1175, 'method', 'Method'),
(1176, 'market_rate', 'Market rate'),
(1177, 'there_are_no_transactions_yet._on_this_page_will_be_displaye', 'There are no transactions yet. On this page will be displayed a list of all market transactions'),
(1178, 'nothing_found_by_your_search_term._please_try_again_with_som', 'Nothing found by your search term. Please try again with some diffirent keywords'),
(1179, 'success', 'Success'),
(1180, 'failed', 'Failed'),
(1181, 'filter_transactions', 'Filter transactions'),
(1182, 'enter_name', 'Enter name'),
(1183, 'enter_amount', 'Enter amount'),
(1184, 'transaction_status', 'Transaction status'),
(1185, 'payment_method', 'Payment method'),
(1186, 'card', 'Card'),
(1187, 'paypal', 'Paypal'),
(1188, 'apply_filter', 'Apply filter'),
(1189, 'reset_all', 'Reset all'),
(1190, 'create_announcement', 'Create announcement'),
(1192, 'announcement_title', 'Announcement title'),
(1193, 'enter_an_announcement_title', 'Enter an announcement title'),
(1194, 'announcement_url', 'Announcement url'),
(1195, 'enter_an_announcement_redirect_url', 'Enter an announcement redirect URL'),
(1196, 'enter_the_url_if_you_want_to_redirect_users_to_some_source_o', 'Enter the URL if you want to redirect users to some source or leave it blank'),
(1197, 'announcement_message', 'Announcement message'),
(1198, 'enter_an_announcement_message', 'Enter an announcement message'),
(1199, 'announcement_type', 'Announcement type'),
(1200, 'information_(blue)', 'Information (Blue)'),
(1201, 'warning_(orange)', 'Warning (Orange)'),
(1202, 'important_(red)', 'Important (Red)'),
(1203, 'success_(green)', 'Success (Green)'),
(1204, 'this_option_determines_the_priority_of_events_(message_sever', 'This option determines the priority of events (message severity level). For example, the \\&quot;Important (red)\\&quot; option determines the critical importance of the message, etc.'),
(1205, 'reset', 'Reset'),
(1206, 'announce', 'Announce'),
(1207, 'the_announcement_title_is_required_', 'The announcement title is required!'),
(1208, 'the_announcement_message_is_required_', 'The announcement message is required!'),
(1209, 'the_announcement_url_you_entered_is_not_valid._please_check_', 'The announcement url you entered is not valid. Please check your details!'),
(1210, 'your_announcement_has_been_sent_to_the_all_active_users_of_t', 'Your announcement has been sent to the all active users of the market!'),
(1211, 'site_map_settings', 'Site map settings'),
(1212, 'generate_sitemap', 'Generate sitemap'),
(1213, 'xml_sitemap_-_last_updata_was_in', 'XML Sitemap - Last Updata was in'),
(1214, 'entries_per_sitemap', 'Entries per sitemap'),
(1215, 'please_enter_the_maximum_number_of_entries_per_sitemap_page_', 'Please enter the maximum number of entries per sitemap page (Default is 1000)'),
(1216, 'change_frequency', 'Change frequency'),
(1217, 'daily', 'Daily'),
(1218, 'always', 'Always'),
(1219, 'hourly', 'Hourly'),
(1220, 'weekly', 'Weekly'),
(1221, 'monthly', 'Monthly'),
(1222, 'yearly', 'Yearly'),
(1223, 'never', 'Never'),
(1224, 'sitemap_updating_rate._default_(daily)', 'SiteMap updating rate. Default (daily)'),
(1225, 'last_modification', 'Last modification'),
(1226, 'use_server_s_response', 'Use server\\&#039;s response'),
(1227, 'use_specific_date___time', 'Use specific date / time'),
(1228, 'the_date_the_sitemap_was_last_modified_(optional)', 'The date the sitemap was last modified (optional)'),
(1229, 'update_sitemap', 'Update sitemap'),
(1230, 'updated_successfully', 'Updated successfully'),
(1231, 'the_sitemaps_storage_folder_does_not_exists_or_not_writable_', 'The sitemaps storage folder does not exists or not writable!'),
(1232, 'the_sitemap-index.xml_does_not_exists_or_not_writable_', 'The sitemap-index.xml does not exists or not writable!'),
(1233, 'the_sitemap_maps_forder_does_not_exists_or_not_writable_', 'The sitemap/maps forder does not exists or not writable!'),
(1234, 'the_entries_per_sitemap_field_is_required_', 'The entries per sitemap field is required!'),
(1235, 'the_entries_per_sitemap_field_value_must_be_between_100_-_30', 'The entries per sitemap field value must be between 100 - 3000!'),
(1236, 'site_map_has_been_updated_successfully.', 'Site map has been updated successfully.'),
(1237, 'change_frequency_field_value_is_missing_or_invalid_', 'Change frequency field value is missing or invalid!'),
(1238, 'last_modification_field_value_is_missing_or_invalid_', 'Last modification field value is missing or invalid!'),
(1239, 'please_enter_the_last_modification_date_or_select_another_op', 'Please enter the last modification date or select another option above!'),
(1240, 'site_backups_management', 'Site backups management'),
(1241, 'to_start_the_process_of_creating_a_backup_copy_of_your_site_', 'to start the process of creating a backup copy of your site, the module of PHP (ZipArchive) must be installed on the server, and also make sure that the root directory of your site is writable by the user of the HTTP web server (www-data), otherwise, the process will fail!'),
(1242, 'creating_a_backup_may_take_some_time_depending_on_the_amount', 'creating a backup may take some time depending on the amount of content on your site, therefore, after clicking the (Create backup) button, wait for the process to complete without leaving the page!'),
(1243, 'list_of_all_backups', 'List of all backups'),
(1244, 'last_backup', 'Last backup'),
(1245, 'files_backup', 'Files Backup'),
(1246, 'sql_backup', 'SQL Backup'),
(1247, 'files_size', 'Files Size'),
(1248, 'sql_size', 'SQL Size'),
(1249, 'created_date', 'Created date'),
(1250, 'back_up', 'Back up'),
(1251, 'no_backups_found', 'No backups found'),
(1252, 'you_do_not_have_backups_yet._to_back_up_your_site__click_on_', 'You do not have backups yet. To back up your site, click on the red button in the lower right corner.'),
(1253, 'are_you_sure_you_want_to_make_a_new_backup__please_note_that', 'Are you sure you want to make a new backup? Please note that this may take several minutes.'),
(1254, 'yes__create_it_', 'Yes, Create it!'),
(1255, 'the_new_site_backup_has_been_successfully_created_', 'The new site backup has been successfully created!'),
(1256, 'the_new_backup_successfully_created_', 'The new backup successfully created!'),
(1257, 'the_backup_creating_process_has_been_successfully_finished._', 'The backup creating process has been successfully finished. We recommend you to download your backups via FTP.'),
(1258, 'the_backup_has_been_successfully_deleted_', 'The backup has been successfully deleted!'),
(1259, 'market_general_settings', 'Market general settings'),
(1260, 'market_info_settings', 'Market info settings'),
(1261, 'market_title', 'Market title'),
(1262, 'enter_your_web_site_title', 'Enter your web site title'),
(1263, 'market_name', 'Market name'),
(1264, 'enter_your_web_site_name', 'Enter your web site name'),
(1265, 'market_description', 'Market description'),
(1266, 'enter_your_web_site_description', 'Enter your web site description'),
(1267, 'market_keywords', 'Market keywords'),
(1268, 'enter_your_web_site_keywords', 'Enter your web site keywords'),
(1269, 'enter_a_popular_ecommerce_keywords._please_note_that_keyword', 'Enter a popular ecommerce keywords. Please note that keywords must be separated by a comma.'),
(1270, 'google_analytics', 'Google analytics'),
(1271, 'put_here_google_analytics_(javascript)_code._more_about_this', 'Put here google analytics (JavaScript) code. More about this read here'),
(1272, 'company_location_address', 'Company location address'),
(1273, 'enter_your_company_location_address', 'Enter your company location address'),
(1274, 'company_contacts_info', 'Company contacts info'),
(1275, 'enter_your_company_contacts_informations', 'Enter your company contacts informations'),
(1276, 'market_e-mail_address', 'Market e-mail address'),
(1277, 'enter_your_web_site_email', 'Enter your web site email'),
(1278, 'market_currency', 'Market currency'),
(1279, 'please_note_that_a_change_in_market_currency_will_affect_all', 'Please note that a change in market currency will affect all product prices globally in the market, and this will force all sellers to change prices for their goods in accordance with the new currency'),
(1280, 'market_default_language', 'Market default language'),
(1281, 'your_changes_have_been_saved_successfully_', 'Your changes have been saved successfully!'),
(1283, 'changes_saved', 'Changes saved'),
(1284, 'market_payments___payouts_settings', 'Market Payments &amp; Payouts Settings'),
(1285, 'paypal_api_settings', 'PayPal API Settings'),
(1286, 'paypal_api_public_key', 'PayPal API public key'),
(1287, 'enter_paypal_api_public_key', 'Enter payPal API public key'),
(1289, 'enter_paypal_api_secret_key', 'Enter PayPal API secret key'),
(1290, 'this_is_your_personal_secret_key_to_accsess_the_paypal_payme', 'This is your personal secret key to accsess the PayPal Payments API. Please do not publish or share this private token'),
(1291, 'paypal_payment_mode', 'PayPal Payment mode'),
(1292, 'stripe_api_settings', 'Stripe API settings'),
(1293, 'stripe_api_public_key', 'Stripe API public key'),
(1294, 'enter_stripe_api_public_key', 'Enter stripe API public key'),
(1295, 'stripe_api_secret_key', 'Stripe API secret key'),
(1296, 'enter_stripe_api_secret_key', 'Enter stripe API secret key'),
(1297, 'this_is_your_personal_secret_key_to_accsess_the_stripe_payme', 'This is your personal secret key to accsess the Stripe Payments API. Please do not publish or share this private token'),
(1298, 'product_pricing_settings', 'Product pricing settings'),
(1299, 'product_min_price', 'Product min price'),
(1300, 'min_price', 'Min price'),
(1301, 'product_max_price', 'Product max price'),
(1302, 'max_price', 'Max price'),
(1303, 'market_payout_settings', 'Market payout settings'),
(1304, 'payout_period', 'Payout period'),
(1305, 'payout_each_7_days', 'Payout each 7 days'),
(1306, 'payout_each_10_days', 'Payout each 10 days'),
(1307, 'payout_each_15_days', 'Payout each 15 days'),
(1308, 'payout_each_1_month', 'Payout each 1 month'),
(1309, 'payout_each_2_months', 'Payout each 2 months'),
(1310, 'payout_each_3_months', 'Payout each 3 months'),
(1311, 'we_strongly_recommend_that_you_do_not_pay_funds_to_sellers_o', 'We strongly recommend that you do not pay funds to sellers of your market for a period of less than 30 days, to prevent fraudulent actions by sellers and protect the rights of your customers.'),
(1312, 'min_payout_request_amount', 'Min payout request amount'),
(1314, 'market_mailing_system_settings', 'Market mailing system settings'),
(1315, 'smtp_user', 'SMTP User'),
(1316, 'enter_smtp_server_username', 'Enter SMTP server username'),
(1317, 'smtp_host', 'SMTP Host'),
(1318, 'enter_smtp_host_name', 'Enter SMTP host name'),
(1319, 'smtp_password', 'SMTP Password'),
(1320, 'enter_smtp_server_password', 'Enter SMTP server password'),
(1321, 'smtp_encription_type', 'SMTP Encription type'),
(1322, 'smtp_server_type', 'SMTP Server type'),
(1323, 'smtp_server', 'SMTP Server'),
(1324, 'mail_(default_unix_server)', 'Mail (Default unix server)'),
(1325, 'smtp_port', 'SMTP Port'),
(1326, 'enter_smtp_server_port', 'Enter SMTP server port'),
(1327, 'the_content_of_this_page_will_be_publicly_available_to_all_v', 'The content of this page will be publicly available to all visitors to your site, and should contain a description of the type of activity (products or services) of your enterprise, for example: What do you offer, How to contact you, etc.'),
(1328, 'about_company', 'About company'),
(1331, 'list_of_all_customer_reviews', 'List of all customer reviews'),
(1332, 'purchased_item', 'Purchased item'),
(1333, 'valuation', 'Valuation'),
(1334, 'rating', 'Rating'),
(1335, 'review_date', 'Review Date'),
(1336, 'there_are_no_reviews_from_your_customers._on_this_page___wil', 'There are no reviews from your customers. On this page,  will be displayed a list of all reviews from your customers!'),
(1337, 'very_good_', 'Very Good!'),
(1338, 'average_', 'Average!'),
(1339, 'excellent_', 'Excellent!'),
(1340, 'poor_', 'Poor!'),
(1341, 'good_', 'Good!'),
(1342, 'reviwed_at', 'Reviwed at'),
(1343, 'review_rating', 'Review rating'),
(1344, 'hide_review_details_', 'Hide review details!'),
(1345, 'this_customer_did_not_write_a_message_under_his_review.', 'This customer did not write a message under his review.'),
(1346, 'please_follow_these_guidelines__indicate_the_minimum_length_', 'Please follow these guidelines: Indicate the minimum length (5 characters).{%br%} Use uppercase and lowercase letters.{%br%} Use numbers and special characters (&amp;% $)'),
(1347, 'manage_account_settings', 'Manage account settings'),
(1348, 'account_general_settings', 'Account general settings'),
(1349, 'avatar', 'Avatar'),
(1350, 'we_recommend_using_an_image_for_your_avatar_with_a_1__1_aspe', 'We recommend using an image for your avatar with a 1: 1 aspect ratio, such as 150x150, 300x300, etc.'),
(1351, 'enter_your_first_name', 'Enter your first name'),
(1352, 'surname', 'Surname'),
(1353, 'enter_your_last_name', 'Enter your last name'),
(1354, 'enter_about_your_business', 'Enter about your business'),
(1355, 'this_information_will_be_published_on_your_profile__and_visi', 'This information will be published on your profile, and visible to the all your visitors'),
(1356, 'enter_your_e-mail_address', 'Enter your E-mail address'),
(1357, 'enter_your_mobile_phone_number', 'Enter your mobile phone number'),
(1358, 'enter_your_whatsapp_number', 'Enter your whatsapp number'),
(1359, 'please_provide_us_with_your_most_current_contact_information', 'Please provide us with your most current contact information so that we and your customers can quickly contact you at any time.'),
(1360, 'gender', 'Gender'),
(1361, 'male', 'Male'),
(1362, 'female', 'Female'),
(1363, 'language', 'Language'),
(1364, 'account_address_settings', 'Account address settings'),
(1365, 'city', 'City'),
(1367, 'enter_your_street_name', 'Enter your street name'),
(1368, 'enter_your_office_or_apartment_or_suite_number', 'Enter your office or apartment or suite number'),
(1369, 'postal', 'Postal'),
(1370, 'enter_your_zip_postal_code_number', 'Enter your Zip/Postal code number'),
(1371, 'important', 'Important'),
(1372, 'please_provide_your_actual_address_of_residence', 'please provide your actual address of residence'),
(1373, 'account_password_settings', 'Account password settings'),
(1374, 'old_password', 'Old password'),
(1375, 'enter_your_current_password', 'Enter your current password'),
(1376, 'new_password', 'New password'),
(1377, 'create_a_new_password', 'Create a new password'),
(1378, 'confirm_your_new_password', 'Confirm your new password'),
(1379, 'account_deletion_request', 'Account deletion request'),
(1380, 'password', 'Password'),
(1381, 'message', 'Message'),
(1382, 'tell_us_more_about_your_reason_for_leaving_(optional)', 'Tell us more about your reason for leaving (Optional)'),
(1383, 'to_delete_your_account__you_need_to_send_a_deletion_request_', 'To delete your account, you need to send a deletion request, as a result, the site administrator will consider your request and respond to it, but before you do it Please note that everything in your account will be permanently deleted. This includes all of your products, transaction information, orders, etc.'),
(1384, 'send_account_deletion_request', 'Send account deletion request'),
(1385, 'your_avatar_has_been_successfully_changed_', 'Your avatar has been successfully changed!'),
(1386, 'first_name_field_is_required_for_the_user_and_should_not_be_', 'First name field is required for the user and should not be empty!'),
(1387, 'the_first_name_field_length_must_be_between_3___25_character', 'The first name field length must be between 3 / 25 characters length'),
(1388, 'the_first_name_contains_invalid_characters._allowed_characte', 'The first name contains invalid characters. Allowed characters are a-z'),
(1389, 'the_last_name_field_is_required_for_the_user_and_should_not_', 'The last name field is required for the user and should not be empty!'),
(1390, 'the_last_name_field_length_must_be_between_3___25_characters', 'The last name field length must be between 3 / 25 characters length'),
(1391, 'the_last_name_contains_invalid_characters._allowed_character', 'The last name contains invalid characters. Allowed characters are a-z'),
(1392, 'the_user_bio_field_length_must_be_between_12___220_character', 'The user bio field length must be between 12 / 220 characters length'),
(1393, 'the_e-mail_address_field_is_required_for_the_user_and_should', 'The e-mail address field is required for the user and should not be empty!'),
(1394, 'this_e-mail_is_invalid._please_enter_a_valid_e-mail_address_', 'This e-mail is invalid. Please enter a valid E-mail address!'),
(1395, 'this_e-mail_is_already_taken_', 'This E-mail is already taken!'),
(1396, 'the_phone_number_you_entered_is_not_vlaid_', 'The phone number you entered is not vlaid!'),
(1397, 'the_whatsapp_number_you_entered_is_not_vlaid.', 'The whatsapp number you entered is not vlaid.'),
(1398, 'the_user_gender_field_value_is_not_valid_', 'The user gender field value is not valid!'),
(1399, 'the_user_language_field_value_is_not_valid_', 'The user language field value is not valid!'),
(1400, 'the_user_country_field_value_is_not_valid_', 'The user country field value is not valid!'),
(1401, 'invalid_city_name._please_check_your_details_', 'Invalid city name. Please check your details!'),
(1402, 'invalid_street_name._please_check_your_details_', 'Invalid street name. Please check your details!'),
(1403, 'invalid_office_or_apartment_address._please_check_your_detai', 'Invalid office or apartment address. Please check your details.'),
(1404, 'invalid_zip_postal_code._please_check_your_details_', 'Invalid zip/postal code. Please check your details!'),
(1405, 'your_changes_have_been_successfully_saved_', 'Your changes have been successfully saved!'),
(1406, 'the_old_password_field_is_required_', 'The old password field is required!'),
(1407, 'the_currnet_password_you_entered_is_not_valid_', 'The currnet password you entered is not valid!'),
(1408, 'the_new_password_field_is_required_', 'The new password field is required!'),
(1409, 'the_new_password_is_fully_consistent_with_the_old.', 'The new password is fully consistent with the old.'),
(1410, 'the_new_password_you_entered_must_be_at_least_8_characters', 'The new password you entered must be at least 8 characters'),
(1411, 'the_new_password_you_entered_is_too_long._maximum_password_l', 'The new password you entered is too long. Maximum password length is 20 characters!'),
(1412, 'passwords_don_t_match', 'Passwords don\\&#039;t match'),
(1413, 'your_new_password_have_been_successfully_saved_', 'Your new password have been successfully saved!'),
(1414, 'the_password_has_been_changed_', 'The password has been changed!'),
(1415, 'the_password_of_your_account_was_just_changed._please_be_sur', 'The password of your account was just changed. Please be sure to memorize it or note it in a safe place!'),
(1416, 'user_password_is_required._please_enter_your_current_passwor', 'User password is required. Please enter your current password!'),
(1417, 'the_password_you_entered_is_not_valid._please_enter_your_acc', 'The password you entered is not valid. Please enter your account password!'),
(1418, 'the_account_deletion_reason_field_value_is_required._please_', 'The account deletion reason field value is required. Please select the reason of your leave!'),
(1419, 'the_account_deletion_reason_field_value_is_invalid_', 'The account deletion reason field value is invalid!'),
(1420, 'the_account_deletion_message_is_too_long._the_maximum_messag', 'The account deletion message is too long. The maximum message length is 600!'),
(1421, 'your_account_deletion_request_has_been_successfulyy_sent.', 'Your account deletion request has been successfulyy sent.'),
(1422, 'account_deletion_request_sent_', 'Account deletion request sent!'),
(1423, 'you_have_successuflly_entered_an_account_deletion_request._y', 'You have successuflly entered an account deletion request. You will be notified by email or the administration will contact you, once we consider your request!'),
(1424, 'your_request_to_delete_your_account_has_been_received_and_is', 'Your request to delete your account has been received and is waiting, you will receive a notification by e-mail or our moderator will contact you!'),
(1425, '_-_shop_online_easily___conveniently_', '{%name%} - Shop online easily &amp; conveniently!'),
(1426, 'contacts', 'Contacts'),
(1427, 'contact_info_of_-_', 'Contact info of - {%name%}'),
(1432, 'checkout_-_', 'Checkout - {%name%}'),
(1433, 'trading_terms_of_sale_in_-_', 'Trading terms of sale in - {%name%}'),
(1434, 'messages_-_', 'Messages - {%name%}'),
(1435, 'notifications_-_', 'Notifications - {%name%}'),
(1437, 'terms___agreements_of_use_-_', 'Terms &amp; Agreements of use - {%name%}'),
(1438, 'wish_lists_-_', 'Wish lists - {%name%}'),
(1439, 'about_company_-_', 'About company - {%name%}'),
(1440, '_-_products___prices_of_marketplace_-_', '{%catg_name%} - Products &amp; Prices of marketplace - {%name%}'),
(1441, 'administrator_dashboard_-_', 'Administrator dashboard - {%name%}'),
(1442, 'control_panel_dashboard_-_', 'Control panel dashboard - {%name%}'),
(1443, 'account_deleting_-_', 'Account deleting - {%name%}'),
(1444, 'account_reviews_-_', 'Account reviews - {%name%}'),
(1445, 'create_a_new_product', 'Create a new product'),
(1446, 'create_a_backup_-_', 'Create a backup - {%name%}'),
(1447, 'announcements_-_', 'Announcements - {%name%}'),
(1448, 'store_customer', 'Store customer'),
(1449, 'merchant_terms_of_saling_-_', 'Merchant terms of saling - {%name%}'),
(1450, 'terms_of_use_-_', 'Terms of use - {%name%}'),
(1451, 'edit_-_', 'Edit - {%name%}'),
(1453, 'account_settings_-_', 'Account settings - {%name%}'),
(1454, 'merchants_list_of_-_', 'Merchants list of - {%name%}'),
(1455, 'payouts_-_', 'Payouts - {%name%}'),
(1456, 'products_list_of_-_', 'Products list of - {%name%}'),
(1457, 'checkout_transactions_-_', 'Checkout transactions - {%name%}'),
(1458, 'market_users_-_', 'Market users - {%name%}'),
(1459, 'my_orders_-_', 'My orders - {%name%}'),
(1460, 'my_products_-_', 'My products - {%name%}'),
(1461, 'new_products_-_', 'New products - {%name%}'),
(1462, 'order_details_-_', 'Order details - {%name%}'),
(1463, 'order_invoice_-_', 'Order invoice - {%name%}'),
(1464, 'payment_settings_-_', 'Payment settings - {%name%}'),
(1465, 'draft_-_', 'Draft - {%name%}'),
(1466, 'reports_-_', 'Reports - {%name%}'),
(1467, 'xml_sitemap_-_', 'XML Sitemap - {%name%}'),
(1468, 'site_settings_-_', 'Site settings - {%name%}'),
(1469, 'wallet_-_', 'Wallet - {%name%}'),
(1470, 'withdrawals_-_', 'Withdrawals - {%name%}'),
(1471, 'contact_seller', 'Contact seller'),
(1472, 'contact_customer', 'Contact customer'),
(1475, 'the_product_sku_value_you_entered_is_too_long_', 'The product SKU value you entered is too long!'),
(1476, 'the_product_with_such_sku_id_alerady_exists_', 'The product with such SKU ID alerady exists!'),
(1477, 'customer_order_details', 'Customer order details'),
(1478, 'customer_contacts', 'Customer contacts'),
(1479, 'shipping', 'Shipping'),
(1480, 'undefined', 'Undefined'),
(1481, 'processing', 'Processing'),
(1482, 'processed', 'Processed'),
(1483, 'sent', 'Sent'),
(1484, 'shipped', 'Shipped'),
(1485, 'canceled', 'Canceled'),
(1486, 'expired', 'Expired'),
(1487, 'returned', 'Returned'),
(1488, 'order_history_timeline', 'Order history timeline'),
(1489, 'date_added', 'Date Added'),
(1490, 'comment', 'Comment'),
(1491, 'customer_notified', 'Customer notified'),
(1492, 'add_to_story', 'Add to story'),
(1493, 'order_status', 'Order status'),
(1494, 'notify_buyer', 'Notify Buyer'),
(1495, 'enter_a_comment_for_your_post', 'Enter a comment for your post'),
(1496, 'update_order_status', 'Update order status'),
(1497, 'choose_order_status', 'Choose order status'),
(1498, 'no_order_updates_found', 'No order updates found'),
(1499, 'there_are_no_comments_on_this_order_yet.', 'There are no comments on this order yet.'),
(1500, 'yes', 'Yes'),
(1501, 'please_select_an_order_status_for_your_update_', 'Please select an order status for your update!'),
(1502, 'order_status_has_been_updated_successfully_', 'Order status has been updated successfully!'),
(1504, 'comments_should_be_between_15_-_600_characters_in_length', 'Comments should be between 15 - 600 characters in length'),
(1505, 'has_updated_your_order_status', 'has updated your order status'),
(1506, 'order_invoice', 'Order invoice'),
(1507, 'seller_s_contacts', 'Seller\\&#039;s contacts'),
(1508, 'total_paid', 'Total paid'),
(1509, 'there_are_no_comments_from_the_seller_on_your_order.', 'There are no comments from the seller on your order.'),
(1510, 'cancel_order', 'Cancel order'),
(1511, 'your_order_cancellation_request_has_been_sent_successfully.', 'Your order cancellation request has been sent successfully.'),
(1512, 'has_canceled_his_order_for_your_product', 'has canceled his order for your product'),
(1517, 'refunds', 'Refunds'),
(1518, 'customer_refunds', 'Customer refunds'),
(1519, 'customer_refund_requests', 'Customer refund requests'),
(1520, 'list_of_all_order_cancellation_requests', 'List of all order cancellation requests'),
(1521, 'purchase_amount', 'Purchase amount'),
(1522, 'mark_as_paid', 'Mark as paid'),
(1523, 'payment_info', 'Payment info'),
(1524, 'payment_id', 'Payment ID'),
(1525, 'cancellation_fee', 'Cancellation fee'),
(1526, 'order_cancellation_fee', 'Order cancellation fee'),
(1527, 'refund_is_almost_complete_', 'Refund is almost complete!'),
(1528, 'the_cancellation_and_refund_process_is_almost_complete__exce', 'The cancellation and refund process is almost complete, except that you need to go to the your Stripe dashboard panel, find the transaction with the number: <b>{%trans_id%}</b> and make a refund.'),
(1529, 'there_are_no_refund_requests_yet._this_page_will_receive_req', 'There are no refund requests yet. This page will receive requests from customers to cancel their orders!'),
(1530, 'important__the_cancellation_and_refund_process_is_almost_com', 'Important: The cancellation and refund process is almost complete, except that you need to go to the your Paypal business account, find the transaction with the number: <b>{%trans_id%}</b> and issue a refund.'),
(1531, 'refund_has_been_completed_succesffully_', 'Refund has been completed succesffully!'),
(1533, 'order_cancellation_completed_succesffully_', 'order cancellation completed succesffully!'),
(1538, 'page_not_found', 'Page not found'),
(1539, 'go_to_homepage', 'Go to homepage'),
(1540, 'product_deleting', 'Product deleting'),
(1541, 'deleted_products_-_', 'Deleted products - {%name%}'),
(1542, 'manage_deleted_products', 'Manage deleted products'),
(1543, 'list_of_all_deleted_market_products', 'List of all deleted market products'),
(1544, 'there_are_no_product_removal_requests_yet.', 'There are no product removal requests yet.'),
(1545, 'deleted', 'Deleted'),
(1546, 'published_on', 'Published on'),
(1547, 'product_info', 'Product info'),
(1548, 'are_you_sure_that_you_want_to_delete_this_product__note_that', 'Are you sure that you want to delete this product? Note that this action is undonable!'),
(1550, 'sorry__the_page_you_requested_was_not_found_', 'Sorry, the page you requested was not found!'),
(1551, 'your_request_has_been_submitted_', 'Your request has been submitted!'),
(1552, 'your_product_removal_request_has_been_sent_successfully_and_', 'Your product removal request has been sent successfully and awaiting review by the administrator.'),
(1553, 'the_product_removal_request_has_been_successfully_sent_and_a', 'The product removal request has been successfully sent and awaiting for admin review!'),
(1554, 'the_product_item_has_been_successfully_deleted_', 'The product item has been successfully deleted!'),
(1555, 'processing_please_wait_...', 'Processing please wait ...'),
(1556, 'creating_a_temporary_session__please_do_not_leave_the_page_', 'Creating a temporary session, please do not leave the page!'),
(1557, 'access_is_limited_', 'Access is limited!'),
(1558, 'sorry__a_temporary_session_allows_full_access_only_to_the_co', 'Sorry, a temporary session allows full access only to the control panel of the current user!'),
(1561, 'processing_please_wait...', 'Processing please wait...'),
(1562, 'exiting_the_temporary_session__please_do_not_leave_the_page_', 'Exiting the temporary session, please do not leave the page!'),
(1564, 'delete_account', 'Delete account'),
(1565, 'password_recovery', 'Password recovery'),
(1566, 'email_sent', 'Email sent'),
(1567, 'we_have_sent_you_an_email_to_reset_your_password._please_fol', 'We have sent you an email to reset your password. Please follow the instructions in the email to reset your password.'),
(1568, 'first_time_here_', 'First time here?'),
(1569, 'sign_up', 'Sign up'),
(1570, 'create_a_new_password_for_your_account', 'Create a new password for your account'),
(1571, 'repeat_new_password', 'Repeat new password'),
(1572, 'save_password', 'Save password'),
(1573, 'go_through_a_quick_check-in_and_enjoy_shopping_with_thousand', 'Go through a quick check-in and enjoy shopping with thousands of goods'),
(1574, 'welcome_', 'Welcome!'),
(1575, 'registration_is_required_to_view_products_', 'Registration is required to view products!'),
(1576, 'sign_in_with_social_networks', 'Sign in with social networks'),
(1577, 'registration', 'Registration'),
(1578, 'first_name', 'First name'),
(1579, 'last_name', 'Last name'),
(1580, 'confirm_password', 'Confirm password'),
(1581, 'register', 'Register'),
(1582, 'already_have_an_account_', 'Already have an account?'),
(1583, 'login_here', 'Login here'),
(1584, 'the_first_name_field_is_required_', 'The first name field is required!'),
(1585, 'done__please_wait..', 'Done! Please wait..'),
(1586, 'the_first_name_field_length_must_be_between_3___25_length_ch', 'The first name field length must be between 3 / 25 length characters!'),
(1587, 'the_first_name_has_invalid_characters._allowed_characters_ar', 'The first name has invalid characters. Allowed characters are a-z!'),
(1588, 'the_last_name_field_is_required_', 'The last name field is required!'),
(1589, 'the_last_name_field_length_must_be_between_3___25_length_cha', 'The last name field length must be between 3 / 25 length characters!'),
(1590, 'the_last_name_has_invalid_characters._allowed_characters_are', 'The last name has invalid characters. Allowed characters are a-z!'),
(1591, 'the_email_address_field_is_required_', 'The email address field is required!'),
(1592, 'this_e-mail_is_invalid', 'This e-mail is invalid'),
(1594, 'the_password_must_be_at_least_6_characters_', 'The password must be at least 6 characters!'),
(1595, 'the_password_field_is_required_', 'The password field is required!'),
(1596, 'please_confirm_your_password_', 'Please confirm your password!'),
(1597, 'login', 'Login'),
(1598, 'log_in_to_view_products_', 'Log in to view products!'),
(1599, 'forgot_your_password_', 'Forgot your password?'),
(1600, 'welcome_back_', 'Welcome back!'),
(1601, 'invalid_username_or_password_', 'Invalid username or password!'),
(1602, 'please_enter_your_login_', 'Please enter your login!'),
(1603, 'please_enter_your_password_', 'Please enter your password!'),
(1604, 'forgot_your_password__please_enter_your_email_address._you_w', 'Forgot your password? Please enter your email address. You will receive a link to create a new password by email'),
(1605, 'restore_password', 'Restore password'),
(1606, 'remember_your_password_', 'Remember your password?'),
(1607, 'e-mail_sent_', 'E-mail sent!'),
(1608, 'please_enter_your_email_address_', 'Please enter your email address!'),
(1609, 'we_cannot_find_an_account_with_this_email_address_', 'We cannot find an account with this email address!'),
(1610, 'please_enter_a_valid_email_address_', 'Please enter a valid email address!'),
(1611, 'error', 'Error'),
(1612, 'error_found_while_sending_the_reset_link__please_try_again_l', 'Error found while sending the reset link, please try again later.'),
(1613, 'reset_your_password', 'Reset your password'),
(1615, 'reset_my_password', 'Reset my password'),
(1616, 'opps..', 'Opps..'),
(1617, 'hello', 'Hello'),
(1618, 'tap_the_botton_below_to_reset_your_account_password._if_you_', 'Tap the botton below to reset your account password. If you did not request a new password, you can safely delete this email.'),
(1619, 'support_team', 'Support team'),
(1620, 'please_enter_a_new_password_', 'Please enter a new password!'),
(1621, 'password_must_be_at_least_6_characters', 'Password must be at least 6 characters'),
(1622, 'password_you_entered_is_too_long_', 'Password you entered is too long!'),
(1623, 'invalid_request_data._please_check_your_details_', 'Invalid request data. Please check your details!'),
(1624, 'categories', 'Categories'),
(1625, 'homepage', 'Homepage'),
(1626, 'messages', 'Messages'),
(1627, 'data_base_settings', 'Data base settings'),
(1628, 'please_wait...', 'Please wait...'),
(1629, 'setting_up_the_database__please_do_not_leave_the_page_', 'Setting up the database, please do not leave the page!'),
(1630, 'the_email_address_you_entered_is_not_valid_', 'The email address you entered is not valid!'),
(1631, 'you_do_not_have_a_saved_default_shipping_address._in_order_t', 'You do not have a saved default shipping address. In order to add an address, go to your account settings, or add an additional address by clicking the add address button'),
(1632, 'you_do_not_have_a_saved_shipping_addresses_yet._in_order_to_', 'You do not have a saved shipping addresses yet. In order to add an address, go to your account settings, or add an additional address by clicking the add address button'),
(1633, 'the_state_name_field_length_must_be_between_6_-_32_character', 'The state name field length must be between 6 - 32 characters'),
(1769, 'checkout_products', 'Checkout products'),
(2015, 'albania', 'Albania'),
(2156, 'state', 'State'),
(2157, 'enter_your_state_name.', 'Enter your state name.'),
(2158, 'enter_your_city_name.', 'Enter your city name.'),
(2161, 'invalid_state_name._please_check_your_details_', 'Invalid state name. Please check your details!'),
(2258, 'member_since', 'Member since'),
(2291, 'reviews', 'Reviews'),
(28348, 'has_reviewed_your_product', 'has reviewed your product'),
(28361, 'customer_feedback', 'Customer feedback'),
(28378, 'withdrawal_declined', 'Withdrawal declined'),
(28444, 'new_order', 'New order'),
(29292, 'empty_wishlist', 'Empty wishlist'),
(29309, 'please_enter_a_name_for_the_this_wishlist_', 'Please enter a name for the this wishlist!'),
(29774, 'support', 'Support'),
(29859, 'registration_and_authorization_are_needed_to_save_the_data_o', 'Registration and authorization are needed to save the data of your orders and account settings. After registration, you can log into your account from any device, and also get full access to account\\&#039;s control panel.'),
(29862, 'why_do_i_need_registration_and_authorization_', 'Why do I need registration and authorization?'),
(29885, 'if_you_have_forgotten_your_password__then_use_the_(restore_p', 'If you have forgotten your password, then use the (Restore password) form. Enter your email address and click restore password, after that you will be sent a message to the email address you specified, with a link to the password recovery page, follow the link and enter a new password for your account, then click the \\&quot;Restore\\&quot; button.  If this is not the problem, {%link%}'),
(29886, 'profile_-_user_account', 'Profile - User Account'),
(29887, 'problems_logging_into_your_profile_', 'Problems logging into your profile?'),
(29888, 'why_fill_out_the_profile_data_', 'Why fill out the profile data?'),
(29889, 'correct_filling_of_your_profile_data_will_allow_you_to_go_th', 'Correct filling of your profile data will allow you to go through a moderation of your actions more simply. For example, adding a product, or ordering a product, canceling an order, etc.'),
(29894, '_is_a_marketplace_(online_store)_of_goods_from_around_the_wo', '{%market_name%} is a marketplace (online store) of goods from around the world, where you can buy as well as sell your products. Through (Control Panel) you can change your account settings, track your orders and create your own store on - {%market_name%}, and manage other contents of your account, etc.'),
(29895, 'what_is_account_s_(control_panel)_', 'What is account\\&#039;s (Control Panel)?'),
(29906, 'how_to_delete_a_profile_', 'How to delete a profile?'),
(29907, 'highexpress_-_does_not_allow_users_to_delete_accounts_on_the', 'ImronPedia - does not allow users to delete accounts on their own, as important data for other users could be associated with them. For example, orders, unpaid funds of sellers, etc.'),
(29910, 'in_the_case_of_a_user_submits_a_deletion_request__the_modera', 'In the case of a user submits a deletion request, the moderator has the right to fully check the status of your account at the time of sending the application to delete your account'),
(29911, 'to_send_an_account_deletion_request__go_to__account_settings', 'To send an account deletion request, go to \\&quot;Account Settings\\&quot; and in the \\&quot;Account deletion request\\&quot; section, enter your password in the form and click the send deletion request button'),
(29912, 'please_note_that_after_deleting_the_profile__all_information', 'Please note that after deleting the profile, all information associated with it will also be deleted, and it will not be possible to restore the account.'),
(29913, 'reauthorization_with_the_same_data_will_create_a_new__empty_', 'Reauthorization with the same data will create a new, empty profile.'),
(29928, 'purchases___shopping', 'Purchases &amp; Shopping'),
(29931, 'how_to_logout_a_profile_', 'How to logout a profile?'),
(29932, 'in_the_upper_right_corner__click_on_the_avatar_and_then_clic', 'In the upper right corner, click on the avatar and then click \\&quot;Logout\\&quot;.'),
(29943, 'to_pay_for_your_products_at_-___you_can_use_credit_cards__ma', 'To pay for your products at - {%market_name%}, you can use credit cards, Mastercard, Discover, American Express, and Visa.'),
(29944, 'you_can_also_use_the_paypal_payment_system__or_pay_for_goods', 'You can also use the Paypal payment system, or pay for goods from the wallet of your current account.'),
(29945, 'what_payment_methods_are_there_', 'What payment methods are there?'),
(29954, 'how_to_pay_for_goods_on_-_', 'How to pay for goods on - {%market_name%}'),
(29955, 'in_order_to_pay_for_goods__open_the_page_with_a_description_', 'In order to pay for goods, open the page with a description of a product you want to purchase and click \\&quot;Buy now\\&quot;. On the checkout page, tick off the goods you want to pay, select the payment method in the sidebar and click the \\&quot;Pay order\\&quot; button'),
(29964, 'please_note_that_you_need_to_provide_your_delivery_address_t', 'Please note that you need to provide your delivery address to place an order. Enter the full delivery address (including zip code and apartment number), personal data, phone number, your email address.'),
(29967, 'how_to_cancel_the_order_', 'How to cancel the order?'),
(29972, 'you_can_cancel_an_order_you_placed_on_the__store_if_it_is_st', 'You can cancel an order you placed on the {%market_name%} Store if it is still pending.'),
(29973, 'open_your__order_history_-_', 'Open your {%market_name%} order history - {%link%}'),
(29978, 'search_your_list_of_orders_and_find_the_one_you_want_to_canc', 'Search your list of orders and find the one you want to cancel.'),
(29979, 'check_the_order_status_to_make_sure_it_s_pending.', 'Check the order status to make sure it\\&#039;s Pending.'),
(29980, 'select_order_details.', 'Select Order Details.'),
(29981, 'if_you_don_t_see__cancel_order__button__that_means_your_orde', 'If you don\\&#039;t see \\&quot;Cancel order\\&quot; button, that means your order has been prepared for shipment or sent and can\\&#039;t be canceled'),
(29992, 'when_will_my_order_be_shipped_', 'When will my order be shipped?'),
(29993, 'estimated_delivery_times_for_each_product_are_indicated_on_t', 'Estimated delivery times for each product are indicated on the order details card and depend on the transport company with which the seller works.'),
(29994, 'on_average__orders_come_from_7_to_40_days._sometimes_orders_', 'On average, orders come from 7 to 40 days. Sometimes orders may be delayed, usually this occurs on holidays and pre-holiday days, that is, on peak days of logistics companies, in which case the delivery time may increase to 90 days.'),
(29995, 'please_note_that_the_delivery_time_is_calculated_from_the_mo', 'Please note that the delivery time is calculated from the moment of sending the order.'),
(29996, 'if_the_goods_have_not_arrived_(the_maximum_delivery_time_on_', 'If the goods have not arrived (the maximum delivery time on our service is 90 days), we recommend that you contact a customer support center'),
(30001, 'how_to_track_an_order_', 'How to track an order?'),
(30002, 'search_your_list_of_orders_and_find_the_one_you_want_to_trac', 'Search your list of orders and find the one you want to track.'),
(30003, 'find_the_id_of_departure_(track_number)', 'Find the ID of departure (Track number)'),
(30004, 'and_use_the_online_services_for_tracking_mail._for_example_', 'And use the online services for tracking mail. For example:'),
(30013, 'error_in_the_name__or_delivery_address_', 'Error in the name, or delivery address?'),
(30014, 'ratings___reviews', 'Ratings &amp; Reviews'),
(30015, 'how_to_leave_a_review_', 'How to leave a review?'),
(30016, 'open_the_product_page', 'Open the product page'),
(30017, 'scroll_down_to_(product_reviews)', 'Scroll down to (Product Reviews)'),
(30018, 'rate_the_order__write_a_review_and_upload_a_photo__then_clic', 'Rate the order, write a review and upload a photo, then click on \\&quot;Submit\\&quot;.'),
(30021, 'according_to_the_postal_rules__for_identification_and_delive', 'According to the postal rules, for identification and delivery of a parcel, it is necessary that the name on the parcel coincides with the name in the document presented by the recipient. If you enter the wrong name, the parcel cannot be received.'),
(30434, 'no_chat_selected', 'No chat selected'),
(30906, 'enter_sku', 'Enter SKU'),
(31438, 'color_name', 'Color name'),
(31507, 'maximum_is_1200', 'Maximum is 1200'),
(31542, 'enter_a_basic_variant_info', 'Enter a basic variant info');
INSERT INTO `hex_langs` (`id`, `lang_key`, `indonesia`) VALUES
(31770, 'you_cannot_change_the_variations_sizing_type_of_your_product', 'You cannot change the variations sizing type of your product, as you have already added ({%vars_total%}) product variants of a different type. In order to change the type of product variation you first need to remove the previously added options'),
(31817, 'select_a_color_name', 'Select a color name'),
(31830, 'product_variation_item_quantity', 'Product variation item quantity'),
(31831, 'enter_the_stock_keeping_unit_of_your_item', 'Enter the stock keeping unit of your item'),
(31988, 'the_size_you_want_to_add_is_not_valid_', 'The size you want to add is not valid!'),
(32097, 'only_numeric_value_is_allowed._maximum_120', 'Only numeric value is allowed. Maximum 120'),
(32098, 'standard_return___refund_terms', 'Standard Return / Refund Terms'),
(32984, 'admin_panel', 'Admin panel'),
(33001, 'order_details', 'Order details'),
(33036, 'delivery_time', 'Delivery time'),
(33169, 'leave_a_comment_on_your_post_so_that_your_customers_can_rece', 'Leave a comment on your post so that your customers can receive more detailed information about their orders'),
(33744, 'enter_the_top_up_amount._e.g._150', 'Enter the top up amount. E.g. 150'),
(34102, 'market_products', 'Market products'),
(34119, 'market_sellers_management', 'Market sellers management'),
(34132, 'market_users_management', 'Market users management'),
(34372, 'backups', 'Backups'),
(34517, 'annual_revenue_statistics', 'Annual revenue statistics'),
(34524, 'payout_requests_list', 'Payout requests list'),
(34533, 'you_have_no_payment_requests_yet._to_request_your_monthly_in', 'You have no payment requests yet. To request your monthly income, click on the red button in the lower right corner.'),
(34536, 'request_withdrawal', 'Request withdrawal'),
(34537, 'please_pay_attention', 'Please pay attention'),
(34538, 'money_will_be_debited_from_your_account_when_paying_for_the_', 'Money will be debited from your account when paying for the request.'),
(34539, 'if_your_account_balance_is_less_than_the_request_amount__you', 'If your account balance is less than the request amount, your request will be rejected'),
(34540, 'withdrawal_amount', 'Withdrawal amount'),
(34541, 'paypal-me_link', 'Paypal-me link'),
(34542, 'payout_currency', 'Payout Currency'),
(34543, 'your_password', 'Your password'),
(34544, 'submit_request', 'Submit request'),
(34547, 'revenue', 'Revenue'),
(34548, 'payout', 'Payout'),
(34561, 'please_select_payout_currency', 'Please select payout currency'),
(34570, 'the_paypal_payment_address_you_entered_is_not_valid._pleas_c', 'The Paypal payment address you entered is not valid. Pleas check your details'),
(34589, 'your_account_balance_is_less_than_the_request_amount._your_b', 'Your account balance is less than the request amount. Your balance now is: {%balance%}'),
(34602, 'invalid_payment_amount._minimum_payout_amount_is___', 'Invalid payment amount. Minimum payout amount is: {%min_payout%} {%currency%}'),
(34611, 'please_fill_in_all_fields_', 'Please fill in all fields!'),
(34614, 'please_enter_the_payout_amount_', 'Please enter the payout amount!'),
(34623, 'please_your_paypal-me_payment_link_', 'Please your Paypal-Me payment link!'),
(34630, 'please_select_the_payout_currency_type_', 'Please select the payout currency type!'),
(34635, 'your_payment_request_has_been_sent_successfully._please_note', 'Your payment request has been sent successfully. Please note that it will take several business days to process your request.'),
(34636, 'withdrawal_requested_successfully_', 'Withdrawal requested successfully!'),
(34649, 'please_enter_your_account_password_', 'Please enter your account password!'),
(34719, 'canada', 'Canada'),
(34919, 'bangladesh', 'Bangladesh'),
(34922, 'information_is_not_available', 'Information is not available'),
(34923, 'this_product_has_been_removed_by_the_seller_and_there_is_no_', 'This product has been removed by the seller and there is no other information available about this product. If you have a complaint with this seller, contact the seller or contact us in the support center'),
(34924, 'contact_the_seller', 'Contact the seller'),
(34926, 'united_states', 'United States'),
(34928, 'sorry__this_item_is_temporary_out_of_stock_and_can_not_be_or', 'Sorry, this item is temporary out of stock and can not be ordered. For more information about this product, we advise you to contact its seller.'),
(34929, 'out_of_stock', 'Out of stock'),
(34931, 'this_product_item_is_not_available_in_the_desired_quantity._', 'This product item is not available in the desired quantity. Available quantity is {%qty%}'),
(34932, 'sorry__this_product_option_is_out_of_stock_and_can_not_be_or', 'Sorry, this product option is out of stock and can not be ordered!'),
(34933, 'you_can_not_have_more_than_30_products_at_a_time._please__fi', 'You can not have more than 30 products at a time. Please, first remove or pay products from your basket!'),
(34936, 'enter_your_facebook_profile_page_url', 'Enter your facebook profile page url'),
(34937, 'enter_your_youtube_channel_url', 'Enter your youtube channel url'),
(34942, 'enter_your_instagram_profile_page_url', 'Enter your instagram profile page url'),
(34943, 'enter_your_google_plus_profile_page_url', 'Enter your google plus profile page url'),
(34944, 'enter_your_twitter_profile_page_url', 'Enter your twitter profile page url'),
(34948, 'russian_federation', 'Russian Federation'),
(34949, 'please_enter_a_valid_url_address_', 'Please enter a valid url address!'),
(34950, 'got_it_', 'Got it!'),
(34951, 'cookie_policy', 'Cookie policy'),
(34952, 'we_use_cookies_on_this_website_to_ensure_the_functionality_o', 'We use cookies on this website to ensure the functionality of the application and to improve user experience. By using the site, you agree to our cookie policy!'),
(34954, 'in_order_to_place_an_order__you_first_need_to_add_or_choose_', 'In order to place an order, you first need to add or choose from the list, delivery address'),
(34955, 'social_login', 'Social login'),
(34959, 'social_login_api_settings', 'Social login API settings'),
(34960, 'facebook_api_id', 'Facebook API ID'),
(34961, 'enter_your_facebook_login_api_application_id', 'Enter your facebook login api application ID'),
(34962, 'facebook_api_key', 'Facebook API Key'),
(34963, 'enter_your_facebook_login_api_application_key', 'Enter your facebook login api application Key'),
(34964, 'twitter_api_id', 'Twitter API ID'),
(34965, 'enter_your_twitter_login_api_application_key', 'Enter your twitter login api application Key'),
(34966, 'enter_your_twitter_login_api_application_id', 'Enter your twitter login api application ID'),
(34967, 'twitter_api_key', 'Twitter API Key'),
(34968, 'google_api_id', 'Google API ID'),
(34969, 'enter_your_google_login_api_application_id', 'Enter your Google login api application ID'),
(34970, 'google_api_key', 'Google API Key'),
(34971, 'enter_your_google_login_api_application_key', 'Enter your Google login api application Key'),
(34972, 'failed_to_create_temporary_session._', 'Failed to create temporary session.!'),
(34973, 'could_not_find_a_user_with_this_name__please_check_your_deta', 'Could not find a user with this name, please check your details or try again later!'),
(34974, 'failed_to_log_in_as_admin_', 'Failed to log in as admin!'),
(34975, 'you_cannot_switch_to_administrator_mode__since_you_are_not_o', 'You cannot switch to administrator mode, since you are not on the list of our admins.'),
(34976, 'session_switched_to_admin_mode_', 'Session switched to admin mode!'),
(34977, 'you_are_logged_in_with_administrative_privileges._now_you_ca', 'You are logged in with administrative privileges. Now you can manage the contents of your administrative sections in the market control panel!'),
(34978, 'never', 'Never'),
(35145, 'changelogs', 'Changelogs'),
(35146, 'phones_and_tablets', 'Phones and tablets'),
(35147, 'computers_and_accessories', 'Computers and Accessories'),
(35148, 'motorcycle_products', 'Motorcycle products'),
(35149, 'office_supplies', 'Office supplies'),
(35150, 'school_supplies', 'School supplies'),
(35151, 'hunting_accessories', 'Hunting accessories'),
(35152, 'fishing_supplies___equipment', 'Fishing Supplies &amp; Equipment'),
(35153, 'holidays___events', 'Holidays &amp; Events'),
(35154, 'tea___accessories', 'Tea &amp; Accessories'),
(35155, 'games_and_toys', 'Games and toys'),
(35156, 'annual_earnings', 'Annual earnings'),
(35157, 'month', 'Month'),
(35158, 'item_sales_count', 'Item sales count'),
(35159, 'earnings', 'Earnings'),
(35160, 'main_navigation', 'Main navigation'),
(35161, 'image_storage', 'Image storage'),
(35163, 'select_logo_file', 'Select logo file'),
(35164, 'select_favicon_file', 'Select favicon file'),
(35165, 'unknown', 'Unknown'),
(35166, 'account_validation', 'Account validation'),
(35167, 'if_you_enable_this_option__then_after_registration_the_user_', 'If you enable this option, then after registration the user will have to go through confirmation by sending a confirmation code link to his email.'),
(35168, 'logo___favicon', 'Logo &amp; Favicon'),
(35169, 'in_order_to_change_the_logo_(90x90)_and_favicon_(30x30)_of_y', 'In order to change the logo (90x90) and favicon (30x30) of your site, click on the corresponding area above, and then click on the Save changes button'),
(35170, 'invalid_value_of_field__', 'Invalid value of field: {%field_name%}'),
(35171, 'market_sale_rate', 'Market sale rate'),
(35172, 'market_commission_rate_for_each_sale', 'Market commission rate for each sale'),
(35173, 'the_value_of_this_field_determines_the_fixed_value_of_the_co', 'The value of this field determines the fixed value of the commission charged as a percentage of sellers for each sale in your market.'),
(35174, 'there_are_no_products_in_your_catalog_to_create_a_site_map.', 'There are no products in your catalog to create a site map.'),
(35175, 'you_previously_set_this_status_to_your_order__therefore__you', 'You previously set this status to your order, therefore, you cannot set the same status twice'),
(35176, 'merchant_panel', 'Merchant panel'),
(35177, 'print', 'Print'),
(35178, 'weekly_earnings', 'Weekly earnings'),
(35179, 'week_day', 'Week day'),
(35180, 'update_order_timeline_history', 'Update order timeline history'),
(35181, 'total_withdrawal_requests', 'Total withdrawal requests'),
(35182, 'total_paid_requests', 'Total paid requests'),
(35183, 'total_rejected_requests', 'Total rejected requests'),
(35184, 'total_pending_requests', 'Total pending requests'),
(35186, 'yes__cancel_it_', 'Yes, cancel it!'),
(35187, 'current_order_status', 'Current order status'),
(35188, 'your_order__has_been_successfully_canceled._you_will_receive', 'Your order {%order_id%} has been successfully canceled. You will receive a refund on your original payment method as soon as the administration considers your refund request. Please note that a refund takes up to 14 days.'),
(35189, 'you_have_canceled_this_order', 'You have canceled this order'),
(35190, 'date_canceled', 'Date Canceled'),
(35191, 'this_order_has_been_canceled', 'This order has been canceled'),
(35193, 'unfortunately_this_order_has_been_canceled_by_the_buyer._we_', 'Unfortunately this order has been canceled by the buyer. We are sorry that we are forced to return the funds to the buyer in accordance with our order cancellation and refund policy!'),
(35195, 'market_additional_settings', 'Market additional settings'),
(35196, 'product_data_settings', 'Product data settings'),
(35197, 'minimum._e.g._5', 'Minimum. E.g. 5'),
(35198, 'minimum._e.g._120', 'Minimum. E.g. 120'),
(35199, 'set_the_minimum_and_maximum_(not_exceeding_145)_length_of_th', 'Set the minimum and maximum (Not exceeding 145) length of the product name.'),
(35200, 'product_description', 'Product description'),
(35201, 'minimum._e.g._650', 'Minimum. E.g. 650'),
(35202, 'set_the_minimum_and_maximum_(not_exceeding_60_000)_length_of', 'Set the minimum and maximum (Not exceeding 60,000) length of the product description text'),
(35203, 'product_images', 'Product images'),
(35204, 'maximum_e.g._25', 'Maximum E.g. 25'),
(35205, 'enter_the_minimum___maximum_number_of_product_images', 'Enter the minimum &amp; maximum number of product images'),
(35206, 'user_data_settings', 'User data settings'),
(35207, 'enter_the_maximum_number_of_user_wishlists', 'Enter the maximum number of user wishlists'),
(35208, 'enter_your_google_maps_api_key', 'Enter your google maps API key'),
(35209, 'declined', 'Declined'),
(35211, 'your_order_could_not_be_completed_', 'Your order could not be completed!'),
(35212, 'this_order_is_suspended_', 'This order is suspended!'),
(35214, 'date_suspended', 'Date suspended'),
(35216, 'your_income_for_today', 'Your income for today'),
(35217, 'current_month_income', 'Current month income'),
(35218, 'all_time_earnings', 'All time earnings'),
(35219, 'your_order_has_been_placed__but_is_still_awaiting_processing', 'Your order has been placed, but is still awaiting processing. If you cancel it now, the administration may charge you a fee of {%refund_fee%}, and you will receive money back within 14 business days. Are you sure you want to continue?'),
(35221, 'the_process_of_cancellation_and_refund_to_the_buyer_is_fully', 'The process of cancellation and refund to the buyer is fully completed.'),
(35222, 'refund_money', 'Refund money'),
(35223, 'ready_to_ship_within_1_month', 'Ready to ship within 1 month'),
(35224, 'ready_to_ship_within_2_months', 'Ready to ship within 2 months'),
(35225, 'ready_to_ship_within_3_months', 'Ready to ship within 3 months'),
(35226, 'the_product_gallery_images_are_required._please_add_product_', 'The product gallery images are required. Please add product gallery from {%min%} to {%max%} images'),
(35227, 'sizing_type_is_not_defined_', 'Sizing type is not defined!'),
(35228, 'please_select_a_color_and_available_sizes_to_the_selected_pr', 'Please select a color and available sizes to the selected product color.'),
(35229, 'weekly_earnings_statistics_of_your_account', 'Weekly earnings statistics of your account'),
(35230, 'list_of_all_transactions', 'List of all transactions'),
(35231, 'google_maps_api', 'Google maps API'),
(35233, 'test_as3_api_connection', 'Test AS3 API Connection'),
(35237, 'amazon_s3_image_upload_settings', 'Amazon S3 image upload settings'),
(35238, 'amazon_s3_storage', 'Amazon S3 Storage'),
(35239, 'enabled', 'Enabled'),
(35240, 'disabled', 'Disabled'),
(35241, 'please_note_that_before_you_enable_amazon_s3_storage__make_s', 'Please note that before you enable Amazon S3 storage, make sure you upload the whole \\&quot;upload/*\\&quot; folder (including all its contents) to your remote S3 bucket.'),
(35242, 'as3_bucket_name', 'AS3 bucket name'),
(35243, 'enter_as3_storage_bucket_name', 'Enter AS3 storage bucket name'),
(35244, 'amazon_s3_api_key', 'Amazon S3 API key'),
(35245, 'enter_as3_storage_api_key', 'Enter AS3 storage api key'),
(35246, 'amazon_s3_api_secret_key', 'Amazon S3 API secret key'),
(35247, 'enter_as3_storage_api_secret_key', 'Enter AS3 storage api secret key'),
(35248, 'as3_bucket_region', 'AS3 bucket region'),
(35249, 'delete_from_server', 'Delete from server'),
(35250, 'if_you_enable_this_option__then_after_uploading_the_images_t', 'If you enable this option, then after uploading the images to the AS3 Servers, the uploaded file will be deleted from your server'),
(35251, 'please_check_if_everything_is_configured_correctly_in_the_as', 'Please check if everything is configured correctly in the as3 API settings, otherwise this function will fail. However, if you are sure that everything is configured correctly, before saving, click on the \\&quot;Test Connection\\&quot; button and wait for a response from the server'),
(35252, 'please_note_that_before_you_disable_amazon_s3_storage__make_', 'Please note that before you disable Amazon S3 storage, make sure you download the whole \\&quot;upload/*\\&quot; folder (including all its contents) to your server.'),
(35253, 'sometimes_sellers_are_mistaken_and_send_out_goods_of_the_wro', 'Sometimes sellers are mistaken and send out goods of the wrong color or a different size or a completely different category of goods. If this happened to your order, contact {%name%} support center! We will review your application and decide on a partial or full refund.'),
(35254, 'if_you_received_defective_goods_(torn__broken__broken)_or_no', 'If you received defective goods (torn, broken, broken) or not in accordance with the description, contact {%name%} support center! We will review your application and decide on a partial or full refund.'),
(35255, 'go_to_your_basket_page__()', 'Go to your basket page: ({%link%})'),
(35256, 'about_-_', 'About - {%name%}'),
(35257, 'what_is_-_', 'What is - {%name%}'),
(35258, '_-_is_a_convenient_service_for_searching_various_goods_for_p', '{%name%} - is a convenient service for searching various goods for purchase without leaving your home, and also a convenient platform for selling your goods.'),
(35259, 'the__service_makes_the_process_of_buying_or_selling_for_its_', 'The {%name%} service makes the process of buying or selling for its users easy, fast and enjoyable!'),
(35260, 'how_to_sell_on_-_', 'How to sell on - {%name%}'),
(35261, 'before_you_start_selling_on___please_carefully_read_the_term', 'Before you start selling on {%name%}, please carefully read the terms and conditions of sale on this page {%link%}'),
(35262, 'my_order_is_canceled._when_will_the_money_come_back_', 'My order is canceled. When will the money come back?'),
(35263, 'money_after_cancellation_of_the_order_is_returned_within_a_f', 'Money after cancellation of the order is returned within a few days. Sometimes the process may take longer, the maximum return period is up to 30 days. The speed of crediting depends on the bank that you used when placing your order.'),
(35264, 'i_canceled_the_order_but_the_funds_still_have_not_returned.', 'I canceled the order but the funds still have not returned.'),
(35265, 'why_so_long_', 'Why so long?'),
(35266, 'we_are_used_to_the_fact_that_card_payments_are_instantaneous', 'We are used to the fact that card payments are instantaneous, but this is not always the case. When you buy goods in a store using a credit card, the bank immediately blocks the amount of the purchase in your account and sends an SMS notification about debiting, however, in fact, the money is transferred to the seller in a few hours or even days.'),
(35267, 'therefore__the_reverse_process_of_returning_money_to_the_cli', 'Therefore, the reverse process of returning money to the client also takes some time.'),
(35268, 'i_receive_the_wrong_product_that_i_ordered__what_to_do_', 'I receive the wrong product that I ordered! What to do?'),
(35269, 'i_received_a_bad_quality_product__what_to_do_', 'I received a bad quality product! What to do?'),
(35270, 'why_is_the_price_in_the_catalog_and_the_price_on_the_payment', 'Why is the price in the catalog and the price on the payment form different?'),
(35271, 'the_price_may_vary_depending_on_the_selected_characteristics', 'The price may vary depending on the selected characteristics of the product. E.g. Color, Size'),
(35272, 'how_to_change_the_order_', 'How to change the order?'),
(35273, 'the_composition_of_the_order_cannot_be_changed_after_payment', 'The composition of the order cannot be changed after payment, however it can be done before you place your order'),
(35274, 'find_in_the_basket_the_product_for_which_you_want_to_change_', 'Find in the basket the product for which you want to change the order'),
(35275, 'go_to_the_product_description_page_by_clicking_on_its_name', 'Go to the product description page by clicking on its name'),
(35276, 'then_select_the_options_you_want_to_order.', 'Then select the options you want to order.'),
(35277, 'why_don_t_i_have_a___leave_a_review___button_', 'Why don\\&#039;t I have a «Leave a review» button?'),
(35278, 'leave_their_reviews_about_a_product__can_only_those_who_orde', 'Leave their reviews about a product, can only those who ordered a specific product'),
(35279, 'for_more_information_read_this_article.', 'For more information read this article.'),
(35280, 'changelogs_-_', 'Changelogs - {%name%}'),
(35281, 'site_changelogs_timeline', 'Site changelogs timeline'),
(35282, 'please_confirm_your_actions_', 'Please confirm your actions!'),
(35283, 'yes__mark_it_as_paid_', 'Yes, Mark it as paid!'),
(35284, 'please_note_that_after_the_confirmation_of_this_action__this', 'Please note that after the confirmation of this action, this request will take the status as {%bt%}, so first make sure that you paid for this request, and after that, mark it as {%bt%}'),
(35285, 'the_payout_request_has_been_accepted_successfully_', 'The payout request has been accepted successfully!'),
(35286, 'your_withdrawal_request_has_been_accepted_', 'Your withdrawal request has been accepted!'),
(35287, 'congratulations__your_withdrawal_request_has_been_accepted_b', 'Congratulations! Your withdrawal request has been accepted by our administration team. You are paid {%paid_amount%} through PayPal to {%paypal_link%} link ID'),
(35288, 'payout_request_is_accepted_', 'Payout request is accepted!'),
(35289, 'product_status_has_been_successfully_changed_', 'Product status has been successfully changed!'),
(35290, '', ''),
(35291, 'localization', 'Localization'),
(35292, 'languages', 'Languages'),
(35293, 'manage_languages', 'Manage languages'),
(35294, 'manage_market_languages', 'Manage market languages'),
(35295, 'search_rows_by_keyword', 'Search rows by keyword'),
(35296, 'language_name', 'Language name'),
(35297, 'alpha-2_code', 'Alpha-2 Code'),
(35298, 'country_banner', 'Country banner'),
(35309, 'sort_order', 'Sort order'),
(35310, 'change_sort_order', 'Change sort order'),
(35311, 'change_language_sort_order', 'Change language sort order'),
(35312, 'enter_the_sort_item_number', 'Enter the sort item number'),
(35313, 'please_note_that_items_are_sorted_in_ascending_order._that_i', 'Please note that items are sorted in ascending order. That is, the item with number 1 will be first, 2 second, etc.'),
(35314, 'sort_item_number', 'Sort item number'),
(35316, 'add_new_language', 'Add new language'),
(35317, 'enter_a_new_language_name', 'Enter a new language name'),
(35318, 'please_note_that_when_adding_a_new_language__the_name_of_the', 'Please note that when adding a new language, the name of the language should contain only lowercase English letters, that is, [a-z], without spaces or special characters.'),
(35319, 'add_language', 'Add language'),
(35320, 'please_enter_a_name_for_the_new_language_', 'Please enter a name for the new language!'),
(35321, 'invalid_characters_in_the_language_name', 'Invalid characters in the language name'),
(35322, 'please_enter_a_language_name_between_4_and_30_characters_', 'Please enter a language name between 4 and 30 characters!'),
(35324, 'country_alpha-2_code', 'Country alpha-2 code'),
(35325, 'alpha-2_country_code_is_missing_or_invalid_', 'Alpha-2 country code is missing or invalid!'),
(35326, 'this_language_is_already_exists_', 'This language is already exists!'),
(35332, 'the_new_language_has_been_successfully_added_', 'The new language has been successfully added!'),
(35335, 'congratulations__a_new_interface_language_has_been_successfu', 'Congratulations! A new interface language has been successfully added. However, you must manually translate the texts into the {%lang_name%} language. Click on this link {%link%} to start editing.'),
(35336, 'the_new_language_has_been_successfully_added', 'The new language has been successfully added'),
(35340, 'language_status_has_been_successfully_changed_', 'Language status has been successfully changed!'),
(35341, 'people', 'People'),
(35342, 'usage', 'Usage'),
(35343, 'you_cannot_disable_all_interface_languages__at_least_one_lan', 'You cannot disable all interface languages, at least one language must be enabled'),
(35344, 'are_you_sure_you_want_to_delete_this_backup__please_note_tha', 'Are you sure you want to delete this backup? Please note that this action can not be undone!'),
(35345, 'are_you_sure_you_want_to_delete_this_language__please_note_t', 'Are you sure you want to delete this language? Please note that this action cannot be undone!'),
(35346, 'you_cannot_remove_this_interface_language_since_there_are_no', 'You cannot remove this interface language since there are no active languages to use!'),
(35347, 'language_has_been_successfully_deleted_', 'Language has been successfully deleted!'),
(35348, 'edit_language', 'Edit language'),
(35349, 'edit_language_text', 'Edit language text'),
(35350, 'enter_a_custom_language_text_here', 'Enter a custom language text here'),
(35351, 'please_note_that_some_lines_may_contain_special_code_express', 'Please note that some lines may contain special code expressions that look like this: {%something%} that cannot be deleted or edited, otherwise the text in the language will not display correctly'),
(35352, 'the_language_text_is_missing_or_invalid_', 'The language text is missing or invalid!'),
(35353, 'language_text_must_be_between_2_and_500_characters_long', 'Language text must be between 2 and 500 characters long'),
(35355, 'currencies', 'Currencies'),
(35356, 'product_categories', 'Product categories'),
(35357, 'manage_categories', 'Manage categories'),
(35369, 'manage_product_categories', 'Manage product categories'),
(35370, 'slug', 'Slug'),
(35371, 'category_name', 'Category name'),
(35372, 'add_new_category', 'Add new category'),
(35373, 'change_category_sort_order', 'Change category sort order'),
(35374, 'you_cannot_disable_all_product_categories__at_least_one_cate', 'You cannot disable all product categories, at least one category must be enabled'),
(35375, 'category_status_has_been_successfully_changed_', 'Category status has been successfully changed!'),
(35376, 'are_you_sure_you_want_to_disable_this_product_category__plea', 'Are you sure you want to disable this product category? Please note that this action will result in all market products in this category being transferred from the catalog to drafts!'),
(35377, 'yes__disable_it_', 'Yes, disable it!'),
(35378, 'add_category', 'Add category'),
(35379, 'enter_a_new_category_name', 'Enter a new category name'),
(35380, 'please_note_that_when_adding_a_new_category__the_category_na', 'Please note that when adding a new category, the category name should contain only English letters!'),
(35381, 'please_enter_a_name_for_the_new_category_', 'Please enter a name for the new category!'),
(35382, 'invalid_characters_in_the_category_name', 'Invalid characters in the category name'),
(35383, 'the_new_product_category_has_been_successfully_added_', 'The new product category has been successfully added!'),
(35386, 'please_enter_a_category_name_between_4_and_55_characters_', 'Please enter a category name between 4 and 55 characters!'),
(35389, 'are_you_sure_you_want_to_delete_this_product_category__pleas', 'Are you sure you want to delete this product category? Please note that this action will result in all market products in this category being transferred from the catalog to drafts!'),
(35390, 'you_cannot_delete_this_product_category__as_there_are_no_act', 'You cannot delete this product category, as there are no active product categories to use!'),
(35391, 'product_category_has_been_successfully_deleted_', 'Product category has been successfully deleted!'),
(35394, 'manage_currencies', 'Manage currencies'),
(35395, 'inactive', 'Inactive'),
(35396, 'manage_market_currencies', 'Manage market currencies'),
(35397, 'currency_code', 'Currency code'),
(35398, 'currency_symbol', 'Currency symbol'),
(35399, 'add_new_currency', 'Add new currency'),
(35400, 'set_default', 'Set default'),
(35401, 'please_pay_attention_', 'Please pay attention!'),
(35402, 'please_note_when_adding_a_new_currency_that_not_all_currenci', 'Please note when adding a new currency that not all currencies are supported by payment systems: {%payment_systems%}, so make sure that the currency you use is supported by all payment systems integrated into your website!'),
(35403, 'enter_a_new_currency_code', 'Enter a new currency code'),
(35404, 'please_note_that_when_adding_a_new_currency__the_code_of_the', 'Please note that when adding a new currency, the code of the currency should contain only lowercase English letters, that is, [a-z], without spaces or special characters.'),
(35405, 'enter_a_new_currency_symbol', 'Enter a new currency symbol'),
(35406, 'add_currency', 'Add currency'),
(35407, 'please_enter_a_code_of_the_new_currency_', 'Please enter a code of the new currency!'),
(35408, 'invalid_characters_in_the_currency_code_', 'Invalid characters in the currency code!'),
(35409, 'please_enter_the_standard_currency_code_iso_4217_alpha-3_', 'Please enter the standard currency code ISO 4217 Alpha-3!'),
(35410, 'this_currency_is_already_exists_', 'This currency is already exists!'),
(35411, 'the_currency_symbol_is_missing_or_entered_incorrectly._pleas', 'The currency symbol is missing or entered incorrectly. Please enter a unique currency symbol in UTF-8 format!'),
(35422, 'the_new_currency_has_been_successfully_added_', 'The new currency has been successfully added!'),
(35423, 'please_enter_a_name_for_the_new_currency_from_4_to_50_charac', 'Please enter a name for the new currency from 4 to 50 characters long!'),
(35424, 'currency_name', 'Currency name'),
(35425, 'enter_a_new_currency_name', 'Enter a new currency name'),
(35426, 'yes__set_default_', 'Yes, Set default!'),
(35427, 'market_currency_has_been_successfully_changed_to__', 'Market currency has been successfully changed to: {%curr_name%}'),
(35428, 'are_you_sure_you_want_to_delete_this_currency__please_note_t', 'Are you sure you want to delete this currency? Please note that this action cannot be undone!'),
(35429, 'you_cannot_delete_the_default_currency_of_the_market_', 'You cannot delete the default currency of the market!'),
(35430, 'the_currency__was_successfully_deleted_', 'The currency {%currency%} was successfully deleted!'),
(35431, 'set_after_price_tag', 'Set after price tag'),
(35432, 'set_before_price_tag', 'Set before price tag'),
(35433, 'determining_the_position_of_a_currency_symbol__that_is__eith', 'Determining the position of a currency symbol, that is, either before the product price tag or after'),
(35434, 'in_order_to_see_more_information_about_this_product__or_to_p', 'In order to see more information about this product, or to purchase it, you must first log in or register if you have not previously been registered on - {%market_name%}'),
(35435, 'your_current_balance', 'Your current balance'),
(35443, 'e.g._24in__60.96cm__5.5mm', 'E.g. 24in, 60.96cm, 5.5mm'),
(35444, 'e.g._2in__5.08cm__0.8mm', 'E.g. 2in, 5.08cm, 0.8mm'),
(35445, 'e.g._6in__15.24cm__12.5mm', 'E.g. 6in, 15.24cm, 12.5mm'),
(35446, 'e.g._5kg__11lb__176oz__50g', 'E.g. 5kg, 11lb, 176oz, 50g'),
(35447, 'order_id', 'Order ID'),
(35448, 'enter_order_id', 'Enter order ID'),
(35449, 'my_wallet', 'My wallet'),
(35450, 'close_window', 'Close window'),
(35451, 'edit_product_variation', 'Edit product variation'),
(35452, 'edit_product_variation_basic_info', 'Edit product variation basic info'),
(35453, 'terms_and_conditions_of_use', 'Terms and Conditions of Use'),
(35454, 'please_enter_the_amount_you_want_to_replenish_your_account_w', 'Please enter the amount you want to replenish your account wallet'),
(35455, 'popular_products', 'Popular products'),
(35456, 'delivery_within_one_month', 'Delivery within one month'),
(35457, 'delivery_within_two_months', 'Delivery within two months'),
(35458, 'delivery_within_three_months', 'Delivery within three months'),
(35459, 'note__this_may_take_up_to_5_minutes._please_do_not_leave_the', 'Note! This may take up to 5 minutes. Please do not leave the page until the process is complete.'),
(35461, 'this_request_was_initiated_because_the_seller_suspended_furt', 'This request was initiated because the seller suspended further processing of the order or the maximum lead time has expired.'),
(35473, 'please_remember_to_save_before_leaving_this_page__otherwise_', 'Please remember to save before leaving this page, otherwise the product will be automatically moved to the draft list of products!'),
(35474, 'moderators', 'Moderators'),
(35475, 'market_moderators_-_', 'Market moderators - {%name%}'),
(35476, 'market_moderators', 'Market moderators'),
(35477, 'market_moderators_management', 'Market moderators management'),
(35478, 'list_of_market_moderators', 'List of market moderators'),
(35479, 'enter_user_first_name', 'Enter user first name'),
(35480, 'enter_user_surname', 'Enter user surname'),
(35481, 'enter_user_bio', 'Enter user bio'),
(35482, 'enter_user_e-mail', 'Enter user E-mail'),
(35483, 'enter_user_phone_number', 'Enter user phone number'),
(35484, 'enter_user_whatsapp_number', 'Enter user whatsapp number'),
(35485, 'enter_user_facebook_url', 'Enter user facebook url'),
(35486, 'enter_user_instagram_url', 'Enter user instagram url'),
(35487, 'enter_user_google-plus_url', 'Enter user google-plus url'),
(35488, 'enter_user_twitter_url', 'Enter user twitter url'),
(35489, 'enter_user_youtube_url', 'Enter user youtube url'),
(35490, 'edit_user_data', 'Edit user data'),
(35491, 'enter_state_name', 'Enter state name'),
(35492, 'enter_city_name', 'Enter city name'),
(35493, 'enter_street_name', 'Enter street name'),
(35494, 'enter_office_or_apartment_or_suite_number', 'Enter office or apartment or suite number'),
(35495, 'enter_zip_postal_code_number', 'Enter Zip/Postal code number'),
(35496, 'account_advanced_settings', 'Account advanced settings'),
(35497, 'account_balance', 'Account balance'),
(35498, 'the_account_balance_amount_is_invalid_', 'The account balance amount is invalid!'),
(35499, 'user_type', 'User type'),
(35500, 'moderator', 'Moderator'),
(35501, 'user', 'User'),
(35502, 'are_you_sure_you_want_to_disable_this_account__please_note_t', 'Are you sure you want to disable this account? Please note that this action will result in all products of this user being also disabled!'),
(35503, 'yes__continue_', 'Yes, continue!'),
(35504, 'this_account_has_been_successfully_disabled_', 'This account has been successfully disabled!'),
(35505, 'this_account_has_been_successfully_enabled_', 'This account has been successfully enabled!'),
(35506, 'back_to_admin_panel', 'Back to admin panel'),
(35507, 'this_account_has_been_suspended_', 'This account has been suspended!'),
(35508, 'sorry__but_this_account_has_been_blocked_by_the_administrati', 'Sorry, but this account has been blocked by the administration, and therefore you can’t get access to its public content!'),
(35509, 'please_wait_', 'Please wait!'),
(35510, 'thank_you_for_you_signing_up_', 'Thank you for you signing up!'),
(35511, 'an_email_has_been_sent_to_._you_need__now_to_confirm_your_em', 'An email has been sent to {%email%}. You need  now to confirm your email address before you can login. Please check your email and click on the provided link.'),
(35512, 'resend_e-mail_', 'Resend E-mail!'),
(35513, 'your_account_has_been_suspended_', 'Your account has been suspended!'),
(35514, 'your_account_has_been_suspended._please_check_your_email_inb', 'Your account has been suspended. Please check your email inbox. If you have not received a message to your email with a description of the reason for blocking your account, then you can contact us on this email {%market_email%} if you have questions!'),
(35515, 'unfortunately__your_account_has_been_deprived_of_the_privile', 'Unfortunately, your account has been deprived of the privileges of a site moderator, now you do not have the ability to manage advanced features of the site'),
(35516, 'deprivation_of_moderator_privileges_', 'Deprivation of moderator privileges!'),
(35517, 'congratulations_that_your_account_has_been_privileged_as_a_m', 'Congratulations that your account has been privileged as a moderator of the site, now you have the ability to manage advanced features of the site'),
(35518, 'moderator_account_', 'Moderator account!'),
(35519, 'are_you_sure_you_want_to_delete_this_moderator__please_note_', 'Are you sure you want to delete this moderator? Please note that this action cannot be undone!'),
(35520, 'moderator_has_been_successfully_deleted', 'Moderator has been successfully deleted'),
(35521, 'paypal_gateway_status', 'PayPal gateway status'),
(35522, 'stripe_gateway_status', 'Stripe gateway status'),
(35523, 'other_payment_gateways', 'Other payment gateways'),
(35524, 'wallet_gateway_status', 'Wallet gateway status'),
(35525, 'please_select_a_payment_method_to_place_an_order_', 'Please select a payment method to place an order!'),
(35526, 'some_payment_methods_are_not_available_for_this_checkout.', 'Some payment methods are not available for this checkout.'),
(35527, 'allows_you_to_enable_or_disable_the_product_payment_gateway', 'Allows you to enable or disable the product payment gateway'),
(35528, 'select_payment_method', 'Select payment method'),
(35529, 'cash_on_delivery', 'Cash on delivery'),
(35530, 'prepayment', 'Prepayment'),
(35531, 'all_methods', 'All methods'),
(35532, 'cod_gateway_status', 'COD gateway status'),
(35533, 'payment', 'Payment'),
(35534, 'payment_on_delivery', 'Payment on delivery'),
(35535, 'please_note_that_the_seller_of_this_item_requires_an_advance', 'Please note that the seller of this item requires an advance payment through the payment systems of the site, in order to place an order for this product.'),
(35536, 'please_note_that_the_seller_of_this_product_requires_payment', 'Please note that the seller of this product requires payment in cash upon delivery of this product in order to place an order for this product.'),
(35537, 'some_products_are_not_available_for_payment_through_the_sele', 'Some products are not available for payment through the selected payment method.'),
(35538, 'order_cancellation_process_completed_successfully_', 'Order cancellation process completed successfully!'),
(35540, 'blocked', 'Blocked'),
(35541, 'min_balance_top_up_amount', 'Min balance top up amount'),
(35542, 'min_user_account_balance_top_up_amount', 'Min user account balance top up amount'),
(35543, 'the_minimum_amount_of_replenishment_of_the_user_balance_is__', 'the minimum amount of replenishment of the user balance is: {%min_topup_amount%}'),
(35544, 'the_amount_you_entered_is_less_than_the_minimum_amount_to_re', 'The amount you entered is less than the minimum amount to replenish the balance!'),
(35545, 'inactive_product', 'Inactive product'),
(35546, 'this_product_is_not_active__so_customers_cannot_order_it__yo', 'This product is not active, so customers cannot order it, you need to activate it so that it appears in the product catalog'),
(35547, 'blocked_product', 'Blocked product'),
(35548, 'this_product_is_blocked__so_customers_cannot_order_it__you_n', 'This product is blocked, so customers cannot order it, you need to replenish the balance of your account so that all your blocked products appear in the product catalog'),
(35549, 'temporary_blocked', 'Temporary blocked'),
(35550, 'this_product_item_has_been_temporary_blocked_by_the_market', 'This product item has been temporary blocked by the market'),
(35551, 'please_note_that_if_you_change_the_status_of_this_order_to_o', 'Please note that if you change the status of this order to one of ({%stats%}), you will no longer be able to process this order {%link%}'),
(35554, 'your_order__has_been_successfully_canceled._if_you_have_any_', 'Your order {%order_id%} has been successfully canceled. If you have any questions, please contact the seller {%seller_url%} or contact our support team.'),
(35555, 'unfortunately_this_order_has_been_canceled_by_the_buyer._if_', 'Unfortunately this order has been canceled by the buyer. If you have any questions, please contact the buyer {%buyer_url%} or contact our support team.'),
(35556, 'this_order_has_been_suspended_and_cannot_be_further_processe', 'This order has been suspended and cannot be further processed by you. You can contact us through our support team if you have any questions.'),
(35557, 'the_process_of_canceling_and_deleting_an_order_is_completed_', 'The process of canceling and deleting an order is completed successfully.'),
(35558, 'order_has_been_canceled_', 'Order has been canceled!'),
(35559, 'please_add_product_gallery_from__to__images', 'Please add product gallery from {%min%} to {%max%} images'),
(35560, 'filter_products', 'Filter products'),
(35561, 'approval_status', 'Approval status'),
(35562, 'approved', 'Approved'),
(35563, 'no_results_were_found_for_your_search._please_try_again_with', 'No results were found for your search. Please try again with other terms.'),
(35564, 'hi___unfortunately__your_account_has_run_out_of_funds_for_de', 'Hi {%name%}! Unfortunately, your account has run out of funds for deducting sales commission, and in connection with this, we temporarily blocked some of your products. If you have any questions, please contact our support team.'),
(35565, 'temporary_products_blocking_', 'Temporary products blocking!'),
(35566, 'order_cancellation', 'Order cancellation'),
(35567, 'paypal_api_secret_key', 'PayPal API secret key'),
(35571, 'product_data', 'Product data'),
(35572, 'add_size', 'Add size'),
(35574, 'announcement_information', 'Announcement information'),
(35575, 'select_announcement_type', 'Select announcement type'),
(35576, 'announcement', 'Announcement'),
(35577, 'google_analytics_js_code', 'Google analytics JS code'),
(35578, 'google_maps_api_application_key', 'Google maps API application key'),
(35579, 'address', 'Address'),
(35580, 'currency', 'Currency'),
(35581, 'logo___favicon_of_market', 'Logo &amp; Favicon of Market'),
(35582, 'additional_settings', 'Additional settings'),
(35583, 'additional_settings_-_', 'Additional settings - {%name%}'),
(35584, 'other_settings', 'Other settings'),
(35585, 'these_are_your_personal_social_media_(facebook__google__twit', 'These are your personal social media (Facebook, Google, Twitter) credentials to access their oAuth API systems. Please do not post or share this data in any way.'),
(35586, 'market_settings', 'Market settings'),
(35587, 'product_name_min_length', 'Product name min length'),
(35588, 'product_name_max_length', 'Product name max length'),
(35589, 'product_description_min_length', 'Product description min length'),
(35590, 'product_description_max_length', 'Product description max length'),
(35591, 'product_images_(minimum)', 'Product images (Minimum)'),
(35592, 'product_images_(maximum)', 'Product images (Maximum)'),
(35593, 'privacy_policy_of_-_', 'Privacy Policy of - {%name%}'),
(35594, 'privacy_policy', 'Privacy Policy'),
(35595, 'privacy_policy_terms_of', 'Privacy Policy terms of'),
(35596, 'privacy___policy_of_-_', 'Privacy &amp; Policy of - {%name%}'),
(35597, 'general_settings', 'General settings'),
(35598, 'account_social_media_links', 'Account social media links'),
(35599, 'social_links', 'Social links'),
(35600, 'account_default_language', 'Account default language'),
(35601, 'account_avatar_settings', 'Account avatar settings'),
(35602, 'change_my_password', 'Change my password'),
(35603, 'the_announcement_message_type_is_missing_or_invalid._please_', 'The announcement message type is missing or invalid. Please check your details!'),
(35604, 'select_data_time', 'Select Data/Time'),
(35605, 'verification', 'Verification'),
(35606, '_account_verification', '{%market_name%} Account verification'),
(35607, 'full_name', 'Full name'),
(35608, 'enter_your_full_name', 'Enter your full name'),
(35609, 'message_to_reviewer', 'Message to reviewer'),
(35610, 'enter_message_for_reviewer', 'Enter message for reviewer'),
(35611, 'your_passport_id_photo', 'Your passport/ID photo'),
(35612, 'your_personal_photo', 'Your personal photo'),
(35613, 'please_enter_your_full_name', 'Please enter your full name'),
(35614, 'please_enter_your_full_name_with_a_length_of_6_32_characters', 'Please enter your full name with a length of 6/32 characters'),
(35615, 'please_enter_a_message_for_the_reviewer', 'Please enter a message for the reviewer'),
(35616, 'the_message_for_the_reviewer_that_you_entered_is_too_long._m', 'The message for the reviewer that you entered is too long. Maximum length 600 characters'),
(35617, 'please_select_a_photo_of_your_passport_id_document', 'Please select a photo of your passport/ID document'),
(35618, 'please_select_your_personal_photo.', 'Please select your personal photo.'),
(35619, 'your_verification_request_has_been_sent_successfully_', 'Your verification request has been sent successfully!'),
(35620, 'your_verification_request_has_been_sent_successfully._we_wil', 'Your verification request has been sent successfully. We will let you know as soon as we review your request for a verified badge.'),
(35621, 'verification_request_submitted_', 'Verification request submitted!'),
(35622, 'account_verification', 'Account verification'),
(35623, 'account_verification_-_', 'Account verification - {%name%}'),
(35624, 'account_verification_requests_management', 'Account verification requests management'),
(35625, 'list_of_all_account_verification_requests', 'List of all account verification requests'),
(35626, 'account_type', 'Account type'),
(35627, 'regular_account', 'Regular account'),
(35628, 'seller_account', 'Seller account'),
(35629, 'there_are_no_account_verification_requests_yet._this_page_wi', 'There are no account verification requests yet. This page will receive requests from users to verify their accounts!'),
(35630, 'request_details', 'Request details'),
(35631, 'verified', 'Verified'),
(35633, 'verified_account', 'Verified account'),
(35634, 'your_account_has_been_verified._thank_you_for_verifying_your', 'Your account has been verified. Thank you for verifying your identity.'),
(35635, 'your_request_for_verification_of_your_account_has_been_sent_', 'Your request for verification of your account has been sent and is awaiting review by the administrator, however this can take several business days.'),
(35636, 'your_request_for_verification_of_your_account_has_been_rejec', 'Your request for verification of your account has been rejected by the market administrator. The administrator may have sent you a message to your email address with detailed information about the reason for the refusal. Please contact us if you have any questions.'),
(35637, 'verification_request_was_successfully_deleted_', 'Verification request was successfully deleted!'),
(35638, 'reject', 'Reject'),
(35639, 'verification_request_was_successfully_rejected_', 'Verification request was successfully rejected!'),
(35640, 'unfortunately__your_request_for_verification_of_your_account', 'Unfortunately, your request for verification of your account was rejected by the market administrator. Please contact us if you have any questions'),
(35641, 'request_rejected_', 'Request rejected!'),
(35642, 'rejected', 'Rejected'),
(35643, 'verify', 'Verify'),
(35644, 'this_user_has_been_verified_successfully_', 'This user has been verified successfully!'),
(35645, 'congratulations_your_account_has_been_successfully_verified_', 'Congratulations your account has been successfully verified at your request, thank you for verifying your identity'),
(35646, 'an_account_authentication_icon_is_displayed_next_to_the_user', 'An account authentication icon is displayed next to the username. Account verification is desirable for market sellers to increase customer confidence'),
(35647, 'package_width', 'Package width'),
(35648, 'package_length', 'Package length'),
(35649, 'package_height', 'Package height'),
(35650, 'unfortunately__this_order_cannot_be_completed_because_the_se', 'Unfortunately, this order cannot be completed because the seller {%seller_name%} has suspended further processing of this order. If you have any questions, please contact the seller {%seller_url%} or contact our support team.'),
(35651, 'product_logistics_information', 'Product Logistics Information'),
(35652, 'product_variations', 'Product variations'),
(35653, 'product_logistics_information', 'Product Logistics Information'),
(35654, 'product_variations', 'Product variations'),
(35655, 'indonesia', 'Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `hex_languages`
--

CREATE TABLE `hex_languages` (
  `id` int(11) NOT NULL,
  `lang_name` varchar(32) NOT NULL DEFAULT '',
  `a2_code` varchar(5) NOT NULL DEFAULT 'gb',
  `status` enum('active','inactive') NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hex_languages`
--

INSERT INTO `hex_languages` (`id`, `lang_name`, `a2_code`, `status`, `sort_order`) VALUES
(11, 'indonesia', 'id', 'active', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hex_market_revenue`
--

CREATE TABLE `hex_market_revenue` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `trans_id` int(11) DEFAULT '0',
  `amount` varchar(20) NOT NULL DEFAULT '0.00',
  `rate` varchar(11) NOT NULL DEFAULT '0',
  `time` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_notifications`
--

CREATE TABLE `hex_notifications` (
  `id` int(11) NOT NULL,
  `notifier_id` int(11) NOT NULL DEFAULT '0',
  `recipient_id` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(25) NOT NULL DEFAULT '',
  `message` varchar(300) NOT NULL DEFAULT '',
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `url` varchar(500) NOT NULL DEFAULT '',
  `time` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_orders`
--

CREATE TABLE `hex_orders` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL DEFAULT '0',
  `buyer_id` int(11) NOT NULL DEFAULT '0',
  `prod_id` int(11) NOT NULL DEFAULT '0',
  `prod_sp` varchar(11) NOT NULL DEFAULT '0.00',
  `prod_rp` varchar(11) NOT NULL DEFAULT '0.00',
  `prod_sf` varchar(11) NOT NULL DEFAULT '0.00',
  `prod_sc` enum('free','paid') NOT NULL DEFAULT 'free',
  `paid_amount` varchar(11) NOT NULL DEFAULT '0.00',
  `var_id` int(11) NOT NULL DEFAULT '0',
  `var_type` enum('single','color','size','color_size') NOT NULL DEFAULT 'single',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `cust_name` varchar(60) NOT NULL DEFAULT '',
  `cust_phone` varchar(20) NOT NULL DEFAULT '',
  `cust_street` varchar(60) NOT NULL DEFAULT '',
  `cust_off_apt` varchar(50) NOT NULL DEFAULT '',
  `cust_country` varchar(60) NOT NULL DEFAULT '',
  `cust_state` varchar(50) NOT NULL DEFAULT '',
  `cust_city` varchar(60) NOT NULL DEFAULT '',
  `cust_zip` varchar(20) NOT NULL DEFAULT '0',
  `cust_email` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `timeline` varchar(300) NOT NULL DEFAULT '[]',
  `time` varchar(20) NOT NULL DEFAULT '0',
  `cancellation_time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_order_cancellations`
--

CREATE TABLE `hex_order_cancellations` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `trans_id` int(11) NOT NULL DEFAULT '0',
  `prod_id` int(11) NOT NULL DEFAULT '0',
  `seller_id` int(11) NOT NULL DEFAULT '0',
  `buyer_id` int(11) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT 'none',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_ord_hist_timeline`
--

CREATE TABLE `hex_ord_hist_timeline` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL DEFAULT '0',
  `buyer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `buyer_notified` enum('y','n') NOT NULL DEFAULT 'n',
  `comment` varchar(600) NOT NULL,
  `time` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_payout_requests`
--

CREATE TABLE `hex_payout_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `pp_link` varchar(300) NOT NULL DEFAULT '',
  `amount` varchar(15) NOT NULL DEFAULT '0.00',
  `currency` varchar(5) NOT NULL DEFAULT 'usd',
  `status` enum('pending','paid','declined') NOT NULL DEFAULT 'pending',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_products`
--

CREATE TABLE `hex_products` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL DEFAULT '',
  `description` text,
  `keywords` varchar(600) NOT NULL DEFAULT '',
  `category` varchar(25) NOT NULL DEFAULT 'none',
  `condition` enum('1','2','3') NOT NULL DEFAULT '1',
  `has_variations` enum('0','1') NOT NULL DEFAULT '0',
  `reg_price` varchar(11) NOT NULL DEFAULT '0.00',
  `sale_price` varchar(11) NOT NULL DEFAULT '0.00',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(25) NOT NULL DEFAULT '',
  `shipping_cost` varchar(60) NOT NULL DEFAULT '',
  `shipping_fee` varchar(20) NOT NULL DEFAULT '0.00',
  `shipping_time` varchar(120) NOT NULL DEFAULT '',
  `status` enum('inactive','active','deleted','blocked') NOT NULL DEFAULT 'active',
  `last_status` enum('inactive','active','deleted') NOT NULL DEFAULT 'active',
  `origin` varchar(100) NOT NULL DEFAULT '',
  `brand` varchar(50) NOT NULL DEFAULT '',
  `model_number` varchar(50) NOT NULL DEFAULT '',
  `weight` varchar(11) NOT NULL DEFAULT '0',
  `length` varchar(11) NOT NULL DEFAULT '0',
  `width` varchar(11) NOT NULL DEFAULT '0',
  `height` varchar(11) NOT NULL DEFAULT '0',
  `poster` varchar(300) NOT NULL DEFAULT '',
  `thumb` varchar(3000) NOT NULL DEFAULT '',
  `variation_type` enum('single','color','size','color_size') NOT NULL DEFAULT 'single',
  `sizing_type` varchar(30) NOT NULL DEFAULT 'none',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `sold` int(11) NOT NULL DEFAULT '0',
  `rating` varchar(5) NOT NULL DEFAULT '0.0',
  `reviews` int(11) NOT NULL DEFAULT '0',
  `profit` varchar(15) NOT NULL DEFAULT '0.00',
  `activity_status` enum('active','inactive','orphan') NOT NULL DEFAULT 'inactive',
  `approved` enum('Y','N') DEFAULT 'N',
  `editing_stage` enum('saved','unsaved') NOT NULL DEFAULT 'unsaved',
  `payment_method` enum('cod_payments','pre_payments','all_payments') NOT NULL DEFAULT 'pre_payments',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hex_products`
--

INSERT INTO `hex_products` (`id`, `name`, `description`, `keywords`, `category`, `condition`, `has_variations`, `reg_price`, `sale_price`, `quantity`, `sku`, `shipping_cost`, `shipping_fee`, `shipping_time`, `status`, `last_status`, `origin`, `brand`, `model_number`, `weight`, `length`, `width`, `height`, `poster`, `thumb`, `variation_type`, `sizing_type`, `user_id`, `sold`, `rating`, `reviews`, `profit`, `activity_status`, `approved`, `editing_stage`, `payment_method`, `time`) VALUES
(1, '', NULL, '', 'none', '1', '0', '0.00', '0.00', 0, '', '', '0.00', '', 'active', 'active', '', '', '', '0', '0', '0', '0', '', '', 'single', 'none', 1, 0, '0.0', 0, '0.00', 'orphan', 'N', 'unsaved', 'pre_payments', '1684036997');

-- --------------------------------------------------------

--
-- Table structure for table `hex_product_media`
--

CREATE TABLE `hex_product_media` (
  `id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL DEFAULT '0',
  `src` varchar(300) NOT NULL DEFAULT '',
  `thumb` varchar(300) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_prod_categories`
--

CREATE TABLE `hex_prod_categories` (
  `id` int(11) NOT NULL,
  `catg_id` varchar(60) NOT NULL DEFAULT '',
  `catg_name` varchar(60) NOT NULL DEFAULT '',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `sort_order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hex_prod_categories`
--

INSERT INTO `hex_prod_categories` (`id`, `catg_id`, `catg_name`, `status`, `sort_order`) VALUES
(1, 'womens_fation', 'Women\'s fashion', 'active', 2),
(2, 'health_beauty', 'Health and beauty', 'active', 18),
(3, 'phones_and_tablets', 'Phones and tablets', 'active', 9),
(4, 'computers_accessories', 'Computers and Accessories', 'active', 3),
(5, 'electronics', 'Electronics', 'active', 23),
(6, 'footwear', 'Footwear', 'active', 4),
(7, 'household', 'Household products', 'active', 5),
(8, 'children_baby', 'Childen\'s goods', 'active', 6),
(9, 'mens_fation', 'Men\'s fashion', 'active', 22),
(10, 'pets', 'Goods for pets', 'active', 8),
(11, 'graden', 'Garden', 'active', 7),
(12, 'sports_fitenss', 'Sports & Fintness', 'active', 10),
(13, 'auto', 'Auto products', 'active', 11),
(14, 'motorcycle', 'Motorcycle products', 'active', 12),
(15, 'repair', 'Repair Products', 'active', 13),
(16, 'hobby', 'Hobby goods', 'active', 14),
(17, 'office_goods', 'Office supplies', 'active', 15),
(18, 'school_supplies', 'School supplies', 'active', 16),
(19, 'hunting_accessories', 'Hunting accessories', 'active', 17),
(20, 'fishing_supplies', 'Fishing Supplies & Equipment', 'active', 1),
(21, 'holidays_events', 'Holidays & Events', 'active', 19),
(22, 'tea_accessories', 'Tea & Accessories', 'active', 20),
(23, 'games_and_toys', 'Games and toys', 'active', 21);

-- --------------------------------------------------------

--
-- Table structure for table `hex_prod_ratings`
--

CREATE TABLE `hex_prod_ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `prod_id` int(11) NOT NULL DEFAULT '0',
  `valuation` int(11) NOT NULL DEFAULT '0',
  `review` varchar(1200) NOT NULL DEFAULT '',
  `activity_status` enum('active','inactive','orphan') NOT NULL DEFAULT 'inactive',
  `time` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_prod_rating_media`
--

CREATE TABLE `hex_prod_rating_media` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `review_id` int(11) NOT NULL DEFAULT '0',
  `file_path` varchar(1500) NOT NULL DEFAULT '',
  `time` varchar(15) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_prod_reports`
--

CREATE TABLE `hex_prod_reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `prod_id` int(11) NOT NULL DEFAULT '0',
  `report` varchar(1220) NOT NULL DEFAULT '',
  `seen` enum('1','0') NOT NULL DEFAULT '0',
  `time` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_prod_variations`
--

CREATE TABLE `hex_prod_variations` (
  `id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL DEFAULT '0',
  `col_img` varchar(300) NOT NULL DEFAULT '',
  `col_thumb` varchar(3000) NOT NULL DEFAULT '',
  `col_hex` varchar(15) NOT NULL DEFAULT '',
  `col_name` varchar(20) NOT NULL DEFAULT '',
  `size` varchar(50) NOT NULL DEFAULT '',
  `reg_price` varchar(15) NOT NULL DEFAULT '0.00',
  `sale_price` varchar(15) NOT NULL DEFAULT '0.00',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(25) NOT NULL DEFAULT '',
  `height` varchar(11) NOT NULL DEFAULT '',
  `var_type` enum('color','size','color_size','none') NOT NULL DEFAULT 'none',
  `status` enum('active','inactive','blank') NOT NULL DEFAULT 'active',
  `activity_status` enum('active','inactive','orphan') NOT NULL DEFAULT 'inactive',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_sessions`
--

CREATE TABLE `hex_sessions` (
  `id` int(11) NOT NULL,
  `session_id` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `platform` varchar(10) NOT NULL DEFAULT 'web',
  `time` varchar(15) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hex_sessions`
--

INSERT INTO `hex_sessions` (`id`, `session_id`, `user_id`, `platform`, `time`) VALUES
(3, 'a508eea7f96e8e708a043a5991788a5f13e3eab4168403888013aedb42af494edf1e6f0c4bbba8dbaf', 1, 'web', '1684038880');

-- --------------------------------------------------------

--
-- Table structure for table `hex_settings`
--

CREATE TABLE `hex_settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(60) NOT NULL DEFAULT '',
  `value` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_static_pages`
--

CREATE TABLE `hex_static_pages` (
  `id` int(11) NOT NULL,
  `page_name` varchar(300) NOT NULL DEFAULT '',
  `page_content` longtext,
  `last_updated` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hex_static_pages`
--

INSERT INTO `hex_static_pages` (`id`, `page_name`, `page_content`, `last_updated`) VALUES
(1, 'doc_aboutus_page', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse accumsan viverra suscipit. Phasellus vitae interdum leo. Nullam fringilla a neque ut finibus. Pellentesque molestie dolor sit amet metus pretium maximus. Cras molestie id nibh quis volutpat. Integer vel rhoncus ex, non aliquam justo. Mauris accumsan nisl nec nisi pulvinar, nec malesuada sapien convallis. Donec sed accumsan nulla. Aliquam diam velit, malesuada eu turpis et, euismod accumsan nulla. Nulla ac ligula sit amet sem commodo posuere. Cras mauris purus, hendrerit eu lacus vitae, vulputate mollis justo. Nunc eu egestas arcu.\n\nIn finibus eu urna nec facilisis. Cras eu vulputate lorem. Suspendisse pharetra est congue nibh consequat, vel eleifend felis ultricies. Aliquam quis semper risus. Donec ipsum felis, consectetur ac metus ac, dapibus condimentum libero. Etiam velit nulla, congue id suscipit vel, sagittis et sem. Sed condimentum laoreet lorem, sodales porttitor enim egestas ut. Donec tristique nibh quis massa rhoncus laoreet. In hendrerit quam sit amet commodo interdum. Morbi consectetur semper mattis. Nulla tempus lorem suscipit lacus tincidunt, at venenatis sapien tristique. Ut ut mi varius, euismod ligula ut, ornare neque. Curabitur efficitur justo eu nisi maximus lacinia.\n\nSuspendisse a sapien nec nibh auctor scelerisque ut id eros. Nunc at quam ultricies, placerat sapien et, efficitur urna. Duis blandit elit tellus, eu ullamcorper metus aliquet a. Suspendisse feugiat malesuada nisl eu ornare. Cras at dignissim arcu. In ut nibh eget diam eleifend efficitur a sit amet mi. Curabitur accumsan a purus nec sagittis. Vestibulum efficitur orci sem, vitae facilisis nulla pharetra at. Maecenas sit amet elit justo. Maecenas cursus, sapien vitae congue tincidunt, arcu diam vestibulum magna, sed egestas urna velit eu tortor. Sed porta placerat sapien, quis faucibus ligula fringilla quis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent mattis facilisis velit ac tristique. Quisque lacus sem, imperdiet a est id, lobortis mollis sem. Nulla venenatis eu lorem fringilla commodo. Nulla nec orci et nunc feugiat interdum.\n\nMorbi consequat efficitur diam. Etiam euismod sodales magna quis vehicula. Fusce consectetur sem tellus, at aliquet ante mattis quis. Quisque ullamcorper dui justo, quis congue lorem imperdiet vel. Aliquam ut libero nec leo interdum consequat. Nam tristique libero sed lorem elementum mattis. Fusce nec aliquet felis.\n\nNam tempus lorem nec erat egestas, at posuere felis iaculis. Duis tempor nunc pellentesque metus consequat, ac eleifend lacus accumsan. Nunc id ante nec ex blandit ultricies. Phasellus commodo consectetur quam, vel ullamcorper libero sollicitudin eu. Nunc nisl augue, volutpat eu convallis in, dictum aliquet arcu. Morbi a lacus felis. Fusce lobortis diam fermentum facilisis pretium. Integer nec luctus sem, et convallis tellus. Nunc lacinia leo ut tempor lobortis. Fusce tincidunt orci quis consectetur elementum. Nunc rhoncus dui quis augue molestie pulvinar. Mauris sed cursus massa, quis porta risus.', '0'),
(2, 'doc_privacy_policy', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse accumsan viverra suscipit. Phasellus vitae interdum leo. Nullam fringilla a neque ut finibus. Pellentesque molestie dolor sit amet metus pretium maximus. Cras molestie id nibh quis volutpat. Integer vel rhoncus ex, non aliquam justo. Mauris accumsan nisl nec nisi pulvinar, nec malesuada sapien convallis. Donec sed accumsan nulla. Aliquam diam velit, malesuada eu turpis et, euismod accumsan nulla. Nulla ac ligula sit amet sem commodo posuere. Cras mauris purus, hendrerit eu lacus vitae, vulputate mollis justo. Nunc eu egestas arcu.\n\nIn finibus eu urna nec facilisis. Cras eu vulputate lorem. Suspendisse pharetra est congue nibh consequat, vel eleifend felis ultricies. Aliquam quis semper risus. Donec ipsum felis, consectetur ac metus ac, dapibus condimentum libero. Etiam velit nulla, congue id suscipit vel, sagittis et sem. Sed condimentum laoreet lorem, sodales porttitor enim egestas ut. Donec tristique nibh quis massa rhoncus laoreet. In hendrerit quam sit amet commodo interdum. Morbi consectetur semper mattis. Nulla tempus lorem suscipit lacus tincidunt, at venenatis sapien tristique. Ut ut mi varius, euismod ligula ut, ornare neque. Curabitur efficitur justo eu nisi maximus lacinia.\n\nSuspendisse a sapien nec nibh auctor scelerisque ut id eros. Nunc at quam ultricies, placerat sapien et, efficitur urna. Duis blandit elit tellus, eu ullamcorper metus aliquet a. Suspendisse feugiat malesuada nisl eu ornare. Cras at dignissim arcu. In ut nibh eget diam eleifend efficitur a sit amet mi. Curabitur accumsan a purus nec sagittis. Vestibulum efficitur orci sem, vitae facilisis nulla pharetra at. Maecenas sit amet elit justo. Maecenas cursus, sapien vitae congue tincidunt, arcu diam vestibulum magna, sed egestas urna velit eu tortor. Sed porta placerat sapien, quis faucibus ligula fringilla quis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent mattis facilisis velit ac tristique. Quisque lacus sem, imperdiet a est id, lobortis mollis sem. Nulla venenatis eu lorem fringilla commodo. Nulla nec orci et nunc feugiat interdum.\n\nMorbi consequat efficitur diam. Etiam euismod sodales magna quis vehicula. Fusce consectetur sem tellus, at aliquet ante mattis quis. Quisque ullamcorper dui justo, quis congue lorem imperdiet vel. Aliquam ut libero nec leo interdum consequat. Nam tristique libero sed lorem elementum mattis. Fusce nec aliquet felis.\n\nNam tempus lorem nec erat egestas, at posuere felis iaculis. Duis tempor nunc pellentesque metus consequat, ac eleifend lacus accumsan. Nunc id ante nec ex blandit ultricies. Phasellus commodo consectetur quam, vel ullamcorper libero sollicitudin eu. Nunc nisl augue, volutpat eu convallis in, dictum aliquet arcu. Morbi a lacus felis. Fusce lobortis diam fermentum facilisis pretium. Integer nec luctus sem, et convallis tellus. Nunc lacinia leo ut tempor lobortis. Fusce tincidunt orci quis consectetur elementum. Nunc rhoncus dui quis augue molestie pulvinar. Mauris sed cursus massa, quis porta risus.', '0'),
(3, 'doc_terms', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse accumsan viverra suscipit. Phasellus vitae interdum leo. Nullam fringilla a neque ut finibus. Pellentesque molestie dolor sit amet metus pretium maximus. Cras molestie id nibh quis volutpat. Integer vel rhoncus ex, non aliquam justo. Mauris accumsan nisl nec nisi pulvinar, nec malesuada sapien convallis. Donec sed accumsan nulla. Aliquam diam velit, malesuada eu turpis et, euismod accumsan nulla. Nulla ac ligula sit amet sem commodo posuere. Cras mauris purus, hendrerit eu lacus vitae, vulputate mollis justo. Nunc eu egestas arcu.\n\nIn finibus eu urna nec facilisis. Cras eu vulputate lorem. Suspendisse pharetra est congue nibh consequat, vel eleifend felis ultricies. Aliquam quis semper risus. Donec ipsum felis, consectetur ac metus ac, dapibus condimentum libero. Etiam velit nulla, congue id suscipit vel, sagittis et sem. Sed condimentum laoreet lorem, sodales porttitor enim egestas ut. Donec tristique nibh quis massa rhoncus laoreet. In hendrerit quam sit amet commodo interdum. Morbi consectetur semper mattis. Nulla tempus lorem suscipit lacus tincidunt, at venenatis sapien tristique. Ut ut mi varius, euismod ligula ut, ornare neque. Curabitur efficitur justo eu nisi maximus lacinia.\n\nSuspendisse a sapien nec nibh auctor scelerisque ut id eros. Nunc at quam ultricies, placerat sapien et, efficitur urna. Duis blandit elit tellus, eu ullamcorper metus aliquet a. Suspendisse feugiat malesuada nisl eu ornare. Cras at dignissim arcu. In ut nibh eget diam eleifend efficitur a sit amet mi. Curabitur accumsan a purus nec sagittis. Vestibulum efficitur orci sem, vitae facilisis nulla pharetra at. Maecenas sit amet elit justo. Maecenas cursus, sapien vitae congue tincidunt, arcu diam vestibulum magna, sed egestas urna velit eu tortor. Sed porta placerat sapien, quis faucibus ligula fringilla quis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent mattis facilisis velit ac tristique. Quisque lacus sem, imperdiet a est id, lobortis mollis sem. Nulla venenatis eu lorem fringilla commodo. Nulla nec orci et nunc feugiat interdum.\n\nMorbi consequat efficitur diam. Etiam euismod sodales magna quis vehicula. Fusce consectetur sem tellus, at aliquet ante mattis quis. Quisque ullamcorper dui justo, quis congue lorem imperdiet vel. Aliquam ut libero nec leo interdum consequat. Nam tristique libero sed lorem elementum mattis. Fusce nec aliquet felis.\n\nNam tempus lorem nec erat egestas, at posuere felis iaculis. Duis tempor nunc pellentesque metus consequat, ac eleifend lacus accumsan. Nunc id ante nec ex blandit ultricies. Phasellus commodo consectetur quam, vel ullamcorper libero sollicitudin eu. Nunc nisl augue, volutpat eu convallis in, dictum aliquet arcu. Morbi a lacus felis. Fusce lobortis diam fermentum facilisis pretium. Integer nec luctus sem, et convallis tellus. Nunc lacinia leo ut tempor lobortis. Fusce tincidunt orci quis consectetur elementum. Nunc rhoncus dui quis augue molestie pulvinar. Mauris sed cursus massa, quis porta risus.', '0'),
(4, 'doc_merchant_terms', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse accumsan viverra suscipit. Phasellus vitae interdum leo. Nullam fringilla a neque ut finibus. Pellentesque molestie dolor sit amet metus pretium maximus. Cras molestie id nibh quis volutpat. Integer vel rhoncus ex, non aliquam justo. Mauris accumsan nisl nec nisi pulvinar, nec malesuada sapien convallis. Donec sed accumsan nulla. Aliquam diam velit, malesuada eu turpis et, euismod accumsan nulla. Nulla ac ligula sit amet sem commodo posuere. Cras mauris purus, hendrerit eu lacus vitae, vulputate mollis justo. Nunc eu egestas arcu.\n\nIn finibus eu urna nec facilisis. Cras eu vulputate lorem. Suspendisse pharetra est congue nibh consequat, vel eleifend felis ultricies. Aliquam quis semper risus. Donec ipsum felis, consectetur ac metus ac, dapibus condimentum libero. Etiam velit nulla, congue id suscipit vel, sagittis et sem. Sed condimentum laoreet lorem, sodales porttitor enim egestas ut. Donec tristique nibh quis massa rhoncus laoreet. In hendrerit quam sit amet commodo interdum. Morbi consectetur semper mattis. Nulla tempus lorem suscipit lacus tincidunt, at venenatis sapien tristique. Ut ut mi varius, euismod ligula ut, ornare neque. Curabitur efficitur justo eu nisi maximus lacinia.\n\nSuspendisse a sapien nec nibh auctor scelerisque ut id eros. Nunc at quam ultricies, placerat sapien et, efficitur urna. Duis blandit elit tellus, eu ullamcorper metus aliquet a. Suspendisse feugiat malesuada nisl eu ornare. Cras at dignissim arcu. In ut nibh eget diam eleifend efficitur a sit amet mi. Curabitur accumsan a purus nec sagittis. Vestibulum efficitur orci sem, vitae facilisis nulla pharetra at. Maecenas sit amet elit justo. Maecenas cursus, sapien vitae congue tincidunt, arcu diam vestibulum magna, sed egestas urna velit eu tortor. Sed porta placerat sapien, quis faucibus ligula fringilla quis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent mattis facilisis velit ac tristique. Quisque lacus sem, imperdiet a est id, lobortis mollis sem. Nulla venenatis eu lorem fringilla commodo. Nulla nec orci et nunc feugiat interdum.\n\nMorbi consequat efficitur diam. Etiam euismod sodales magna quis vehicula. Fusce consectetur sem tellus, at aliquet ante mattis quis. Quisque ullamcorper dui justo, quis congue lorem imperdiet vel. Aliquam ut libero nec leo interdum consequat. Nam tristique libero sed lorem elementum mattis. Fusce nec aliquet felis.\n\nNam tempus lorem nec erat egestas, at posuere felis iaculis. Duis tempor nunc pellentesque metus consequat, ac eleifend lacus accumsan. Nunc id ante nec ex blandit ultricies. Phasellus commodo consectetur quam, vel ullamcorper libero sollicitudin eu. Nunc nisl augue, volutpat eu convallis in, dictum aliquet arcu. Morbi a lacus felis. Fusce lobortis diam fermentum facilisis pretium. Integer nec luctus sem, et convallis tellus. Nunc lacinia leo ut tempor lobortis. Fusce tincidunt orci quis consectetur elementum. Nunc rhoncus dui quis augue molestie pulvinar. Mauris sed cursus massa, quis porta risus.', '0');

-- --------------------------------------------------------

--
-- Table structure for table `hex_store_customers`
--

CREATE TABLE `hex_store_customers` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL DEFAULT '0',
  `buyer_id` int(11) NOT NULL DEFAULT '0',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_temp_data`
--

CREATE TABLE `hex_temp_data` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(300) NOT NULL DEFAULT '',
  `value` varchar(3000) NOT NULL DEFAULT '',
  `type` enum('int','text','url','path','none') NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_temp_media`
--

CREATE TABLE `hex_temp_media` (
  `id` int(11) NOT NULL,
  `file_path` varchar(600) NOT NULL DEFAULT '',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_users`
--

CREATE TABLE `hex_users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `fname` varchar(30) NOT NULL DEFAULT '',
  `lname` varchar(30) NOT NULL DEFAULT '',
  `bio` varchar(220) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `em_code` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `joined` varchar(20) NOT NULL DEFAULT '0',
  `last_active` varchar(20) NOT NULL DEFAULT '0',
  `ipv4_address` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `language` varchar(20) NOT NULL DEFAULT 'english',
  `avatar` varchar(300) NOT NULL DEFAULT 'upload/users/user-avatar.png',
  `country_id` int(3) NOT NULL DEFAULT '0',
  `youtube` varchar(100) NOT NULL DEFAULT '',
  `facebook` varchar(100) NOT NULL DEFAULT '',
  `twitter` varchar(100) NOT NULL DEFAULT '',
  `instagram` varchar(100) NOT NULL DEFAULT '',
  `website` varchar(100) NOT NULL DEFAULT '',
  `google_plus` varchar(100) NOT NULL DEFAULT '',
  `verified` enum('0','1') NOT NULL DEFAULT '0',
  `admin` enum('0','1') NOT NULL DEFAULT '0',
  `is_seller` enum('Y','N') NOT NULL DEFAULT 'N',
  `wallet` varchar(15) NOT NULL DEFAULT '0.00',
  `sales` int(11) NOT NULL DEFAULT '0',
  `active` enum('0','1','2') NOT NULL DEFAULT '0',
  `phone` varchar(18) NOT NULL DEFAULT '',
  `whatsapp` varchar(18) NOT NULL DEFAULT '',
  `state` varchar(50) NOT NULL DEFAULT '',
  `city` varchar(60) NOT NULL DEFAULT '',
  `street` varchar(100) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `off_apt` varchar(60) NOT NULL DEFAULT '',
  `zip_postal` varchar(10) NOT NULL DEFAULT '',
  `deliv_addr` varchar(11) NOT NULL DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hex_users`
--

INSERT INTO `hex_users` (`id`, `username`, `fname`, `lname`, `bio`, `email`, `em_code`, `password`, `joined`, `last_active`, `ipv4_address`, `language`, `avatar`, `country_id`, `youtube`, `facebook`, `twitter`, `instagram`, `website`, `google_plus`, `verified`, `admin`, `is_seller`, `wallet`, `sales`, `active`, `phone`, `whatsapp`, `state`, `city`, `street`, `off_apt`, `zip_postal`, `deliv_addr`) VALUES
(1, 'administrator@1', 'Administrator', '', '', 'imronpedia@gmail.com', '', '$2y$10$IPGGb1W/DlLA2JJlOdxwEuAi1fvxqLv.0QyMZn9U.4pd8f/RspPoa', '1681895952', '1684038882', '127.0.0.1', 'indonesia', 'upload/users/user-avatar.png', 100, '', '', '', '', '', '', '0', '1', 'Y', '0.00', 0, '1', '', '', '', '', '', '', '', 'default'),
(2, 'imron_reviady@2', 'Imron', 'Reviady', '', 'imronreviady1@gmail.com', 'da9084033eb9c0c4d61110c8e854efb50a0fd8f7', '$2y$10$IPGGb1W/DlLA2JJlOdxwEuAi1fvxqLv.0QyMZn9U.4pd8f/RspPoa', '1684038837', '1684038837', '127.0.0.1', 'indonesia', 'upload/users/user-avatar.png', 0, '', '', '', '', '', '', '0', '0', 'N', '0.00', 0, '1', '', '', '', '', '', '', '', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `hex_verif_requests`
--

CREATE TABLE `hex_verif_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `full_name` varchar(32) NOT NULL DEFAULT '',
  `message` varchar(600) NOT NULL DEFAULT '',
  `id_photo` varchar(300) NOT NULL DEFAULT '',
  `pr_photo` varchar(300) NOT NULL DEFAULT '',
  `status` enum('pending','rejected') NOT NULL DEFAULT 'pending',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hex_wishlist`
--

CREATE TABLE `hex_wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `list_name` varchar(50) NOT NULL DEFAULT '',
  `hash_id` varchar(64) NOT NULL DEFAULT '',
  `type` enum('static','removable') NOT NULL DEFAULT 'removable',
  `time` varchar(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hex_wishlist`
--

INSERT INTO `hex_wishlist` (`id`, `user_id`, `list_name`, `hash_id`, `type`, `time`) VALUES
(1, 1, 'Favorite', '6b90b6a112f2f408ec5c95c12', 'static', '1681895952'),
(2, 1, 'Sundry', '62778e4e6c576a5967b4594a2', 'static', '1681895952'),
(3, 1, 'Buy later', 'c306ee6b02589deef09778e26', 'static', '1681895952'),
(4, 1, 'Birthday', 'a6b9d69f57d94a826930e4536', 'static', '1681895952'),
(5, 1, 'Gift Ideas', '6bdb99c24cd3d1d269dd7aa81', 'static', '1681895952'),
(6, 2, 'Favorite', '6b90b6a112f2f408ec5c95c12', 'static', '1684038837'),
(7, 2, 'Sundry', '62778e4e6c576a5967b4594a2', 'static', '1684038837'),
(8, 2, 'Buy later', 'c306ee6b02589deef09778e26', 'static', '1684038837'),
(9, 2, 'Birthday', 'a6b9d69f57d94a826930e4536', 'static', '1684038837'),
(10, 2, 'Gift Ideas', '6bdb99c24cd3d1d269dd7aa81', 'static', '1684038837');

-- --------------------------------------------------------

--
-- Table structure for table `hex_wishlist_items`
--

CREATE TABLE `hex_wishlist_items` (
  `id` int(11) NOT NULL,
  `list_id` int(11) NOT NULL DEFAULT '0',
  `prod_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `time` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hex_acc_del_requests`
--
ALTER TABLE `hex_acc_del_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_admins`
--
ALTER TABLE `hex_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_admin_sessions`
--
ALTER TABLE `hex_admin_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_announcements`
--
ALTER TABLE `hex_announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `hex_backups`
--
ALTER TABLE `hex_backups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_basket`
--
ALTER TABLE `hex_basket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_blocked_users`
--
ALTER TABLE `hex_blocked_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_chat_conversations`
--
ALTER TABLE `hex_chat_conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_one` (`user_one`),
  ADD KEY `user_two` (`user_two`);

--
-- Indexes for table `hex_chat_messages`
--
ALTER TABLE `hex_chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_checkout_transactions`
--
ALTER TABLE `hex_checkout_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_config`
--
ALTER TABLE `hex_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_currencies`
--
ALTER TABLE `hex_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_data_sessions`
--
ALTER TABLE `hex_data_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_deliv_addresses`
--
ALTER TABLE `hex_deliv_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_langs`
--
ALTER TABLE `hex_langs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_languages`
--
ALTER TABLE `hex_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_market_revenue`
--
ALTER TABLE `hex_market_revenue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_notifications`
--
ALTER TABLE `hex_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifier_id` (`notifier_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `hex_orders`
--
ALTER TABLE `hex_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_order_cancellations`
--
ALTER TABLE `hex_order_cancellations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_ord_hist_timeline`
--
ALTER TABLE `hex_ord_hist_timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_payout_requests`
--
ALTER TABLE `hex_payout_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_products`
--
ALTER TABLE `hex_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_product_media`
--
ALTER TABLE `hex_product_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_prod_categories`
--
ALTER TABLE `hex_prod_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_prod_ratings`
--
ALTER TABLE `hex_prod_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_status` (`activity_status`);

--
-- Indexes for table `hex_prod_rating_media`
--
ALTER TABLE `hex_prod_rating_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_prod_reports`
--
ALTER TABLE `hex_prod_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_prod_variations`
--
ALTER TABLE `hex_prod_variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_sessions`
--
ALTER TABLE `hex_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hex_sessions_ibfk_1` (`user_id`);

--
-- Indexes for table `hex_settings`
--
ALTER TABLE `hex_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `hex_static_pages`
--
ALTER TABLE `hex_static_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_store_customers`
--
ALTER TABLE `hex_store_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_temp_data`
--
ALTER TABLE `hex_temp_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `key` (`name`);

--
-- Indexes for table `hex_temp_media`
--
ALTER TABLE `hex_temp_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_users`
--
ALTER TABLE `hex_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_verif_requests`
--
ALTER TABLE `hex_verif_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_wishlist`
--
ALTER TABLE `hex_wishlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hex_wishlist_items`
--
ALTER TABLE `hex_wishlist_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hex_acc_del_requests`
--
ALTER TABLE `hex_acc_del_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_admins`
--
ALTER TABLE `hex_admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hex_admin_sessions`
--
ALTER TABLE `hex_admin_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_announcements`
--
ALTER TABLE `hex_announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hex_backups`
--
ALTER TABLE `hex_backups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_basket`
--
ALTER TABLE `hex_basket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_blocked_users`
--
ALTER TABLE `hex_blocked_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_chat_conversations`
--
ALTER TABLE `hex_chat_conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_chat_messages`
--
ALTER TABLE `hex_chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_checkout_transactions`
--
ALTER TABLE `hex_checkout_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_config`
--
ALTER TABLE `hex_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `hex_currencies`
--
ALTER TABLE `hex_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `hex_data_sessions`
--
ALTER TABLE `hex_data_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hex_deliv_addresses`
--
ALTER TABLE `hex_deliv_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_langs`
--
ALTER TABLE `hex_langs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35656;

--
-- AUTO_INCREMENT for table `hex_languages`
--
ALTER TABLE `hex_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `hex_market_revenue`
--
ALTER TABLE `hex_market_revenue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_notifications`
--
ALTER TABLE `hex_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_orders`
--
ALTER TABLE `hex_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_order_cancellations`
--
ALTER TABLE `hex_order_cancellations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_ord_hist_timeline`
--
ALTER TABLE `hex_ord_hist_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_payout_requests`
--
ALTER TABLE `hex_payout_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_products`
--
ALTER TABLE `hex_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hex_product_media`
--
ALTER TABLE `hex_product_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_prod_categories`
--
ALTER TABLE `hex_prod_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `hex_prod_ratings`
--
ALTER TABLE `hex_prod_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_prod_rating_media`
--
ALTER TABLE `hex_prod_rating_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_prod_reports`
--
ALTER TABLE `hex_prod_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_prod_variations`
--
ALTER TABLE `hex_prod_variations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_sessions`
--
ALTER TABLE `hex_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hex_settings`
--
ALTER TABLE `hex_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_static_pages`
--
ALTER TABLE `hex_static_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hex_store_customers`
--
ALTER TABLE `hex_store_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_temp_data`
--
ALTER TABLE `hex_temp_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_temp_media`
--
ALTER TABLE `hex_temp_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_users`
--
ALTER TABLE `hex_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hex_verif_requests`
--
ALTER TABLE `hex_verif_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hex_wishlist`
--
ALTER TABLE `hex_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `hex_wishlist_items`
--
ALTER TABLE `hex_wishlist_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hex_sessions`
--
ALTER TABLE `hex_sessions`
  ADD CONSTRAINT `hex_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `hex_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
