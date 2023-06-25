-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2023 at 01:45 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salon`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `json_extract` (`details` TEXT, `required_field` VARCHAR(255)) RETURNS TEXT CHARSET latin1 COLLATE latin1_swedish_ci  BEGIN
        SET details = SUBSTRING_INDEX(details, "{", -1);
        SET details = SUBSTRING_INDEX(details, "}", 1);
        RETURN TRIM(
            BOTH '"' FROM SUBSTRING_INDEX(
                SUBSTRING_INDEX(
                    SUBSTRING_INDEX(
                        details,
                        CONCAT(
                            '"',
                            SUBSTRING_INDEX(required_field,'$.', -1),
                            '":'
                        ),
                        -1
                    ),
                    ',"',
                    1
                ),
                ':',
                -1
            )
        ) ;
        END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `json_unquote` (`mdata` TEXT CHARSET utf8mb4) RETURNS TEXT CHARSET utf8mb4 COLLATE utf8mb4_general_ci  BEGIN
            RETURN mdata;
            END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `latitude` double(20,17) NOT NULL DEFAULT 0.00000000000000000,
  `longitude` double(20,17) NOT NULL DEFAULT 0.00000000000000000,
  `default` tinyint(1) DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `description`, `address`, `latitude`, `longitude`, `default`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Office', '396 Champlin Gateway\nShannyfort, MT 38222', 51.25712566000000000, 9.83749842000000000, 0, 1, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(2, 'Office', '1735 Fermin Walk\nEast Luz, IA 72977', 51.84912200000000000, 9.98474561000000000, 0, 7, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(3, 'Office', '2689 Callie Shoal\nSouth Loma, SD 59595-9745', 51.87134845000000000, 9.13570666000000000, 0, 1, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(4, 'Workshop', '27148 Beatty Union\nKatelinberg, NE 65054-2594', 51.42036968000000000, 11.56426575000000000, 0, 2, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(5, 'Building', '728 Dulce Mountain Suite 408\nSouth Abdiel, WV 80237-0669', 50.32962746000000000, 10.97049389000000000, 0, 2, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(6, 'Building', '773 Hoppe Crest Suite 230\nZboncakberg, VA 02968', 51.14053477000000000, 9.59926654000000000, 0, 5, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(7, 'Work', '159 Hahn Field Apt. 653\nSouth Ervinstad, MO 17540-0584', 51.61672502000000000, 10.35019457000000000, 0, 6, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(8, 'Office', '345 Leffler Camp Apt. 592\nSouth Jermain, GA 27381-5088', 51.84629179000000000, 10.09464886000000000, 0, 7, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(9, 'Office', '6905 Abdul Square Apt. 803\nReymundoton, NC 10240-7408', 51.51700358000000000, 10.88104049000000000, 0, 7, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(10, 'Workshop', '46486 Lionel Loaf\nEast Louisa, CO 68259', 50.31360157000000000, 9.86158387000000000, 0, 6, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(11, 'Hotel', '897 Bergnaum Tunnel Suite 659\nNew Mireille, OH 54870-3258', 50.95818494000000000, 9.50331895000000000, 0, 1, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(12, 'Home', '6309 Okuneva Lane\nDenesikland, MN 48382-6012', 51.97878300000000000, 10.51034331000000000, 0, 7, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(13, 'Home', '185 Stanton Keys Apt. 213\nEast Alene, WY 84747-2542', 51.15121794000000000, 10.30106320000000000, 0, 2, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(14, 'Workshop', '7647 Bosco Roads Apt. 422\nIsabelltown, KS 46975', 50.37007222000000000, 10.93936497000000000, 0, 5, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(15, 'Workshop', '9913 Madisen Ferry Suite 344\nKulasberg, HI 76103-8219', 50.26515245000000000, 10.09701364000000000, 0, 1, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(16, 'Building', '26222 Mckenna Viaduct Apt. 325\nEast Golda, MT 82221-4152', 51.40140820000000000, 9.23565990000000000, 0, 7, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(17, 'Work', '1797 Magdalena Glen Apt. 766\nNew Elissa, AZ 03483-3750', 50.07399225000000000, 10.55073645000000000, 0, 5, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(18, 'Work', '42138 Ned Radial Apt. 316\nPort Graham, NC 19573', 51.37765460000000000, 10.75316088000000000, 0, 2, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(19, 'Workshop', '9008 Romaguera Drive Suite 128\nKerlukehaven, NM 96169', 50.59919038000000000, 9.92664948000000000, 0, 5, '2023-05-28 01:08:13', '2023-05-28 01:08:13'),
(20, 'Office', '14657 Lehner Camp\nHaleybury, NJ 82125-9294', 50.34293795000000000, 11.86981877000000000, 0, 2, '2023-05-28 01:08:13', '2023-05-28 01:08:13');

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `key`, `value`) VALUES
(7, 'date_format', 'l jS F Y (H:i:s)'),
(8, 'language', 'en'),
(17, 'is_human_date_format', '1'),
(18, 'app_name', 'Beauty Salons'),
(19, 'app_short_description', 'Manage Mobile Application'),
(20, 'mail_driver', 'smtp'),
(21, 'mail_host', 'smtp.hostinger.com'),
(22, 'mail_port', '587'),
(23, 'mail_username', 'test@demo.com'),
(24, 'mail_password', '-'),
(25, 'mail_encryption', 'ssl'),
(26, 'mail_from_address', 'test@demo.com'),
(27, 'mail_from_name', 'Smarter Vision'),
(30, 'timezone', 'America/Montserrat'),
(32, 'theme_contrast', 'light'),
(33, 'theme_color', 'olive'),
(34, 'app_logo', '020a2dd4-4277-425a-b450-426663f52633'),
(35, 'nav_color', 'navbar-dark navbar-olive'),
(38, 'logo_bg_color', 'text-light  navbar-olive'),
(68, 'facebook_app_id', '518416208939727'),
(69, 'facebook_app_secret', '93649810f78fa9ca0d48972fee2a75cd'),
(71, 'twitter_app_id', 'twitter'),
(72, 'twitter_app_secret', 'twitter 1'),
(74, 'google_app_id', '527129559488-roolg8aq110p8r1q952fqa9tm06gbloe.apps.googleusercontent.com'),
(75, 'google_app_secret', 'FpIi8SLgc69ZWodk-xHaOrxn'),
(77, 'enable_google', '1'),
(78, 'enable_facebook', '1'),
(93, 'enable_stripe', '1'),
(94, 'stripe_key', 'pk_test_pltzOnX3zsUZMoTTTVUL4O41'),
(95, 'stripe_secret', 'sk_test_o98VZx3RKDUytaokX4My3a20'),
(101, 'custom_field_models.0', 'App\\Models\\User'),
(104, 'default_tax', '10'),
(107, 'default_currency', '$'),
(108, 'fixed_header', '1'),
(109, 'fixed_footer', '0'),
(110, 'fcm_key', 'AAAAEywF1hs:APA91bFJX08pyB_IbU-1zh7B-YToCJml2Vgl0MRadfmuleaQFsdDOjW52QcwVLsyBkWDT40gkQkhSQz0E2KMvFk6O9PKCUR4iiePaVV8GIbAqljDOGotJ9QzwBUWMGS3c7OXN0uvKBRG'),
(111, 'enable_notifications', '1'),
(112, 'paypal_username', 'sb-z3gdq482047_api1.business.example.com'),
(113, 'paypal_password', '-'),
(114, 'paypal_secret', '-'),
(115, 'enable_paypal', '1'),
(116, 'main_color', '#09594B'),
(117, 'main_dark_color', '#ADC148'),
(118, 'second_color', '#042819'),
(119, 'second_dark_color', '#CCDDCF'),
(120, 'accent_color', '#BBC4C1'),
(121, 'accent_dark_color', '#99AA99'),
(122, 'scaffold_dark_color', '#2C2C2C'),
(123, 'scaffold_color', '#FAFAFA'),
(124, 'google_maps_key', '-'),
(125, 'mobile_language', 'en'),
(126, 'app_version', '1.0.0'),
(127, 'enable_version', '1'),
(128, 'default_currency_id', '1'),
(129, 'default_currency_code', 'USD'),
(130, 'default_currency_decimal_digits', '2'),
(131, 'default_currency_rounding', '0'),
(132, 'currency_right', '1'),
(133, 'distance_unit', 'km'),
(134, 'default_theme', 'light'),
(135, 'enable_paystack', '1'),
(136, 'paystack_key', 'pk_test_d754715fa3fa9048c9ab2832c440fb183d7c91f5'),
(137, 'paystack_secret', 'sk_test_66f87edaac94f8adcb28fdf7452f12ccc63d068d'),
(138, 'enable_flutterwave', '1'),
(139, 'flutterwave_key', 'FLWPUBK_TEST-d465ba7e4f6b86325cb9881835726402-X'),
(140, 'flutterwave_secret', 'FLWSECK_TEST-d3f8801da31fc093fb1207ea34e68fbb-X'),
(141, 'enable_stripe_fpx', '1'),
(142, 'stripe_fpx_key', 'pk_test_51IQ0zvB0wbAJesyPLo3x4LRgOjM65IkoO5hZLHOMsnO2RaF0NlH7HNOfpCkjuLSohvdAp30U5P1wKeH98KnwXkOD00mMDavaFX'),
(143, 'stripe_fpx_secret', 'sk_test_51IQ0zvB0wbAJesyPUtR7yGdyOR7aGbMQAX5Es9P56EDUEsvEQAC0NBj7JPqFuJEYXrvSCm5OPRmGaUQBswjkRxVB00mz8xhkFX'),
(144, 'enable_paymongo', '1'),
(145, 'paymongo_key', 'pk_test_iD6aYYm4yFuvkuisyU2PGSYH'),
(146, 'paymongo_secret', 'sk_test_oxD79bMKxb8sA47ZNyYPXwf3'),
(147, 'salon_app_name', 'Salon Manager'),
(148, 'default_country_code', 'DE'),
(149, 'enable_otp', '1'),
(150, 'is_private', '1');

-- --------------------------------------------------------

--
-- Table structure for table `availability_hours`
--

CREATE TABLE `availability_hours` (
  `id` int(10) UNSIGNED NOT NULL,
  `day` varchar(16) NOT NULL DEFAULT 'monday',
  `start_at` varchar(16) DEFAULT NULL,
  `end_at` varchar(16) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `salon_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `availability_hours`
--

INSERT INTO `availability_hours` (`id`, `day`, `start_at`, `end_at`, `data`, `salon_id`) VALUES
(1, 'thursday', '08:00', '21:00', '{\"en\":\"Labore expedita aut officiis.\"}', 8),
(2, 'thursday', '08:00', '17:00', '{\"en\":\"Alias autem ab reiciendis doloremque debitis sed.\"}', 9),
(3, 'wednesday', '06:00', '16:00', '{\"en\":\"Autem mollitia maxime voluptate in culpa dolores.\"}', 3),
(4, 'sunday', '05:00', '19:00', '{\"en\":\"Beatae at eum nihil ut.\"}', 2),
(5, 'thursday', '07:00', '18:00', '{\"en\":\"Beatae rem voluptas voluptas aut.\"}', 6),
(6, 'saturday', '06:00', '13:00', '{\"en\":\"Quo odit cum dolores.\"}', 1),
(7, 'tuesday', '07:00', '22:00', '{\"en\":\"Ea veniam ipsam blanditiis perferendis.\"}', 7),
(8, 'thursday', '04:00', '14:00', '{\"en\":\"Qui accusamus debitis accusamus.\"}', 9),
(9, 'monday', '05:00', '23:00', '{\"en\":\"Velit qui quibusdam incidunt maxime ipsum.\"}', 1),
(10, 'tuesday', '08:00', '18:00', '{\"en\":\"Voluptatem ad qui omnis voluptatum ea.\"}', 5),
(11, 'tuesday', '07:00', '16:00', '{\"en\":\"Et sint est et aut.\"}', 3),
(12, 'saturday', '12:00', '14:00', '{\"en\":\"Ut ut enim unde quisquam.\"}', 1),
(13, 'friday', '11:00', '16:00', '{\"en\":\"Commodi est nesciunt sequi est doloribus vitae.\"}', 10),
(14, 'saturday', '04:00', '16:00', '{\"en\":\"At accusantium quos omnis eius eos vitae.\"}', 1),
(15, 'monday', '04:00', '17:00', '{\"en\":\"Velit fugiat at sint sint dolore sapiente.\"}', 10),
(16, 'friday', '04:00', '19:00', '{\"en\":\"Non est et inventore pariatur dolores nostrum.\"}', 5),
(17, 'friday', '12:00', '15:00', '{\"en\":\"Ut fugiat sunt a ut odio esse.\"}', 7),
(18, 'friday', '11:00', '16:00', '{\"en\":\"Ut corrupti ratione ex id.\"}', 1),
(19, 'sunday', '05:00', '22:00', '{\"en\":\"Debitis cumque iure est dolorem.\"}', 7),
(20, 'saturday', '09:00', '14:00', '{\"en\":\"Esse iure qui tenetur vero voluptate provident.\"}', 2),
(21, 'monday', '12:00', '19:00', '{\"en\":\"Consequatur voluptatem dolores et aut autem.\"}', 8),
(22, 'tuesday', '08:00', '18:00', '{\"en\":\"Assumenda totam omnis itaque optio.\"}', 6),
(23, 'monday', '08:00', '20:00', '{\"en\":\"Dolores beatae accusamus eaque ex.\"}', 4),
(24, 'monday', '06:00', '20:00', '{\"en\":\"Vel fugit laudantium ullam libero et.\"}', 4),
(25, 'sunday', '02:00', '22:00', '{\"en\":\"Est atque et veniam ut et vel et.\"}', 5),
(26, 'monday', '07:00', '20:00', '{\"en\":\"Et adipisci enim quo incidunt.\"}', 8),
(27, 'sunday', '04:00', '15:00', '{\"en\":\"Aut commodi doloremque quis dolor hic recusandae.\"}', 6),
(28, 'sunday', '08:00', '16:00', '{\"en\":\"Enim eum excepturi cumque ullam iusto enim.\"}', 9),
(29, 'wednesday', '03:00', '23:00', '{\"en\":\"Vitae dicta sed hic labore.\"}', 1),
(30, 'sunday', '02:00', '14:00', '{\"en\":\"Fuga atque autem qui aut rerum distinctio.\"}', 4),
(31, 'friday', '09:00', '18:00', '{\"en\":\"Beatae deserunt vero sit rem.\"}', 7),
(32, 'wednesday', '05:00', '18:00', '{\"en\":\"Aliquid nulla voluptatem est sit.\"}', 4),
(33, 'sunday', '11:00', '17:00', '{\"en\":\"Quos iste occaecati occaecati a.\"}', 4),
(34, 'saturday', '12:00', '19:00', '{\"en\":\"Reprehenderit dolore aut quis repudiandae.\"}', 10),
(35, 'sunday', '03:00', '18:00', '{\"en\":\"Voluptatem et et non laborum molestiae ex.\"}', 7),
(36, 'saturday', '11:00', '18:00', '{\"en\":\"Vel id autem et doloribus reiciendis molestiae.\"}', 2),
(37, 'thursday', '06:00', '15:00', '{\"en\":\"Qui dolorem qui enim excepturi.\"}', 7),
(38, 'saturday', '03:00', '22:00', '{\"en\":\"Quia cum harum perspiciatis.\"}', 3),
(39, 'sunday', '07:00', '18:00', '{\"en\":\"Minus perspiciatis quia porro sed et.\"}', 7),
(40, 'thursday', '04:00', '21:00', '{\"en\":\"Inventore nulla velit nostrum non.\"}', 4),
(41, 'sunday', '12:00', '18:00', '{\"en\":\"Tenetur amet reiciendis inventore eos ducimus.\"}', 3),
(42, 'friday', '02:00', '22:00', '{\"en\":\"Explicabo sequi quis in reprehenderit aliquid id.\"}', 8),
(43, 'saturday', '04:00', '14:00', '{\"en\":\"Illo non iusto illo repellendus blanditiis.\"}', 3),
(44, 'friday', '09:00', '22:00', '{\"en\":\"Saepe consequuntur possimus ut id.\"}', 8),
(45, 'wednesday', '11:00', '22:00', '{\"en\":\"Praesentium voluptatem laudantium dicta quas.\"}', 6),
(46, 'wednesday', '08:00', '20:00', '{\"en\":\"Dolor ad cumque perferendis et exercitationem.\"}', 10),
(47, 'wednesday', '05:00', '21:00', '{\"en\":\"Eligendi neque quis in nostrum rerum doloribus.\"}', 10),
(48, 'tuesday', '10:00', '21:00', '{\"en\":\"Ad necessitatibus nostrum inventore aut.\"}', 3),
(49, 'thursday', '12:00', '17:00', '{\"en\":\"Quisquam totam suscipit commodi beatae et.\"}', 4),
(50, 'friday', '08:00', '23:00', '{\"en\":\"Blanditiis autem iure itaque ut et quas.\"}', 3);

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `salon_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `awards`
--

INSERT INTO `awards` (`id`, `title`, `description`, `salon_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Labore suscipit consequatur esse repudiandae. Et quaerat illum modi rerum recusandae.\"}', '{\"en\":\"Conqueror, whose cause was favoured by the pope, was soon left alone. \'I wish I hadn\'t quite finished my tea when I get it home?\' when it had made. \'He took me for asking! No, it\'ll never do to come.\"}', 1, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(2, '{\"en\":\"Sunt adipisci rem esse nihil hic. Iusto ratione cum enim cum. Eos aut et et amet qui.\"}', '{\"en\":\"It\'s by far the most important piece of evidence we\'ve heard yet,\' said Alice; \'that\'s not at all like the three were all turning into little cakes as they used to call him Tortoise, if he were.\"}', 4, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(3, '{\"en\":\"Fugit nulla sapiente autem beatae omnis est. Quod vel officiis eos minus autem natus et autem.\"}', '{\"en\":\"Would not, could not, would not, could not, would not join the dance? \\\"You can really have no answers.\' \'If you knew Time as well as she went on muttering over the jury-box with the bones and the.\"}', 2, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(4, '{\"en\":\"Vitae odit est eius quia unde nihil ab a. Delectus eum quisquam voluptatem ex sunt et minima.\"}', '{\"en\":\"Cat\'s head began fading away the moment she appeared on the song, she kept fanning herself all the unjust things--\' when his eye chanced to fall a long and a large arm-chair at one corner of it: for.\"}', 2, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(5, '{\"en\":\"Et magni mollitia facere quo repellat debitis nihil. Dicta accusantium tempore cumque veritatis.\"}', '{\"en\":\"In a minute or two she stood still where she was, and waited. When the sands are all pardoned.\' \'Come, THAT\'S a good opportunity for showing off a bit of stick, and held it out to her very.\"}', 4, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(6, '{\"en\":\"Vero maxime blanditiis ut sint qui laborum. Voluptate enim laudantium et incidunt.\"}', '{\"en\":\"Mock Turtle repeated thoughtfully. \'I should like to be otherwise than what it was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the Queen merely remarking.\"}', 6, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(7, '{\"en\":\"Ipsum nulla suscipit qui. Alias saepe quisquam explicabo eligendi ullam velit magni.\"}', '{\"en\":\"And they pinched it on both sides at once. The Dormouse again took a minute or two to think that very few little girls of her age knew the right house, because the chimneys were shaped like ears and.\"}', 5, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(8, '{\"en\":\"Eos ut et rem occaecati id voluptatibus. Excepturi et sed dolores architecto repellendus.\"}', '{\"en\":\"Queen, who was passing at the stick, and made a rush at the cook, and a fall, and a fan! Quick, now!\' And Alice was beginning very angrily, but the Hatter with a sigh: \'it\'s always tea-time, and.\"}', 6, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(9, '{\"en\":\"Beatae voluptas quas amet eligendi. Cumque sit exercitationem fugit vero rerum dolor consequatur.\"}', '{\"en\":\"WHAT?\' said the King said to herself, as usual. \'Come, there\'s half my plan done now! How puzzling all these changes are! I\'m never sure what I\'m going to say,\' said the Caterpillar. \'Is that the.\"}', 10, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(10, '{\"en\":\"Sint nemo sunt repellat rem. Saepe voluptas ut omnis. Hic ullam voluptatum vel molestiae non.\"}', '{\"en\":\"IT TO BE TRUE--\\\" that\'s the jury-box,\' thought Alice, and, after waiting till she shook the house, and the Mock Turtle. Alice was thoroughly puzzled. \'Does the boots and shoes!\' she repeated in a.\"}', 1, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(11, '{\"en\":\"Eum et non aliquam cupiditate aut eos architecto ipsam. Ex fugiat perferendis omnis.\"}', '{\"en\":\"There could be NO mistake about it: it was done. They had not noticed before, and she told her sister, as well as I used--and I don\'t keep the same side of WHAT? The other guests had taken his watch.\"}', 9, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(12, '{\"en\":\"Sunt alias ab dolor placeat sunt. Voluptatibus est et porro doloremque. Earum et cum voluptatem.\"}', '{\"en\":\"The baby grunted again, so she turned the corner, but the Hatter went on \'And how do you like the look of the hall; but, alas! either the locks were too large, or the key was lying under the table.\"}', 8, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(13, '{\"en\":\"Dolores qui et pariatur sunt consectetur. Ut molestias sed corporis eos quibusdam ratione quod.\"}', '{\"en\":\"Caterpillar decidedly, and he says it\'s so useful, it\'s worth a hundred pounds! He says it kills all the time she found herself safe in a languid, sleepy voice. \'Who are YOU?\' Which brought them.\"}', 4, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(14, '{\"en\":\"Tenetur omnis officia tenetur et. Et autem et nam. Autem enim esse est omnis.\"}', '{\"en\":\"Queen said--\' \'Get to your little boy, And beat him when he sneezes; For he can thoroughly enjoy The pepper when he sneezes; For he can thoroughly enjoy The pepper when he finds out who I WAS when I.\"}', 3, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(15, '{\"en\":\"Enim voluptas est est aspernatur. Fugiat eaque et ex.\"}', '{\"en\":\"Queen merely remarking that a red-hot poker will burn you if you please! \\\"William the Conqueror, whose cause was favoured by the way, and nothing seems to be seen: she found herself in Wonderland.\"}', 3, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(16, '{\"en\":\"Id dolorem qui atque. Eos a quos dolorem aut maxime non.\"}', '{\"en\":\"King; \'and don\'t be nervous, or I\'ll have you got in as well,\' the Hatter said, turning to Alice, she went on, spreading out the words: \'Where\'s the other arm curled round her once more, while the.\"}', 2, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(17, '{\"en\":\"Consequatur ad quaerat dolore ut est maiores. Ea dolor dolorem ut praesentium excepturi.\"}', '{\"en\":\"After a minute or two, and the choking of the Lobster Quadrille?\' the Gryphon as if he doesn\'t begin.\' But she did not like the look of things at all, at all!\' \'Do as I do,\' said Alice indignantly.\"}', 8, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(18, '{\"en\":\"Laboriosam aperiam vel ratione dicta. Optio libero officiis eos omnis officiis provident omnis.\"}', '{\"en\":\"There was certainly English. \'I don\'t think--\' \'Then you should say \\\"With what porpoise?\\\"\' \'Don\'t you mean by that?\' said the Queen, pointing to Alice for protection. \'You shan\'t be beheaded!\' said.\"}', 1, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(19, '{\"en\":\"Aspernatur sapiente et eaque explicabo dolorem. Quo provident id quia sapiente laborum animi.\"}', '{\"en\":\"There could be NO mistake about it: it was a paper label, with the clock. For instance, if you wouldn\'t mind,\' said Alice: \'I don\'t know the way YOU manage?\' Alice asked. \'We called him Tortoise.\"}', 9, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(20, '{\"en\":\"Inventore quaerat repudiandae quaerat ad qui reprehenderit. Quidem et maxime dicta qui.\"}', '{\"en\":\"Hatter: \'but you could manage it?) \'And what an ignorant little girl or a watch to take the place where it had no very clear notion how delightful it will be much the most confusing thing I ask!.\"}', 10, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(21, '{\"en\":\"Earum qui numquam aut eligendi dolor. Qui voluptatem iure dolor quis.\"}', '{\"en\":\"Duck and a large dish of tarts upon it: they looked so grave and anxious.) Alice could hardly hear the Rabbit hastily interrupted. \'There\'s a great deal to ME,\' said the Cat, as soon as there seemed.\"}', 2, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(22, '{\"en\":\"Quaerat id et voluptatem quod facilis. Quasi sunt commodi vitae totam voluptatem.\"}', '{\"en\":\"Dormouse fell asleep instantly, and neither of the Lobster Quadrille, that she had accidentally upset the week before. \'Oh, I beg your pardon!\' cried Alice in a bit.\' \'Perhaps it doesn\'t mind.\' The.\"}', 7, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(23, '{\"en\":\"Est nulla dolor consequatur delectus. Ut ipsum alias fuga qui dolores. Facere et sunt debitis ad.\"}', '{\"en\":\"Dormouse indignantly. However, he consented to go after that into a pig,\' Alice quietly said, just as she came upon a neat little house, on the slate. \'Herald, read the accusation!\' said the King.\"}', 8, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(24, '{\"en\":\"Sit quo perferendis ut suscipit est in omnis. Sed sint dignissimos minima rerum odio.\"}', '{\"en\":\"She had not gone (We know it was all very well without--Maybe it\'s always pepper that makes people hot-tempered,\' she went on in the wind, and the pair of white kid gloves, and was going off into a.\"}', 5, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(25, '{\"en\":\"In molestiae amet sequi autem. Ut eligendi deserunt quo fuga natus consectetur occaecati.\"}', '{\"en\":\"Queen merely remarking as it was just in time to see what this bottle was a dead silence instantly, and neither of the Shark, But, when the White Rabbit, trotting slowly back to the Queen, \'and he.\"}', 9, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(26, '{\"en\":\"Quidem sapiente accusantium reiciendis aut. Aliquid architecto iste et placeat asperiores sed.\"}', '{\"en\":\"I should think very likely to eat some of the house till she had found the fan and gloves. \'How queer it seems,\' Alice said nothing; she had not a regular rule: you invented it just grazed his nose.\"}', 9, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(27, '{\"en\":\"Qui delectus asperiores quia magnam. Nulla voluptas nulla numquam quibusdam repellendus facilis.\"}', '{\"en\":\"After a time she went on, \'What HAVE you been doing here?\' \'May it please your Majesty,\' he began. \'You\'re a very small cake, on which the March Hare. \'Then it ought to tell me the list of the well.\"}', 4, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(28, '{\"en\":\"Nemo aspernatur a fugiat nulla voluptatem ducimus voluptatem quidem. Molestiae unde iusto aut ad.\"}', '{\"en\":\"CHAPTER VIII. The Queen\'s argument was, that her neck from being broken. She hastily put down her anger as well be at school at once.\' And in she went. Once more she found herself lying on the.\"}', 9, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(29, '{\"en\":\"Voluptatum sequi earum id sapiente dolores sunt asperiores. Ex quos quo quia.\"}', '{\"en\":\"Gryphon only answered \'Come on!\' and ran the faster, while more and more sounds of broken glass, from which she concluded that it would be QUITE as much as serpents do, you know.\' Alice had got its.\"}', 8, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(30, '{\"en\":\"Sunt vel sunt voluptatem. Eius cumque ratione veniam voluptatum. Quia voluptatem nemo dolorum.\"}', '{\"en\":\"Duchess asked, with another hedgehog, which seemed to her full size by this time, sat down and make THEIR eyes bright and eager with many a strange tale, perhaps even with the words \'EAT ME\' were.\"}', 1, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(31, '{\"en\":\"Temporibus recusandae itaque neque. Iure distinctio hic et sed. Assumenda cumque autem illo.\"}', '{\"en\":\"And yet you incessantly stand on their throne when they met in the last words out loud, and the shrill voice of the Queen jumped up on tiptoe, and peeped over the edge of her sister, who was.\"}', 1, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(32, '{\"en\":\"Iusto non fugit quam ipsam quia architecto. Facere reprehenderit optio quis aut soluta quia.\"}', '{\"en\":\"Five. \'I heard every word you fellows were saying.\' \'Tell us a story!\' said the Mock Turtle a little timidly: \'but it\'s no use in talking to him,\' the Mock Turtle, \'they--you\'ve seen them, of.\"}', 3, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(33, '{\"en\":\"Et est aut iure qui ab. Porro molestias sequi consequatur aut impedit commodi.\"}', '{\"en\":\"Pigeon. \'I\'m NOT a serpent, I tell you!\' But she went nearer to make herself useful, and looking at the sudden change, but very glad that it might be hungry, in which the words \'EAT ME\' were.\"}', 1, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(34, '{\"en\":\"Ut voluptates corrupti sit aliquam et modi ea accusantium. Fugit qui sed in.\"}', '{\"en\":\"It doesn\'t look like it?\' he said. \'Fifteenth,\' said the Caterpillar contemptuously. \'Who are YOU?\' said the Mouse only growled in reply. \'That\'s right!\' shouted the Queen. \'You make me giddy.\' And.\"}', 3, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(35, '{\"en\":\"Ut enim libero culpa. In modi quia alias repellat ut et ut.\"}', '{\"en\":\"CHORUS. (In which the wretched Hatter trembled so, that he had a VERY turn-up nose, much more like a tunnel for some minutes. The Caterpillar and Alice joined the procession, wondering very much of.\"}', 7, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(36, '{\"en\":\"Quos voluptatem laudantium eius qui consectetur quia. Itaque esse quia accusamus.\"}', '{\"en\":\"Dinah: I think I may as well as I used--and I don\'t keep the same thing a bit!\' said the youth, \'one would hardly suppose That your eye was as steady as ever; Yet you turned a back-somersault in at.\"}', 4, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(37, '{\"en\":\"Optio libero qui et. Dicta consequatur ullam qui ipsum. Tenetur repellendus cum ut qui.\"}', '{\"en\":\"Alice looked all round the hall, but they were all turning into little cakes as they would call after her: the last concert!\' on which the cook tulip-roots instead of onions.\' Seven flung down his.\"}', 2, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(38, '{\"en\":\"Aut architecto quia eaque nemo. Eius eos blanditiis a expedita nihil ex vitae temporibus.\"}', '{\"en\":\"Mock Turtle replied, counting off the top of it. Presently the Rabbit say to itself \'Then I\'ll go round a deal too flustered to tell you--all I know all the time he had a vague sort of present!\'.\"}', 8, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(39, '{\"en\":\"Ut vitae quod nobis repellendus ullam. Facere beatae provident ea illum quia itaque et.\"}', '{\"en\":\"Alice went on, taking first one side and then another confusion of voices--\'Hold up his head--Brandy now--Don\'t choke him--How was it, old fellow? What happened to you? Tell us all about as she was.\"}', 9, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(40, '{\"en\":\"Aut consectetur vel autem consequatur facere velit officia. Consequatur ipsum et maxime nulla et.\"}', '{\"en\":\"Queen ordering off her knowledge, as there was a general chorus of \'There goes Bill!\' then the Rabbit\'s voice along--\'Catch him, you by the way, and the beak-- Pray how did you manage to do it?\' \'In.\"}', 10, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(41, '{\"en\":\"Porro ut qui mollitia neque voluptatem. Qui corporis iure excepturi quia.\"}', '{\"en\":\"I must, I must,\' the King had said that day. \'No, no!\' said the last words out loud, and the second verse of the leaves: \'I should have croqueted the Queen\'s absence, and were resting in the.\"}', 3, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(42, '{\"en\":\"Et est minus ipsa voluptatem. Accusantium itaque totam fugiat quam autem.\"}', '{\"en\":\"Caterpillar took the hookah out of sight before the trial\'s begun.\' \'They\'re putting down their names,\' the Gryphon repeated impatiently: \'it begins \\\"I passed by his face only, she would have called.\"}', 5, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(43, '{\"en\":\"Libero quaerat ea autem. Eos voluptate nemo quia consequatur cupiditate quidem laudantium quos.\"}', '{\"en\":\"The question is, what did the Dormouse began in a whisper, half afraid that it was very deep, or she fell past it. \'Well!\' thought Alice \'without pictures or conversations?\' So she set the little.\"}', 6, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(44, '{\"en\":\"Dolorem magnam dolor mollitia voluptas est nihil quae. Et qui quasi corrupti itaque.\"}', '{\"en\":\"The Gryphon sat up and said, \'It WAS a narrow escape!\' said Alice, who was gently brushing away some dead leaves that had made the whole party swam to the Caterpillar, just as usual. \'Come, there\'s.\"}', 1, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(45, '{\"en\":\"Vero occaecati rerum aspernatur. Non mollitia fugit sed ea.\"}', '{\"en\":\"Duchess, \'as pigs have to beat time when she noticed that the Gryphon as if she meant to take the hint; but the great puzzle!\' And she thought of herself, \'I wonder what you\'re doing!\' cried Alice.\"}', 10, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(46, '{\"en\":\"Vel reiciendis saepe quod voluptas. Et recusandae voluptate beatae quae animi molestiae.\"}', '{\"en\":\"The chief difficulty Alice found at first she thought it over a little three-legged table, all made a rush at the jury-box, and saw that, in her haste, she had gone through that day. \'No, no!\' said.\"}', 2, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(47, '{\"en\":\"Ipsam molestiae nobis enim ut neque. Maxime dolore quia fugiat voluptas.\"}', '{\"en\":\"Mock Turtle is.\' \'It\'s the first figure,\' said the Queen, who had been jumping about like that!\' said Alice sadly. \'Hand it over here,\' said the Dormouse shook its head impatiently, and said.\"}', 10, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(48, '{\"en\":\"Dolorum repellat amet quia. Necessitatibus et beatae odio ratione omnis consequuntur.\"}', '{\"en\":\"Alice to herself, as usual. \'Come, there\'s no name signed at the flowers and the game began. Alice thought to herself, for this time it all is! I\'ll try if I fell off the mushroom, and her face.\"}', 7, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(49, '{\"en\":\"Animi accusamus sit neque ex mollitia sed. Laudantium voluptas est doloribus atque.\"}', '{\"en\":\"Alice remarked. \'Oh, you foolish Alice!\' she answered herself. \'How can you learn lessons in here? Why, there\'s hardly room to open her mouth; but she had got to the table to measure herself by it.\"}', 5, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(50, '{\"en\":\"Adipisci ipsam odio et. Pariatur officiis autem maxime corporis impedit velit velit ex.\"}', '{\"en\":\"This did not like to go and take it away!\' There was no label this time she found herself at last she stretched her arms folded, frowning like a telescope! I think I may as well as she could not.\"}', 1, '2023-05-28 01:08:15', '2023-05-28 01:08:15');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `salon_id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` longtext NOT NULL,
  `account_number` longtext NOT NULL,
  `IBAN` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `salon_id`, `bank_name`, `account_number`, `IBAN`, `created_at`, `updated_at`) VALUES
(1, 1, 'sdfghjacfghc', 'fghjlcvhvasdbjcn', 'asgfcjhacacvbanc', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` longtext NOT NULL,
  `title` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boards`
--

INSERT INTO `boards` (`id`, `image`, `title`, `created_at`, `updated_at`) VALUES
(1, 'uploads/board/razorpay.png', 'a7a', NULL, NULL),
(2, 'uploads/board/razorpay1.png', 'a7a1', NULL, NULL),
(3, 'uploads/board/razorpay2.png', 'a7a2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `salon` longtext NOT NULL,
  `e_services` longtext NOT NULL,
  `options` longtext DEFAULT NULL,
  `quantity` smallint(6) DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `booking_status_id` int(10) UNSIGNED DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `coupon` longtext DEFAULT NULL,
  `taxes` longtext DEFAULT NULL,
  `booking_at` datetime DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `hint` text DEFAULT NULL,
  `cancel` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `salon`, `e_services`, `options`, `quantity`, `user_id`, `employee_id`, `booking_status_id`, `address`, `payment_id`, `coupon`, `taxes`, `booking_at`, `start_at`, `ends_at`, `hint`, `cancel`, `created_at`, `updated_at`) VALUES
(1, '1', '', NULL, 1, 3, 1, 7, NULL, NULL, NULL, NULL, '2023-06-08 14:56:30', '2023-06-26 14:56:30', '2023-06-27 14:56:30', NULL, NULL, NULL, '2023-06-10 08:37:07');

-- --------------------------------------------------------

--
-- Table structure for table `booking_statuses`
--

CREATE TABLE `booking_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` longtext DEFAULT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_statuses`
--

INSERT INTO `booking_statuses` (`id`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Received', 1, '2021-01-26 02:25:46', '2021-01-30 00:56:35'),
(2, 'In Progress', 40, '2021-01-26 02:26:02', '2021-02-17 04:56:52'),
(3, 'On the Way', 20, '2021-01-28 14:47:23', '2021-02-16 19:10:13'),
(4, 'Accepted', 10, '2021-02-16 19:09:29', '2021-02-16 19:10:06'),
(5, 'Ready', 30, '2021-02-16 19:11:50', '2021-02-17 04:56:42'),
(6, 'Done', 50, '2021-02-17 04:57:02', '2021-02-17 04:57:02'),
(7, 'Failed', 60, '2021-02-17 04:58:36', '2021-02-17 04:58:36');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `color` varchar(36) NOT NULL,
  `description` longtext DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  `featured` tinyint(1) DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `color`, `description`, `order`, `featured`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Hair', '#ff9f43', '<p>Categories for all hair services</p>', 1, 1, NULL, '2021-01-20 00:01:35', '2021-01-31 21:19:56'),
(2, 'Nail', '#0abde3', '<p>Categories for all Medical Services<br></p>', 2, 1, NULL, '2021-01-20 01:05:00', '2021-01-31 20:35:11'),
(3, 'Skin', '#ee5253', '<p>Category for all Laundry Service</p>', 3, 1, NULL, '2021-01-31 20:37:04', '2021-02-02 07:33:10'),
(4, 'Eyebrows', '#10ac84', '<p>Category for Eyebrows</p>', 4, 0, NULL, '2021-01-31 20:38:37', '2021-02-23 21:37:09'),
(5, 'Massage', '#5f27cd', '<p>Category for Massage</p>', 5, 0, NULL, '2021-01-31 20:42:02', '2021-01-31 20:42:02'),
(6, 'Makeup', '#ff9f43', '<p>Category for Makeup</p>', 6, 0, NULL, '2021-01-31 20:43:20', '2021-01-31 21:55:51'),
(7, 'Spa', '#5f27cd', '<p>Category for Spa<br></p>', 1, 0, 5, '2021-01-31 21:46:15', '2021-01-31 21:46:30'),
(8, 'Braid', '#5f27cd', '<p>Category for Braid<br></p>', 2, 0, 5, '2021-01-31 21:47:23', '2021-01-31 21:47:23'),
(9, 'Tattoo', '#5f27cd', '<p>Category for Tattoo<br></p>', 1, 0, 1, '2021-01-31 21:49:40', '2021-01-31 21:49:40'),
(10, 'Aesthetic Medicine', '#5f27cd', '<p>Category for Aesthetic Medicine<br></p>', 1, 0, 1, '2021-01-31 21:49:40', '2021-01-31 21:49:40'),
(11, 'Piercing', '#5f27cd', '<p>Category for Piercing<br></p>', 1, 0, 1, '2021-01-31 21:49:40', '2021-01-31 21:49:40'),
(12, 'Holistic Medicine', '#5f27cd', '<p>Category for Holistic Medicine<br></p>', 1, 0, 1, '2021-01-31 21:49:40', '2021-01-31 21:49:40');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) NOT NULL DEFAULT 'percent',
  `description` longtext DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `symbol` longtext DEFAULT NULL,
  `code` longtext DEFAULT NULL,
  `decimal_digits` tinyint(3) UNSIGNED DEFAULT NULL,
  `rounding` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `decimal_digits`, `rounding`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', '$', 'USD', 2, 0, '2020-10-22 22:50:48', '2020-10-22 22:50:48'),
(2, 'Euro', '€', 'EUR', 2, 0, '2020-10-22 22:51:39', '2020-10-22 22:51:39'),
(3, 'Indian Rupee', 'টকা', 'INR', 2, 0, '2020-10-22 22:52:50', '2020-10-22 22:52:50'),
(4, 'Indonesian Rupiah', 'Rp', 'IDR', 0, 0, '2020-10-22 22:53:22', '2020-10-22 22:53:22'),
(5, 'Brazilian Real', 'R$', 'BRL', 2, 0, '2020-10-22 22:54:00', '2020-10-22 22:54:00'),
(6, 'Cambodian Riel', '៛', 'KHR', 2, 0, '2020-10-22 22:55:51', '2020-10-22 22:55:51'),
(7, 'Vietnamese Dong', '₫', 'VND', 0, 0, '2020-10-22 22:56:26', '2020-10-22 22:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(127) NOT NULL,
  `type` varchar(56) NOT NULL,
  `values` varchar(191) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `in_table` tinyint(1) DEFAULT NULL,
  `bootstrap_column` tinyint(4) DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `custom_field_model` varchar(127) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `name`, `type`, `values`, `disabled`, `required`, `in_table`, `bootstrap_column`, `order`, `custom_field_model`, `created_at`, `updated_at`) VALUES
(5, 'bio', 'textarea', NULL, 0, 0, 0, 6, 1, 'App\\Models\\User', '2019-09-07 04:43:58', '2019-09-07 04:43:58'),
(6, 'address', 'text', NULL, 0, 0, 0, 6, 3, 'App\\Models\\User', '2019-09-07 04:49:22', '2019-09-07 04:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` longtext DEFAULT NULL,
  `view` longtext DEFAULT NULL,
  `custom_field_id` int(10) UNSIGNED NOT NULL,
  `customizable_type` varchar(127) NOT NULL,
  `customizable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_field_values`
--

INSERT INTO `custom_field_values` (`id`, `value`, `view`, `custom_field_id`, `customizable_type`, `customizable_id`, `created_at`, `updated_at`) VALUES
(30, 'Explicabo. Eum provi.&nbsp;', 'Explicabo. Eum provi.&nbsp;', 5, 'App\\Models\\User', 2, '2019-09-07 04:52:30', '2021-02-02 18:32:57'),
(31, 'Modi est libero qui', 'Modi est libero qui', 6, 'App\\Models\\User', 2, '2019-09-07 04:52:30', '2021-02-02 18:32:57'),
(33, 'Consequatur error ip.&nbsp;', 'Consequatur error ip.&nbsp;', 5, 'App\\Models\\User', 1, '2019-09-07 04:53:58', '2021-02-02 18:32:01'),
(34, 'Qui vero ratione vel', 'Qui vero ratione vel', 6, 'App\\Models\\User', 1, '2019-09-07 04:53:58', '2021-02-02 18:32:01'),
(36, 'Dolor optio, error e', 'Dolor optio, error e', 5, 'App\\Models\\User', 3, '2019-10-16 00:21:32', '2021-02-02 18:33:23'),
(37, 'Voluptatibus ad ipsu', 'Voluptatibus ad ipsu', 6, 'App\\Models\\User', 3, '2019-10-16 00:21:32', '2021-02-02 18:33:23'),
(39, 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 5, 'App\\Models\\User', 4, '2019-10-17 02:31:46', '2019-10-17 02:31:46'),
(40, 'Sequi molestiae ipsa1', 'Sequi molestiae ipsa1', 6, 'App\\Models\\User', 4, '2019-10-17 02:31:46', '2021-02-22 06:32:10'),
(42, 'Omnis fugiat et cons.', 'Omnis fugiat et cons.', 5, 'App\\Models\\User', 5, '2019-12-16 01:49:44', '2021-02-02 18:29:47'),
(43, 'Consequatur delenit', 'Consequatur delenit', 6, 'App\\Models\\User', 5, '2019-12-16 01:49:44', '2021-02-02 18:29:47'),
(45, '<p>Short bio for this driver</p>', 'Short bio for this driver', 5, 'App\\Models\\User', 6, '2020-03-30 00:28:05', '2020-03-30 00:28:05'),
(46, '4722 Villa Drive', '4722 Villa Drive', 6, 'App\\Models\\User', 6, '2020-03-30 00:28:05', '2020-03-30 00:28:05'),
(48, 'Voluptatem. Omnis op.', 'Voluptatem. Omnis op.', 5, 'App\\Models\\User', 7, '2021-01-17 23:13:24', '2021-02-02 18:31:36'),
(49, 'Perspiciatis aut ei', 'Perspiciatis aut ei', 6, 'App\\Models\\User', 7, '2021-01-17 23:13:24', '2021-02-02 18:31:36'),
(51, 'sdfsdf56', 'sdfsdf56', 5, 'App\\Models\\User', 8, '2021-02-10 18:31:12', '2021-02-19 21:09:37'),
(52, 'Adressttt', 'Adressttt', 6, 'App\\Models\\User', 8, '2021-02-10 18:31:12', '2021-02-19 20:57:27');

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages`
--

CREATE TABLE `custom_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` longtext DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `published` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages`
--

INSERT INTO `custom_pages` (`id`, `title`, `content`, `published`, `created_at`, `updated_at`) VALUES
(1, 'Privacy Policy', '<h1>Privacy Policy of SmarterVision</h1>\n<p>SmarterVision operates the SmarterVision website, which provides the SERVICE.</p>\n<p>This page is used to inform website visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service, the smartersvision.com website.</p>\n<p>If you choose to use our Service, then you agree to the collection and use of information in relation with this policy. The Personal Information that we collect are used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.</p>\n<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at smartersvision.com, unless otherwise defined in this Privacy Policy.</p>\n<h2>Information Collection and Use</h2>\n<p>For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to your name, phone number, and postal address. The information that we collect will be used to contact or identify you.</p>\n<h2>Log Data</h2>\n<p>We want to inform you that whenever you visit our Service, we collect information that your browser sends to us which is called Log Data. This Log Data may include information such as your computer\'s Internet Protocol (“IP”) address, browser version, pages of our Service that you visit, the time and date of your visit, the time spent on those pages, and other statistics.</p>\n<h2>Cookies</h2>\n<p>Cookies are files with small amount of data that is commonly used an anonymous unique identifier. These are sent to your browser from the website that you visit and are stored on your computer\'s hard drive.</p>\n<p>Our website uses these “cookies” to collection information and to improve our Service. You have the option to either accept or refuse these cookies, and know when a cookie is being sent to your computer. If you choose to refuse our cookies, you may not be able to use some portions of our Service.</p>\n<h2>Service Providers</h2>\n<p>We may employ third-party companies and individuals due to the following reasons:</p>\n<ul>\n<li>To facilitate our Service;</li>\n<li>To provide the Service on our behalf;</li>\n<li>To perform Service-related services; or</li>\n<li>To assist us in analyzing how our Service is used.</li>\n</ul>\n<p>We want to inform our Service users that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>\n<h2>Security</h2>\n<p>We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.</p>\n<h2>Links to Other Sites</h2>\n<p>Our Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over, and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>\n<h2>Children\'s Privacy</h2>\n<p>Our Services do not address anyone under the age of 13. We do not knowingly collect personal identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.</p>\n<h2>Changes to This Privacy Policy</h2>\n<p>We may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately, after they are posted on this page.</p>\n<h2>Contact Us</h2>\n<p>If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.</p>', 1, '2021-02-24 18:53:21', '2021-02-24 20:19:19'),
(2, 'Terms & Conditions', '<h2>Terms &amp; Conditions</h2><p>Dolor consequat. Ex ducimus, dolores fugiat ipsam sunt non a dolor quidem nulla ullamco Nam labore nostrum sit amet, tenetur ut consequatur? Non aut incididunt consequatur, rem veniam, veritatis molestiae neque non veniam, nemo facilis eligendi qui aut enim aperiam rerum fugiat, dolorum qui id, in sint et assumenda mollitia dignissimos illum, ipsum maiores asperiores exercitationem odio labore laboris consequatur? Consequatur, sapiente ipsum, laboriosam, laudantium, dolor sed autem eligendi ea a.</p><p>Dolor consequat. Ex ducimus, dolores fugiat ipsam sunt non a dolor quidem nulla ullamco Nam labore nostrum sit amet, tenetur ut consequatur? Non aut incididunt consequatur, rem veniam, veritatis molestiae neque non veniam, nemo facilis eligendi qui aut enim aperiam rerum fugiat, dolorum qui id, in sint et assumenda mollitia dignissimos illum, ipsum maiores asperiores exercitationem odio labore laboris consequatur? Consequatur, sapiente ipsum, laboriosam, laudantium, dolor sed autem eligendi ea a.<br></p>', 1, '2021-02-24 20:20:06', '2021-02-24 20:23:52');

-- --------------------------------------------------------

--
-- Table structure for table `discountables`
--

CREATE TABLE `discountables` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `discountable_type` varchar(127) NOT NULL,
  `discountable_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `id` int(10) UNSIGNED NOT NULL,
  `salon_id` int(10) UNSIGNED DEFAULT NULL,
  `total_bookings` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_earning` double(10,2) NOT NULL DEFAULT 0.00,
  `admin_earning` double(10,2) NOT NULL DEFAULT 0.00,
  `salon_earning` double(10,2) NOT NULL DEFAULT 0.00,
  `taxes` double(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

CREATE TABLE `experiences` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `salon_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `experiences`
--

INSERT INTO `experiences` (`id`, `title`, `description`, `salon_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Fugiat doloribus deleniti labore quisquam et. Dolor incidunt dolore mollitia ea eum quis.\"}', '{\"en\":\"Hatter. Alice felt dreadfully puzzled. The Hatter\'s remark seemed to listen, the whole party at once without waiting for the immediate adoption of more broken glass.) \'Now tell me, Pat, what\'s that.\"}', 4, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(2, '{\"en\":\"Sequi officia tempore aut ipsum omnis. Debitis est natus hic. Possimus dicta cumque error perferendis cum porro.\"}', '{\"en\":\"Gryphon in an angry tone, \'Why, Mary Ann, what ARE you doing out here? Run home this moment, and fetch me a pair of white kid gloves, and she ran with all speed back to finish his story. CHAPTER IV.\"}', 5, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(3, '{\"en\":\"Sint earum blanditiis et consequuntur ut commodi. Et omnis id quos omnis quia magnam quasi.\"}', '{\"en\":\"I can\'t remember,\' said the Cat. \'I\'d nearly forgotten to ask.\' \'It turned into a pig, and she went slowly after it: \'I never could abide figures!\' And with that she wasn\'t a really good school,\'.\"}', 3, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(4, '{\"en\":\"Qui optio a voluptates non eos velit cupiditate. Magni ab deleniti accusamus dolorem. Consequatur rerum et unde aut.\"}', '{\"en\":\"Seven flung down his cheeks, he went on, \'you throw the--\' \'The lobsters!\' shouted the Queen. \'Can you play croquet with the other: the Duchess sang the second time round, she came upon a neat.\"}', 8, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(5, '{\"en\":\"Illo corrupti dicta quidem. Mollitia explicabo quos labore nam nisi ut culpa debitis. Ut corrupti fuga eius saepe aut.\"}', '{\"en\":\"Alice! when she was quite surprised to see a little recovered from the sky! Ugh, Serpent!\' \'But I\'m NOT a serpent!\' said Alice more boldly: \'you know you\'re growing too.\' \'Yes, but some crumbs must.\"}', 3, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(6, '{\"en\":\"Voluptatum et tempore et quis. Consectetur reprehenderit aut mollitia. Voluptates ut voluptatibus aut quidem.\"}', '{\"en\":\"Alice very meekly: \'I\'m growing.\' \'You\'ve no right to think,\' said Alice to herself. \'Shy, they seem to dry me at all.\' \'In that case,\' said the King. \'When did you manage to do it! Oh dear! I shall.\"}', 5, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(7, '{\"en\":\"Quam doloremque corrupti maxime quia eveniet dicta. Ut aspernatur voluptate atque sed. Ea quod cumque nihil velit.\"}', '{\"en\":\"Alice, quite forgetting that she had looked under it, and found quite a new pair of gloves and the pair of gloves and a long sleep you\'ve had!\' \'Oh, I\'ve had such a hurry that she was terribly.\"}', 7, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(8, '{\"en\":\"Id eum totam non illum. Earum ut voluptas ipsam dolor quo quia quia. Minima id consectetur perspiciatis.\"}', '{\"en\":\"Queen, but she gained courage as she could get to the cur, \\\"Such a trial, dear Sir, With no jury or judge, would be worth the trouble of getting up and ran off, thinking while she remembered how.\"}', 9, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(9, '{\"en\":\"Delectus minus ullam neque unde. Et voluptas ut officiis odit nostrum eum. Architecto maiores laboriosam voluptatum in.\"}', '{\"en\":\"I can kick a little!\' She drew her foot slipped, and in another moment, splash! she was peering about anxiously among the people near the door began sneezing all at once. The Dormouse shook itself.\"}', 8, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(10, '{\"en\":\"Nobis odio molestiae incidunt nisi. Eveniet dignissimos et natus. Ut asperiores vel et harum id rerum consequatur.\"}', '{\"en\":\"March Hare said in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an unusually large saucepan flew close by it, and yet it was all dark overhead; before her was another long passage, and.\"}', 4, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(11, '{\"en\":\"Ad et amet incidunt et. Consequatur ad iusto omnis. Id eveniet iusto ea nulla facilis aspernatur.\"}', '{\"en\":\"Alice, \'it\'ll never do to ask: perhaps I shall fall right THROUGH the earth! How funny it\'ll seem, sending presents to one\'s own feet! And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ.\"}', 10, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(12, '{\"en\":\"Nemo eos ut ex ipsa dignissimos. Odit corporis error animi ut vitae atque. Aut architecto molestias quam assumenda occaecati.\"}', '{\"en\":\"When the pie was all about, and called out as loud as she was playing against herself, for this curious child was very uncomfortable, and, as she could, for the next moment she appeared; but she did.\"}', 10, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(13, '{\"en\":\"Molestias harum maiores ea eligendi. Qui magnam sed est culpa. Sit veniam quisquam dolor aspernatur.\"}', '{\"en\":\"Alice quietly said, just as if nothing had happened. \'How am I then? Tell me that first, and then she heard the King and the words \'DRINK ME,\' but nevertheless she uncorked it and put it in time,\'.\"}', 7, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(14, '{\"en\":\"Aliquid aliquam qui et. Commodi ut ex ut suscipit. Ut repellendus et est dolore aut nesciunt.\"}', '{\"en\":\"VERY long claws and a Canary called out \'The race is over!\' and they repeated their arguments to her, one on each side to guard him; and near the right way to fly up into the air. Even the Duchess.\"}', 6, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(15, '{\"en\":\"Tempore sunt ut cum laboriosam excepturi a officiis. Amet quia assumenda architecto. Voluptatibus nostrum possimus sed.\"}', '{\"en\":\"Gryphon answered, very nearly in the newspapers, at the bottom of a candle is blown out, for she was up to them to be seen: she found to be lost, as she fell past it. \'Well!\' thought Alice to.\"}', 2, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(16, '{\"en\":\"Sequi nisi quidem qui cumque. Non quam quod ut voluptates debitis. Voluptas sit provident omnis dolor.\"}', '{\"en\":\"As she said to Alice; and Alice was very deep, or she should meet the real Mary Ann, and be turned out of their wits!\' So she called softly after it, \'Mouse dear! Do come back with the name \'Alice!\'.\"}', 8, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(17, '{\"en\":\"Vel culpa quo quos perferendis omnis assumenda ratione. Eum est impedit ducimus praesentium non omnis ab.\"}', '{\"en\":\"Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of this ointment--one shilling the box-- Allow me to introduce it.\' \'I don\'t believe it,\' said Alice. \'You must be,\' said the Rabbit.\"}', 6, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(18, '{\"en\":\"Est eaque sunt quia est. Et illum iure et rerum tenetur aut. Aliquid quia tempora molestiae quis et quas voluptatem.\"}', '{\"en\":\"The poor little thing sat down again very sadly and quietly, and looked into its mouth open, gazing up into the garden with one eye, How the Owl had the door and found herself in Wonderland, though.\"}', 4, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(19, '{\"en\":\"Aut magnam mollitia sed nisi. Voluptatem odio expedita adipisci.\"}', '{\"en\":\"For really this morning I\'ve nothing to do: once or twice she had felt quite unhappy at the bottom of a well?\' \'Take some more tea,\' the Hatter went on, looking anxiously round to see if he doesn\'t.\"}', 10, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(20, '{\"en\":\"Ducimus neque qui quae temporibus. Doloribus laboriosam quidem omnis deleniti qui debitis. Ab optio ut quaerat.\"}', '{\"en\":\"Mouse to tell you--all I know is, it would all wash off in the other. In the very tones of her childhood: and how she was looking down at once, and ran till she fancied she heard her voice close to.\"}', 3, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(21, '{\"en\":\"Rerum ut perferendis omnis accusantium qui reprehenderit. Sunt quae modi voluptatum. Cumque quis nisi atque voluptatem.\"}', '{\"en\":\"This of course, I meant,\' the King said, with a kind of sob, \'I\'ve tried the roots of trees, and I\'ve tried hedges,\' the Pigeon had finished. \'As if I can listen all day about it!\' Last came a.\"}', 4, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(22, '{\"en\":\"Quasi consequatur voluptas culpa reprehenderit eius. Assumenda eum est accusantium. Nulla enim sapiente autem dolor.\"}', '{\"en\":\"THIS size: why, I should think very likely true.) Down, down, down. There was no use speaking to it,\' she said to herself \'That\'s quite enough--I hope I shan\'t go, at any rate a book written about.\"}', 2, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(23, '{\"en\":\"Ullam est ab sed sunt blanditiis aut. Illum ipsum porro aut sunt adipisci. Repellendus unde suscipit magni ipsa.\"}', '{\"en\":\"Alice. \'Then you may nurse it a violent blow underneath her chin: it had no reason to be otherwise.\\\"\' \'I think you could draw treacle out of a muchness?\' \'Really, now you ask me,\' said Alice, who.\"}', 6, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(24, '{\"en\":\"Necessitatibus ducimus labore distinctio placeat. Similique eaque eos dolorem pariatur ut quia. Placeat cumque est dicta vel.\"}', '{\"en\":\"Gryphon is, look at a king,\' said Alice. \'Well, I should frighten them out with trying, the poor little thing grunted in reply (it had left off staring at the corners: next the ten courtiers; these.\"}', 4, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(25, '{\"en\":\"Quae sunt error impedit qui minus. Laborum eum perspiciatis consectetur sequi itaque omnis et. Vero pariatur ex tempore.\"}', '{\"en\":\"These were the two creatures, who had not noticed before, and he poured a little door was shut again, and we put a white one in by mistake; and if the Mock Turtle said: \'I\'m too stiff. And the moral.\"}', 7, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(26, '{\"en\":\"Quisquam qui aut voluptatum non nulla neque. Delectus omnis corporis doloremque excepturi.\"}', '{\"en\":\"MARMALADE\', but to her feet, they seemed to think to herself, \'the way all the rest, Between yourself and me.\' \'That\'s the reason so many different sizes in a sulky tone, as it was in the wood,\'.\"}', 7, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(27, '{\"en\":\"Ex quisquam at et itaque. Itaque placeat deleniti suscipit aut voluptatem.\"}', '{\"en\":\"Alice hastily replied; \'at least--at least I mean what I see\\\"!\' \'You might just as she could. The next thing is, to get very tired of being upset, and their slates and pencils had been for some time.\"}', 8, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(28, '{\"en\":\"Odio repudiandae illo dolor. Odit autem laudantium sunt mollitia et sit.\"}', '{\"en\":\"I goes like a serpent. She had quite forgotten the Duchess said in a low voice, \'Your Majesty must cross-examine THIS witness.\' \'Well, if I was, I shouldn\'t want YOURS: I don\'t want to see that the.\"}', 4, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(29, '{\"en\":\"Temporibus et animi non tempora est est dolor. Earum animi rem aut iure accusamus. Mollitia impedit ea eum cum at fugiat.\"}', '{\"en\":\"I\'ll eat it,\' said the King said to the Duchess: \'and the moral of that is--\\\"Be what you mean,\' said Alice. \'I mean what I say--that\'s the same height as herself; and when she had looked under it.\"}', 6, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(30, '{\"en\":\"Quos eum eveniet ipsam soluta aut voluptate. Cupiditate aut voluptate rerum rem quaerat voluptas.\"}', '{\"en\":\"March Hare. Alice was so long that they couldn\'t see it?\' So she began thinking over all the other arm curled round her once more, while the Dodo suddenly called out to sea!\\\" But the insolence of.\"}', 9, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(31, '{\"en\":\"Soluta similique quos id id ea. Nulla expedita molestiae voluptatem sint voluptates. Fugiat ut fuga qui quia exercitationem.\"}', '{\"en\":\"For anything tougher than suet; Yet you balanced an eel on the stairs. Alice knew it was the BEST butter,\' the March Hare. \'Then it wasn\'t very civil of you to get through the doorway; \'and even if.\"}', 10, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(32, '{\"en\":\"Incidunt numquam perferendis ullam reprehenderit. Numquam nam officiis unde incidunt. Molestiae molestias suscipit rerum.\"}', '{\"en\":\"There was no more of it altogether; but after a pause: \'the reason is, that there\'s any one of the earth. Let me think: was I the same size: to be a person of authority among them, called out.\"}', 8, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(33, '{\"en\":\"Quas eaque ratione ullam dolor et id earum. Eos id et debitis doloremque. Dolores at corrupti qui ipsum numquam molestiae ea.\"}', '{\"en\":\"Gryphon as if a dish or kettle had been all the jurymen are back in a melancholy tone: \'it doesn\'t seem to see what would happen next. The first thing I\'ve got to go down the middle, being held up.\"}', 10, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(34, '{\"en\":\"Perspiciatis nam consequuntur earum repellat tempora. Quaerat earum beatae odit.\"}', '{\"en\":\"There was no one could possibly hear you.\' And certainly there was no label this time the Mouse in the sun. (IF you don\'t know what they\'re like.\' \'I believe so,\' Alice replied in an offended tone.\"}', 9, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(35, '{\"en\":\"Voluptatem distinctio deleniti ea est. Impedit voluptates est est eum. Nesciunt ex rerum accusantium quisquam voluptates aut.\"}', '{\"en\":\"I was, I shouldn\'t like THAT!\' \'Oh, you foolish Alice!\' she answered herself. \'How can you learn lessons in the morning, just time to go, for the rest of my life.\' \'You are not the same, the next.\"}', 3, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(36, '{\"en\":\"Provident sed ut ut ut. Dolores cum explicabo deserunt doloremque quidem consectetur deleniti.\"}', '{\"en\":\"For this must ever be A secret, kept from all the things between whiles.\' \'Then you keep moving round, I suppose?\' said Alice. \'Come, let\'s try Geography. London is the reason and all must have a.\"}', 1, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(37, '{\"en\":\"Dolore esse nobis commodi accusamus tempora. Cumque ab non optio deserunt modi provident.\"}', '{\"en\":\"I didn\'t know that cats COULD grin.\' \'They all can,\' said the King: \'leave out that it might end, you know,\' the Hatter was out of its right ear and left off sneezing by this time, as it went, as if.\"}', 2, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(38, '{\"en\":\"Saepe rerum excepturi quia sunt rem nam hic. Maxime sed autem temporibus rerum.\"}', '{\"en\":\"And he added looking angrily at the stick, and held it out again, so violently, that she wanted much to know, but the Mouse with an air of great curiosity. \'Soles and eels, of course,\' said the.\"}', 3, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(39, '{\"en\":\"Sint omnis sit magnam non atque rerum. Error perspiciatis vel velit quaerat quasi est. Qui iste aut sint eum quia.\"}', '{\"en\":\"Hatter trembled so, that Alice quite jumped; but she could see, as they came nearer, Alice could not be denied, so she turned away. \'Come back!\' the Caterpillar took the hookah into its eyes were.\"}', 9, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(40, '{\"en\":\"Libero qui at ea provident. At dicta dolores voluptas modi quae. Voluptatem ipsum rerum et eos fugiat.\"}', '{\"en\":\"I do hope it\'ll make me giddy.\' And then, turning to the three were all writing very busily on slates. \'What are they made of?\' Alice asked in a whisper, half afraid that she was quite surprised to.\"}', 9, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(41, '{\"en\":\"Quis est molestias perspiciatis. Debitis vel delectus nesciunt delectus. Et officiis totam maiores itaque.\"}', '{\"en\":\"I think--\' (she was obliged to say \'Drink me,\' but the wise little Alice and all dripping wet, cross, and uncomfortable. The moment Alice appeared, she was now about two feet high: even then she.\"}', 4, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(42, '{\"en\":\"Quae autem dolor id eum esse eos voluptate. Ex eos quia et.\"}', '{\"en\":\"For the Mouse replied rather crossly: \'of course you know I\'m mad?\' said Alice. \'You did,\' said the Knave, \'I didn\'t mean it!\' pleaded poor Alice in a great many teeth, so she went back to the.\"}', 7, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(43, '{\"en\":\"Aut tempora excepturi voluptates. Veritatis illum hic dolorum dolorum. Inventore in omnis qui itaque voluptatem sunt.\"}', '{\"en\":\"I can\'t see you?\' She was moving them about as it turned round and round goes the clock in a minute. Alice began to repeat it, when a sharp hiss made her draw back in their paws. \'And how did you.\"}', 4, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(44, '{\"en\":\"Consequuntur rem laudantium porro dolorem harum quia reiciendis. Quo totam aliquam eligendi architecto odio et.\"}', '{\"en\":\"Knave of Hearts, who only bowed and smiled in reply. \'Idiot!\' said the Hatter; \'so I can\'t get out again. The Mock Turtle sighed deeply, and began, in a tone of the court,\\\" and I could say if I.\"}', 10, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(45, '{\"en\":\"Dolorum dicta illum ut ab quia. Autem nemo eum voluptas eum maxime illo sapiente. Sed recusandae aliquid eaque consequatur.\"}', '{\"en\":\"Alice sadly. \'Hand it over afterwards, it occurred to her very much confused, \'I don\'t think they play at all the rats and--oh dear!\' cried Alice, quite forgetting that she knew that it is!\' As she.\"}', 10, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(46, '{\"en\":\"Et quod nostrum mollitia. Quo eius dicta ex sint quibusdam eius eos. Eveniet ut dolorem quod provident consectetur aut.\"}', '{\"en\":\"Alice panted as she spoke. (The unfortunate little Bill had left off staring at the beginning,\' the King sharply. \'Do you play croquet with the lobsters, out to the King, with an M?\' said Alice.\"}', 3, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(47, '{\"en\":\"Voluptatem in iure quo maxime asperiores iure sequi vitae. Illum soluta eos ut eaque accusantium nulla.\"}', '{\"en\":\"Queen, who was reading the list of singers. \'You may not have lived much under the hedge. In another moment that it led into the teapot. \'At any rate he might answer questions.--How am I then? Tell.\"}', 8, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(48, '{\"en\":\"Et quaerat velit cum omnis nostrum. Sunt veritatis non voluptatem in quia sit omnis. Voluptas vitae ea dignissimos impedit.\"}', '{\"en\":\"MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'Off with her head! Off--\' \'Nonsense!\' said Alice, who felt very curious sensation, which puzzled her very earnestly, \'Now, Dinah, tell.\"}', 3, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(49, '{\"en\":\"Iste asperiores provident aut. Sit accusamus consequatur ut natus. Eum dolorem dolore a id assumenda omnis nulla soluta.\"}', '{\"en\":\"The first witness was the Cat in a low voice, \'Why the fact is, you see, Miss, this here ought to tell them something more. \'You promised to tell me who YOU are, first.\' \'Why?\' said the Gryphon.\"}', 2, '2023-05-28 01:08:16', '2023-05-28 01:08:16'),
(50, '{\"en\":\"Accusamus ab sit ut id molestiae. Illum est quaerat quasi ea. Fugit vel rerum numquam numquam sit.\"}', '{\"en\":\"Let me think: was I the same year for such dainties would not give all else for two Pennyworth only of beautiful Soup? Beau--ootiful Soo--oop! Soo--oop of the house, and found quite a commotion in.\"}', 6, '2023-05-28 01:08:16', '2023-05-28 01:08:16');

-- --------------------------------------------------------

--
-- Table structure for table `e_services`
--

CREATE TABLE `e_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `discount_price` double(10,2) DEFAULT 0.00,
  `duration` varchar(16) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `featured` tinyint(1) DEFAULT 0,
  `enable_booking` tinyint(1) DEFAULT 1,
  `enable_at_customer_address` tinyint(1) DEFAULT 1,
  `enable_at_salon` tinyint(1) DEFAULT 1,
  `available` tinyint(1) DEFAULT 1,
  `salon_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_services`
--

INSERT INTO `e_services` (`id`, `name`, `price`, `discount_price`, `duration`, `description`, `featured`, `enable_booking`, `enable_at_customer_address`, `enable_at_salon`, `available`, `salon_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Wig consultation\"}', 35.77, 0.00, '4:00', '{\"en\":\"Et blanditiis veniam veniam ipsam non consectetur doloremque. Provident laborum autem sed. Maxime magnam et molestiae est necessitatibus et.\"}', 0, 0, 1, 1, 1, 9, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(2, '{\"en\":\"Thai Massage Services\"}', 10.08, 2.58, '4:00', '{\"en\":\"Recusandae praesentium ut placeat exercitationem sunt. Voluptates porro provident perferendis quis.\"}', 0, 0, 1, 1, 1, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(3, '{\"en\":\"Color correction\"}', 44.80, 38.84, '4:00', '{\"en\":\"Dolorem nisi possimus sed laborum repudiandae ipsam aliquid adipisci. Omnis sequi deserunt vel quaerat eos. Voluptatem est aut fugit quos voluptatem.\"}', 0, 1, 1, 1, 1, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(4, '{\"en\":\"Facials Services\"}', 27.03, 24.61, '3:00', '{\"en\":\"Voluptate eos qui a earum vero inventore. Numquam minus soluta dicta officia. Commodi cupiditate temporibus quibusdam inventore.\"}', 0, 1, 1, 1, 0, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(5, '{\"en\":\"Braid down\"}', 41.21, 0.00, '1:00', '{\"en\":\"Enim repellat nemo assumenda enim fugiat ut. Aliquam dolorem possimus vel enim. Repellendus aut blanditiis officiis atque praesentium.\"}', 0, 1, 1, 1, 0, 7, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(6, '{\"en\":\"Wand curls\"}', 41.67, 37.97, '2:00', '{\"en\":\"Accusantium quia facilis dicta est in. Ut et voluptas placeat sapiente. Sed dicta quasi laudantium eos odio perspiciatis.\"}', 0, 1, 1, 1, 1, 4, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(7, '{\"en\":\"Shampoo & deep conditioning Treatment\"}', 44.40, 42.21, '2:00', '{\"en\":\"Architecto et quia officia mollitia blanditiis nesciunt. Soluta molestias possimus minus. Et quasi eveniet voluptatibus sint voluptatem.\"}', 0, 0, 1, 1, 1, 8, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(8, '{\"en\":\"Global Keratin treatment\"}', 27.62, 0.00, '5:00', '{\"en\":\"Omnis recusandae aut consectetur unde repellendus id et qui. Aperiam autem nesciunt enim. Fugit doloremque corrupti expedita sunt dolorum voluptas. Omnis laudantium eos omnis quaerat et est.\"}', 1, 1, 1, 1, 1, 9, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(9, '{\"en\":\"Hair Botox\"}', 14.70, 0.00, '4:00', '{\"en\":\"Quis a architecto vitae amet eius. Occaecati ut facere quia natus ducimus deleniti ut. Sed recusandae consequatur rerum et reprehenderit.\"}', 1, 1, 1, 1, 0, 9, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(10, '{\"en\":\"Massage Services\"}', 49.08, 45.92, '5:00', '{\"en\":\"Numquam veniam eos eum qui. Ratione corrupti porro quidem nisi. Accusamus nam ducimus non dolores perspiciatis dignissimos. Nesciunt impedit et dolor qui dolorem dicta.\"}', 0, 1, 1, 1, 0, 6, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(11, '{\"en\":\"Quick weave\"}', 18.47, 0.00, '1:00', '{\"en\":\"Soluta tempora corporis laborum sequi. Autem repellendus molestiae numquam quo nesciunt. Eligendi ratione veritatis accusantium praesentium.\"}', 0, 1, 1, 1, 1, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(12, '{\"en\":\"Keratin hair treatment\"}', 49.67, 0.00, '2:00', '{\"en\":\"Culpa quaerat exercitationem voluptate aliquid aut voluptate quis. Harum voluptas eveniet et fugiat id quis. Voluptatibus dolor placeat eum nostrum et sed voluptas et. Nihil non ducimus sed autem.\"}', 1, 0, 1, 1, 0, 5, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(13, '{\"en\":\"Massage Services\"}', 44.98, 38.54, '5:00', '{\"en\":\"Quia quos voluptatem perferendis quia. Aut ea et amet corrupti. Consectetur laudantium dolores sint praesentium ut.\"}', 1, 1, 1, 1, 1, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(14, '{\"en\":\"Braid down\"}', 47.81, 0.00, '4:00', '{\"en\":\"Nobis quasi qui dolor nostrum ut necessitatibus quia. Maxime aut aperiam nihil ut velit id ut cum. Voluptatem dolorum et et ut quia sint. Deserunt expedita vitae iure autem. Nisi odio est dolores.\"}', 0, 0, 1, 1, 1, 9, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(15, '{\"en\":\"Color correction\"}', 18.35, 0.00, '4:00', '{\"en\":\"Ipsum labore eius eaque. Doloremque nam eum velit est sunt. Vero consequuntur omnis illum hic qui illo. Vitae aliquid ipsam at quo quis ut. Nam dolores assumenda vero optio.\"}', 0, 1, 1, 1, 0, 8, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(16, '{\"en\":\"Shampoo & deep conditioning Treatment\"}', 28.26, 0.00, '2:00', '{\"en\":\"Quod perspiciatis aut est et veritatis. Dolorum corporis temporibus dolorem dolor tenetur recusandae dolores. Inventore rerum eum quia iure.\"}', 0, 0, 1, 1, 1, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(17, '{\"en\":\"Foot reflexology\"}', 37.70, 0.00, '1:00', '{\"en\":\"Illum sunt rerum veniam velit. Soluta officiis accusantium esse explicabo id quidem nihil. Ab architecto neque qui tempore eveniet est vel. Veniam molestiae voluptas quo aut.\"}', 1, 1, 1, 1, 0, 8, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(18, '{\"en\":\"Wig consultation\"}', 20.27, 13.15, '3:00', '{\"en\":\"Deserunt nisi et et quod error laboriosam ad. Enim eveniet doloremque voluptatem voluptas. Eos expedita explicabo sit possimus mollitia quis officiis. Labore voluptas velit voluptas iusto nulla quos.\"}', 1, 1, 1, 1, 0, 8, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(19, '{\"en\":\"Body rub with hot stone\"}', 32.99, 28.89, '4:00', '{\"en\":\"Ratione mollitia qui veritatis impedit. Sit ipsum distinctio corrupti molestiae cumque ea. Vero ut ipsum id commodi praesentium.\"}', 0, 0, 1, 1, 0, 8, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(20, '{\"en\":\"Health trim\"}', 34.27, 32.91, '4:00', '{\"en\":\"Dignissimos et amet nihil aut culpa. Ut aut illum suscipit nobis autem ea quo. Accusamus similique animi reiciendis sint error dolorem iusto facere. Rerum laboriosam maiores est ut delectus fugiat.\"}', 0, 0, 1, 1, 0, 5, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(21, '{\"en\":\"Relax the neck and back\"}', 34.86, 30.63, '3:00', '{\"en\":\"Qui non explicabo sed. Ea sit consequuntur nulla quia dignissimos vero et. Sed cumque perferendis vel sit maiores vel. Quibusdam sed quod deleniti dignissimos.\"}', 0, 1, 1, 1, 1, 5, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(22, '{\"en\":\"Quick weave removal\"}', 15.00, 0.00, '5:00', '{\"en\":\"Sed exercitationem accusantium quaerat aperiam illum. Est in vel dolores libero voluptatum ab inventore. Qui voluptas est dolores fuga assumenda omnis sed.\"}', 1, 1, 1, 1, 0, 7, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(23, '{\"en\":\"Body rub with hot stone\"}', 42.65, 37.03, '1:00', '{\"en\":\"Et est reprehenderit velit itaque voluptates. Iure ipsam enim fugit et qui aspernatur maxime. Ut ea enim excepturi velit cupiditate.\"}', 0, 1, 1, 1, 1, 9, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(24, '{\"en\":\"Foot reflexology\"}', 27.59, 24.03, '1:00', '{\"en\":\"Ducimus ut doloribus et error. Similique voluptatibus quod sit repellat. Nostrum ut ut qui mollitia voluptatem. Aut et aliquid voluptatem tempora. Dicta natus corporis est voluptatem.\"}', 0, 0, 1, 1, 1, 9, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(25, '{\"en\":\"Keratin hair treatment\"}', 44.97, 38.59, '1:00', '{\"en\":\"A officia error explicabo quia. Ut sit voluptatum consequatur animi nulla consequatur. Cupiditate quasi necessitatibus earum omnis.\"}', 1, 0, 1, 1, 0, 6, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(26, '{\"en\":\"Keratin hair treatment\"}', 48.22, 0.00, '5:00', '{\"en\":\"Aperiam quae est ut sit. Voluptates eum ipsum voluptatem minus voluptatum. Omnis reiciendis aut doloribus culpa numquam aut veritatis. Et culpa voluptatibus dolore enim.\"}', 0, 0, 1, 1, 0, 8, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(27, '{\"en\":\"Body rub with hot stone\"}', 13.64, 0.00, '3:00', '{\"en\":\"In enim exercitationem itaque aliquam voluptates. Ipsum assumenda aliquid vitae. Nihil veritatis et laborum velit delectus. In labore non beatae in vel totam quis.\"}', 1, 1, 1, 1, 0, 5, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(28, '{\"en\":\"Child haircut\"}', 44.58, 0.00, '2:00', '{\"en\":\"Aut et consequatur alias veritatis eligendi. Consequatur quisquam est voluptas sed vero excepturi. Consequatur iusto omnis unde.\"}', 1, 0, 1, 1, 1, 9, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(29, '{\"en\":\"Relax the neck and back\"}', 10.41, 0.00, '4:00', '{\"en\":\"Eligendi aut magni ab eos reiciendis pariatur animi. Veniam non et qui a. Dolores optio dolorem eveniet id rerum. Pariatur ut minus tempore qui temporibus.\"}', 1, 0, 1, 1, 0, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(30, '{\"en\":\"Color correction\"}', 31.27, 21.73, '3:00', '{\"en\":\"Qui asperiores deserunt aliquam veritatis et modi. Ullam ut itaque inventore ut ex dignissimos. Et tempore officiis dolor debitis ex. Enim quia quaerat consequuntur est.\"}', 0, 0, 1, 1, 1, 5, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(31, '{\"en\":\"Quick weave\"}', 41.55, 31.66, '2:00', '{\"en\":\"Mollitia ut sed similique molestiae tempora quasi minus. Voluptatibus reprehenderit in quod rerum sunt ducimus quaerat alias. Voluptatem saepe nisi laudantium est.\"}', 0, 0, 1, 1, 1, 7, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(32, '{\"en\":\"Braid down\"}', 15.46, 0.00, '1:00', '{\"en\":\"Autem reprehenderit sint enim quae. Non voluptatem nobis alias sapiente qui rerum ad. Consectetur et est nemo et. Aut voluptates non sapiente autem quasi reprehenderit voluptates tempora.\"}', 0, 0, 1, 1, 1, 8, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(33, '{\"en\":\"Balayage\"}', 17.32, 14.89, '3:00', '{\"en\":\"Est voluptas suscipit neque vel culpa non. Veritatis voluptas autem dolorem. Sequi iusto adipisci maxime eveniet. Est dolorum aliquid est quos aut a.\"}', 0, 0, 1, 1, 0, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(34, '{\"en\":\"Relax the neck and back\"}', 45.71, 38.61, '2:00', '{\"en\":\"Magni et impedit rerum ipsum dicta. Aut aliquid hic sapiente et deserunt aut. Quis at magni ut fugit. Reiciendis voluptatem provident iusto autem ut.\"}', 0, 0, 1, 1, 1, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(35, '{\"en\":\"Balayage\"}', 26.57, 0.00, '3:00', '{\"en\":\"Maxime atque voluptatem ullam. Et eos laboriosam omnis repudiandae et corporis quidem dolor. Natus ut eaque ratione error officia corrupti.\"}', 1, 1, 1, 1, 0, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(36, '{\"en\":\"Massage Services\"}', 36.02, 0.00, '4:00', '{\"en\":\"Vel qui et ea qui dolor architecto dignissimos. Eius iste voluptates minima ad. Autem magni consectetur sint dolores quis aut molestiae.\"}', 0, 1, 1, 1, 0, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(37, '{\"en\":\"Color correction\"}', 25.36, 0.00, '1:00', '{\"en\":\"Et ut qui occaecati est. Minus animi quia quia est. Aut molestiae dolore architecto facere tempora. Temporibus molestiae enim praesentium recusandae.\"}', 0, 1, 1, 1, 1, 7, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(38, '{\"en\":\"Health trim\"}', 45.99, 0.00, '2:00', '{\"en\":\"Minus accusamus quidem omnis. Ut consequatur et dolor. Provident corporis dolore totam accusantium. Qui est qui veniam assumenda sed et reprehenderit dolor.\"}', 1, 1, 1, 1, 0, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(39, '{\"en\":\"Braid down\"}', 48.04, 43.31, '5:00', '{\"en\":\"Excepturi similique consequatur ut quis animi nobis. Consequatur in quia dolores ullam nihil quis quas.\"}', 1, 1, 1, 1, 1, 6, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(40, '{\"en\":\"Child haircut\"}', 41.50, 35.87, '4:00', '{\"en\":\"Magnam dolor natus tempora maxime. Aspernatur repellat modi id molestiae. Facere similique et aut quia et ipsa dicta voluptate.\"}', 1, 0, 1, 1, 0, 6, '2023-05-28 01:08:14', '2023-05-28 01:08:14');

-- --------------------------------------------------------

--
-- Table structure for table `e_service_categories`
--

CREATE TABLE `e_service_categories` (
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_service_categories`
--

INSERT INTO `e_service_categories` (`e_service_id`, `category_id`) VALUES
(3, 10),
(4, 8),
(4, 9),
(6, 1),
(6, 6),
(7, 3),
(8, 3),
(10, 1),
(12, 10),
(14, 1),
(14, 9),
(14, 11),
(14, 12),
(16, 3),
(16, 12),
(17, 3),
(18, 4),
(18, 9),
(18, 10),
(19, 8),
(21, 8),
(22, 8),
(23, 4),
(23, 11),
(24, 5),
(24, 11),
(25, 9),
(26, 5),
(26, 7),
(28, 2),
(28, 5),
(28, 7),
(29, 7),
(29, 8),
(29, 10),
(34, 1),
(34, 8),
(35, 2),
(35, 10),
(36, 11),
(37, 2),
(37, 8),
(37, 9),
(38, 10),
(39, 5),
(39, 6),
(39, 9),
(40, 6);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` longtext DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `faq_category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `faq_category_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Labore facere perspiciatis earum sint temporibus molestiae. Aperiam alias et iste vel.\"}', '{\"en\":\"IT TO BE TRUE--\\\" that\'s the jury-box,\' thought Alice, \'it\'ll never do to come before that!\' \'Call the next verse,\' the Gryphon at the door-- Pray, what is the reason and all must have got altered.\'.\"}', 3, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(2, '{\"en\":\"Iure sequi unde voluptates. Quasi nobis debitis enim in. Minima dolore dolor eligendi.\"}', '{\"en\":\"Queen said to herself; \'his eyes are so VERY tired of this. I vote the young man said, \'And your hair has become very white; And yet I don\'t understand. Where did they live at the thought that she.\"}', 3, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(3, '{\"en\":\"Corporis sint et corporis vitae tempore et. Ipsam aut nihil facilis aut. At vel non quia quibusdam.\"}', '{\"en\":\"And beat him when he pleases!\' CHORUS. \'Wow! wow! wow!\' \'Here! you may SIT down,\' the King in a large plate came skimming out, straight at the thought that it might be some sense in your knocking,\'.\"}', 3, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(4, '{\"en\":\"Asperiores qui laboriosam distinctio. Minus enim voluptatem non ut ipsa recusandae quidem.\"}', '{\"en\":\"March Hare. The Hatter opened his eyes were nearly out of breath, and said to herself. Imagine her surprise, when the race was over. However, when they liked, and left off staring at the top of its.\"}', 3, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(5, '{\"en\":\"Quod totam recusandae illum. Ab eos numquam nihil necessitatibus earum repellat quia.\"}', '{\"en\":\"Hatter, who turned pale and fidgeted. \'Give your evidence,\' said the Hatter, it woke up again as she could do, lying down on their slates, and then the Mock Turtle angrily: \'really you are very.\"}', 3, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(6, '{\"en\":\"Iste et quod facere. Molestiae nihil velit eligendi.\"}', '{\"en\":\"Gryphon, and the two creatures, who had spoken first. \'That\'s none of them didn\'t know how to spell \'stupid,\' and that is rather a complaining tone, \'and they drew all manner of things--everything.\"}', 4, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(7, '{\"en\":\"Libero ipsa qui nostrum sed at quisquam. Alias sint soluta laborum cupiditate laboriosam et quia.\"}', '{\"en\":\"Dormouse turned out, and, by the White Rabbit; \'in fact, there\'s nothing written on the bank, with her head to feel which way it was very hot, she kept on puzzling about it in the sky. Twinkle.\"}', 3, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(8, '{\"en\":\"Delectus alias facere sit qui aspernatur. Tenetur maiores repudiandae et fuga est.\"}', '{\"en\":\"And yet I wish you could keep it to speak first, \'why your cat grins like that?\' \'It\'s a mineral, I THINK,\' said Alice. \'Well, then,\' the Cat said, waving its right paw round, \'lives a March Hare.\"}', 4, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(9, '{\"en\":\"Enim a facilis sit assumenda. Cumque itaque sapiente aliquid quia.\"}', '{\"en\":\"I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go down--Here, Bill! the master says you\'re to go after that savage Queen: so she tried to curtsey as she left her, leaning her head was so.\"}', 2, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(10, '{\"en\":\"Necessitatibus iure omnis impedit id non. Illo eveniet aut quod quisquam dignissimos facilis quis.\"}', '{\"en\":\"The Fish-Footman began by taking the little golden key, and when she went on just as usual. \'Come, there\'s no use in waiting by the hand, it hurried off, without waiting for turns, quarrelling all.\"}', 3, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(11, '{\"en\":\"Sint tenetur tempora illo mollitia odio dolor. Quis nemo odit nisi pariatur.\"}', '{\"en\":\"Duchess, as she tucked her arm affectionately into Alice\'s, and they all crowded round her, calling out in a moment: she looked down at her hands, wondering if anything would EVER happen in a.\"}', 1, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(12, '{\"en\":\"Neque vero fugiat rerum quaerat. Quidem dolores soluta iure et. Impedit ea accusantium dolore.\"}', '{\"en\":\"His voice has a timid voice at her side. She was walking hand in hand with Dinah, and saying to herself \'Suppose it should be like then?\' And she went to the Queen, but she was peering about.\"}', 4, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(13, '{\"en\":\"Magnam nihil enim unde. Minus vitae ut quos facilis earum dolor sequi atque.\"}', '{\"en\":\"Mouse, who seemed ready to make personal remarks,\' Alice said with some surprise that the Gryphon answered, very nearly in the wood, \'is to grow up again! Let me see: that would happen: \'\\\"Miss.\"}', 4, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(14, '{\"en\":\"Corrupti id in est iste reprehenderit consequatur dolores. Corporis et ipsa est rerum quod.\"}', '{\"en\":\"Queen was silent. The Dormouse slowly opened his eyes. \'I wasn\'t asleep,\' he said to herself; \'the March Hare and the Queen to play croquet.\' The Frog-Footman repeated, in the pool, and the words.\"}', 4, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(15, '{\"en\":\"Pariatur est modi enim sunt. Tempora et adipisci nostrum accusamus asperiores nam.\"}', '{\"en\":\"I should have liked teaching it tricks very much, if--if I\'d only been the right distance--but then I wonder if I\'ve kept her waiting!\' Alice felt dreadfully puzzled. The Hatter\'s remark seemed to.\"}', 2, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(16, '{\"en\":\"Eius minima autem sint sint quaerat. Rerum quibusdam asperiores architecto nihil.\"}', '{\"en\":\"Alice felt dreadfully puzzled. The Hatter\'s remark seemed to listen, the whole party look so grave and anxious.) Alice could speak again. In a minute or two she stood still where she was, and.\"}', 1, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(17, '{\"en\":\"Cum illo ab tempora fugit. Blanditiis et sapiente veritatis veritatis ipsa. Ex harum ad voluptatem.\"}', '{\"en\":\"I think.\' And she thought it must be on the breeze that followed them, the melancholy words:-- \'Soo--oop of the shepherd boy--and the sneeze of the room again, no wonder she felt a little pattering.\"}', 2, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(18, '{\"en\":\"Quas et quis facere vel. Veritatis quibusdam ut dolor quia.\"}', '{\"en\":\"VERY short remarks, and she went on: \'But why did they live at the time it vanished quite slowly, beginning with the time,\' she said this, she came up to her very much at this, but at the cook, and.\"}', 2, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(19, '{\"en\":\"Et et mollitia suscipit ut. Nobis facere rerum vel soluta ipsam impedit.\"}', '{\"en\":\"Cat, and vanished again. Alice waited a little, and then I\'ll tell you how it was written to nobody, which isn\'t usual, you know.\' \'Not the same side of the room. The cook threw a frying-pan after.\"}', 2, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(20, '{\"en\":\"Error maiores soluta rerum voluptatem enim. Voluptatem quis quam libero voluptas.\"}', '{\"en\":\"I know who I WAS when I got up and saying, \'Thank you, sir, for your walk!\\\" \\\"Coming in a tone of great dismay, and began talking again. \'Dinah\'ll miss me very much pleased at having found out that.\"}', 4, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(21, '{\"en\":\"Consequuntur enim officiis iure harum earum odio. Natus sunt et voluptas perspiciatis.\"}', '{\"en\":\"Alice angrily. \'It wasn\'t very civil of you to sit down without being seen, when she looked up, and there was Mystery,\' the Mock Turtle went on, \'--likely to win, that it\'s hardly worth while.\"}', 3, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(22, '{\"en\":\"Id ut ab beatae voluptate et eum corrupti. Consequuntur facilis soluta voluptatem illo ut.\"}', '{\"en\":\"Hatter trembled so, that he had never seen such a curious dream!\' said Alice, \'and if it had entirely disappeared; so the King say in a ring, and begged the Mouse had changed his mind, and was.\"}', 4, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(23, '{\"en\":\"Eos qui harum itaque quae ut a sequi. Odio qui nam quas ipsam. Id et velit numquam possimus ut.\"}', '{\"en\":\"VERY remarkable in that; nor did Alice think it would be a lesson to you to learn?\' \'Well, there was no longer to be done, I wonder?\' As she said aloud. \'I shall do nothing of the ground, Alice soon.\"}', 1, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(24, '{\"en\":\"Non sint iure vero ut. Architecto ipsa eius et qui velit alias. Numquam eaque sunt maiores.\"}', '{\"en\":\"Gryphon, \'she wants for to know your history, she do.\' \'I\'ll tell it her,\' said the Hatter: \'but you could see this, as she fell very slowly, for she was getting so used to read fairy-tales, I.\"}', 3, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(25, '{\"en\":\"Rerum aut odit enim labore dolor. Est amet in neque beatae. Incidunt culpa eius odit vitae.\"}', '{\"en\":\"And she went on, \'you see, a dog growls when it\'s pleased. Now I growl when I\'m angry. Therefore I\'m mad.\' \'I call it sad?\' And she went down on one of them bowed low. \'Would you like the Queen?\'.\"}', 2, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(26, '{\"en\":\"Aliquam similique et nisi omnis ut ut. Magnam iure repellendus ipsa optio.\"}', '{\"en\":\"I think it was,\' said the March Hare had just begun to think about it, you know.\' It was, no doubt: only Alice did not look at them--\'I wish they\'d get the trial done,\' she thought, and rightly too.\"}', 2, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(27, '{\"en\":\"Iusto et eveniet omnis sit. Velit qui ipsum dignissimos atque.\"}', '{\"en\":\"Duchess began in a trembling voice, \'Let us get to the other, and growing sometimes taller and sometimes she scolded herself so severely as to size,\' Alice hastily replied; \'only one doesn\'t like.\"}', 1, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(28, '{\"en\":\"Cum mollitia consectetur sequi non. Nisi eum laborum distinctio repellendus. Ad et id cum eum.\"}', '{\"en\":\"Hatter, \'or you\'ll be telling me next that you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, as she did not dare to disobey, though she felt that this could not swim. He sent.\"}', 4, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(29, '{\"en\":\"Suscipit excepturi voluptas assumenda quae. Quia ea delectus voluptatum.\"}', '{\"en\":\"I don\'t keep the same year for such dainties would not join the dance. Will you, won\'t you, will you, won\'t you, won\'t you, won\'t you, will you, won\'t you, won\'t you join the dance. Would not, could.\"}', 3, '2023-05-28 01:08:15', '2023-05-28 01:08:15'),
(30, '{\"en\":\"Rerum aliquid non et. Sit et explicabo qui quam voluptas. Nesciunt at inventore blanditiis et.\"}', '{\"en\":\"I can\'t see you?\' She was close behind us, and he\'s treading on my tail. See how eagerly the lobsters and the words \'DRINK ME\' beautifully printed on it in asking riddles that have no notion how.\"}', 2, '2023-05-28 01:08:15', '2023-05-28 01:08:15');

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Service\"}', '2023-05-28 01:08:12', '2023-05-28 01:08:12'),
(2, '{\"en\":\"Service\"}', '2023-05-28 01:08:12', '2023-05-28 01:08:12'),
(3, '{\"en\":\"Service\"}', '2023-05-28 01:08:12', '2023-05-28 01:08:12'),
(4, '{\"en\":\"Service\"}', '2023-05-28 01:08:12', '2023-05-28 01:08:12'),
(5, '{\"en\":\"Service\"}', '2023-05-28 01:08:12', '2023-05-28 01:08:12');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorite_options`
--

CREATE TABLE `favorite_options` (
  `option_id` int(10) UNSIGNED NOT NULL,
  `favorite_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` longtext DEFAULT NULL,
  `salon_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `description`, `salon_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Labore mollitia ea eveniet.\"}', 7, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(2, '{\"en\":\"Quia aut itaque et dolorum.\"}', 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(3, '{\"en\":\"Aut dolores voluptatem aspernatur iusto facilis provident.\"}', 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(4, '{\"en\":\"Sit vel in mollitia eveniet in ad.\"}', 4, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(5, '{\"en\":\"Qui vel ut animi sapiente quas quaerat quam.\"}', 5, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(6, '{\"en\":\"Voluptatem maxime iure quam vitae dolores sint dolor consectetur.\"}', 6, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(7, '{\"en\":\"Est reiciendis enim aut reiciendis.\"}', 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(8, '{\"en\":\"Enim labore velit distinctio laboriosam consequatur.\"}', 5, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(9, '{\"en\":\"Distinctio sunt ut aliquam aut ullam rem.\"}', 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(10, '{\"en\":\"Provident illo cupiditate qui sed reprehenderit et ducimus.\"}', 9, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(11, '{\"en\":\"Et hic ea deserunt consequuntur perferendis distinctio explicabo.\"}', 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(12, '{\"en\":\"Et voluptate veritatis sed autem qui.\"}', 5, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(13, '{\"en\":\"Ex aperiam corporis eaque accusamus.\"}', 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(14, '{\"en\":\"Autem quasi atque voluptatem.\"}', 9, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(15, '{\"en\":\"Enim consectetur qui eveniet fuga tempore culpa quasi.\"}', 4, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(16, '{\"en\":\"Ipsam porro explicabo consequatur.\"}', 7, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(17, '{\"en\":\"Qui qui ea veniam ut.\"}', 8, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(18, '{\"en\":\"Cum beatae ut esse rerum quia aut.\"}', 5, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(19, '{\"en\":\"Quia possimus ea exercitationem impedit aut distinctio soluta.\"}', 8, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(20, '{\"en\":\"Et deleniti a nihil veniam.\"}', 4, '2023-05-28 01:08:14', '2023-05-28 01:08:14');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `mime_type` varchar(191) DEFAULT NULL,
  `disk` varchar(191) NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` text NOT NULL,
  `custom_properties` text NOT NULL,
  `responsive_images` text NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\PaymentMethod', 2, 'logo', 'razorpay', 'razorpay.png', 'image/png', 'public', 13026, '[]', '{\"uuid\":\"13e62475-6b5f-4812-b484-2b94cc52b715\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 3, '2021-05-08 01:03:38', '2021-05-08 01:03:38'),
(5, 'App\\Models\\PaymentMethod', 5, 'logo', 'paypal', 'paypal.png', 'image/png', 'public', 15819, '[]', '{\"uuid\":\"2b8bd9b8-5c37-4464-a5c7-623496d7655f\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 5, '2021-05-08 01:03:49', '2021-05-08 01:03:49'),
(7, 'App\\Models\\PaymentMethod', 6, 'logo', 'pay_pickup', 'pay_pickup.png', 'image/png', 'public', 11712, '[]', '{\"uuid\":\"5e06e7ca-ac33-413c-9ab0-6fd4e3083cc1\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 7, '2021-05-08 01:03:58', '2021-05-08 01:03:58'),
(9, 'App\\Models\\PaymentMethod', 7, 'logo', 'stripe-logo', 'stripe-logo.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd448a36-8a5e-4c85-8d6e-c356843429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 9, '2021-05-08 01:04:23', '2021-05-08 01:04:23'),
(10, 'App\\Models\\PaymentMethod', 9, 'logo', 'flutterwave', 'flutterwave.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a96-8a5e-4a85-8d6e-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 10, '2021-05-08 01:04:23', '2021-05-08 01:04:23'),
(11, 'App\\Models\\PaymentMethod', 8, 'logo', 'paystack', 'paystack.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd448a96-8a5e-4c85-8d6e-c356648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 11, '2021-05-08 01:04:23', '2021-05-08 01:04:23'),
(12, 'App\\Models\\PaymentMethod', 10, 'logo', 'fpx', 'fpx.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a84-8a5e-4b85-8d6f-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 12, '2021-05-08 01:04:23', '2021-05-08 01:04:23'),
(13, 'App\\Models\\PaymentMethod', 11, 'logo', 'wallet', 'wallet.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a84-8a5e-4b85-8d6f-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 12, '2021-05-08 01:04:23', '2021-05-08 01:04:23'),
(14, 'App\\Models\\PaymentMethod', 12, 'logo', 'paymongo', 'paymongo.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a84-8a5e-4b85-8d6f-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 12, '2021-05-08 01:04:23', '2021-05-08 01:04:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_26_175145_create_permission_tables', 1),
(4, '2018_06_12_140344_create_media_table', 1),
(5, '2018_06_13_035117_create_uploads_table', 1),
(6, '2018_07_17_180731_create_settings_table', 1),
(7, '2018_07_24_211308_create_custom_fields_table', 1),
(8, '2018_07_24_211327_create_custom_field_values_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_08_29_213829_create_faq_categories_table', 1),
(11, '2019_08_29_213926_create_faqs_table', 1),
(12, '2019_10_22_144652_create_currencies_table', 1),
(13, '2021_01_07_162658_create_payment_methods_table', 1),
(14, '2021_01_07_164755_create_payment_statuses_table', 1),
(15, '2021_01_07_165422_create_payments_table', 1),
(16, '2021_01_13_105605_create_salon_levels_table', 1),
(17, '2021_01_13_105606_create_addresses_table', 1),
(18, '2021_01_13_111155_create_salons_table', 1),
(19, '2021_01_13_111622_create_experiences_table', 1),
(20, '2021_01_13_111730_create_awards_table', 1),
(21, '2021_01_13_114302_create_taxes_table', 1),
(22, '2021_01_15_115747_create_salon_users_table', 1),
(23, '2021_01_15_115850_create_salon_taxes_table', 1),
(24, '2021_01_16_160838_create_availability_hours_table', 1),
(25, '2021_01_19_135951_create_e_services_table', 1),
(26, '2021_01_19_140427_create_categories_table', 1),
(27, '2021_01_19_171553_create_e_service_categories_table', 1),
(28, '2021_01_22_194514_create_option_groups_table', 1),
(29, '2021_01_22_200807_create_options_table', 1),
(30, '2021_01_22_205819_create_favorites_table', 1),
(31, '2021_01_22_205944_create_favorite_options_table', 1),
(32, '2021_01_23_201533_create_galleries_table', 1),
(33, '2021_01_25_105421_create_slides_table', 1),
(34, '2021_01_25_162055_create_notifications_table', 1),
(35, '2021_01_25_170522_create_coupons_table', 1),
(36, '2021_01_25_170529_create_discountables_table', 1),
(37, '2021_01_25_191833_create_booking_statuses_table', 1),
(38, '2021_01_25_212252_create_bookings_table', 1),
(39, '2021_01_25_222252_create_salon_reviews_table', 1),
(40, '2021_01_30_111717_create_salon_payouts_table', 1),
(41, '2021_01_30_135356_create_earnings_table', 1),
(42, '2021_02_24_102838_create_custom_pages_table', 1),
(43, '2021_06_26_110636_create_json_extract_function', 1),
(44, '2021_06_26_110636_create_json_unquote_function', 1),
(45, '2021_08_08_134136_create_wallets_table', 1),
(46, '2021_08_08_155732_create_wallet_transactions_table', 1),
(47, '2023_06_06_200033_create_boards_table', 2),
(48, '2023_06_06_202758_add_data_to_salons_table', 3),
(49, '2023_06_06_204307_create_banks_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 6),
(4, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 5),
(4, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 8),
(4, 'App\\Models\\User', 9);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `option_group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `description`, `price`, `e_service_id`, `option_group_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Addon 2\"}', '{\"en\":\"Nihil dolorem quaerat.\"}', 38.10, 32, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(2, '{\"en\":\"Addon 2\"}', '{\"en\":\"Voluptatem quia iste et laboriosam.\"}', 42.68, 19, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(3, '{\"en\":\"Addon 1\"}', '{\"en\":\"Enim voluptas aut blanditiis.\"}', 20.15, 20, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(4, '{\"en\":\"Addon 2\"}', '{\"en\":\"Illum veritatis ipsam.\"}', 25.23, 19, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(5, '{\"en\":\"Addon 1\"}', '{\"en\":\"Et rerum animi voluptatem.\"}', 31.70, 5, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(6, '{\"en\":\"Addon 1\"}', '{\"en\":\"Enim autem in explicabo sit maxime.\"}', 43.41, 23, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(7, '{\"en\":\"Addon 2\"}', '{\"en\":\"Maxime dignissimos ex corporis optio voluptas.\"}', 41.58, 8, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(8, '{\"en\":\"Addon 3\"}', '{\"en\":\"Tempora iusto doloremque.\"}', 40.48, 32, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(9, '{\"en\":\"Addon 1\"}', '{\"en\":\"Reprehenderit qui rerum.\"}', 24.69, 26, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(10, '{\"en\":\"Addon 3\"}', '{\"en\":\"Aut dolorem cum sint voluptatem aut.\"}', 31.04, 27, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(11, '{\"en\":\"Addon 3\"}', '{\"en\":\"Exercitationem voluptatum mollitia est nisi.\"}', 40.15, 31, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(12, '{\"en\":\"Addon 2\"}', '{\"en\":\"Nobis nam deleniti saepe.\"}', 29.91, 16, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(13, '{\"en\":\"Addon 2\"}', '{\"en\":\"Ratione aut est.\"}', 18.06, 14, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(14, '{\"en\":\"Addon 3\"}', '{\"en\":\"Alias qui optio eaque enim dolor.\"}', 28.87, 40, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(15, '{\"en\":\"Addon 2\"}', '{\"en\":\"Animi hic repellat quia at.\"}', 22.16, 21, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(16, '{\"en\":\"Addon 3\"}', '{\"en\":\"Quo illum sunt et.\"}', 15.11, 38, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(17, '{\"en\":\"Addon 1\"}', '{\"en\":\"Necessitatibus eligendi voluptas voluptatem eligendi.\"}', 34.93, 29, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(18, '{\"en\":\"Addon 1\"}', '{\"en\":\"Praesentium atque distinctio.\"}', 13.59, 16, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(19, '{\"en\":\"Addon 2\"}', '{\"en\":\"Omnis a aut mollitia.\"}', 33.70, 5, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(20, '{\"en\":\"Addon 1\"}', '{\"en\":\"Aspernatur similique inventore sed.\"}', 42.11, 9, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(21, '{\"en\":\"Addon 3\"}', '{\"en\":\"Omnis nihil eos accusantium.\"}', 40.63, 31, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(22, '{\"en\":\"Addon 2\"}', '{\"en\":\"Veritatis qui odio.\"}', 18.57, 12, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(23, '{\"en\":\"Addon 3\"}', '{\"en\":\"Nam pariatur repellat non.\"}', 23.78, 12, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(24, '{\"en\":\"Addon 2\"}', '{\"en\":\"Facilis natus saepe.\"}', 17.84, 29, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(25, '{\"en\":\"Addon 2\"}', '{\"en\":\"Suscipit laudantium et totam.\"}', 47.44, 4, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(26, '{\"en\":\"Addon 2\"}', '{\"en\":\"Commodi enim aut.\"}', 29.57, 32, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(27, '{\"en\":\"Addon 3\"}', '{\"en\":\"Impedit ipsum quasi natus.\"}', 38.51, 33, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(28, '{\"en\":\"Addon 3\"}', '{\"en\":\"Totam enim ea voluptatem.\"}', 17.03, 15, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(29, '{\"en\":\"Addon 4\"}', '{\"en\":\"Dolor illo veritatis repellat.\"}', 23.76, 40, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(30, '{\"en\":\"Addon 1\"}', '{\"en\":\"Ratione in odio est consequuntur.\"}', 36.25, 19, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(31, '{\"en\":\"Addon 1\"}', '{\"en\":\"Est illo eos omnis ipsam.\"}', 21.09, 25, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(32, '{\"en\":\"Addon 2\"}', '{\"en\":\"Sed in consequuntur quam fugit.\"}', 33.75, 34, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(33, '{\"en\":\"Addon 3\"}', '{\"en\":\"Voluptatem repellat ab.\"}', 39.71, 14, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(34, '{\"en\":\"Addon 3\"}', '{\"en\":\"Culpa non veritatis aliquid laborum enim.\"}', 36.64, 17, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(35, '{\"en\":\"Addon 4\"}', '{\"en\":\"Omnis repudiandae temporibus autem voluptates.\"}', 14.67, 37, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(36, '{\"en\":\"Addon 3\"}', '{\"en\":\"Ab sunt voluptatem et.\"}', 18.91, 26, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(37, '{\"en\":\"Addon 4\"}', '{\"en\":\"Laudantium necessitatibus fugit est ducimus soluta.\"}', 33.91, 8, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(38, '{\"en\":\"Addon 2\"}', '{\"en\":\"Odit quia ipsum ea.\"}', 49.76, 13, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(39, '{\"en\":\"Addon 3\"}', '{\"en\":\"Ut minus omnis sunt nulla maiores.\"}', 48.89, 34, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(40, '{\"en\":\"Addon 2\"}', '{\"en\":\"Sapiente ut earum saepe.\"}', 24.44, 19, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(41, '{\"en\":\"Addon 4\"}', '{\"en\":\"Beatae quis maiores natus.\"}', 12.48, 31, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(42, '{\"en\":\"Addon 3\"}', '{\"en\":\"Veritatis mollitia rem quos.\"}', 30.02, 31, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(43, '{\"en\":\"Addon 4\"}', '{\"en\":\"Est vel corporis.\"}', 32.72, 39, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(44, '{\"en\":\"Addon 1\"}', '{\"en\":\"Facilis sunt ipsa iusto quidem.\"}', 49.01, 25, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(45, '{\"en\":\"Addon 1\"}', '{\"en\":\"Voluptas sunt neque tempora.\"}', 26.77, 32, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(46, '{\"en\":\"Addon 1\"}', '{\"en\":\"Est ut nam vel possimus.\"}', 38.39, 2, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(47, '{\"en\":\"Addon 2\"}', '{\"en\":\"Et laborum laboriosam quae.\"}', 27.91, 4, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(48, '{\"en\":\"Addon 4\"}', '{\"en\":\"Et sunt optio ab.\"}', 38.26, 31, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(49, '{\"en\":\"Addon 1\"}', '{\"en\":\"Facere unde cumque tempora accusantium non.\"}', 26.03, 4, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(50, '{\"en\":\"Addon 3\"}', '{\"en\":\"Velit consequatur dolor velit mollitia ex.\"}', 30.97, 16, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(51, '{\"en\":\"Addon 1\"}', '{\"en\":\"Aut dignissimos odit aliquid.\"}', 46.04, 11, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(52, '{\"en\":\"Addon 3\"}', '{\"en\":\"Sed voluptates iste dolores quia voluptatum.\"}', 14.17, 9, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(53, '{\"en\":\"Addon 1\"}', '{\"en\":\"Facere blanditiis enim a laudantium.\"}', 32.98, 15, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(54, '{\"en\":\"Addon 1\"}', '{\"en\":\"Eaque et sint exercitationem sit.\"}', 12.38, 32, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(55, '{\"en\":\"Addon 3\"}', '{\"en\":\"Distinctio minima enim.\"}', 42.45, 6, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(56, '{\"en\":\"Addon 3\"}', '{\"en\":\"Sunt eius cupiditate.\"}', 23.40, 33, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(57, '{\"en\":\"Addon 1\"}', '{\"en\":\"Dolore aut velit est.\"}', 30.62, 5, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(58, '{\"en\":\"Addon 3\"}', '{\"en\":\"Sed molestiae sequi aliquid.\"}', 22.61, 2, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(59, '{\"en\":\"Addon 1\"}', '{\"en\":\"Adipisci velit magni illum.\"}', 23.99, 7, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(60, '{\"en\":\"Addon 1\"}', '{\"en\":\"Dolorem omnis ut iste quis ad.\"}', 41.72, 30, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(61, '{\"en\":\"Addon 4\"}', '{\"en\":\"Magnam consequuntur voluptatem corrupti aut.\"}', 34.55, 29, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(62, '{\"en\":\"Addon 1\"}', '{\"en\":\"Qui quia ducimus.\"}', 36.76, 31, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(63, '{\"en\":\"Addon 3\"}', '{\"en\":\"Modi numquam ipsum.\"}', 37.78, 30, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(64, '{\"en\":\"Addon 4\"}', '{\"en\":\"Eius consequatur in velit non.\"}', 11.03, 34, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(65, '{\"en\":\"Addon 4\"}', '{\"en\":\"Sed soluta unde blanditiis qui.\"}', 44.32, 14, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(66, '{\"en\":\"Addon 1\"}', '{\"en\":\"Nulla qui aut occaecati aliquid.\"}', 44.96, 23, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(67, '{\"en\":\"Addon 3\"}', '{\"en\":\"Fugit magnam officia aut nobis.\"}', 44.39, 30, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(68, '{\"en\":\"Addon 2\"}', '{\"en\":\"Odio doloribus excepturi sed vero illo.\"}', 34.04, 7, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(69, '{\"en\":\"Addon 4\"}', '{\"en\":\"Modi numquam labore ab voluptatem dignissimos.\"}', 49.56, 30, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(70, '{\"en\":\"Addon 2\"}', '{\"en\":\"Aspernatur tempora sint fuga eveniet.\"}', 35.77, 31, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(71, '{\"en\":\"Addon 4\"}', '{\"en\":\"Quos possimus ut in.\"}', 11.50, 26, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(72, '{\"en\":\"Addon 4\"}', '{\"en\":\"Dolorum qui exercitationem.\"}', 18.80, 30, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(73, '{\"en\":\"Addon 1\"}', '{\"en\":\"Nulla et est ea ratione accusamus.\"}', 21.20, 2, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(74, '{\"en\":\"Addon 1\"}', '{\"en\":\"Ut magni neque deserunt et iusto.\"}', 19.69, 29, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(75, '{\"en\":\"Addon 4\"}', '{\"en\":\"Quisquam et voluptates vitae architecto.\"}', 46.33, 34, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(76, '{\"en\":\"Addon 2\"}', '{\"en\":\"Veniam blanditiis alias earum nesciunt.\"}', 13.96, 5, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(77, '{\"en\":\"Addon 3\"}', '{\"en\":\"Quis aut ut.\"}', 13.59, 13, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(78, '{\"en\":\"Addon 3\"}', '{\"en\":\"Perspiciatis occaecati excepturi asperiores.\"}', 16.08, 19, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(79, '{\"en\":\"Addon 3\"}', '{\"en\":\"Rem dolorem aliquam cupiditate eligendi.\"}', 12.83, 30, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(80, '{\"en\":\"Addon 3\"}', '{\"en\":\"Quia est magnam eius voluptatem laudantium.\"}', 30.33, 7, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(81, '{\"en\":\"Addon 4\"}', '{\"en\":\"Ea quisquam earum.\"}', 35.67, 21, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(82, '{\"en\":\"Addon 2\"}', '{\"en\":\"Dolore odit sapiente eligendi.\"}', 30.33, 3, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(83, '{\"en\":\"Addon 4\"}', '{\"en\":\"Cumque iusto quaerat harum vel.\"}', 14.60, 20, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(84, '{\"en\":\"Addon 4\"}', '{\"en\":\"Eaque et magni cumque quia iusto.\"}', 26.07, 11, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(85, '{\"en\":\"Addon 3\"}', '{\"en\":\"Numquam at adipisci.\"}', 12.82, 21, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(86, '{\"en\":\"Addon 1\"}', '{\"en\":\"Saepe omnis officia assumenda facilis rem.\"}', 36.67, 20, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(87, '{\"en\":\"Addon 1\"}', '{\"en\":\"Dignissimos debitis ipsam sit reiciendis.\"}', 10.86, 17, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(88, '{\"en\":\"Addon 2\"}', '{\"en\":\"Rem pariatur qui.\"}', 36.96, 19, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(89, '{\"en\":\"Addon 2\"}', '{\"en\":\"Vel minima est voluptas.\"}', 15.52, 36, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(90, '{\"en\":\"Addon 4\"}', '{\"en\":\"Perferendis nisi alias cumque et.\"}', 16.38, 14, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(91, '{\"en\":\"Addon 1\"}', '{\"en\":\"Dolore id culpa quaerat ea excepturi.\"}', 42.81, 17, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(92, '{\"en\":\"Addon 2\"}', '{\"en\":\"Aliquam voluptatem error.\"}', 27.14, 29, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(93, '{\"en\":\"Addon 2\"}', '{\"en\":\"Iure porro doloremque est.\"}', 24.16, 2, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(94, '{\"en\":\"Addon 4\"}', '{\"en\":\"Occaecati numquam porro occaecati totam.\"}', 43.46, 13, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(95, '{\"en\":\"Addon 4\"}', '{\"en\":\"Et aspernatur officia explicabo aut.\"}', 27.14, 33, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(96, '{\"en\":\"Addon 3\"}', '{\"en\":\"Culpa nihil ipsa iure quia voluptatem.\"}', 39.24, 17, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(97, '{\"en\":\"Addon 1\"}', '{\"en\":\"Numquam atque rerum neque.\"}', 43.71, 13, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(98, '{\"en\":\"Addon 1\"}', '{\"en\":\"Voluptate minima nesciunt quia reprehenderit.\"}', 18.07, 7, 2, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(99, '{\"en\":\"Addon 3\"}', '{\"en\":\"Vel labore quod a natus.\"}', 10.85, 9, 3, '2023-05-28 01:08:14', '2023-05-28 01:08:14'),
(100, '{\"en\":\"Addon 1\"}', '{\"en\":\"Totam atque maxime minima rerum.\"}', 23.95, 21, 1, '2023-05-28 01:08:14', '2023-05-28 01:08:14');

-- --------------------------------------------------------

--
-- Table structure for table `option_groups`
--

CREATE TABLE `option_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `allow_multiple` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `option_groups`
--

INSERT INTO `option_groups` (`id`, `name`, `allow_multiple`, `created_at`, `updated_at`) VALUES
(1, 'Size', 1, '2021-01-23 02:49:15', '2021-02-08 03:30:19'),
(2, 'Color', 1, '2021-01-23 03:46:28', '2021-01-23 03:46:28'),
(3, 'Type', 0, '2021-01-23 03:46:47', '2021-01-23 03:46:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `description` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` int(10) UNSIGNED NOT NULL,
  `payment_status_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `route` varchar(127) NOT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `description`, `route`, `order`, `default`, `enabled`, `created_at`, `updated_at`) VALUES
(2, 'RazorPay', 'Click to pay with RazorPay gateway', '/RazorPay', 2, 0, 1, '2021-01-17 21:33:49', '2021-02-18 05:37:30'),
(5, 'PayPal', 'Click to pay with your PayPal account', '/PayPal', 1, 0, 1, '2021-01-17 22:46:06', '2021-02-18 05:38:47'),
(6, 'Cash', 'Click to pay cash when finish', '/Cash', 3, 1, 1, '2021-02-18 05:38:42', '2021-02-18 05:38:42'),
(7, 'Credit Card (Stripe)', 'Click to pay with your Credit Card', '/Stripe', 3, 0, 1, '2021-02-18 05:38:42', '2021-02-18 05:38:42'),
(8, 'PayStack', 'Click to pay with PayStack gateway', '/PayStack', 5, 0, 1, '2021-07-24 05:38:42', '2021-07-24 05:38:42'),
(9, 'FlutterWave', 'Click to pay with FlutterWave gateway', '/FlutterWave', 6, 0, 1, '2021-07-24 05:38:42', '2021-07-24 05:38:42'),
(10, 'Malaysian Stripe FPX	', 'Click to pay with Stripe FPX gateway', '/StripeFPX', 7, 0, 1, '2021-07-25 05:38:42', '2021-07-25 05:38:42'),
(11, 'Wallet', 'Click to pay with Wallet', '/Wallet', 8, 0, 1, '2021-08-09 05:38:42', '2021-08-09 05:38:42'),
(12, 'PayMongo', 'Click to pay with PayMongo', '/PayMongo', 12, 0, 1, '2021-10-09 05:38:42', '2021-10-09 05:38:42');

-- --------------------------------------------------------

--
-- Table structure for table `payment_statuses`
--

CREATE TABLE `payment_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` longtext DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_statuses`
--

INSERT INTO `payment_statuses` (`id`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Pending', 1, '2021-01-17 22:28:28', '2021-02-18 04:55:15'),
(2, 'Paid', 10, '2021-01-12 06:19:49', '2021-02-18 04:55:53'),
(3, 'Failed', 20, '2021-01-17 21:05:04', '2021-02-18 04:56:32'),
(4, 'Refunded', 40, '2021-02-18 04:58:14', '2021-02-18 04:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'web', '2021-01-07 20:17:34', '2021-01-07 20:17:34'),
(2, 'medias.create', 'web', '2021-01-07 20:17:35', '2021-01-07 20:17:35'),
(3, 'users.profile', 'web', '2021-01-07 20:17:35', '2021-01-07 20:17:35'),
(4, 'users.index', 'web', '2021-01-07 20:17:35', '2021-01-07 20:17:35'),
(5, 'users.create', 'web', '2021-01-07 20:17:35', '2021-01-07 20:17:35'),
(6, 'users.store', 'web', '2021-01-07 20:17:35', '2021-01-07 20:17:35'),
(7, 'users.show', 'web', '2021-01-07 20:17:35', '2021-01-07 20:17:35'),
(8, 'users.edit', 'web', '2021-01-07 20:17:36', '2021-01-07 20:17:36'),
(9, 'users.update', 'web', '2021-01-07 20:17:36', '2021-01-07 20:17:36'),
(10, 'users.destroy', 'web', '2021-01-07 20:17:36', '2021-01-07 20:17:36'),
(11, 'medias.delete', 'web', '2021-01-07 20:17:36', '2021-01-07 20:17:36'),
(12, 'medias', 'web', '2021-01-07 20:17:36', '2021-01-07 20:17:36'),
(13, 'permissions.index', 'web', '2021-01-07 20:17:36', '2021-01-07 20:17:36'),
(14, 'permissions.create', 'web', '2021-01-07 20:17:36', '2021-01-07 20:17:36'),
(15, 'permissions.store', 'web', '2021-01-07 20:17:36', '2021-01-07 20:17:36'),
(16, 'permissions.show', 'web', '2021-01-07 20:17:37', '2021-01-07 20:17:37'),
(17, 'permissions.edit', 'web', '2021-01-07 20:17:37', '2021-01-07 20:17:37'),
(18, 'permissions.update', 'web', '2021-01-07 20:17:37', '2021-01-07 20:17:37'),
(19, 'permissions.destroy', 'web', '2021-01-07 20:17:37', '2021-01-07 20:17:37'),
(20, 'roles.index', 'web', '2021-01-07 20:17:37', '2021-01-07 20:17:37'),
(21, 'roles.create', 'web', '2021-01-07 20:17:37', '2021-01-07 20:17:37'),
(22, 'roles.store', 'web', '2021-01-07 20:17:37', '2021-01-07 20:17:37'),
(23, 'roles.show', 'web', '2021-01-07 20:17:38', '2021-01-07 20:17:38'),
(24, 'roles.edit', 'web', '2021-01-07 20:17:38', '2021-01-07 20:17:38'),
(25, 'roles.update', 'web', '2021-01-07 20:17:38', '2021-01-07 20:17:38'),
(26, 'roles.destroy', 'web', '2021-01-07 20:17:38', '2021-01-07 20:17:38'),
(27, 'customFields.index', 'web', '2021-01-07 20:17:38', '2021-01-07 20:17:38'),
(28, 'customFields.create', 'web', '2021-01-07 20:17:38', '2021-01-07 20:17:38'),
(29, 'customFields.store', 'web', '2021-01-07 20:17:38', '2021-01-07 20:17:38'),
(30, 'customFields.show', 'web', '2021-01-07 20:17:38', '2021-01-07 20:17:38'),
(31, 'customFields.edit', 'web', '2021-01-07 20:17:39', '2021-01-07 20:17:39'),
(32, 'customFields.update', 'web', '2021-01-07 20:17:39', '2021-01-07 20:17:39'),
(33, 'customFields.destroy', 'web', '2021-01-07 20:17:39', '2021-01-07 20:17:39'),
(34, 'currencies.index', 'web', '2021-01-07 20:17:39', '2021-01-07 20:17:39'),
(35, 'currencies.create', 'web', '2021-01-07 20:17:39', '2021-01-07 20:17:39'),
(36, 'currencies.store', 'web', '2021-01-07 20:17:39', '2021-01-07 20:17:39'),
(37, 'currencies.edit', 'web', '2021-01-07 20:17:39', '2021-01-07 20:17:39'),
(38, 'currencies.update', 'web', '2021-01-07 20:17:40', '2021-01-07 20:17:40'),
(39, 'currencies.destroy', 'web', '2021-01-07 20:17:40', '2021-01-07 20:17:40'),
(40, 'users.login-as-user', 'web', '2021-01-07 20:17:40', '2021-01-07 20:17:40'),
(41, 'app-settings', 'web', '2021-01-07 20:17:40', '2021-01-07 20:17:40'),
(42, 'faqCategories.index', 'web', '2021-01-07 20:17:40', '2021-01-07 20:17:40'),
(43, 'faqCategories.create', 'web', '2021-01-07 20:17:40', '2021-01-07 20:17:40'),
(44, 'faqCategories.store', 'web', '2021-01-07 20:17:40', '2021-01-07 20:17:40'),
(45, 'faqCategories.edit', 'web', '2021-01-07 20:17:41', '2021-01-07 20:17:41'),
(46, 'faqCategories.update', 'web', '2021-01-07 20:17:41', '2021-01-07 20:17:41'),
(47, 'faqCategories.destroy', 'web', '2021-01-07 20:17:41', '2021-01-07 20:17:41'),
(48, 'faqs.index', 'web', '2021-01-07 20:17:41', '2021-01-07 20:17:41'),
(49, 'faqs.create', 'web', '2021-01-07 20:17:41', '2021-01-07 20:17:41'),
(50, 'faqs.store', 'web', '2021-01-07 20:17:41', '2021-01-07 20:17:41'),
(51, 'faqs.edit', 'web', '2021-01-07 20:17:41', '2021-01-07 20:17:41'),
(52, 'faqs.update', 'web', '2021-01-07 20:17:42', '2021-01-07 20:17:42'),
(53, 'faqs.destroy', 'web', '2021-01-07 20:17:42', '2021-01-07 20:17:42'),
(54, 'payments.index', 'web', '2021-01-11 07:04:33', '2021-01-11 07:04:33'),
(55, 'payments.show', 'web', '2021-01-11 07:04:33', '2021-01-11 07:04:33'),
(56, 'payments.update', 'web', '2021-01-11 07:04:33', '2021-01-11 07:04:33'),
(57, 'paymentMethods.index', 'web', '2021-01-11 07:04:33', '2021-01-11 07:04:33'),
(58, 'paymentMethods.create', 'web', '2021-01-11 07:04:34', '2021-01-11 07:04:34'),
(59, 'paymentMethods.store', 'web', '2021-01-11 07:04:34', '2021-01-11 07:04:34'),
(60, 'paymentMethods.edit', 'web', '2021-01-11 07:04:34', '2021-01-11 07:04:34'),
(61, 'paymentMethods.update', 'web', '2021-01-11 07:04:34', '2021-01-11 07:04:34'),
(62, 'paymentMethods.destroy', 'web', '2021-01-11 07:04:34', '2021-01-11 07:04:34'),
(63, 'paymentStatuses.index', 'web', '2021-01-11 07:04:34', '2021-01-11 07:04:34'),
(64, 'paymentStatuses.create', 'web', '2021-01-11 07:04:34', '2021-01-11 07:04:34'),
(65, 'paymentStatuses.store', 'web', '2021-01-11 07:04:35', '2021-01-11 07:04:35'),
(66, 'paymentStatuses.edit', 'web', '2021-01-11 07:04:35', '2021-01-11 07:04:35'),
(67, 'paymentStatuses.update', 'web', '2021-01-11 07:04:35', '2021-01-11 07:04:35'),
(68, 'paymentStatuses.destroy', 'web', '2021-01-11 07:04:35', '2021-01-11 07:04:35'),
(69, 'verification.notice', 'web', '2021-01-12 17:19:50', '2021-01-12 17:19:50'),
(70, 'verification.verify', 'web', '2021-01-12 17:19:50', '2021-01-12 17:19:50'),
(71, 'verification.resend', 'web', '2021-01-12 17:19:51', '2021-01-12 17:19:51'),
(72, 'awards.index', 'web', '2021-01-12 17:19:51', '2021-01-12 17:19:51'),
(73, 'awards.create', 'web', '2021-01-12 17:19:52', '2021-01-12 17:19:52'),
(74, 'awards.store', 'web', '2021-01-12 17:19:52', '2021-01-12 17:19:52'),
(75, 'awards.show', 'web', '2021-01-12 17:19:52', '2021-01-12 17:19:52'),
(76, 'awards.edit', 'web', '2021-01-12 17:19:52', '2021-01-12 17:19:52'),
(77, 'awards.update', 'web', '2021-01-12 17:19:52', '2021-01-12 17:19:52'),
(78, 'awards.destroy', 'web', '2021-01-12 17:19:52', '2021-01-12 17:19:52'),
(79, 'experiences.index', 'web', '2021-01-12 18:20:29', '2021-01-12 18:20:29'),
(80, 'experiences.create', 'web', '2021-01-12 18:20:29', '2021-01-12 18:20:29'),
(81, 'experiences.store', 'web', '2021-01-12 18:20:30', '2021-01-12 18:20:30'),
(82, 'experiences.show', 'web', '2021-01-12 18:20:30', '2021-01-12 18:20:30'),
(83, 'experiences.edit', 'web', '2021-01-12 18:20:30', '2021-01-12 18:20:30'),
(84, 'experiences.update', 'web', '2021-01-12 18:20:30', '2021-01-12 18:20:30'),
(85, 'experiences.destroy', 'web', '2021-01-12 18:20:30', '2021-01-12 18:20:30'),
(92, 'salonLevels.index', 'web', '2021-01-13 18:31:08', '2021-01-13 18:31:08'),
(93, 'salonLevels.create', 'web', '2021-01-13 18:31:09', '2021-01-13 18:31:09'),
(94, 'salonLevels.store', 'web', '2021-01-13 18:31:09', '2021-01-13 18:31:09'),
(95, 'salonLevels.edit', 'web', '2021-01-13 18:31:09', '2021-01-13 18:31:09'),
(96, 'salonLevels.update', 'web', '2021-01-13 18:31:09', '2021-01-13 18:31:09'),
(97, 'salonLevels.destroy', 'web', '2021-01-13 18:31:09', '2021-01-13 18:31:09'),
(98, 'salons.index', 'web', '2021-01-13 18:48:55', '2021-01-13 18:48:55'),
(99, 'salons.create', 'web', '2021-01-13 18:48:56', '2021-01-13 18:48:56'),
(100, 'salons.store', 'web', '2021-01-13 18:48:56', '2021-01-13 18:48:56'),
(101, 'salons.edit', 'web', '2021-01-13 18:48:56', '2021-01-13 18:48:56'),
(102, 'salons.update', 'web', '2021-01-13 18:48:56', '2021-01-13 18:48:56'),
(103, 'salons.destroy', 'web', '2021-01-13 18:48:56', '2021-01-13 18:48:56'),
(104, 'addresses.index', 'web', '2021-01-13 18:48:56', '2021-01-13 18:48:56'),
(105, 'addresses.create', 'web', '2021-01-13 18:48:57', '2021-01-13 18:48:57'),
(106, 'addresses.store', 'web', '2021-01-13 18:48:57', '2021-01-13 18:48:57'),
(107, 'addresses.edit', 'web', '2021-01-13 18:48:57', '2021-01-13 18:48:57'),
(108, 'addresses.update', 'web', '2021-01-13 18:48:57', '2021-01-13 18:48:57'),
(109, 'addresses.destroy', 'web', '2021-01-13 18:48:57', '2021-01-13 18:48:57'),
(110, 'taxes.index', 'web', '2021-01-13 18:48:57', '2021-01-13 18:48:57'),
(111, 'taxes.create', 'web', '2021-01-13 18:48:57', '2021-01-13 18:48:57'),
(112, 'taxes.store', 'web', '2021-01-13 18:48:58', '2021-01-13 18:48:58'),
(113, 'taxes.edit', 'web', '2021-01-13 18:48:58', '2021-01-13 18:48:58'),
(114, 'taxes.update', 'web', '2021-01-13 18:48:58', '2021-01-13 18:48:58'),
(115, 'taxes.destroy', 'web', '2021-01-13 18:48:58', '2021-01-13 18:48:58'),
(116, 'availabilityHours.index', 'web', '2021-01-16 23:14:21', '2021-01-16 23:14:21'),
(117, 'availabilityHours.create', 'web', '2021-01-16 23:14:21', '2021-01-16 23:14:21'),
(118, 'availabilityHours.store', 'web', '2021-01-16 23:14:21', '2021-01-16 23:14:21'),
(119, 'availabilityHours.edit', 'web', '2021-01-16 23:14:21', '2021-01-16 23:14:21'),
(120, 'availabilityHours.update', 'web', '2021-01-16 23:14:22', '2021-01-16 23:14:22'),
(121, 'availabilityHours.destroy', 'web', '2021-01-16 23:14:22', '2021-01-16 23:14:22'),
(122, 'eServices.index', 'web', '2021-01-19 21:03:00', '2021-01-19 21:03:00'),
(123, 'eServices.create', 'web', '2021-01-19 21:03:00', '2021-01-19 21:03:00'),
(124, 'eServices.store', 'web', '2021-01-19 21:03:00', '2021-01-19 21:03:00'),
(126, 'eServices.edit', 'web', '2021-01-19 21:03:01', '2021-01-19 21:03:01'),
(127, 'eServices.update', 'web', '2021-01-19 21:03:01', '2021-01-19 21:03:01'),
(128, 'eServices.destroy', 'web', '2021-01-19 21:03:01', '2021-01-19 21:03:01'),
(129, 'categories.index', 'web', '2021-01-19 21:08:55', '2021-01-19 21:08:55'),
(130, 'categories.create', 'web', '2021-01-19 21:08:55', '2021-01-19 21:08:55'),
(131, 'categories.store', 'web', '2021-01-19 21:08:55', '2021-01-19 21:08:55'),
(132, 'categories.edit', 'web', '2021-01-19 21:08:55', '2021-01-19 21:08:55'),
(133, 'categories.update', 'web', '2021-01-19 21:08:56', '2021-01-19 21:08:56'),
(134, 'categories.destroy', 'web', '2021-01-19 21:08:56', '2021-01-19 21:08:56'),
(135, 'optionGroups.index', 'web', '2021-01-23 02:48:32', '2021-01-23 02:48:32'),
(136, 'optionGroups.create', 'web', '2021-01-23 02:48:32', '2021-01-23 02:48:32'),
(137, 'optionGroups.store', 'web', '2021-01-23 02:48:32', '2021-01-23 02:48:32'),
(138, 'optionGroups.edit', 'web', '2021-01-23 02:48:32', '2021-01-23 02:48:32'),
(139, 'optionGroups.update', 'web', '2021-01-23 02:48:32', '2021-01-23 02:48:32'),
(140, 'optionGroups.destroy', 'web', '2021-01-23 02:48:32', '2021-01-23 02:48:32'),
(141, 'options.index', 'web', '2021-01-23 03:10:51', '2021-01-23 03:10:51'),
(142, 'options.create', 'web', '2021-01-23 03:10:51', '2021-01-23 03:10:51'),
(143, 'options.store', 'web', '2021-01-23 03:10:52', '2021-01-23 03:10:52'),
(144, 'options.edit', 'web', '2021-01-23 03:10:52', '2021-01-23 03:10:52'),
(145, 'options.update', 'web', '2021-01-23 03:10:52', '2021-01-23 03:10:52'),
(146, 'options.destroy', 'web', '2021-01-23 03:10:52', '2021-01-23 03:10:52'),
(147, 'favorites.index', 'web', '2021-01-23 04:01:13', '2021-01-23 04:01:13'),
(148, 'favorites.create', 'web', '2021-01-23 04:01:13', '2021-01-23 04:01:13'),
(149, 'favorites.store', 'web', '2021-01-23 04:01:13', '2021-01-23 04:01:13'),
(150, 'favorites.edit', 'web', '2021-01-23 04:01:13', '2021-01-23 04:01:13'),
(151, 'favorites.update', 'web', '2021-01-23 04:01:13', '2021-01-23 04:01:13'),
(152, 'favorites.destroy', 'web', '2021-01-23 04:01:13', '2021-01-23 04:01:13'),
(153, 'salonReviews.index', 'web', '2021-01-24 02:42:57', '2021-01-24 02:42:57'),
(154, 'salonReviews.create', 'web', '2021-01-24 02:42:58', '2021-01-24 02:42:58'),
(155, 'salonReviews.store', 'web', '2021-01-24 02:42:58', '2021-01-24 02:42:58'),
(156, 'salonReviews.edit', 'web', '2021-01-24 02:42:58', '2021-01-24 02:42:58'),
(157, 'salonReviews.update', 'web', '2021-01-24 02:42:58', '2021-01-24 02:42:58'),
(158, 'salonReviews.destroy', 'web', '2021-01-24 02:42:58', '2021-01-24 02:42:58'),
(160, 'galleries.index', 'web', '2021-01-24 03:17:46', '2021-01-24 03:17:46'),
(161, 'galleries.create', 'web', '2021-01-24 03:17:47', '2021-01-24 03:17:47'),
(162, 'galleries.store', 'web', '2021-01-24 03:17:47', '2021-01-24 03:17:47'),
(163, 'galleries.edit', 'web', '2021-01-24 03:17:47', '2021-01-24 03:17:47'),
(164, 'galleries.update', 'web', '2021-01-24 03:17:47', '2021-01-24 03:17:47'),
(165, 'galleries.destroy', 'web', '2021-01-24 03:17:47', '2021-01-24 03:17:47'),
(166, 'requestedSalons.index', 'web', '2021-01-25 16:53:17', '2021-01-25 16:53:17'),
(167, 'slides.index', 'web', '2021-01-25 18:01:20', '2021-01-25 18:01:20'),
(168, 'slides.create', 'web', '2021-01-25 18:01:20', '2021-01-25 18:01:20'),
(169, 'slides.store', 'web', '2021-01-25 18:01:20', '2021-01-25 18:01:20'),
(170, 'slides.edit', 'web', '2021-01-25 18:01:20', '2021-01-25 18:01:20'),
(171, 'slides.update', 'web', '2021-01-25 18:01:20', '2021-01-25 18:01:20'),
(172, 'slides.destroy', 'web', '2021-01-25 18:01:20', '2021-01-25 18:01:20'),
(173, 'notifications.index', 'web', '2021-01-25 22:42:33', '2021-01-25 22:42:33'),
(174, 'notifications.show', 'web', '2021-01-25 22:42:34', '2021-01-25 22:42:34'),
(175, 'notifications.destroy', 'web', '2021-01-25 22:42:34', '2021-01-25 22:42:34'),
(176, 'coupons.index', 'web', '2021-01-25 23:11:55', '2021-01-25 23:11:55'),
(177, 'coupons.create', 'web', '2021-01-25 23:11:55', '2021-01-25 23:11:55'),
(178, 'coupons.store', 'web', '2021-01-25 23:11:55', '2021-01-25 23:11:55'),
(179, 'coupons.edit', 'web', '2021-01-25 23:11:55', '2021-01-25 23:11:55'),
(180, 'coupons.update', 'web', '2021-01-25 23:11:55', '2021-01-25 23:11:55'),
(181, 'coupons.destroy', 'web', '2021-01-25 23:11:55', '2021-01-25 23:11:55'),
(182, 'bookingStatuses.index', 'web', '2021-01-26 02:21:01', '2021-01-26 02:21:01'),
(183, 'bookingStatuses.create', 'web', '2021-01-26 02:21:01', '2021-01-26 02:21:01'),
(184, 'bookingStatuses.store', 'web', '2021-01-26 02:21:01', '2021-01-26 02:21:01'),
(185, 'bookingStatuses.edit', 'web', '2021-01-26 02:21:01', '2021-01-26 02:21:01'),
(186, 'bookingStatuses.update', 'web', '2021-01-26 02:21:01', '2021-01-26 02:21:01'),
(187, 'bookingStatuses.destroy', 'web', '2021-01-26 02:21:01', '2021-01-26 02:21:01'),
(188, 'bookings.index', 'web', '2021-01-26 04:27:09', '2021-01-26 04:27:09'),
(189, 'bookings.create', 'web', '2021-01-26 04:27:09', '2021-01-26 04:27:09'),
(190, 'bookings.store', 'web', '2021-01-26 04:27:09', '2021-01-26 04:27:09'),
(191, 'bookings.show', 'web', '2021-01-26 04:27:09', '2021-01-26 04:27:09'),
(192, 'bookings.edit', 'web', '2021-01-26 04:27:09', '2021-01-26 04:27:09'),
(193, 'bookings.update', 'web', '2021-01-26 04:27:09', '2021-01-26 04:27:09'),
(194, 'bookings.destroy', 'web', '2021-01-26 04:27:09', '2021-01-26 04:27:09'),
(195, 'salonPayouts.index', 'web', '2021-01-30 18:23:08', '2021-01-30 18:23:08'),
(196, 'salonPayouts.create', 'web', '2021-01-30 18:23:08', '2021-01-30 18:23:08'),
(197, 'salonPayouts.store', 'web', '2021-01-30 18:23:08', '2021-01-30 18:23:08'),
(198, 'salonPayouts.destroy', 'web', '2021-01-30 18:23:09', '2021-01-30 18:23:09'),
(199, 'earnings.index', 'web', '2021-01-30 20:57:57', '2021-01-30 20:57:57'),
(200, 'earnings.create', 'web', '2021-01-30 20:57:57', '2021-01-30 20:57:57'),
(201, 'earnings.store', 'web', '2021-01-30 20:57:57', '2021-01-30 20:57:57'),
(202, 'earnings.destroy', 'web', '2021-01-30 20:57:57', '2021-01-30 20:57:57'),
(203, 'customPages.index', 'web', '2021-02-24 18:37:44', '2021-02-24 18:37:44'),
(204, 'customPages.create', 'web', '2021-02-24 18:37:44', '2021-02-24 18:37:44'),
(205, 'customPages.store', 'web', '2021-02-24 18:37:44', '2021-02-24 18:37:44'),
(206, 'customPages.show', 'web', '2021-02-24 18:37:44', '2021-02-24 18:37:44'),
(207, 'customPages.edit', 'web', '2021-02-24 18:37:44', '2021-02-24 18:37:44'),
(208, 'customPages.update', 'web', '2021-02-24 18:37:44', '2021-02-24 18:37:44'),
(209, 'customPages.destroy', 'web', '2021-02-24 18:37:44', '2021-02-24 18:37:44'),
(210, 'wallets.index', 'web', '2021-02-24 18:37:44', '2021-02-24 18:37:44'),
(211, 'wallets.create', 'web', '2021-02-24 18:37:44', '2021-02-24 18:37:44'),
(212, 'wallets.store', 'web', '2021-02-24 18:37:44', '2021-02-24 18:37:44'),
(213, 'wallets.update', 'web', '2021-02-24 18:37:44', '2021-02-24 18:37:44'),
(214, 'wallets.edit', 'web', '2021-02-24 18:37:44', '2021-02-24 18:37:44'),
(215, 'wallets.destroy', 'web', '2021-02-24 18:37:44', '2021-02-24 18:37:44'),
(216, 'walletTransactions.index', 'web', '2021-02-24 18:37:44', '2021-02-24 18:37:44'),
(217, 'walletTransactions.create', 'web', '2021-02-24 18:37:44', '2021-02-24 18:37:44'),
(218, 'walletTransactions.store', 'web', '2021-02-24 18:37:44', '2021-02-24 18:37:44'),
(219, 'modules.update', 'web', '2023-05-28 01:08:10', '2023-05-28 01:08:10'),
(220, 'modules.install', 'web', '2023-05-28 01:08:10', '2023-05-28 01:08:10'),
(221, 'modules.index', 'web', '2023-05-28 01:08:10', '2023-05-28 01:08:10'),
(222, 'modules.enable', 'web', '2023-05-28 01:08:10', '2023-05-28 01:08:10');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL DEFAULT 'web',
  `default` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `default`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'web', 0, NULL, NULL),
(3, 'salon owner', 'web', 0, NULL, NULL),
(4, 'customer', 'web', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(2, 3),
(2, 4),
(3, 2),
(3, 3),
(3, 4),
(4, 2),
(5, 2),
(6, 2),
(8, 2),
(9, 2),
(9, 3),
(9, 4),
(10, 2),
(11, 2),
(11, 3),
(11, 4),
(12, 2),
(12, 3),
(13, 2),
(16, 2),
(19, 2),
(20, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(42, 3),
(42, 4),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(48, 3),
(48, 4),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(54, 3),
(54, 4),
(57, 2),
(57, 3),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(66, 2),
(67, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(72, 3),
(73, 2),
(73, 3),
(74, 2),
(74, 3),
(75, 2),
(75, 3),
(76, 2),
(76, 3),
(77, 2),
(77, 3),
(78, 2),
(78, 3),
(79, 2),
(79, 3),
(80, 2),
(80, 3),
(81, 2),
(81, 3),
(82, 2),
(82, 3),
(83, 2),
(83, 3),
(84, 2),
(84, 3),
(85, 2),
(85, 3),
(92, 2),
(92, 3),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(98, 3),
(98, 4),
(99, 2),
(99, 3),
(99, 4),
(100, 2),
(100, 3),
(100, 4),
(101, 2),
(101, 3),
(102, 2),
(102, 3),
(103, 2),
(104, 2),
(104, 3),
(104, 4),
(105, 2),
(105, 3),
(105, 4),
(106, 2),
(106, 3),
(106, 4),
(107, 2),
(107, 3),
(107, 4),
(108, 2),
(108, 3),
(108, 4),
(109, 2),
(109, 3),
(109, 4),
(110, 2),
(111, 2),
(112, 2),
(113, 2),
(114, 2),
(115, 2),
(116, 2),
(116, 3),
(117, 2),
(117, 3),
(118, 2),
(118, 3),
(119, 2),
(119, 3),
(120, 2),
(120, 3),
(121, 2),
(121, 3),
(122, 2),
(122, 3),
(122, 4),
(123, 2),
(123, 3),
(124, 2),
(124, 3),
(126, 2),
(126, 3),
(127, 2),
(127, 3),
(128, 2),
(128, 3),
(129, 2),
(129, 3),
(129, 4),
(130, 2),
(131, 2),
(132, 2),
(133, 2),
(134, 2),
(135, 2),
(135, 3),
(136, 2),
(136, 3),
(137, 2),
(137, 3),
(138, 2),
(139, 2),
(140, 2),
(141, 2),
(141, 3),
(142, 2),
(142, 3),
(143, 2),
(143, 3),
(144, 2),
(144, 3),
(145, 2),
(145, 3),
(146, 2),
(146, 3),
(147, 2),
(147, 3),
(147, 4),
(148, 2),
(149, 2),
(149, 3),
(150, 2),
(151, 2),
(151, 3),
(152, 2),
(153, 2),
(153, 3),
(153, 4),
(156, 2),
(156, 3),
(156, 4),
(157, 2),
(157, 3),
(157, 4),
(158, 2),
(160, 2),
(160, 3),
(161, 2),
(161, 3),
(162, 2),
(162, 3),
(163, 2),
(163, 3),
(164, 2),
(164, 3),
(165, 2),
(165, 3),
(166, 2),
(166, 3),
(166, 4),
(167, 2),
(168, 2),
(169, 2),
(170, 2),
(171, 2),
(172, 2),
(173, 2),
(173, 3),
(173, 4),
(174, 2),
(175, 2),
(175, 3),
(175, 4),
(176, 2),
(176, 3),
(177, 2),
(178, 2),
(179, 2),
(179, 3),
(180, 2),
(180, 3),
(181, 2),
(182, 2),
(182, 3),
(185, 2),
(186, 2),
(188, 2),
(188, 3),
(188, 4),
(191, 2),
(191, 3),
(191, 4),
(192, 2),
(192, 3),
(193, 2),
(193, 3),
(194, 2),
(194, 3),
(195, 2),
(195, 3),
(196, 2),
(196, 3),
(197, 2),
(197, 3),
(199, 2),
(199, 3),
(200, 2),
(200, 3),
(203, 2),
(203, 3),
(203, 4),
(204, 2),
(205, 2),
(206, 2),
(207, 2),
(208, 2),
(209, 2),
(210, 2),
(210, 3),
(210, 4),
(211, 2),
(212, 2),
(213, 2),
(214, 2),
(215, 2),
(216, 2),
(216, 3),
(216, 4),
(217, 2),
(218, 2),
(219, 2),
(220, 2),
(221, 2),
(222, 2);

-- --------------------------------------------------------

--
-- Table structure for table `salons`
--

CREATE TABLE `salons` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `salon_level_id` int(10) UNSIGNED NOT NULL,
  `address_id` int(10) UNSIGNED NOT NULL,
  `description` longtext DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `mobile_number` varchar(50) DEFAULT NULL,
  `availability_range` double(9,2) DEFAULT 0.00,
  `available` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `accepted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `snapchat` longtext DEFAULT NULL,
  `tiktok` longtext DEFAULT NULL,
  `instagram` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salons`
--

INSERT INTO `salons` (`id`, `name`, `salon_level_id`, `address_id`, `description`, `phone_number`, `mobile_number`, `availability_range`, `available`, `featured`, `accepted`, `created_at`, `updated_at`, `snapchat`, `tiktok`, `instagram`) VALUES
(1, '{\"en\":\"Esthetics center Friesen Ltd\"}', 2, 11, '{\"en\":\"Est rerum est sit. Accusamus pariatur ipsum velit saepe sequi. Sint deleniti facilis aut facere consequatur magnam veniam.\"}', '+1-256-408-8402', '1-564-787-0939', 10911.39, 1, 1, 1, '2023-05-28 01:08:13', '2023-05-28 01:08:13', 'a7a', 'a7a', 'a7a'),
(2, '{\"en\":\"Waxing Gorczany-Herzog\"}', 3, 14, '{\"en\":\"Aliquam repellendus eveniet dolorem doloribus dolorum. Dolorem et ipsa autem. Distinctio quo minima eum in repellat provident. Accusamus quia sit est explicabo rem ab tenetur.\"}', '+1 (815) 932-9838', '(954) 944-2241', 14789.23, 1, 0, 1, '2023-05-28 01:08:13', '2023-05-28 01:08:13', NULL, NULL, NULL),
(3, '{\"en\":\"Spa Skin Care Ritchie-Zulauf\"}', 2, 15, '{\"en\":\"Sit ea blanditiis fuga labore. Sunt omnis earum quia aut qui dignissimos doloribus veritatis. Veniam dolor harum minima facilis fuga suscipit rem ut. Libero qui et ea a necessitatibus.\"}', '+16364508694', '838.758.8541', 7820.65, 1, 1, 1, '2023-05-28 01:08:13', '2023-05-28 01:08:13', NULL, NULL, NULL),
(4, '{\"en\":\"Miami Nail Wehner LLC\"}', 2, 14, '{\"en\":\"Ipsum omnis optio dolorum doloremque qui velit. Quis sequi et quis natus quam provident. Quisquam et eum aut et debitis numquam nulla.\"}', '931-212-9980', '(858) 433-8967', 10099.99, 1, 0, 1, '2023-05-28 01:08:13', '2023-05-28 01:08:13', NULL, NULL, NULL),
(5, '{\"en\":\"Miami Nail Purdy, Littel and Gulgowski\"}', 4, 6, '{\"en\":\"Non a assumenda sed repudiandae voluptas. Et libero quibusdam expedita dolorem. Sunt velit quisquam consequatur mollitia. Vel saepe beatae officiis corrupti nam quis.\"}', '+1 (516) 818-0095', '1-424-770-6966', 11023.10, 1, 0, 1, '2023-05-28 01:08:13', '2023-05-28 01:08:13', NULL, NULL, NULL),
(6, '{\"en\":\"Beauty Attraction Ledner, Donnelly and Feil\"}', 3, 15, '{\"en\":\"Quaerat aliquam quo occaecati veniam. Occaecati dolor atque molestiae aut. Ducimus veniam aut voluptate voluptatem est aliquid iure. Dolores culpa accusamus qui molestiae modi repellendus.\"}', '806-663-8467', '(682) 501-5664', 13958.89, 1, 1, 1, '2023-05-28 01:08:13', '2023-05-28 01:08:13', NULL, NULL, NULL),
(7, '{\"en\":\"Terra Bella Day Ortiz and Sons\"}', 2, 20, '{\"en\":\"Qui error iste amet veniam quae et voluptas. Quo in odit error. Sed architecto aut modi eos. Quae occaecati laborum voluptatem modi consectetur commodi ea qui.\"}', '954.581.1705', '+1 (726) 219-1758', 10017.62, 1, 0, 1, '2023-05-28 01:08:13', '2023-05-28 01:08:13', NULL, NULL, NULL),
(8, '{\"en\":\"Miami Nail Feest and Sons\"}', 2, 2, '{\"en\":\"Voluptatem ut et quia dolores ratione ea cupiditate. Distinctio laboriosam rem sit odio voluptatem voluptatibus eveniet.\"}', '475.672.6101', '(810) 966-7644', 6448.44, 1, 1, 1, '2023-05-28 01:08:13', '2023-05-28 01:08:13', NULL, NULL, NULL),
(9, '{\"en\":\"Royalty Nails Waelchi, Baumbach and Bahringer\"}', 2, 10, '{\"en\":\"Odio perspiciatis magnam vel architecto voluptatem rem. Commodi ab id nemo tenetur. Quis quasi suscipit et dolor. Aliquid accusantium deleniti velit accusantium ullam mollitia sed.\"}', '541.748.4498', '+18208186455', 12135.51, 1, 1, 1, '2023-05-28 01:08:13', '2023-05-28 01:08:13', NULL, NULL, NULL),
(10, '{\"en\":\"Miami Nail Kiehn PLC\"}', 3, 15, '{\"en\":\"Unde optio in non non. Id omnis aut assumenda ducimus voluptatem ad porro. Et et porro eveniet quia.\"}', '+16414789003', '+1 (609) 366-1691', 12693.66, 1, 1, 1, '2023-05-28 01:08:13', '2023-05-28 01:08:13', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `salon_levels`
--

CREATE TABLE `salon_levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `commission` double(5,2) NOT NULL DEFAULT 0.00,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salon_levels`
--

INSERT INTO `salon_levels` (`id`, `name`, `commission`, `disabled`, `default`, `created_at`, `updated_at`) VALUES
(2, 'Level One', 50.00, 0, 1, '2021-01-14 01:05:35', '2021-02-02 04:22:19'),
(3, 'Level Two', 75.00, 0, 0, '2021-01-18 02:27:18', '2021-02-25 01:57:30'),
(4, 'Level Three', 85.00, 0, 0, '2021-01-18 02:27:18', '2021-02-25 01:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `salon_payouts`
--

CREATE TABLE `salon_payouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `salon_id` int(10) UNSIGNED NOT NULL,
  `method` varchar(127) NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `paid_date` datetime NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_reviews`
--

CREATE TABLE `salon_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `review` text DEFAULT NULL,
  `rate` decimal(3,2) NOT NULL DEFAULT 0.00,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_taxes`
--

CREATE TABLE `salon_taxes` (
  `salon_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_users`
--

CREATE TABLE `salon_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `salon_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salon_users`
--

INSERT INTO `salon_users` (`user_id`, `salon_id`) VALUES
(2, 1),
(2, 4),
(2, 6),
(4, 1),
(4, 2),
(4, 4),
(4, 5),
(6, 1),
(6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` int(10) UNSIGNED NOT NULL,
  `order` int(10) UNSIGNED DEFAULT 0,
  `text` longtext DEFAULT NULL,
  `button` longtext DEFAULT NULL,
  `text_position` varchar(50) DEFAULT 'start',
  `text_color` varchar(36) DEFAULT NULL,
  `button_color` varchar(36) DEFAULT NULL,
  `background_color` varchar(36) DEFAULT NULL,
  `indicator_color` varchar(36) DEFAULT NULL,
  `image_fit` varchar(50) DEFAULT 'cover',
  `e_service_id` int(10) UNSIGNED DEFAULT NULL,
  `salon_id` int(10) UNSIGNED DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `order`, `text`, `button`, `text_position`, `text_color`, `button_color`, `background_color`, `indicator_color`, `image_fit`, `e_service_id`, `salon_id`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 1, 'Assign a Handyman at Work to Fix the Household', 'Discover It', 'bottom_start', '#333333', '#D94464', '#FFFFFF', '#333333', 'cover', NULL, NULL, 1, '2021-01-25 18:51:45', '2021-01-31 18:08:13'),
(2, 2, 'Fix the Broken Stuff by Asking for the Technicians', 'Repair', 'bottom_start', '#333333', '#D94464', '#FFFFFF', '#333333', 'cover', NULL, NULL, 1, '2021-01-25 21:23:49', '2021-01-31 18:03:05'),
(3, 3, 'Add Hands to Your Cleaning Chores', 'Book Now', 'bottom_start', '#333333', '#D94464', '#FFFFFF', '#333333', 'cover', NULL, NULL, 1, '2021-01-31 18:04:36', '2021-01-31 18:06:45');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `value` double(10,2) NOT NULL DEFAULT 0.00,
  `type` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Tax 20', 20.00, 'percent', '2021-01-15 18:12:13', '2021-02-02 04:23:01'),
(2, 'Tax 10', 10.00, 'percent', '2021-01-15 18:19:30', '2021-01-15 18:19:30'),
(3, 'Maintenance', 2.00, 'fixed', '2021-01-19 03:48:29', '2021-02-02 04:25:13'),
(4, 'Tools Fee', 5.00, 'fixed', '2021-02-02 04:24:12', '2021-02-02 04:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(24) DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `api_token` char(60) DEFAULT NULL,
  `device_token` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_number`, `phone_verified_at`, `email_verified_at`, `password`, `api_token`, `device_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hyatt Zimmerman', 'admin@demo.com', '+1 234 8996 321', '2022-01-11 00:22:10', '2022-01-11 00:22:10', '$2y$10$YOn/Xq6vfvi9oaixrtW8QuM2W0mawkLLqIxL.IoGqrsqOqbIsfBNu', 'PivvPlsQWxPl1bB5KrbKNBuraJit0PrUZekQUgtLyTRuyBq921atFtoR1HuA', '', 'fU74kiNeDsPSli77nLRFboCEmUOuK57tpt9SGSczqnmlebqgOODfO8HXjYrb', NULL, '2022-02-09 23:50:32'),
(2, 'Jennifer Paul', 'salon@demo.com', '+1 234 8996 322', '2022-01-11 00:22:10', '2022-01-11 00:22:10', '$2y$10$YOn/Xq6vfvi9oaixrtW8QuM2W0mawkLLqIxL.IoGqrsqOqbIsfBNu', 'tVSfIKRSX2Yn8iAMoUS3HPls84ycS8NAxO2dj2HvePbbr4WHorp4gIFRmFwB', '', 'TwyKlf5NJ0oG6l5FfFhbCKsdRWrjF6HCunV8nZn2U9OXhJJTZ2Jxx4EqAJPA', NULL, '2022-03-01 00:06:55'),
(3, 'Germaine Guzman', 'customer@demo.com', '+1 234 8996 323', '2022-01-11 00:22:10', '2022-01-11 00:22:10', '$2y$10$6rJXf2r9vfetz0VdvbQpvOtex1S7NSbsPhEKbWWjj145kKjjnoghS', 'fXLu7VeYgXDu82SkMxlLPG1mCAXc4EBIx6O5isgYVIKFQiHah0xiOHmzNsBv', '', 'SPz6luq3aoxCbgIS1gqmFDgM1qzGlIDtF0HgmDbtWcx2reaeFcogcFQzdP2F', NULL, '2022-02-25 04:52:57'),
(4, 'Aimee Mcgee', 'salon1@demo.com', '+1 234 8996 324', '2022-01-11 00:22:10', '2022-01-11 00:22:10', '$2y$10$pmdnepS1FhZUMqOaFIFnNO0spltJpziz3j13UqyEwShmLhokmuoei', 'Czrsk9rwD0c75NUPkzNXM2WvbxYHKj8p0nG29pjKT0PZaTgMVzuVyv4hOlte', '', 'yCzPqDP1oczySU57q6G71SxTIJSiZUBE4vYdXbXCqzpzC2iN09igcs3jzSQK', NULL, '2022-02-21 21:50:29'),
(5, 'Josephine Harding', 'customer3@demo.com', '+1 236 7887 263', '2022-01-11 00:22:10', '2022-01-11 00:22:10', '$2y$10$n/06hZG121ZGp3tSwDQS3uhsQKxEYspjKrn7kGlLxRinUZKiulrEm', 'gkEWScQHIol9EIRhP3m5m7JqnK5UvcGdEsKQJo7YeBcQawYFq3JAJ6SX9UKy', NULL, NULL, '2022-01-11 17:55:52', '2022-02-02 18:29:47'),
(6, 'Nicolette Christiansen', 'salon2@demo.com', '+1 228 8787 278', '2022-01-11 00:22:10', '2022-01-11 07:00:00', '$2y$04$WRpHC9iMxZ3f.gctQ4igsuZjsYfGjX7igVM8GsC2AMME3.4au3dYu', 'TKArYDDFHNiEI33sfExaBEhxHCs5kFaWP7EO6aNlUZfnqHrvsMCwsYeAk9s2', NULL, 'JbiYaHlRWGKkfITxH9qI87GzTMPf0zJ2Iw6NIdlS5dDvWuT5PC2sP5ELGwKx', '2022-01-11 18:33:59', '2022-02-02 18:30:56'),
(7, 'Rose Bauer', 'customer2@demo.com', '+1 259 9875 364', '2022-01-11 00:22:10', '2022-01-11 07:00:00', '$2y$10$3GhoIShzRdSXevYAh1NF/.67J3OshX9D2.sqY50o8kxh7EXPw7tuC', 'w6QJYqZyllY24AIR3nSsKqgj5eMSZevmgpSywwxJxUS9nwULcuriRLBxEXZC', '', 'WxYP9zjTBy9SYF5OWjcFbMt2Ob9r0bahBKzPDOtw9OrAJ89JqaMxkN5aqu8J', '2022-01-17 23:13:24', '2022-03-01 01:03:25'),
(8, 'admin', 'admin@app.elnagah-display.com', NULL, NULL, NULL, '$2y$10$EmyZPD9boCjwnW3RDN4vleQ6UsmYoThhKtDy3PDgn.Z7iSLodPYdK', 'mbxPTjzWD17wlLoQi2q3iNr86yalyoVEkpxpVDBQfwk8QehCzrrreiiGva2t', NULL, NULL, '2023-05-27 19:11:19', '2023-05-27 19:11:19'),
(9, 'amr', 'amr@amr.com', '01020159660', NULL, NULL, '$2y$10$0WtX45ed/T0U9UFfso8lCO6CruxI31ML7PihqREAcWmcwuFkGO/I2', 'phGQvCWN0U0vCeiLHFdSdVy6du8kapOH71wIK5ptPEFSdnMQMsavfOYbL181', '', NULL, '2023-06-01 11:49:35', '2023-06-01 11:49:35');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` char(36) NOT NULL,
  `name` varchar(191) NOT NULL,
  `balance` double(16,2) NOT NULL DEFAULT 0.00,
  `currency` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `name`, `balance`, `currency`, `user_id`, `enabled`, `created_at`, `updated_at`) VALUES
('01194a4f-f302-47af-80b2-ceb2075d36dc', 'My USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 1, 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('02194a4f-f302-47af-80b2-ceb2075d36dc', 'Home USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 2, 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('03194a4f-f302-47af-80b2-ceb2075d36dc', 'Work USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 3, 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('04194a4f-f302-47af-80b2-ceb2075d36dc', 'Dummy USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 4, 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('05194a4f-f302-47af-80b2-ceb2075d36dc', 'Old USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 5, 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('06194a4f-f302-47af-80b2-ceb2075d36dc', 'New USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 6, 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('07194a4f-f302-47af-80b2-ceb2075d36dc', 'USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 7, 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('8d194a4f-f302-47af-80b2-ceb2075d36dc', 'Dollar Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 8, 1, '2021-01-07 20:17:34', '2021-01-07 20:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` char(36) NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `description` varchar(255) DEFAULT NULL,
  `action` enum('credit','debit') NOT NULL,
  `wallet_id` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_transactions`
--

INSERT INTO `wallet_transactions` (`id`, `amount`, `description`, `action`, `wallet_id`, `user_id`, `created_at`, `updated_at`) VALUES
('01194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '01194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('02194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '02194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('03194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '03194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('04194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '04194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('05194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '05194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('06194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '06194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('07194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '07194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('8d194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '8d194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_settings_key_index` (`key`);

--
-- Indexes for table `availability_hours`
--
ALTER TABLE `availability_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `availability_hours_salon_id_foreign` (`salon_id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awards_salon_id_foreign` (`salon_id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_employee_id_foreign` (`employee_id`),
  ADD KEY `bookings_booking_status_id_foreign` (`booking_status_id`),
  ADD KEY `bookings_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `booking_statuses`
--
ALTER TABLE `booking_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_values_custom_field_id_foreign` (`custom_field_id`);

--
-- Indexes for table `custom_pages`
--
ALTER TABLE `custom_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discountables`
--
ALTER TABLE `discountables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discountables_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `earnings_salon_id_foreign` (`salon_id`);

--
-- Indexes for table `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `experiences_salon_id_foreign` (`salon_id`);

--
-- Indexes for table `e_services`
--
ALTER TABLE `e_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_services_salon_id_foreign` (`salon_id`);

--
-- Indexes for table `e_service_categories`
--
ALTER TABLE `e_service_categories`
  ADD PRIMARY KEY (`e_service_id`,`category_id`),
  ADD KEY `e_service_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_faq_category_id_foreign` (`faq_category_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_e_service_id_foreign` (`e_service_id`),
  ADD KEY `favorites_user_id_foreign` (`user_id`);

--
-- Indexes for table `favorite_options`
--
ALTER TABLE `favorite_options`
  ADD PRIMARY KEY (`option_id`,`favorite_id`),
  ADD KEY `favorite_options_favorite_id_foreign` (`favorite_id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_salon_id_foreign` (`salon_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_e_service_id_foreign` (`e_service_id`),
  ADD KEY `options_option_group_id_foreign` (`option_group_id`);

--
-- Indexes for table `option_groups`
--
ALTER TABLE `option_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `payments_payment_status_id_foreign` (`payment_status_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_statuses`
--
ALTER TABLE `payment_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `salons`
--
ALTER TABLE `salons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salons_salon_level_id_foreign` (`salon_level_id`),
  ADD KEY `salons_address_id_foreign` (`address_id`);

--
-- Indexes for table `salon_levels`
--
ALTER TABLE `salon_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon_payouts`
--
ALTER TABLE `salon_payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salon_payouts_salon_id_foreign` (`salon_id`);

--
-- Indexes for table `salon_reviews`
--
ALTER TABLE `salon_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salon_reviews_booking_id_foreign` (`booking_id`);

--
-- Indexes for table `salon_taxes`
--
ALTER TABLE `salon_taxes`
  ADD PRIMARY KEY (`salon_id`,`tax_id`),
  ADD KEY `salon_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `salon_users`
--
ALTER TABLE `salon_users`
  ADD PRIMARY KEY (`user_id`,`salon_id`),
  ADD KEY `salon_users_salon_id_foreign` (`salon_id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slides_e_service_id_foreign` (`e_service_id`),
  ADD KEY `slides_salon_id_foreign` (`salon_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_transactions_wallet_id_foreign` (`wallet_id`),
  ADD KEY `wallet_transactions_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `availability_hours`
--
ALTER TABLE `availability_hours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking_statuses`
--
ALTER TABLE `booking_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `custom_pages`
--
ALTER TABLE `custom_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `discountables`
--
ALTER TABLE `discountables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `e_services`
--
ALTER TABLE `e_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `option_groups`
--
ALTER TABLE `option_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment_statuses`
--
ALTER TABLE `payment_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salons`
--
ALTER TABLE `salons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `salon_levels`
--
ALTER TABLE `salon_levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salon_payouts`
--
ALTER TABLE `salon_payouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salon_reviews`
--
ALTER TABLE `salon_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `availability_hours`
--
ALTER TABLE `availability_hours`
  ADD CONSTRAINT `availability_hours_salon_id_foreign` FOREIGN KEY (`salon_id`) REFERENCES `salons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `awards_salon_id_foreign` FOREIGN KEY (`salon_id`) REFERENCES `salons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_booking_status_id_foreign` FOREIGN KEY (`booking_status_id`) REFERENCES `booking_statuses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `bookings_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discountables`
--
ALTER TABLE `discountables`
  ADD CONSTRAINT `discountables_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `earnings`
--
ALTER TABLE `earnings`
  ADD CONSTRAINT `earnings_salon_id_foreign` FOREIGN KEY (`salon_id`) REFERENCES `salons` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `experiences`
--
ALTER TABLE `experiences`
  ADD CONSTRAINT `experiences_salon_id_foreign` FOREIGN KEY (`salon_id`) REFERENCES `salons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_services`
--
ALTER TABLE `e_services`
  ADD CONSTRAINT `e_services_salon_id_foreign` FOREIGN KEY (`salon_id`) REFERENCES `salons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_service_categories`
--
ALTER TABLE `e_service_categories`
  ADD CONSTRAINT `e_service_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_service_categories_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite_options`
--
ALTER TABLE `favorite_options`
  ADD CONSTRAINT `favorite_options_favorite_id_foreign` FOREIGN KEY (`favorite_id`) REFERENCES `favorites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_salon_id_foreign` FOREIGN KEY (`salon_id`) REFERENCES `salons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `options_option_group_id_foreign` FOREIGN KEY (`option_group_id`) REFERENCES `option_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_payment_status_id_foreign` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salons`
--
ALTER TABLE `salons`
  ADD CONSTRAINT `salons_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salons_salon_level_id_foreign` FOREIGN KEY (`salon_level_id`) REFERENCES `salon_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salon_payouts`
--
ALTER TABLE `salon_payouts`
  ADD CONSTRAINT `salon_payouts_salon_id_foreign` FOREIGN KEY (`salon_id`) REFERENCES `salons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salon_reviews`
--
ALTER TABLE `salon_reviews`
  ADD CONSTRAINT `salon_reviews_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salon_taxes`
--
ALTER TABLE `salon_taxes`
  ADD CONSTRAINT `salon_taxes_salon_id_foreign` FOREIGN KEY (`salon_id`) REFERENCES `salons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salon_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salon_users`
--
ALTER TABLE `salon_users`
  ADD CONSTRAINT `salon_users_salon_id_foreign` FOREIGN KEY (`salon_id`) REFERENCES `salons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salon_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `slides_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `slides_salon_id_foreign` FOREIGN KEY (`salon_id`) REFERENCES `salons` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD CONSTRAINT `wallet_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wallet_transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
