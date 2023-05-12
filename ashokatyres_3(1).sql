
CREATE TABLE `ads_mst` (
  `adsm_id` int(15) NOT NULL,
  `adsm_name` varchar(250) NOT NULL COMMENT 'Unique name for each Ads',
  `adsm_desc` text DEFAULT NULL,
  `adsm_lnk` varchar(250) DEFAULT NULL,
  `adsm_img` varchar(250) DEFAULT NULL,
  `adsm_sts` char(1) NOT NULL COMMENT 'Status of each Ads',
  `adsm_prty` int(15) DEFAULT NULL COMMENT 'Priority of each Ads',
  `adsm_crtdon` date DEFAULT NULL COMMENT 'Date on which the Ads is created',
  `adsm_crtdby` varchar(250) DEFAULT NULL COMMENT 'By whom the Ads is created',
  `adsm_mdfdon` date DEFAULT NULL COMMENT 'Date on which the Ads is modified',
  `adsm_mdfdby` varchar(250) DEFAULT NULL COMMENT 'By whom the Ads is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ads_mst`
--

INSERT INTO `ads_mst` (`adsm_id`, `adsm_name`, `adsm_desc`, `adsm_lnk`, `adsm_img`, `adsm_sts`, `adsm_prty`, `adsm_crtdon`, `adsm_crtdby`, `adsm_mdfdon`, `adsm_mdfdby`) VALUES
(1, '*', '', 'http://www.ektagarments.com/services.php', 'adsimg53bfa2e73c86d.jpg', 'i', 1, '2014-07-10', 'admin', '2020-09-28', 'admin'),
(2, '1', '', 'http://ektagarments.com/services.php', 'adsimg53f5ac7adfc0b.jpg', 'i', 2, '2014-08-21', 'admin', NULL, NULL),
(3, 'emi poster', '<p><ins><span style=\"font-size:16px\"><span style=\"font-family:times new roman,times,serif\"><span style=\"background-color:#FFFFFF\">As a customer benifecial scheme launched by ekta garments which provides its consumers a payment option of over 12 months!!</span></span></span></ins></p>\r\n\r\n<p><span style=\"font-family:times new roman,times,serif\"><ins><span style=\"font-size:16px\"><span style=\"background-color:#FFFFFF\">Just puchase goods to sell and be relaxed for the payment of purchases. pay easy monthly installments at your convinience.</span></span></ins></span></p>', 'gallery.php?phtcat=13', 'adsimg541e70a21a4b1.jpg', 'a', 1, '2014-09-21', 'admin', '2014-10-01', 'admin'),
(4, 'vat', '<p><span style=\"font-family:times new roman,times,serif\">Get value added tax (VAT) of garments just at 4% instead of 5% at <strong>EKTA GARMENTS.</strong></span></p>', 'gallery.php?phtcat=13', 'adsimg541e714b8a49b.jpg', 'i', 2, '2014-09-21', 'admin', '2014-10-01', 'admin'),
(5, 'venga logo', '', '', 'adsimg5f3ce971dc133.jpg', 'a', 1, '2020-08-19', 'admin', NULL, NULL),
(6, 'shop photo', '', '', 'adsimg5f3ce97f97b3d.jpg', 'a', 2, '2020-08-19', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bnr_mst`
--

CREATE TABLE `bnr_mst` (
  `bnrm_id` int(11) NOT NULL,
  `bnrm_name` varchar(250) NOT NULL,
  `bnrm_desc` text DEFAULT NULL,
  `bnrm_imgnm` varchar(250) DEFAULT NULL,
  `bnrm_lnk` varchar(250) DEFAULT NULL,
  `bnrm_prty` int(15) DEFAULT NULL,
  `bnrm_sts` char(1) DEFAULT NULL,
  `bnrm_crtdon` datetime DEFAULT NULL,
  `bnrm_crtdby` varchar(250) DEFAULT NULL,
  `bnrm_mdfdon` datetime DEFAULT NULL,
  `bnrm_mdfdby` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bnr_mst`
--

INSERT INTO `bnr_mst` (`bnrm_id`, `bnrm_name`, `bnrm_desc`, `bnrm_imgnm`, `bnrm_lnk`, `bnrm_prty`, `bnrm_sts`, `bnrm_crtdon`, `bnrm_crtdby`, `bnrm_mdfdon`, `bnrm_mdfdby`) VALUES
(13, 'Banner1', '', 'simg5f7b498403291.jpg', '', 10, 'a', '2020-04-10 01:54:01', 'admin', '2020-10-05 04:27:48', 'admin'),
(14, 'Banner2', '', 'simg5f7b49a12eeee.jpg', '', 20, 'a', '2020-04-10 01:54:23', 'admin', '2020-10-05 04:28:17', 'admin'),
(23, 'NEW YEAR&#039;S EVE', '', 'simg61c80659a729c.jpg', '', 250, 'a', '2021-12-26 06:06:17', 'admin', NULL, NULL),
(25, 'Banner99', 'banner99', 'bnrimg61d596a67cf1a.jpg', '123', 100, 'i', '2022-01-05 01:01:26', 'admin', '2022-01-05 01:25:19', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cntnt_mst`
--

CREATE TABLE `cntnt_mst` (
  `cntntm_id` int(15) NOT NULL,
  `cntntm_name` varchar(250) NOT NULL,
  `cntntm_iso` varchar(250) DEFAULT NULL,
  `cntntm_prty` int(15) DEFAULT NULL,
  `cntntm_sts` char(1) DEFAULT NULL,
  `cntntm_crtdon` datetime DEFAULT NULL,
  `cntntm_crtdby` varchar(250) DEFAULT NULL,
  `cntntm_mdfdon` datetime DEFAULT NULL,
  `cntntm_mdfdby` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cntry_mst`
--

CREATE TABLE `cntry_mst` (
  `cntrym_id` int(15) NOT NULL,
  `cntrym_name` varchar(250) NOT NULL COMMENT 'Name of the country',
  `cntrym_isothr` varchar(250) NOT NULL,
  `cntrym_isotwo` varchar(250) NOT NULL,
  `cntrym_cntntm_id` int(15) NOT NULL,
  `cntrym_isonum` varchar(250) NOT NULL,
  `cntrym_sts` char(1) DEFAULT NULL COMMENT 'Status of the country',
  `cntrym_prty` int(15) DEFAULT NULL COMMENT 'Priority of the country',
  `cntrym_crtdon` date DEFAULT NULL COMMENT 'Date on which the country is created',
  `cntrym_crtdby` varchar(250) DEFAULT NULL COMMENT 'By Whom the country is created',
  `cntrym_mdfdon` date DEFAULT NULL COMMENT 'Date on which the country is modified',
  `cntrym_mdfdby` varchar(250) DEFAULT NULL COMMENT 'By whom the country is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cntry_mst`
--

INSERT INTO `cntry_mst` (`cntrym_id`, `cntrym_name`, `cntrym_isothr`, `cntrym_isotwo`, `cntrym_cntntm_id`, `cntrym_isonum`, `cntrym_sts`, `cntrym_prty`, `cntrym_crtdon`, `cntrym_crtdby`, `cntrym_mdfdon`, `cntrym_mdfdby`) VALUES
(8, 'Afghanistan', 'AFG', 'AF', 3, '004', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(11, 'Aland Islands', 'ALA', 'AX', 0, '248', 'a', NULL, '2012-03-27', 'admin', NULL, NULL),
(12, 'Albania', 'ALB', 'AL', 5, '008', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(56, 'Algeria', 'DZA', 'DZ', 1, '012', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(17, 'American Samoa', 'ASM', 'AS', 4, '016', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(13, 'Andorra', 'AND', 'AD', 5, '020', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(9, 'Angola', 'AGO', 'AO', 1, '024', 'a', 10, '2012-03-27', 'admin', '2014-06-30', 'admin'),
(10, 'Anguilla', 'AIA', 'AI', 6, '660', 'a', NULL, '2012-03-27', 'admin', '2014-02-11', 'admin'),
(18, 'Antarctica', 'ATA', 'AQ', 2, '010', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(20, 'Antigua and Barbuda', 'ATG', 'AG', 6, '028', 'a', NULL, '2012-03-27', 'admin', '2014-02-11', 'admin'),
(15, 'Argentina', 'ARG', 'AR', 7, '032', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(16, 'Armenia', 'ARM', 'AM', 4, '051', 'a', NULL, '2012-03-27', 'admin', '2014-02-11', 'admin'),
(7, 'Aruba', 'ABW', 'AW', 6, '533', 'a', NULL, '2012-03-27', 'admin', '2014-02-11', 'admin'),
(21, 'Australia', 'AUS', 'AU', 4, '036', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(22, 'Austria', 'AUT', 'AT', 5, '040', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(23, 'Azerbaijan', 'AZE', 'AZ', 3, '031', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(57, 'Azores', '', 'PT', 5, '', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(31, 'Bahamas', 'BHS', 'BS', 6, '044', 'a', NULL, '2012-03-27', 'admin', '2014-02-11', 'admin'),
(30, 'Bahrain', 'BHR', 'BH', 3, '048', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', 'admin'),
(28, 'Bangladesh', 'BGD', 'BD', 3, '050', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(38, 'Barbados', 'BRB', 'BB', 6, '052', 'a', NULL, '2012-03-27', 'admin', '2014-02-11', 'admin'),
(59, 'Barbuda', 'ATG', 'AG', 6, '1 268', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(34, 'Belarus', 'BLR', 'BY', 5, '112', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(25, 'Belgium', 'BEL', 'BE', 5, '056', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(35, 'Belize', 'BLZ', 'BZ', 6, '084', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(26, 'Benin', 'BEN', 'BJ', 1, '204', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(36, 'Bermuda', 'BMU', 'BM', 6, '060', 'a', NULL, '2012-03-27', 'admin', '2014-02-11', 'admin'),
(40, 'Bhutan', 'BTN', 'BT', 3, '064', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(60, 'Bolivia', 'BOL', 'BO', 7, '068', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(32, 'Bosnia and Herzegovina', 'BIH', 'BA', 5, '070', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(42, 'Botswana', 'BWA', 'BW', 4, '072', 'a', NULL, '2012-03-27', 'admin', '2014-02-11', 'admin'),
(41, 'BOUVET Island', 'BVT', 'BV', 0, '074', 'a', NULL, '2012-03-27', 'admin', NULL, NULL),
(37, 'Brazil', 'BRA', 'BR', 7, '076', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(39, 'Brunei Darussalam', 'BRM', 'BN', 3, '096', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(29, 'Bulgaria', 'BGR', 'BG', 5, '100', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(27, 'Burkina Faso', 'BFA', 'BF', 1, '854', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(24, 'Burundi', 'BDI', 'BI', 1, '108', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(61, 'Cambodia', 'KHM', 'KH', 3, '116', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(49, 'Cameroon', 'CMR', 'CM', 1, '120', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(44, 'Canada', 'CAN', 'CA', 6, '124', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(62, 'Canary Islands', 'IC', '', 5, '', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(54, 'Cape Verde', 'CPV', 'CV', 1, '132', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(64, 'Cayman Island', 'CYM', 'KY', 6, '136', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(43, 'Central African Republic', 'CAF', 'CF', 1, '14', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(63, 'Chad', 'TCD', 'TD', 1, '148', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(47, 'Chile', 'CHL', 'CL', 7, '152', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(48, 'China', 'CHN', 'CN', 3, '156', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(65, 'Christmas Island', 'CXR', 'CX', 3, '162', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(45, 'Cocos (Keeling) Islands', 'CCK', 'CC', 3, '166', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', 'admin'),
(52, 'Colombia', 'COL', 'CO', 7, '170', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(53, 'Comoros', 'COM', 'KM', 1, '174', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(50, 'Congo', 'COG', 'CG', 1, '178', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(51, 'Cook Islands', 'COK', 'CK', 4, '184', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', 'admin'),
(66, 'Costa Rica', 'CRI', 'CR', 6, '188', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(67, 'Croatia (local name: Hrvatska)', 'HRV', 'HR', 5, '191', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(68, 'Cuba', 'CUB', 'CU', 6, '192', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', 'admin'),
(69, 'Cyprus', 'CYP', 'CY', 5, '196', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(70, 'Czech Republic', 'CZE', 'CZ', 5, '203', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(71, 'Dem Republic of Congo', 'COG', 'CG', 1, '242', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(72, 'Denmark', 'DNK', 'DK', 5, '208', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(73, 'Djibouti', 'DJI', 'DJ', 1, '262', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(74, 'Dominica', 'DMA', 'DM', 6, '212', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(75, 'Dominican Republic', 'DOM', 'DO', 6, '214', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(76, 'Ecuador', 'ECU', 'EC', 7, '218', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(77, 'Egypt', 'EGY', 'EG', 1, '818', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(78, 'EL Salvador', 'SLV', 'SV', 6, '222', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(79, 'Equatorial Guinea', 'GNQ', 'GQ', 1, '226', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', 'admin'),
(80, 'Eritrea', 'ERI', 'ER', 1, '232', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(81, 'Estonia', 'EST', 'EE', 5, '233', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(82, 'Ethiopia', 'ETH', 'ET', 1, '231', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(83, 'Faroe Islands', 'FRO', 'FO', 7, '234', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(84, 'Fiji', 'FJI', 'FJ', 6, '242', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(85, 'Finland', 'FIN', 'FI', 5, '246', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(86, 'France', 'FRA', 'FR', 5, '250', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(87, 'French Guiana', 'GUF', 'GF', 7, '254', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(88, 'French Polynesia', 'PYF', 'PF', 6, '258', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(19, 'French Southern Territories', 'ATF', 'TF', 5, '260', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(89, 'Gabon', 'GAB', 'GA', 1, '266', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(90, 'Gambia', 'GMB', 'GM', 1, '270', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(91, 'Georgia', 'GEO', 'GE', 5, '268', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(92, 'Germany', 'DEU', 'DE', 5, '276', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(93, 'Ghana', 'GHA', 'GH', 1, '288', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(94, 'Gibraltar', 'GIB', 'GI', 5, '292', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(95, 'Greece', 'GRC', 'GR', 5, '300', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(96, 'GreenLand', 'GRL', 'GL', 6, '304', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(97, 'Grenada', 'GRD', 'GD', 6, '308', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(98, 'Guadeloupe', 'GLP', 'GP', 6, '312', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(99, 'Guam', 'GUM', 'GU', 3, '316', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(100, 'Guatemala', 'GTM', 'GT', 6, '320', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(101, 'Guinea', 'GIN', 'GN', 1, '324', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(102, 'Guinea-Bissau', 'GNB', 'GW', 1, '624', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(103, 'Guyana', 'GUY', 'GY', 7, '328', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(104, 'Haiti', 'HTI', 'HT', 6, '332', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(105, 'Honduras', 'HND', 'HN', 6, '340', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(106, 'Hong Kong', 'HKG', 'HK', 3, '344', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(107, 'Hungary', 'HUN', 'HU', 5, '348', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(108, 'Iceland', 'ISL', 'IS', 5, '352', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(2, 'India', 'IND', 'IN', 3, '356', 'a', NULL, '2011-08-26', 'admhitlooks', '2014-03-03', 'admin'),
(109, 'Indonesia', 'IDN', 'ID', 3, '360', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(110, 'Iran', 'IRN', 'IR', 3, '364', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(111, 'Iraq', 'IRQ', 'IQ', 3, '368', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(112, 'Ireland', 'IRL', 'IE', 5, '372', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(113, 'Isle of man', 'IMN', 'IM', 5, '833', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(114, 'Israel', 'ISR', 'IL', 3, '376', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(115, 'Italy', 'ITA', 'IT', 5, '380', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(116, 'Ivory coast', 'CIV', '', 1, '', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(117, 'Jamaica', 'JAM', 'JM', 6, '388', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(118, 'Japan(Documents)', 'JPN', 'JP', 3, '392', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(119, 'Japan(Dutiables)', 'JPN', 'JP', 3, '392', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(120, 'Japan(Excluding Okinawa)', 'JPN', 'JP', 3, '392', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(121, 'Jordan', 'JOR', 'JO', 3, '400', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(122, 'Kazakhstan', 'KAZ', 'KZ', 3, '398', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(123, 'Kenya', 'KEN', 'KE', 1, '404', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(124, 'Kiribati', 'KIR', 'KI', 6, '296', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(125, 'Korea South', 'KOR', 'KR', 3, '82', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(126, 'Kuwait', 'KWT', 'KW', 3, '414', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(127, 'Kyrgyzstan', 'KGZ', 'KG', 3, '417', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(128, 'Laos', 'LAO', 'LA', 3, '418', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(129, 'Latvia', 'LVA', 'LV', 5, '428', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(130, 'Lebanon', 'LBN', 'LB', 3, '422', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(131, 'Lesotho', 'LSO', 'LS', 1, '426', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(132, 'Liberia', 'LBR', 'LR', 1, '430', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', 'admin'),
(133, 'Libya', 'LBY', 'LY', 3, '434', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(134, 'Liechtenstein', 'LIE', 'LI', 5, '438', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(135, 'Lithuania', 'LTU', 'LT', 5, '440', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(136, 'Luxembourg', 'LUX', 'LU', 5, '442', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(137, 'Macau', 'MAC', 'MO', 3, '446', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(138, 'Macedonia', 'MAD', 'MK', 5, '807', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(139, 'Madagascar', 'MDG', 'MG', 1, '450', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(140, 'Madeira Island', 'PRT', 'PT', 5, '351', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(141, 'Malawi', 'MWI', 'MW', 1, '454', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', 'admin'),
(55, 'Malaysia', 'MYS', 'MY', 3, '458', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(142, 'Maldives', 'MDV', 'MV', 3, '462', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(143, 'Mali', 'MLI', 'ML', 1, '466', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(144, 'Malta (Excluding Gozo &amp; Comino Island)', 'MLT', 'MT', 5, '356', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(145, 'Malta Island (Gozo &amp; Comino)', 'MLT', 'MT', 5, '356', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(146, 'Martinique', 'MTQ', 'MQ', 6, '474', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(147, 'Mauritania', 'MRT', 'MR', 1, '478', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(148, 'Mauritius', 'MUS', 'MU', 1, '480', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(149, 'Mexico', 'MEX', 'MX', 6, '484', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', 'admin'),
(150, 'Moldova', 'MDA', 'MD', 5, '498', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(151, 'Monaco', 'MCO', 'MC', 5, '492', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(152, 'Mongolia', 'MNG', 'MN', 3, '496', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', 'admin'),
(153, 'Montenegro', 'MNE', 'ME', 5, '499', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(154, 'Montserrat', 'MSR', 'MS', 6, '500', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(155, 'Morocco', 'MAR', 'MA', 1, '504', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(156, 'Mozambique', 'MOZ', 'MZ', 1, '508', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(157, 'Myanmar', 'MMR', 'MM', 3, '95', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(158, 'Nambia', 'NAM', 'NA', 1, '516', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(159, 'Nauru', 'NRU', 'NR', 4, '520', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(160, 'Nepal', 'NPL', 'NP', 3, '524', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(161, 'Netherlands', 'NLD', 'NL', 5, '528', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(162, 'Netherlands Antilles', 'ANT', 'AN', 7, '599', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(163, 'New Caledonia', 'NCL', 'NC', 0, '540', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(164, 'New Zealand', 'NZL', 'NZ', 4, '554', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(165, 'Nicaragua', 'NIC', 'NI', 6, '558', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(166, 'Niger', 'NER', 'NE', 1, '562', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(167, 'Nigeria', 'NGA', 'NG', 1, '566', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(168, 'Northern Ireland', 'IRL', 'IE', 5, '353', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(169, 'Northern Mariana Islands', 'MNP', 'MP', 4, '580', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(170, 'Norway', 'NOR', 'NO', 5, '578', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(171, 'Oman', 'OMN', 'OM', 3, '512', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(172, 'Pakistan', 'PAK', 'PK', 3, '586', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(173, 'Palau', 'PLW', 'PW', 4, '585', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(174, 'palestine', 'PSE', 'PS', 3, '275', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(175, 'Panama', 'PAN', 'PA', 6, '591', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(176, 'Papua New Guinea', 'PNG', 'PG', 4, '598', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', 'admin'),
(177, 'Paraguay', 'PRY', 'PY', 7, '600', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(178, 'Peru', 'PER', 'PE', 7, '604', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(179, 'Philippines', 'PHL', 'PH', 3, '608', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(180, 'Pitcairn Island', 'PCN', 'PN', 4, '612', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(181, 'Poland', 'POL', 'PL', 5, '616', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(182, 'Portugal', 'PRT', 'PT', 5, '620', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(183, 'Puerto Rico', 'PRI', 'PR', 6, '630', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(184, 'Qatar', 'QAT', 'QA', 3, '634', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(186, 'RÃ©union Island', 'REU', 'RE', 1, '638', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(185, 'Republic Of Serbia', 'SRB', 'RS', 5, '688', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(187, 'Romania', 'ROU', 'RO', 5, '642', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(188, 'Russia', 'RUS', 'RU', 4, '643', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(189, 'Rwanda', 'RWA', 'RW', 1, '646', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(190, 'Samoa', 'WSM', 'WS', 4, '882', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(191, 'San Marino', 'SMR', 'SM', 5, '674', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(192, 'Saudi Arabia', 'SAU', 'SA', 3, '682', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(193, 'Senegal', 'SEN', 'SN', 1, '686', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(194, 'Seychelles', 'SYC', 'SC', 1, '690', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(195, 'Sierra Leone', 'SLE', 'SL', 1, '694', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(196, 'Singapore', 'SGP', 'SG', 3, '702', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(197, 'Slovakia', 'SVK', 'SK', 5, '703', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(198, 'Slovenia', 'SVN', 'SI', 5, '705', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(199, 'Solomon Islands', 'SLB', 'SB', 4, '090', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(200, 'Somalia', 'SOM', 'SO', 1, '706', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', 'admin'),
(201, 'South Africa', 'ZAF', 'ZA', 1, '710', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(202, 'South Sudan', 'SSD', 'SS', 1, '728', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', 'admin'),
(203, 'Spain', 'ESP', 'ES', 5, '724', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(204, 'Sri Lanka', 'LKA', 'LK', 3, '144', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(206, 'ST Kitts and Nevis', 'KNA', 'KN', 6, '1 869', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(207, 'ST Lucia', 'LCA', 'LC', 6, '1 758', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(205, 'ST Vincent and Grenadine', 'VCT', 'VC', 6, '1 784', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(208, 'Sudan', 'SDN', 'SD', 1, '729', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(210, 'Swaziland', 'SWZ', 'SZ', 1, '748', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(209, 'Sweden', 'SWE', 'SE', 5, '752', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(46, 'Switzerland', 'CHE', 'CH', 5, '756', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(211, 'Syria', 'SYR', 'SY', 3, '760', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(212, 'Taiwan', 'TWN', 'TW', 3, '158', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(213, 'Tajikistan', 'TJK', 'TJ', 3, '762', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(214, 'Tanzania', 'TZA', 'TZ', 1, '834', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(239, 'test', 'te', 'te', 3, 'csadf', 'a', 1, '2014-06-30', 'admin', NULL, NULL),
(215, 'Thailand', 'THA', 'TH', 3, '764', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(216, 'Togo', 'TGO', 'TG', 1, '768', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(217, 'Tonga', 'TON', 'TO', 0, '776', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(218, 'Trinidad and Tobago', 'TTO', 'TT', 6, '780', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(219, 'Tunisia', 'TUN', 'TN', 1, '788', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(220, 'Turkey', 'TUR', 'TR', 3, '792', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(221, 'Turkmenistan', 'TKM', 'TM', 3, '795', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(222, 'Turks and Caicos Islands', 'TCA', 'TC', 6, '796', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(223, 'Tuvalu', 'TUV', 'TV', 4, '798', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(224, 'Uganda', 'UGA', 'UG', 1, '800', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(225, 'Ukraine', 'UKR', 'UA', 5, '804', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(14, 'United Arab Emirates', 'ARE', 'AE', 3, '784', 'a', NULL, '2012-03-27', 'admin', '2014-03-03', ''),
(226, 'United Kingdom', 'GBR', 'GB', 5, '826', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(3, 'United States', 'USA', 'US', 6, '840', 'a', NULL, '2011-08-26', 'admhitlooks', '2014-03-03', ''),
(227, 'Uruguay', 'URY', 'UY', 7, '858', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(228, 'Uzbekistan', 'UZB', 'UZ', 3, '860', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(229, 'Vanuatu', 'VUT', 'VU', 7, '548', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(230, 'Vatican City', 'VAT', 'VA', 5, '39', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(231, 'Venezuela', 'VEN', 'VE', 4, '58', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(232, 'Viet Nam', 'VNM', 'VN', 3, '704', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(233, 'Virgin Islands, British', 'VGB', 'VG', 6, '092', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(234, 'Virgin Islands, U.S.', 'VIR', 'VI', 6, '850', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(235, 'Wallis and Futuna Island', 'WLF', 'WF', 4, '876', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(236, 'Yemen', 'YEM', 'YE', 3, '887', 'a', NULL, '2014-02-11', 'admin', NULL, NULL),
(237, 'Zambia', 'ZMB', 'ZM', 1, '894', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', ''),
(238, 'Zimbabwe', 'ZWE', 'ZW', 1, '716', 'a', NULL, '2014-02-11', 'admin', '2014-03-03', '');

-- --------------------------------------------------------

--
-- Table structure for table `cnty_mst`
--

CREATE TABLE `cnty_mst` (
  `cntym_id` int(15) NOT NULL,
  `cntym_name` varchar(250) NOT NULL COMMENT 'Name of the county',
  `cntym_cntrym_id` int(15) NOT NULL COMMENT 'Refer cntry_mst > cntrym_id',
  `cntym_iso` varchar(250) NOT NULL,
  `cntym_sts` char(1) DEFAULT NULL COMMENT 'Status of the county',
  `cntym_prty` int(15) DEFAULT NULL COMMENT 'Priority of the county',
  `cntym_crtdon` date DEFAULT NULL COMMENT 'Date on which the county is created',
  `cntym_crtdby` varchar(250) DEFAULT NULL COMMENT 'By whom the county is created',
  `cntym_mdfdon` date DEFAULT NULL COMMENT 'Date on which the county is modified',
  `cntym_mdfdby` varchar(250) DEFAULT NULL COMMENT 'By whom the county is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cnty_mst`
--

INSERT INTO `cnty_mst` (`cntym_id`, `cntym_name`, `cntym_cntrym_id`, `cntym_iso`, `cntym_sts`, `cntym_prty`, `cntym_crtdon`, `cntym_crtdby`, `cntym_mdfdon`, `cntym_mdfdby`) VALUES
(1, 'Andhra Pradesh', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(2, 'Arunachal Pradesh', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(3, 'Assam', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(4, 'Bihar', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(5, 'Chandigarh', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(6, 'Chhattisgarh', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(7, 'Delhi', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(8, 'Goa', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(9, 'Gujarat', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(10, 'Haryana', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(11, 'Himachal Pradesh', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(12, 'Jammu and Kashmir', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(13, 'Jharkhand', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(14, 'Karnataka', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(15, 'Kerala', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(16, 'Madhya Pradesh', 2, '', 'a', NULL, '0000-00-00', 'admin', '0000-00-00', 'admin'),
(17, 'Maharashtra', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(18, 'Manipur', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(19, 'Meghalaya', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(20, 'Mizoram', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(21, 'Odisha', 2, '', 'a', 1, '0000-00-00', 'admin', NULL, NULL),
(22, 'orisha', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(23, 'Puducherry', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(24, 'Punjab', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(25, 'Rajasthan', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(26, 'Sikkim', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(27, 'Tamil Nadu', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(28, 'Telangana', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(29, 'Tripura', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(30, 'Uttar Pradesh', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(31, 'Uttarakhand', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(32, 'West Bengal', 2, '', 'a', NULL, '0000-00-00', 'admin', NULL, NULL),
(33, 'Other', 2, '', 'a', 0, '0000-00-00', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `crtord_dtl`
--

CREATE TABLE `crtord_dtl` (
  `crtordd_id` int(15) NOT NULL COMMENT 'Auto increment id for each order detail',
  `crtordd_sesid` varchar(250) DEFAULT NULL COMMENT 'Session id of the order',
  `crtordd_prodm_id` int(15) NOT NULL COMMENT 'Product id refers prod_mst -> prodm_id',
  `crtordd_prodprcd_id` int(15) NOT NULL,
  `crtord_splrm_lgnm_id` int(15) NOT NULL,
  `crtordd_clrm_id` int(15) NOT NULL,
  `crtordd_sizem_id` int(15) NOT NULL COMMENT 'Size of the product',
  `crtordd_fitm_id` int(15) NOT NULL,
  `crtordd_sizem_qty` int(15) NOT NULL,
  `crtordd_prc` double(10,2) DEFAULT NULL COMMENT 'Price of the product',
  `crtordd_qty` int(15) DEFAULT NULL COMMENT 'Quanity of the product',
  `crtordd_wt` double(10,2) DEFAULT NULL COMMENT 'Weight of the product',
  `crtordd_sts` char(1) DEFAULT NULL COMMENT 'Status of the product',
  `crtordd_crtordm_id` int(15) NOT NULL COMMENT 'order id of the order refers crtord_mst -> crtordm_id ',
  `crtordd_crtdper` double(10,2) DEFAULT NULL COMMENT 'Credit Percentage',
  `crtordd_crtdval` double(10,2) DEFAULT NULL COMMENT 'Credit Value',
  `crtordd_crtdon` datetime DEFAULT NULL COMMENT 'Date on which the record is created',
  `crtordd_crtdby` varchar(250) DEFAULT NULL COMMENT 'By whom the order is created',
  `crtordd_mdfdon` datetime DEFAULT NULL COMMENT 'Date on which the order is modified ',
  `crtordd_mdfdby` varchar(250) DEFAULT NULL COMMENT 'By whom the order is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `crtord_dtl`
--

INSERT INTO `crtord_dtl` (`crtordd_id`, `crtordd_sesid`, `crtordd_prodm_id`, `crtordd_prodprcd_id`, `crtord_splrm_lgnm_id`, `crtordd_clrm_id`, `crtordd_sizem_id`, `crtordd_fitm_id`, `crtordd_sizem_qty`, `crtordd_prc`, `crtordd_qty`, `crtordd_wt`, `crtordd_sts`, `crtordd_crtordm_id`, `crtordd_crtdper`, `crtordd_crtdval`, `crtordd_crtdon`, `crtordd_crtdby`, `crtordd_mdfdon`, `crtordd_mdfdby`) VALUES
(1, '840afa7abaf73afd8cb4a78089309a54', 26, 0, 0, 0, 1, 0, 1, 255.00, 100, NULL, 'a', 1, NULL, NULL, '2021-02-23 11:54:30', 'test@gmail.com', NULL, NULL),
(2, '840afa7abaf73afd8cb4a78089309a54', 21, 0, 0, 0, 1, 0, 1, 255.00, 1000, NULL, 'a', 2, NULL, NULL, '2021-02-23 03:05:58', 'subramanyampeddada@gmail.com', NULL, NULL),
(3, '138e0b7d841b200b06c25839b4c5802a', 197, 0, 0, 0, 1, 0, 1, 255.00, 20, NULL, 'a', 3, NULL, NULL, '2021-02-24 11:23:46', 'sravanstainely@gmail.com', NULL, NULL),
(4, '138e0b7d841b200b06c25839b4c5802a', 57, 0, 0, 0, 14, 0, 1, 255.00, 0, NULL, 'a', 3, NULL, NULL, '2021-02-24 11:23:46', 'sravanstainely@gmail.com', NULL, NULL),
(5, '66e1aa4e42e985bb3ea3ee84bfcfc924', 228, 0, 0, 0, 1, 0, 1, 255.00, 2, NULL, 'a', 4, NULL, NULL, '2021-02-24 01:42:04', 'subramanyampeddada@gmail.com', NULL, NULL),
(6, '66e1aa4e42e985bb3ea3ee84bfcfc924', 135, 0, 0, 0, 1, 0, 1, 255.00, 10, NULL, 'a', 4, NULL, NULL, '2021-02-24 01:42:04', 'subramanyampeddada@gmail.com', NULL, NULL),
(7, '138e0b7d841b200b06c25839b4c5802a', 228, 0, 0, 0, 50, 0, 1, 255.00, 50, NULL, 'a', 5, NULL, NULL, '2021-02-24 02:00:59', 'sravanstainely@gmail.com', NULL, NULL),
(8, '138e0b7d841b200b06c25839b4c5802a', 267, 0, 0, 0, 18, 0, 1, 365.00, 21, NULL, 'a', 6, NULL, NULL, '2021-02-24 02:06:53', 'sravanstainely@gmail.com', NULL, NULL),
(9, '66e1aa4e42e985bb3ea3ee84bfcfc924', 96, 0, 0, 0, 1, 0, 4, 45900.00, 45, NULL, 'a', 8, NULL, NULL, '2021-02-24 02:12:25', 'subramanyampeddada@gmail.com', NULL, NULL),
(10, '66e1aa4e42e985bb3ea3ee84bfcfc924', 64, 0, 0, 0, 1, 0, 4, 102000.00, 100, NULL, 'a', 9, NULL, NULL, '2021-02-24 04:19:50', 'subramanyampeddada@gmail.com', NULL, NULL),
(11, '8f0efe324e2754c894fca75067063385', 187, 0, 0, 0, 50, 0, 4, 51000.00, 50, NULL, 'a', 10, NULL, NULL, '2021-02-26 11:23:35', 'sravanstainely@gmail.com', NULL, NULL),
(12, '8af914d13d8bd190d358b95c6817e8d1', 170, 0, 0, 0, 1, 0, 4, 8160.00, 8, NULL, 'a', 11, NULL, NULL, '2021-03-02 11:26:14', 'ekta_garments@yahoo.co.in', NULL, NULL),
(13, '8af914d13d8bd190d358b95c6817e8d1', 196, 0, 0, 0, 1, 0, 4, 8160.00, 8, NULL, 'a', 11, NULL, NULL, '2021-03-02 11:26:14', 'ekta_garments@yahoo.co.in', NULL, NULL),
(14, '8af914d13d8bd190d358b95c6817e8d1', 252, 0, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 11, NULL, NULL, '2021-03-02 11:26:14', 'ekta_garments@yahoo.co.in', NULL, NULL),
(15, '092766bd8aac7ab02c79c65d59e5efe2', 176, 0, 0, 0, 20, 0, 4, 20400.00, 20, NULL, 'a', 12, NULL, NULL, '2021-03-03 10:00:26', 'mktg@adroitinfoactive.net', NULL, NULL),
(16, 'cfe5dfd4bae4e408f2be58b68409a30d', 255, 0, 0, 0, 1, 0, 4, 12800.00, 16, NULL, 'a', 13, NULL, NULL, '2021-03-03 11:01:08', 'mktg@adroitinfoactive.net', NULL, NULL),
(17, '77d29b1fbc798fe034d1b0968ee94aae', 176, 0, 0, 0, 1, 0, 4, 15300.00, 15, NULL, 'a', 14, NULL, NULL, '2021-03-03 11:39:22', 'mktg@adroitinfoactive.net', NULL, NULL),
(18, '77d29b1fbc798fe034d1b0968ee94aae', 46, 0, 0, 0, 1, 0, 4, 15300.00, 15, NULL, 'a', 14, NULL, NULL, '2021-03-03 11:39:22', 'mktg@adroitinfoactive.net', NULL, NULL),
(19, '77d29b1fbc798fe034d1b0968ee94aae', 93, 0, 0, 0, 1, 0, 4, 10200.00, 10, NULL, 'a', 14, NULL, NULL, '2021-03-03 11:39:22', 'mktg@adroitinfoactive.net', NULL, NULL),
(20, '77d29b1fbc798fe034d1b0968ee94aae', 197, 0, 0, 0, 1, 0, 4, 10200.00, 10, NULL, 'a', 14, NULL, NULL, '2021-03-03 11:39:22', 'mktg@adroitinfoactive.net', NULL, NULL),
(21, '4852c499611ee8ab4792ecbe4b305072', 65, 0, 0, 0, 1, 0, 4, 15300.00, 15, NULL, 'a', 15, NULL, NULL, '2021-03-12 06:32:35', 'mktg@adroitinfoactive.net', NULL, NULL),
(22, '4852c499611ee8ab4792ecbe4b305072', 152, 0, 0, 0, 20, 0, 4, 20400.00, 20, NULL, 'a', 16, NULL, NULL, '2021-03-12 06:33:43', 'mktg@adroitinfoactive.net', NULL, NULL),
(23, '4852c499611ee8ab4792ecbe4b305072', 152, 0, 0, 0, 15, 0, 4, 15300.00, 15, NULL, 'a', 17, NULL, NULL, '2021-03-12 06:36:01', 'mktg@adroitinfoactive.net', NULL, NULL),
(24, '987553120d8c4bf63fd59a6b808f93c9', 288, 0, 34, 0, 1, 0, 3, 90000.00, 100, NULL, 'a', 18, NULL, NULL, '2021-03-15 04:09:47', 'subramanyampeddada@gmail.com', NULL, NULL),
(25, '987553120d8c4bf63fd59a6b808f93c9', 230, 237, 0, 0, 1, 0, 4, 102000.00, 100, NULL, 'a', 21, NULL, NULL, '2021-03-15 06:09:55', 'subramanyampeddada@gmail.com', NULL, NULL),
(26, '338ff6006e5d33671e08abf8238188e0', 288, 312, 34, 0, 1, 0, 3, 13500.00, 15, NULL, 'a', 22, NULL, NULL, '2021-03-16 07:10:20', 'mktg@adroitinfoactive.net', NULL, NULL),
(27, '338ff6006e5d33671e08abf8238188e0', 294, 322, 0, 0, 1, 0, 3, 6000.00, 20, NULL, 'a', 22, NULL, NULL, '2021-03-16 07:10:20', 'mktg@adroitinfoactive.net', NULL, NULL),
(28, '12bcd1da09153ef8baa1d7a032c6fbc6', 299, 357, 35, 0, 10, 0, 3, 13500.00, 10, NULL, 'a', 23, NULL, NULL, '2021-03-16 01:44:25', 'sravanstainely@gmail.com', NULL, NULL),
(29, '2d5f4020d328849002db33d9a65cdeef', 299, 357, 35, 0, 10, 0, 3, 20250.00, 15, NULL, 'a', 24, NULL, NULL, '2021-03-16 01:48:36', 'sravanstainely@gmail.com', NULL, NULL),
(30, '2d5f4020d328849002db33d9a65cdeef', 299, 357, 35, 0, 15, 0, 3, 20250.00, 15, NULL, 'a', 25, NULL, NULL, '2021-03-16 02:00:51', 'sravanstainely@gmail.com', NULL, NULL),
(31, '2d5f4020d328849002db33d9a65cdeef', 299, 357, 35, 0, 10, 0, 3, 13500.00, 10, NULL, 'a', 26, NULL, NULL, '2021-03-16 02:10:24', 'sravanstainely@gmail.com', NULL, NULL),
(32, '2d5f4020d328849002db33d9a65cdeef', 82, 88, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 26, NULL, NULL, '2021-03-16 02:10:24', 'sravanstainely@gmail.com', NULL, NULL),
(33, '81df79fe404dfc674b377e52e5e31533', 41, 46, 0, 0, 1, 0, 4, 15300.00, 15, NULL, 'a', 27, NULL, NULL, '2021-03-17 06:08:52', 'mktg@adroitinfoactive.net', NULL, NULL),
(34, '81df79fe404dfc674b377e52e5e31533', 66, 71, 0, 0, 1, 0, 4, 25500.00, 25, NULL, 'a', 27, NULL, NULL, '2021-03-17 06:08:52', 'mktg@adroitinfoactive.net', NULL, NULL),
(35, '81df79fe404dfc674b377e52e5e31533', 33, 38, 0, 0, 1, 0, 4, 15300.00, 15, NULL, 'a', 28, NULL, NULL, '2021-03-17 06:17:05', 'mktg@adroitinfoactive.net', NULL, NULL),
(36, '81df79fe404dfc674b377e52e5e31533', 13, 13, 0, 0, 1, 0, 3, 11475.00, 15, NULL, 'a', 29, NULL, NULL, '2021-03-17 06:19:58', 'mktg@adroitinfoactive.net', NULL, NULL),
(37, '81df79fe404dfc674b377e52e5e31533', 171, 177, 0, 0, 1, 0, 4, 15300.00, 15, NULL, 'a', 30, NULL, NULL, '2021-03-17 06:39:06', 'mktg@adroitinfoactive.net', NULL, NULL),
(38, '81df79fe404dfc674b377e52e5e31533', 162, 168, 0, 0, 1, 0, 4, 15300.00, 15, NULL, 'a', 31, NULL, NULL, '2021-03-17 09:38:36', 'mktg@adroitinfoactive.net', NULL, NULL),
(39, 'd525e30b7bc9ca8e970ea748f4de2a76', 305, 408, 0, 0, 15, 0, 3, 20250.00, 15, NULL, 'a', 32, NULL, NULL, '2021-03-17 09:47:11', 'sravanstainely@gmail.com', NULL, NULL),
(40, '3e4dcbe6e0cbd43efce5dea1d78b9254', 307, 410, 35, 0, 20, 0, 3, 75000.00, 20, NULL, 'a', 33, NULL, NULL, '2021-03-17 09:52:15', 'sravanstainely@gmail.com', NULL, NULL),
(41, '3e4dcbe6e0cbd43efce5dea1d78b9254', 307, 410, 35, 0, 10, 0, 3, 187500.00, 50, NULL, 'a', 34, NULL, NULL, '2021-03-17 10:02:36', 'sravanstainely@gmail.com1234', NULL, NULL),
(42, '81df79fe404dfc674b377e52e5e31533', 304, 406, 35, 0, 10, 0, 3, 11475.00, 15, NULL, 'a', 35, NULL, NULL, '2021-03-17 10:04:04', 'mktg@adroitinfoactive.net', NULL, NULL),
(43, '05278d18bd72e9a29a8e8f85af95a21e', 70, 75, 0, 0, 1, 0, 4, 11333220.00, 11111, NULL, 'a', 36, NULL, NULL, '2021-03-17 10:04:23', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(44, '05278d18bd72e9a29a8e8f85af95a21e', 179, 185, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 36, NULL, NULL, '2021-03-17 10:04:23', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(45, '05278d18bd72e9a29a8e8f85af95a21e', 49, 54, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 36, NULL, NULL, '2021-03-17 10:04:23', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(46, '05278d18bd72e9a29a8e8f85af95a21e', 71, 76, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 36, NULL, NULL, '2021-03-17 10:04:23', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(47, '81df79fe404dfc674b377e52e5e31533', 304, 406, 35, 0, 1, 0, 3, 15300.00, 20, NULL, 'a', 37, NULL, NULL, '2021-03-17 10:05:44', 'mktg@adroitinfoactive.net', NULL, NULL),
(48, '3e4dcbe6e0cbd43efce5dea1d78b9254', 307, 410, 35, 0, 10, 0, 3, 37500.00, 10, NULL, 'a', 38, NULL, NULL, '2021-03-17 10:06:41', 'ravikumar@gmail.com', NULL, NULL),
(49, '05278d18bd72e9a29a8e8f85af95a21e', 304, 406, 35, 0, 1, 0, 3, 8415.00, 11, NULL, 'a', 39, NULL, NULL, '2021-03-17 10:20:30', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(50, '05278d18bd72e9a29a8e8f85af95a21e', 166, 172, 0, 0, 1, 0, 4, 11220.00, 11, NULL, 'a', 39, NULL, NULL, '2021-03-17 10:20:30', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(51, '3e4dcbe6e0cbd43efce5dea1d78b9254', 12, 12, 0, 0, 15, 0, 3, 11475.00, 15, NULL, 'a', 40, NULL, NULL, '2021-03-17 10:20:51', 'RaviPrasad@gmail.com', NULL, NULL),
(52, '2e26a5267c96a2181b0f3d0b09edc06a', 304, 406, 35, 0, 1, 0, 3, 8415.00, 11, NULL, 'a', 41, NULL, NULL, '2021-03-17 10:23:42', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(53, '2e26a5267c96a2181b0f3d0b09edc06a', 166, 172, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 41, NULL, NULL, '2021-03-17 10:23:42', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(54, '2e26a5267c96a2181b0f3d0b09edc06a', 22, 27, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 41, NULL, NULL, '2021-03-17 10:23:42', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(55, '2e26a5267c96a2181b0f3d0b09edc06a', 197, 204, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 41, NULL, NULL, '2021-03-17 10:23:42', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(56, '2e26a5267c96a2181b0f3d0b09edc06a', 219, 226, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 41, NULL, NULL, '2021-03-17 10:23:42', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(57, '2e26a5267c96a2181b0f3d0b09edc06a', 138, 144, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 41, NULL, NULL, '2021-03-17 10:23:42', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(58, '2e26a5267c96a2181b0f3d0b09edc06a', 166, 172, 0, 0, 1, 0, 4, 15300.00, 15, NULL, 'a', 42, NULL, NULL, '2021-03-17 10:31:45', 'krishnaagarwal99@yahoo.com', NULL, NULL),
(59, '81df79fe404dfc674b377e52e5e31533', 304, 406, 35, 0, 20, 0, 3, 15300.00, 20, NULL, 'a', 43, NULL, NULL, '2021-03-17 11:46:35', 'kal@gmail.com', NULL, NULL),
(60, 'ddca34c9c81325033cf6b7895fa49c7e', 13, 13, 0, 0, 10, 0, 3, 11475.00, 15, NULL, 'a', 44, NULL, NULL, '2021-03-17 11:53:24', 'kalyani@gmail.com', NULL, NULL),
(61, 'ddca34c9c81325033cf6b7895fa49c7e', 304, 406, 35, 0, 15, 0, 3, 11475.00, 15, NULL, 'a', 45, NULL, NULL, '2021-03-17 11:56:44', 'bunty@gmail.com', NULL, NULL),
(62, '81df79fe404dfc674b377e52e5e31533', 76, 81, 0, 0, 25, 0, 4, 25500.00, 25, NULL, 'a', 46, NULL, NULL, '2021-03-17 11:59:33', 'abc@gmail.com', NULL, NULL),
(63, '81df79fe404dfc674b377e52e5e31533', 173, 179, 0, 0, 15, 0, 4, 15300.00, 15, NULL, 'a', 47, NULL, NULL, '2021-03-17 12:01:17', 'abc@gmail.com', NULL, NULL),
(64, '81df79fe404dfc674b377e52e5e31533', 173, 179, 0, 0, 15, 0, 4, 15300.00, 15, NULL, 'a', 48, NULL, NULL, '2021-03-17 12:11:43', 'apple@gmail.com', NULL, NULL),
(65, '81df79fe404dfc674b377e52e5e31533', 76, 81, 0, 0, 15, 0, 4, 15300.00, 15, NULL, 'a', 49, NULL, NULL, '2021-03-17 12:14:26', 'ball@gmail.com', NULL, NULL),
(66, 'ddca34c9c81325033cf6b7895fa49c7e', 307, 410, 35, 0, 1, 0, 3, 67500.00, 18, NULL, 'a', 50, NULL, NULL, '2021-03-17 01:11:40', 'kushal@gmail.com', NULL, NULL),
(67, 'ddca34c9c81325033cf6b7895fa49c7e', 304, 406, 35, 0, 1, 0, 3, 9180.00, 12, NULL, 'a', 50, NULL, NULL, '2021-03-17 01:11:40', 'kushal@gmail.com', NULL, NULL),
(68, 'ddca34c9c81325033cf6b7895fa49c7e', 145, 151, 0, 0, 12, 0, 4, 12240.00, 12, NULL, 'a', 50, NULL, NULL, '2021-03-17 01:11:40', 'kushal@gmail.com', NULL, NULL),
(69, '42ea3f6ec1407868c51b7735c0f1613d', 304, 406, 35, 0, 25, 0, 3, 19125.00, 25, NULL, 'a', 51, NULL, NULL, '2021-03-18 09:49:37', 'mktg@adroitinfoactive.net', NULL, NULL),
(70, '42ea3f6ec1407868c51b7735c0f1613d', 304, 406, 35, 0, 25, 0, 3, 19125.00, 25, NULL, 'a', 52, NULL, NULL, '2021-03-18 10:33:59', 'abcd@gmail.com', NULL, NULL),
(71, 'df8d03eb65ca08357bf2580d2f5f61b7', 304, 406, 35, 0, 1, 0, 3, 11475.00, 15, NULL, 'a', 53, NULL, NULL, '2021-03-18 02:18:36', 'sravanstainely@gmail.com', NULL, NULL),
(72, 'fee394064fdb1be69da3e76e6ae4d202', 149, 155, 0, 0, 20, 0, 4, 20400.00, 20, NULL, 'a', 54, NULL, NULL, '2021-03-19 04:41:10', '123@gmail.com', NULL, NULL),
(73, 'fee394064fdb1be69da3e76e6ae4d202', 84, 90, 0, 0, 20, 0, 4, 20400.00, 20, NULL, 'a', 55, NULL, NULL, '2021-03-19 04:46:25', 'mktg@adroitinfoactive.net', NULL, NULL),
(74, 'ecabd6fa5c417620c913f20800b17d58', 304, 406, 35, 0, 1, 0, 3, 11475.00, 15, NULL, 'a', 56, NULL, NULL, '2021-03-20 07:54:14', 'sravanstainely@gmail.com', NULL, NULL),
(75, '0298279565c77279bcbdaed680b9f0db', 304, 406, 35, 0, 1, 0, 3, 765.00, 1, NULL, 'a', 57, NULL, NULL, '2021-03-20 09:20:00', 'guest@gmail.com', NULL, NULL),
(76, '0298279565c77279bcbdaed680b9f0db', 156, 162, 0, 0, 1, 0, 4, 10200.00, 10, NULL, 'a', 57, NULL, NULL, '2021-03-20 09:20:00', 'guest@gmail.com', NULL, NULL),
(77, '268fb5e486501da182e34d0829e3b67c', 129, 135, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 58, NULL, NULL, '2021-03-20 09:35:24', 'guest@gmail.com', NULL, NULL),
(78, 'ecabd6fa5c417620c913f20800b17d58', 304, 406, 35, 0, 2, 0, 3, 7650.00, 10, NULL, 'a', 59, NULL, NULL, '2021-03-20 09:49:41', 'arun@gmail.com', NULL, NULL),
(79, 'ecabd6fa5c417620c913f20800b17d58', 156, 162, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 59, NULL, NULL, '2021-03-20 09:49:41', 'arun@gmail.com', NULL, NULL),
(80, 'ecabd6fa5c417620c913f20800b17d58', 118, 124, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 60, NULL, NULL, '2021-03-20 09:53:04', 'arun@gmail.com', NULL, NULL),
(81, 'ecabd6fa5c417620c913f20800b17d58', 160, 166, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 61, NULL, NULL, '2021-03-20 09:55:51', 'arun@gmail.com', NULL, NULL),
(82, 'ecabd6fa5c417620c913f20800b17d58', 118, 124, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 62, NULL, NULL, '2021-03-20 10:32:51', 'sai@gmail.com', NULL, NULL),
(83, 'ecabd6fa5c417620c913f20800b17d58', 304, 406, 35, 0, 10, 0, 3, 7650.00, 10, NULL, 'a', 63, NULL, NULL, '2021-03-20 10:39:50', 'sai@gmail.com', NULL, NULL),
(84, 'ecabd6fa5c417620c913f20800b17d58', 160, 166, 0, 0, 2, 0, 4, 3060.00, 3, NULL, 'a', 63, NULL, NULL, '2021-03-20 10:39:50', 'sai@gmail.com', NULL, NULL),
(85, 'd3359999e381e1245eaa8f7bbc0eed14', 163, 169, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 64, NULL, NULL, '2021-03-22 04:47:18', 'abc@gmail.com', NULL, NULL),
(86, 'd3359999e381e1245eaa8f7bbc0eed14', 169, 175, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 65, NULL, NULL, '2021-03-22 09:01:01', 'mktg@adroitinfoactive.net', NULL, NULL),
(87, '766ed8629ef23e2d2696ff40449bff66', 36, 41, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 66, NULL, NULL, '2021-03-23 05:03:18', 'mktg@adroitinfoactive.net', NULL, NULL),
(88, '4b1b5636324390b79b68d213ed82d559', 240, 247, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 67, NULL, NULL, '2021-03-23 06:25:59', 'mktg@adroitinfoactive.net', NULL, NULL),
(89, '4b1b5636324390b79b68d213ed82d559', 240, 247, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 68, NULL, NULL, '2021-03-23 06:36:07', 'mktg@adroitinfoactive.net', NULL, NULL),
(90, '4b1b5636324390b79b68d213ed82d559', 240, 247, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 69, NULL, NULL, '2021-03-23 07:40:59', 'mktg@adroitinfoactive.net', NULL, NULL),
(91, '4b1b5636324390b79b68d213ed82d559', 240, 247, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 70, NULL, NULL, '2021-03-23 07:48:01', 'mktg@adroitinfoactive.net', NULL, NULL),
(92, '4b1b5636324390b79b68d213ed82d559', 240, 247, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 71, NULL, NULL, '2021-03-23 07:58:29', 'mktg@adroitinfoactive.net', NULL, NULL),
(93, '4b1b5636324390b79b68d213ed82d559', 240, 247, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 72, NULL, NULL, '2021-03-23 08:05:13', 'vengafashions@test2.com', NULL, NULL),
(94, '3cc772a28f88d916a0d957fcaab41772', 239, 246, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 73, NULL, NULL, '2021-03-23 08:14:41', 'sai@gmail.com', NULL, NULL),
(95, '3cc772a28f88d916a0d957fcaab41772', 240, 247, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 73, NULL, NULL, '2021-03-23 08:14:41', 'sai@gmail.com', NULL, NULL),
(96, '32d4774dec739e095ffd84001f0a33b9', 240, 247, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 74, NULL, NULL, '2021-03-23 08:59:50', 'mktg@adroitinfoactive.net', NULL, NULL),
(97, '32d4774dec739e095ffd84001f0a33b9', 240, 247, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 75, NULL, NULL, '2021-03-23 09:47:58', 'mktg@adroitinfoactive.net', NULL, NULL),
(98, '32d4774dec739e095ffd84001f0a33b9', 25, 30, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 76, NULL, NULL, '2021-03-23 09:49:59', 'mktg@adroitinfoactive.net', NULL, NULL),
(99, '32d4774dec739e095ffd84001f0a33b9', 240, 247, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 77, NULL, NULL, '2021-03-23 10:03:01', 'kalyani.kaluvala@gmail.com', NULL, NULL),
(100, '32d4774dec739e095ffd84001f0a33b9', 240, 247, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 78, NULL, NULL, '2021-03-23 10:13:26', 'kal@gmail.com', NULL, NULL),
(101, '32d4774dec739e095ffd84001f0a33b9', 240, 247, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 79, NULL, NULL, '2021-03-23 10:17:03', 'sanvi@gmail.com', NULL, NULL),
(102, 'e9a9e26e6e141d70e36e95cfdf42386e', 240, 247, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 80, NULL, NULL, '2021-03-23 10:32:28', 'mktg@adroitinfoactive.net', NULL, NULL),
(103, 'e9a9e26e6e141d70e36e95cfdf42386e', 234, 241, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 81, NULL, NULL, '2021-03-23 11:09:17', 'mktg@adroitinfoactive.net', NULL, NULL),
(104, 'e9a9e26e6e141d70e36e95cfdf42386e', 228, 235, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 81, NULL, NULL, '2021-03-23 11:09:17', 'mktg@adroitinfoactive.net', NULL, NULL),
(105, 'e9a9e26e6e141d70e36e95cfdf42386e', 20, 20, 0, 0, 10, 0, 3, 7650.00, 10, NULL, 'a', 81, NULL, NULL, '2021-03-23 11:09:17', 'mktg@adroitinfoactive.net', NULL, NULL),
(106, 'e9a9e26e6e141d70e36e95cfdf42386e', 295, 341, 0, 0, 10, 0, 3, 3000.00, 10, NULL, 'a', 81, NULL, NULL, '2021-03-23 11:09:17', 'mktg@adroitinfoactive.net', NULL, NULL),
(107, 'e6b33cd5a066dfa598059ac077c2801d', 136, 142, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 82, NULL, NULL, '2021-03-24 05:11:56', 'mktg@adroitinfoactive.net', NULL, NULL),
(108, '45e48e403918d557719ee3828b46028b', 27, 32, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 83, NULL, NULL, '2021-03-24 10:56:38', 'subramanyampeddada@gmail.com', NULL, NULL),
(109, '45e48e403918d557719ee3828b46028b', 44, 49, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 83, NULL, NULL, '2021-03-24 10:56:38', 'subramanyampeddada@gmail.com', NULL, NULL),
(110, '45e48e403918d557719ee3828b46028b', 79, 84, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 83, NULL, NULL, '2021-03-24 10:56:38', 'subramanyampeddada@gmail.com', NULL, NULL),
(111, '45e48e403918d557719ee3828b46028b', 134, 140, 0, 0, 1, 0, 4, 10200.00, 10, NULL, 'a', 83, NULL, NULL, '2021-03-24 10:56:38', 'subramanyampeddada@gmail.com', NULL, NULL),
(112, '45e48e403918d557719ee3828b46028b', 304, 406, 35, 0, 1, 0, 3, 765.00, 1, NULL, 'a', 84, NULL, NULL, '2021-03-24 12:00:35', 'subramanyampeddada@gmail.com', NULL, NULL),
(113, '45e48e403918d557719ee3828b46028b', 27, 32, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 84, NULL, NULL, '2021-03-24 12:00:35', 'subramanyampeddada@gmail.com', NULL, NULL),
(114, '45e48e403918d557719ee3828b46028b', 134, 140, 0, 0, 1, 0, 4, 10200.00, 10, NULL, 'a', 84, NULL, NULL, '2021-03-24 12:00:35', 'subramanyampeddada@gmail.com', NULL, NULL),
(115, '6c3336355c353ed0f10fb977f15281f5', 304, 406, 35, 0, 1, 0, 3, 765.00, 1, NULL, 'a', 85, NULL, NULL, '2021-03-24 12:04:08', 'sravanstainely@gmail.com', NULL, NULL),
(116, '6c3336355c353ed0f10fb977f15281f5', 134, 140, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 85, NULL, NULL, '2021-03-24 12:04:08', 'sravanstainely@gmail.com', NULL, NULL),
(117, '6c3336355c353ed0f10fb977f15281f5', 27, 32, 0, 0, 1, 0, 4, 10200.00, 10, NULL, 'a', 85, NULL, NULL, '2021-03-24 12:04:08', 'sravanstainely@gmail.com', NULL, NULL),
(118, '7076c05754ca5403f19f565d5b0db7f0', 304, 406, 35, 0, 2, 0, 3, 6120.00, 8, NULL, 'a', 86, NULL, NULL, '2021-03-24 12:16:24', 'ektagarments@yahoo.co.in', NULL, NULL),
(119, '7076c05754ca5403f19f565d5b0db7f0', 27, 32, 0, 0, 1, 0, 4, 4080.00, 4, NULL, 'a', 86, NULL, NULL, '2021-03-24 12:16:24', 'ektagarments@yahoo.co.in', NULL, NULL),
(120, '7076c05754ca5403f19f565d5b0db7f0', 91, 97, 0, 0, 2, 0, 4, 4080.00, 4, NULL, 'a', 86, NULL, NULL, '2021-03-24 12:16:24', 'ektagarments@yahoo.co.in', NULL, NULL),
(121, '7076c05754ca5403f19f565d5b0db7f0', 228, 235, 0, 0, 2, 0, 4, 9180.00, 9, NULL, 'a', 87, NULL, NULL, '2021-03-24 12:19:54', 'ektagarments@yahoo.co.in', NULL, NULL),
(122, '7076c05754ca5403f19f565d5b0db7f0', 230, 237, 0, 0, 2, 0, 4, 6120.00, 6, NULL, 'a', 87, NULL, NULL, '2021-03-24 12:19:54', 'ektagarments@yahoo.co.in', NULL, NULL),
(123, '6c3336355c353ed0f10fb977f15281f5', 304, 406, 35, 0, 2, 0, 3, 7650.00, 10, NULL, 'a', 88, NULL, NULL, '2021-03-24 12:22:29', 'sravanstainely@gmail.com', NULL, NULL),
(124, '6c3336355c353ed0f10fb977f15281f5', 178, 184, 0, 0, 1, 0, 4, 2040.00, 2, NULL, 'a', 88, NULL, NULL, '2021-03-24 12:22:29', 'sravanstainely@gmail.com', NULL, NULL),
(125, '6c3336355c353ed0f10fb977f15281f5', 48, 53, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 88, NULL, NULL, '2021-03-24 12:22:29', 'sravanstainely@gmail.com', NULL, NULL),
(126, '45e48e403918d557719ee3828b46028b', 315, 436, 36, 0, 1, 0, 3, 765.00, 1, NULL, 'a', 89, NULL, NULL, '2021-03-24 12:51:30', '123456789@gmail.com', NULL, NULL),
(127, '45e48e403918d557719ee3828b46028b', 304, 406, 35, 0, 1, 0, 3, 7650.00, 10, NULL, 'a', 89, NULL, NULL, '2021-03-24 12:51:30', '123456789@gmail.com', NULL, NULL),
(128, '45e48e403918d557719ee3828b46028b', 181, 187, 0, 0, 1, 0, 4, 10200.00, 10, NULL, 'a', 89, NULL, NULL, '2021-03-24 12:51:30', '123456789@gmail.com', NULL, NULL),
(129, '997819fb3e4dbeeeaa215de4ec175c01', 314, 435, 36, 0, 10, 0, 3, 7650.00, 10, NULL, 'a', 90, NULL, NULL, '2021-03-24 12:55:12', 'venga@gmail.com', NULL, NULL),
(130, '997819fb3e4dbeeeaa215de4ec175c01', 315, 436, 36, 0, 10, 0, 3, 7650.00, 10, NULL, 'a', 90, NULL, NULL, '2021-03-24 12:55:12', 'venga@gmail.com', NULL, NULL),
(131, '997819fb3e4dbeeeaa215de4ec175c01', 304, 406, 35, 0, 10, 0, 3, 7650.00, 10, NULL, 'a', 90, NULL, NULL, '2021-03-24 12:55:12', 'venga@gmail.com', NULL, NULL),
(132, '6c3336355c353ed0f10fb977f15281f5', 314, 435, 36, 0, 1, 0, 3, 7650.00, 10, NULL, 'a', 91, NULL, NULL, '2021-03-24 12:58:48', 'sravanadroit175@gmail.com', NULL, NULL),
(133, '6c3336355c353ed0f10fb977f15281f5', 315, 436, 36, 0, 1, 0, 3, 3825.00, 5, NULL, 'a', 91, NULL, NULL, '2021-03-24 12:58:48', 'sravanadroit175@gmail.com', NULL, NULL),
(134, '36f01a83a321a69a1e9c10434cf2a8b1', 23, 28, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 92, NULL, NULL, '2021-03-24 01:03:56', 'mktg@adroitinfoactive.net', NULL, NULL),
(135, '0400550e1fb3707002c664cdd1205448', 304, 406, 35, 0, 1, 0, 3, 7650.00, 10, NULL, 'a', 93, NULL, NULL, '2021-03-24 02:58:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(136, '0400550e1fb3707002c664cdd1205448', 132, 138, 0, 0, 1, 0, 4, 3060.00, 3, NULL, 'a', 93, NULL, NULL, '2021-03-24 02:58:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(137, '0400550e1fb3707002c664cdd1205448', 44, 49, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 93, NULL, NULL, '2021-03-24 02:58:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(138, '45e48e403918d557719ee3828b46028b', 307, 410, 35, 0, 1, 0, 3, 3750.00, 1, NULL, 'a', 94, NULL, NULL, '2021-03-24 05:09:06', 'aaa@gmail.com', NULL, NULL),
(139, '45e48e403918d557719ee3828b46028b', 304, 406, 35, 0, 1, 0, 3, 7650.00, 10, NULL, 'a', 94, NULL, NULL, '2021-03-24 05:09:06', 'aaa@gmail.com', NULL, NULL),
(140, '0400550e1fb3707002c664cdd1205448', 44, 49, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 95, NULL, NULL, '2021-03-24 05:14:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(141, '0400550e1fb3707002c664cdd1205448', 218, 225, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 95, NULL, NULL, '2021-03-24 05:14:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(142, '0400550e1fb3707002c664cdd1205448', 137, 143, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 95, NULL, NULL, '2021-03-24 05:14:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(143, '0400550e1fb3707002c664cdd1205448', 26, 31, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 95, NULL, NULL, '2021-03-24 05:14:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(144, '0400550e1fb3707002c664cdd1205448', 45, 50, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 95, NULL, NULL, '2021-03-24 05:14:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(145, '0400550e1fb3707002c664cdd1205448', 175, 181, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 95, NULL, NULL, '2021-03-24 05:14:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(146, '0400550e1fb3707002c664cdd1205448', 133, 139, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 95, NULL, NULL, '2021-03-24 05:14:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(147, '0400550e1fb3707002c664cdd1205448', 74, 79, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 95, NULL, NULL, '2021-03-24 05:14:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(148, '0400550e1fb3707002c664cdd1205448', 234, 241, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 95, NULL, NULL, '2021-03-24 05:14:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(149, '0400550e1fb3707002c664cdd1205448', 195, 202, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 95, NULL, NULL, '2021-03-24 05:14:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(150, '0400550e1fb3707002c664cdd1205448', 304, 406, 35, 0, 2, 0, 3, 1530.00, 2, NULL, 'a', 95, NULL, NULL, '2021-03-24 05:14:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(151, '0400550e1fb3707002c664cdd1205448', 304, 406, 35, 0, 1, 0, 3, 765.00, 1, NULL, 'a', 96, NULL, NULL, '2021-03-24 05:17:11', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(152, '0400550e1fb3707002c664cdd1205448', 159, 165, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 96, NULL, NULL, '2021-03-24 05:17:11', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(153, '0400550e1fb3707002c664cdd1205448', 132, 138, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 96, NULL, NULL, '2021-03-24 05:17:11', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(154, '0400550e1fb3707002c664cdd1205448', 44, 49, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 96, NULL, NULL, '2021-03-24 05:17:11', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(155, '0400550e1fb3707002c664cdd1205448', 174, 180, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 96, NULL, NULL, '2021-03-24 05:17:11', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(156, '0400550e1fb3707002c664cdd1205448', 259, 274, 0, 0, 1, 0, 5, 1825.00, 1, NULL, 'a', 96, NULL, NULL, '2021-03-24 05:17:11', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(157, '0400550e1fb3707002c664cdd1205448', 218, 225, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 96, NULL, NULL, '2021-03-24 05:17:11', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(158, '0400550e1fb3707002c664cdd1205448', 137, 143, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 96, NULL, NULL, '2021-03-24 05:17:11', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(159, '0400550e1fb3707002c664cdd1205448', 45, 50, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 96, NULL, NULL, '2021-03-24 05:17:11', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(160, '0400550e1fb3707002c664cdd1205448', 110, 116, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 96, NULL, NULL, '2021-03-24 05:17:11', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(161, '6c3336355c353ed0f10fb977f15281f5', 304, 406, 35, 0, 1, 0, 3, 7650.00, 10, NULL, 'a', 97, NULL, NULL, '2021-03-24 05:33:04', 'vengafashions510', NULL, NULL),
(162, '6c3336355c353ed0f10fb977f15281f5', 132, 138, 0, 0, 1, 0, 4, 10200.00, 10, NULL, 'a', 97, NULL, NULL, '2021-03-24 05:33:04', 'vengafashions510', NULL, NULL),
(163, '524d9c066cbb8290347da7d4e864e1c8', 237, 244, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 98, NULL, NULL, '2021-03-25 04:43:14', 'mktg@adroitinfoactive.net', NULL, NULL),
(164, '524d9c066cbb8290347da7d4e864e1c8', 181, 187, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 99, NULL, NULL, '2021-03-25 05:07:51', 'sridharkannam@gmail.com', NULL, NULL),
(165, '524d9c066cbb8290347da7d4e864e1c8', 237, 244, 0, 0, 10, 0, 4, 10200.00, 10, NULL, 'a', 100, NULL, NULL, '2021-03-25 05:14:17', 'kannamsridhar@gmail.com', NULL, NULL),
(166, '464e5610d6a9c3daa00a0117d12165a6', 51, 56, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 101, NULL, NULL, '2021-04-30 12:43:27', 'bvgfashions@gmail.com', NULL, NULL),
(167, '464e5610d6a9c3daa00a0117d12165a6', 75, 80, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 101, NULL, NULL, '2021-04-30 12:43:27', 'bvgfashions@gmail.com', NULL, NULL),
(168, '464e5610d6a9c3daa00a0117d12165a6', 20, 20, 0, 0, 1, 0, 3, 765.00, 1, NULL, 'a', 101, NULL, NULL, '2021-04-30 12:43:27', 'bvgfashions@gmail.com', NULL, NULL),
(169, '464e5610d6a9c3daa00a0117d12165a6', 25, 30, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 101, NULL, NULL, '2021-04-30 12:43:27', 'bvgfashions@gmail.com', NULL, NULL),
(170, '464e5610d6a9c3daa00a0117d12165a6', 49, 54, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 101, NULL, NULL, '2021-04-30 12:43:27', 'bvgfashions@gmail.com', NULL, NULL),
(171, '464e5610d6a9c3daa00a0117d12165a6', 78, 83, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 101, NULL, NULL, '2021-04-30 12:43:27', 'bvgfashions@gmail.com', NULL, NULL),
(172, '464e5610d6a9c3daa00a0117d12165a6', 202, 209, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 101, NULL, NULL, '2021-04-30 12:43:27', 'bvgfashions@gmail.com', NULL, NULL),
(173, '464e5610d6a9c3daa00a0117d12165a6', 84, 90, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 101, NULL, NULL, '2021-04-30 12:43:27', 'bvgfashions@gmail.com', NULL, NULL),
(174, '464e5610d6a9c3daa00a0117d12165a6', 223, 230, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 101, NULL, NULL, '2021-04-30 12:43:27', 'bvgfashions@gmail.com', NULL, NULL),
(175, '464e5610d6a9c3daa00a0117d12165a6', 214, 221, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 101, NULL, NULL, '2021-04-30 12:43:27', 'bvgfashions@gmail.com', NULL, NULL),
(176, '464e5610d6a9c3daa00a0117d12165a6', 121, 127, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 101, NULL, NULL, '2021-04-30 12:43:27', 'bvgfashions@gmail.com', NULL, NULL),
(177, '464e5610d6a9c3daa00a0117d12165a6', 87, 93, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 101, NULL, NULL, '2021-04-30 12:43:27', 'bvgfashions@gmail.com', NULL, NULL),
(178, '464e5610d6a9c3daa00a0117d12165a6', 58, 63, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 101, NULL, NULL, '2021-04-30 12:43:27', 'bvgfashions@gmail.com', NULL, NULL),
(179, 'd8f751362bf3bb4ccb4fc93e4f7dafc1', 33, 38, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 102, NULL, NULL, '2021-08-23 08:06:46', 'kusumaraju.surya@gmail.com', NULL, NULL),
(180, 'd8f751362bf3bb4ccb4fc93e4f7dafc1', 46, 51, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 102, NULL, NULL, '2021-08-23 08:06:46', 'kusumaraju.surya@gmail.com', NULL, NULL),
(181, 'd8f751362bf3bb4ccb4fc93e4f7dafc1', 25, 30, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 102, NULL, NULL, '2021-08-23 08:06:46', 'kusumaraju.surya@gmail.com', NULL, NULL),
(182, 'd8f751362bf3bb4ccb4fc93e4f7dafc1', 34, 39, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 102, NULL, NULL, '2021-08-23 08:06:46', 'kusumaraju.surya@gmail.com', NULL, NULL),
(183, 'd8f751362bf3bb4ccb4fc93e4f7dafc1', 27, 32, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 102, NULL, NULL, '2021-08-23 08:06:46', 'kusumaraju.surya@gmail.com', NULL, NULL),
(184, 'd8f751362bf3bb4ccb4fc93e4f7dafc1', 92, 98, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 102, NULL, NULL, '2021-08-23 08:06:46', 'kusumaraju.surya@gmail.com', NULL, NULL),
(185, 'd8f751362bf3bb4ccb4fc93e4f7dafc1', 192, 199, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 102, NULL, NULL, '2021-08-23 08:06:46', 'kusumaraju.surya@gmail.com', NULL, NULL),
(186, 'd8f751362bf3bb4ccb4fc93e4f7dafc1', 152, 158, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 102, NULL, NULL, '2021-08-23 08:06:46', 'kusumaraju.surya@gmail.com', NULL, NULL),
(187, 'd8f751362bf3bb4ccb4fc93e4f7dafc1', 86, 92, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 102, NULL, NULL, '2021-08-23 08:06:46', 'kusumaraju.surya@gmail.com', NULL, NULL),
(188, 'd8f751362bf3bb4ccb4fc93e4f7dafc1', 95, 101, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 102, NULL, NULL, '2021-08-23 08:06:46', 'kusumaraju.surya@gmail.com', NULL, NULL),
(189, 'd8f751362bf3bb4ccb4fc93e4f7dafc1', 20, 20, 0, 0, 1, 0, 3, 765.00, 1, NULL, 'a', 102, NULL, NULL, '2021-08-23 08:06:46', 'kusumaraju.surya@gmail.com', NULL, NULL),
(190, 'd8f751362bf3bb4ccb4fc93e4f7dafc1', 75, 80, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 102, NULL, NULL, '2021-08-23 08:06:46', 'kusumaraju.surya@gmail.com', NULL, NULL),
(191, 'd8f751362bf3bb4ccb4fc93e4f7dafc1', 237, 244, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 102, NULL, NULL, '2021-08-23 08:06:46', 'kusumaraju.surya@gmail.com', NULL, NULL),
(192, 'd8f751362bf3bb4ccb4fc93e4f7dafc1', 161, 167, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 102, NULL, NULL, '2021-08-23 08:06:46', 'kusumaraju.surya@gmail.com', NULL, NULL),
(193, '58a0b71d26eee0e49159d0fb5f826eb1', 228, 235, 0, 0, 1, 0, 4, 9180.00, 9, NULL, 'a', 103, NULL, NULL, '2021-10-05 12:57:08', 'zopeqeti@mailinator.com', NULL, NULL),
(194, '58a0b71d26eee0e49159d0fb5f826eb1', 199, 206, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 103, NULL, NULL, '2021-10-05 12:57:08', 'zopeqeti@mailinator.com', NULL, NULL),
(195, 'a72a54cb1f3866de59a3abbd929db45e', 137, 143, 0, 0, 1, 0, 4, 10200.00, 10, NULL, 'a', 104, NULL, NULL, '2021-10-08 04:00:48', 'xexazi@mailinator.com', NULL, NULL),
(196, '8350898248350dbde1c03d0e459561de', 214, 221, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 105, NULL, NULL, '2021-11-26 10:49:14', 'venkatesan05061997@gmail.com', NULL, NULL),
(197, '8350898248350dbde1c03d0e459561de', 220, 227, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 105, NULL, NULL, '2021-11-26 10:49:14', 'venkatesan05061997@gmail.com', NULL, NULL),
(198, '8350898248350dbde1c03d0e459561de', 82, 88, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 105, NULL, NULL, '2021-11-26 10:49:14', 'venkatesan05061997@gmail.com', NULL, NULL),
(199, '8350898248350dbde1c03d0e459561de', 221, 228, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 105, NULL, NULL, '2021-11-26 10:49:14', 'venkatesan05061997@gmail.com', NULL, NULL),
(200, '8350898248350dbde1c03d0e459561de', 184, 191, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 105, NULL, NULL, '2021-11-26 10:49:14', 'venkatesan05061997@gmail.com', NULL, NULL),
(201, '8350898248350dbde1c03d0e459561de', 199, 206, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 105, NULL, NULL, '2021-11-26 10:49:14', 'venkatesan05061997@gmail.com', NULL, NULL),
(202, '8350898248350dbde1c03d0e459561de', 216, 223, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 105, NULL, NULL, '2021-11-26 10:49:14', 'venkatesan05061997@gmail.com', NULL, NULL),
(203, '8350898248350dbde1c03d0e459561de', 217, 224, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 105, NULL, NULL, '2021-11-26 10:49:14', 'venkatesan05061997@gmail.com', NULL, NULL),
(204, '8350898248350dbde1c03d0e459561de', 233, 240, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 105, NULL, NULL, '2021-11-26 10:49:14', 'venkatesan05061997@gmail.com', NULL, NULL),
(205, '8350898248350dbde1c03d0e459561de', 152, 158, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 105, NULL, NULL, '2021-11-26 10:49:14', 'venkatesan05061997@gmail.com', NULL, NULL),
(206, 'b3f03e9b79d3bbc5285acb0d2e2aa1d9', 87, 93, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 106, NULL, NULL, '2021-11-27 08:12:36', 'perfectdresses.bkd@gmail.com', NULL, NULL),
(207, 'b3f03e9b79d3bbc5285acb0d2e2aa1d9', 194, 201, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 106, NULL, NULL, '2021-11-27 08:12:36', 'perfectdresses.bkd@gmail.com', NULL, NULL),
(208, 'b3f03e9b79d3bbc5285acb0d2e2aa1d9', 195, 202, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 106, NULL, NULL, '2021-11-27 08:12:36', 'perfectdresses.bkd@gmail.com', NULL, NULL),
(209, 'b3f03e9b79d3bbc5285acb0d2e2aa1d9', 189, 196, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 106, NULL, NULL, '2021-11-27 08:12:36', 'perfectdresses.bkd@gmail.com', NULL, NULL),
(210, 'b3f03e9b79d3bbc5285acb0d2e2aa1d9', 84, 90, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 106, NULL, NULL, '2021-11-27 08:12:36', 'perfectdresses.bkd@gmail.com', NULL, NULL),
(211, 'b3f03e9b79d3bbc5285acb0d2e2aa1d9', 226, 233, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 106, NULL, NULL, '2021-11-27 08:12:36', 'perfectdresses.bkd@gmail.com', NULL, NULL),
(212, 'b3f03e9b79d3bbc5285acb0d2e2aa1d9', 227, 234, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 106, NULL, NULL, '2021-11-27 08:12:36', 'perfectdresses.bkd@gmail.com', NULL, NULL),
(213, 'b3f03e9b79d3bbc5285acb0d2e2aa1d9', 156, 162, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 106, NULL, NULL, '2021-11-27 08:12:36', 'perfectdresses.bkd@gmail.com', NULL, NULL),
(214, 'b3f03e9b79d3bbc5285acb0d2e2aa1d9', 66, 71, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 106, NULL, NULL, '2021-11-27 08:12:36', 'perfectdresses.bkd@gmail.com', NULL, NULL),
(215, 'b3f03e9b79d3bbc5285acb0d2e2aa1d9', 33, 38, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 106, NULL, NULL, '2021-11-27 08:12:36', 'perfectdresses.bkd@gmail.com', NULL, NULL),
(216, 'b3f03e9b79d3bbc5285acb0d2e2aa1d9', 197, 204, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 106, NULL, NULL, '2021-11-27 08:12:36', 'perfectdresses.bkd@gmail.com', NULL, NULL),
(217, 'b3f03e9b79d3bbc5285acb0d2e2aa1d9', 185, 192, 0, 0, 1, 0, 4, 1020.00, 1, NULL, 'a', 106, NULL, NULL, '2021-11-27 08:12:36', 'perfectdresses.bkd@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `crtord_mst`
--

CREATE TABLE `crtord_mst` (
  `crtordm_id` int(15) NOT NULL,
  `crtordm_code` varchar(250) NOT NULL COMMENT 'Unique code for each order',
  `crtordm_sesid` varchar(250) NOT NULL COMMENT 'Session of the order',
  `crtordm_fstname` varchar(250) DEFAULT NULL COMMENT 'First name of the order',
  `crtordm_lstname` varchar(250) DEFAULT NULL COMMENT 'Last name of the order',
  `crtordm_badrs` varchar(250) DEFAULT NULL COMMENT 'Billing Address',
  `crtordm_badrs2` varchar(250) DEFAULT NULL COMMENT 'Billing Address2',
  `crtordm_bmbrctym_id` int(15) DEFAULT NULL COMMENT 'Billing City name',
  `crtordm_bmbrcntym_id` int(15) NOT NULL COMMENT 'Billing State name Refers mbrcnty_mst ->mbrcntym_id',
  `crtordm_bmbrctym_name` varchar(250) DEFAULT NULL,
  `crtordm_bmbrcntym_name` varchar(250) DEFAULT NULL,
  `crtordm_bzip` varchar(250) DEFAULT NULL COMMENT 'Billing Zip address',
  `crtordm_bmbrcntrym_id` int(15) DEFAULT NULL COMMENT 'Billing Country name Refers mbrcntry_mst -> mbrcntrym_id',
  `crtordm_bdayphone` varchar(250) DEFAULT NULL COMMENT 'Billing day phone',
  `crtordm_emailid` varchar(250) DEFAULT NULL COMMENT 'Billing emailid',
  `crtordm_sfstname` varchar(250) DEFAULT NULL COMMENT 'Shipping First name',
  `crtordm_slstname` varchar(250) DEFAULT NULL COMMENT 'Shipping Last name',
  `crtordm_sadrs` varchar(250) DEFAULT NULL COMMENT 'Shipping Address',
  `crtordm_sadrs2` varchar(250) DEFAULT NULL COMMENT 'Shipping Address2',
  `crtordm_smbrctym_id` int(15) DEFAULT NULL COMMENT 'Shipping City name',
  `crtordm_smbrcntym_id` int(15) DEFAULT NULL COMMENT 'Shipping State name mbrcnty_mst ->mbrcntym_id',
  `crtordm_smbrctym_name` varchar(250) DEFAULT NULL,
  `crtordm_smbrcntym_name` varchar(250) DEFAULT NULL,
  `crtordm_szip` varchar(250) DEFAULT NULL COMMENT 'Shipping Zip Address',
  `crtordm_smbrcntrym_id` int(15) DEFAULT NULL COMMENT 'Shipping Country name mbrcntry_mst -> mbrcntrym_id',
  `crtordm_sdayphone` varchar(250) DEFAULT NULL COMMENT 'Shipping day phone',
  `crtordm_semailid` varchar(250) DEFAULT NULL COMMENT 'Shipping emailid',
  `crtordm_qty` int(15) DEFAULT NULL COMMENT 'Quantity of the order',
  `crtordm_amt` double(10,2) DEFAULT NULL COMMENT 'Amount of the order',
  `crtordm_wt` double(10,2) DEFAULT NULL COMMENT 'Weight of the order',
  `crtordm_pmode` char(1) DEFAULT NULL COMMENT 'Payment mode(c- credit card)',
  `crtordm_prcssts` char(1) DEFAULT NULL,
  `crtordm_cartsts` char(1) DEFAULT NULL COMMENT 'Cart status (A - Acive / I - Inactive)',
  `crtordm_paysts` char(1) DEFAULT NULL COMMENT 'Pay status (R - received / U - unreceived)',
  `crtordm_rmks` text DEFAULT NULL COMMENT 'Remarks',
  `crtordm_shpchrgm_id` int(15) NOT NULL,
  `crtordm_shpchrgamt` double(10,2) NOT NULL,
  `crtordm_cpnm_id` varchar(250) DEFAULT NULL,
  `crtordm_cpnm_typ` char(1) DEFAULT NULL,
  `crtordm_cpnm_val` double(10,2) DEFAULT NULL,
  `crtordm_mbrm_id` int(15) NOT NULL COMMENT 'Member id refers mbr_mst -> mbrm_id',
  `crtordm_ordtyp` char(1) DEFAULT NULL COMMENT '1 - cart, 2 - xlcart',
  `crtordm_adrstyp` varchar(5) NOT NULL,
  `crtordm_crncyval` varchar(250) DEFAULT NULL,
  `crtordm_cnvrtamt` double(10,2) DEFAULT NULL,
  `crtordm_vat` double NOT NULL,
  `crtordm_cst` double DEFAULT NULL,
  `crtordm_crtdon` datetime DEFAULT NULL COMMENT 'Date on which the order is created',
  `crtordm_crtdby` varchar(250) DEFAULT NULL COMMENT 'By whom the order is created',
  `crtordm_mdfdon` datetime DEFAULT NULL COMMENT 'Date on which the order is modified',
  `crtordm_mdfdby` varchar(250) DEFAULT NULL COMMENT 'By whom the order is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crtord_mst`
--

INSERT INTO `crtord_mst` (`crtordm_id`, `crtordm_code`, `crtordm_sesid`, `crtordm_fstname`, `crtordm_lstname`, `crtordm_badrs`, `crtordm_badrs2`, `crtordm_bmbrctym_id`, `crtordm_bmbrcntym_id`, `crtordm_bmbrctym_name`, `crtordm_bmbrcntym_name`, `crtordm_bzip`, `crtordm_bmbrcntrym_id`, `crtordm_bdayphone`, `crtordm_emailid`, `crtordm_sfstname`, `crtordm_slstname`, `crtordm_sadrs`, `crtordm_sadrs2`, `crtordm_smbrctym_id`, `crtordm_smbrcntym_id`, `crtordm_smbrctym_name`, `crtordm_smbrcntym_name`, `crtordm_szip`, `crtordm_smbrcntrym_id`, `crtordm_sdayphone`, `crtordm_semailid`, `crtordm_qty`, `crtordm_amt`, `crtordm_wt`, `crtordm_pmode`, `crtordm_prcssts`, `crtordm_cartsts`, `crtordm_paysts`, `crtordm_rmks`, `crtordm_shpchrgm_id`, `crtordm_shpchrgamt`, `crtordm_cpnm_id`, `crtordm_cpnm_typ`, `crtordm_cpnm_val`, `crtordm_mbrm_id`, `crtordm_ordtyp`, `crtordm_adrstyp`, `crtordm_crncyval`, `crtordm_cnvrtamt`, `crtordm_vat`, `crtordm_cst`, `crtordm_crtdon`, `crtordm_crtdby`, `crtordm_mdfdon`, `crtordm_mdfdby`) VALUES
(1, '1', '840afa7abaf73afd8cb4a78089309a54', 'Subramanyam', 'Subramanyam', 'tweat', '', 0, 0, NULL, NULL, '500061', NULL, '', 'test@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 100, 76500.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 12, NULL, 's', '', 76500.00, 0, 0, '2021-02-23 11:54:30', 'test@gmail.com', NULL, NULL),
(2, '2', '840afa7abaf73afd8cb4a78089309a54', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, 0, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, NULL, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 1000, 765000.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 1, NULL, 'm', '', 765000.00, 0, 0, '2021-02-23 03:05:58', 'subramanyampeddada@gmail.com', NULL, NULL),
(3, '3', '138e0b7d841b200b06c25839b4c5802a', 'KUMAR', 'KUMAR', 'uppal', '', 0, 0, NULL, NULL, '500060', NULL, '', 'sravanstainely@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 21, 20400.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 13, NULL, 'm', '', 20400.00, 0, 0, '2021-02-24 11:23:46', 'sravanstainely@gmail.com', NULL, NULL),
(4, '4', '66e1aa4e42e985bb3ea3ee84bfcfc924', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, 0, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, NULL, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 12, 12240.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 1, NULL, 'm', '', 12240.00, 0, 0, '2021-02-24 01:42:04', 'subramanyampeddada@gmail.com', NULL, NULL),
(5, '5', '138e0b7d841b200b06c25839b4c5802a', 'KUMAR', 'KUMAR', 'uppal', '', 0, 0, NULL, NULL, '500060', NULL, '', 'sravanstainely@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 50, 51000.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 13, NULL, 's', '', 51000.00, 0, 0, '2021-02-24 02:00:59', 'sravanstainely@gmail.com', NULL, NULL),
(6, '6', '138e0b7d841b200b06c25839b4c5802a', 'KUMAR', 'KUMAR', 'uppal', '', 0, 0, NULL, NULL, '500060', NULL, '', 'sravanstainely@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 21, 38325.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 13, NULL, 'm', '', 38325.00, 0, 0, '2021-02-24 02:06:53', 'sravanstainely@gmail.com', NULL, NULL),
(7, '7', '66e1aa4e42e985bb3ea3ee84bfcfc924', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, 0, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, NULL, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 45, 45900.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 1, NULL, 'm', '', 45900.00, 0, 0, '2021-02-24 02:11:11', 'subramanyampeddada@gmail.com', NULL, NULL),
(8, '8', '66e1aa4e42e985bb3ea3ee84bfcfc924', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, 0, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, NULL, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 45, 45900.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 1, NULL, 'm', '', 45900.00, 0, 0, '2021-02-24 02:12:25', 'subramanyampeddada@gmail.com', NULL, NULL),
(9, '9', '66e1aa4e42e985bb3ea3ee84bfcfc924', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, 0, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, NULL, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 100, 102000.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 1, NULL, 's', '', 102000.00, 0, 0, '2021-02-24 04:19:50', 'subramanyampeddada@gmail.com', NULL, NULL),
(10, '10', '8f0efe324e2754c894fca75067063385', 'KUMAR', 'KUMAR', 'uppal', '', 0, 0, NULL, NULL, '500060', NULL, '', 'sravanstainely@gmail.com', 'KUMAR', 'KUMAR', 'uppal', '', 0, NULL, NULL, NULL, '500060', NULL, '', 'sravanstainely@gmail.com', 50, 51000.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 13, NULL, 's', '', 51000.00, 0, 0, '2021-02-26 11:23:35', 'sravanstainely@gmail.com', NULL, NULL),
(11, '11', '8af914d13d8bd190d358b95c6817e8d1', '', '', '', '', 0, 0, NULL, NULL, '', NULL, '', '', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 17, 17340.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 20, NULL, 'm', '', 17340.00, 0, 0, '2021-03-02 11:26:14', 'ekta_garments@yahoo.co.in', NULL, NULL),
(12, '12', '092766bd8aac7ab02c79c65d59e5efe2', 'mktg', 'mktg', 'hyd', 'hyd', 0, 0, NULL, NULL, '500060', NULL, '', 'mktg@adroitinfoactive.net', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 20, 20400.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 20400.00, 0, 0, '2021-03-03 10:00:26', 'mktg@adroitinfoactive.net', NULL, NULL),
(13, '13', 'cfe5dfd4bae4e408f2be58b68409a30d', 'mktg', 'mktg', 'hyd', 'hyd', 0, 0, NULL, NULL, '500060', NULL, '', 'mktg@adroitinfoactive.net', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 16, 12800.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 12800.00, 0, 0, '2021-03-03 11:01:08', 'mktg@adroitinfoactive.net', NULL, NULL),
(14, '14', '77d29b1fbc798fe034d1b0968ee94aae', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '', 'mktg@adroitinfoactive.net', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 50, 51000.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '1', 51000.00, 0, 0, '2021-03-03 11:39:22', 'mktg@adroitinfoactive.net', NULL, NULL),
(15, '15', '4852c499611ee8ab4792ecbe4b305072', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '', 'mktg@adroitinfoactive.net', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 15, 15300.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 15300.00, 0, 0, '2021-03-12 06:32:35', 'mktg@adroitinfoactive.net', NULL, NULL),
(16, '16', '4852c499611ee8ab4792ecbe4b305072', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '', 'mktg@adroitinfoactive.net', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 20, 20400.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 20400.00, 0, 0, '2021-03-12 06:33:43', 'mktg@adroitinfoactive.net', NULL, NULL),
(17, '17', '4852c499611ee8ab4792ecbe4b305072', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '', 'mktg@adroitinfoactive.net', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 15, 15300.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 15300.00, 0, 0, '2021-03-12 06:36:01', 'mktg@adroitinfoactive.net', NULL, NULL),
(18, '18', '987553120d8c4bf63fd59a6b808f93c9', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, 0, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, NULL, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 100, 90000.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 1, NULL, 'm', '', 90000.00, 0, 0, '2021-03-15 04:09:47', 'subramanyampeddada@gmail.com', NULL, NULL),
(19, '19', '987553120d8c4bf63fd59a6b808f93c9', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, 0, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, NULL, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 100, 102000.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 1, NULL, 'm', '', 102000.00, 0, 0, '2021-03-15 06:08:28', 'subramanyampeddada@gmail.com', NULL, NULL),
(20, '20', '987553120d8c4bf63fd59a6b808f93c9', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, 0, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, NULL, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 100, 102000.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 1, NULL, 'm', '', 102000.00, 0, 0, '2021-03-15 06:08:58', 'subramanyampeddada@gmail.com', NULL, NULL),
(21, '21', '987553120d8c4bf63fd59a6b808f93c9', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, 0, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, NULL, NULL, NULL, '500061', NULL, '', 'subramanyampeddada@gmail.com', 100, 102000.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 1, NULL, 'm', '', 102000.00, 0, 0, '2021-03-15 06:09:55', 'subramanyampeddada@gmail.com', NULL, NULL),
(22, '22', '338ff6006e5d33671e08abf8238188e0', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '', 'mktg@adroitinfoactive.net', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 35, 19500.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 19500.00, 0, 0, '2021-03-16 07:10:20', 'mktg@adroitinfoactive.net', NULL, NULL),
(23, '23', '12bcd1da09153ef8baa1d7a032c6fbc6', 'sravan kumar', 'KUMAR', 'uppal', '', 0, 0, NULL, NULL, '500060', NULL, '', 'sravanstainely@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 10, 13500.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 13, NULL, 's', '', 13500.00, 0, 0, '2021-03-16 01:44:25', 'sravanstainely@gmail.com', NULL, NULL),
(24, '24', '2d5f4020d328849002db33d9a65cdeef', 'sravan kumar', 'KUMAR', '1/102,uppal,secunderabad', '1/102,uppal,secunderabad', 0, 0, NULL, NULL, '500064', NULL, '', 'sravanstainely@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 15, 20250.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 13, NULL, 'm', '', 20250.00, 0, 0, '2021-03-16 01:48:36', 'sravanstainely@gmail.com', NULL, NULL),
(25, '25', '2d5f4020d328849002db33d9a65cdeef', 'sravan kumar', 'KUMAR', '1/102,uppal,secunderabad', '1/102,uppal,secunderabad', 0, 0, NULL, NULL, '500064', NULL, '', 'sravanstainely@gmail.com', 'sravan', 'sravan', '12-11-368/8,warasiguda', '12-11-368/8,warasiguda', 0, NULL, NULL, NULL, '500044', NULL, '', 'sravanstainely@gmail.com', 15, 20250.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 13, NULL, 'm', '', 20250.00, 0, 0, '2021-03-16 02:00:51', 'sravanstainely@gmail.com', NULL, NULL),
(26, '26', '2d5f4020d328849002db33d9a65cdeef', 'sravan kumar', 'KUMAR', '1/102,uppal,secunderabad', '1/102,uppal,secunderabad', 0, 0, NULL, NULL, '500064', NULL, '', 'sravanstainely@gmail.com', 'sravan', 'sravan', '12-11-368/8,warasiguda', '12-11-368/8,warasiguda', 0, NULL, NULL, NULL, '500044', NULL, '', 'sravanstainely@gmail.com', 11, 14520.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 13, NULL, 'm', '', 14520.00, 0, 0, '2021-03-16 02:10:24', 'sravanstainely@gmail.com', NULL, NULL),
(27, '27', '81df79fe404dfc674b377e52e5e31533', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '', 'mktg@adroitinfoactive.net', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 40, 40800.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 40800.00, 0, 0, '2021-03-17 06:08:52', 'mktg@adroitinfoactive.net', NULL, NULL),
(28, '28', '81df79fe404dfc674b377e52e5e31533', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '', 'mktg@adroitinfoactive.net', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 15, 15300.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 15300.00, 0, 0, '2021-03-17 06:17:05', 'mktg@adroitinfoactive.net', NULL, NULL),
(29, '29', '81df79fe404dfc674b377e52e5e31533', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '', 'mktg@adroitinfoactive.net', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 15, 11475.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 11475.00, 0, 0, '2021-03-17 06:19:58', 'mktg@adroitinfoactive.net', NULL, NULL),
(30, '30', '81df79fe404dfc674b377e52e5e31533', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '', 'mktg@adroitinfoactive.net', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 15, 15300.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 15300.00, 0, 0, '2021-03-17 06:39:06', 'mktg@adroitinfoactive.net', NULL, NULL),
(31, '31', '81df79fe404dfc674b377e52e5e31533', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '', 'mktg@adroitinfoactive.net', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 15, 15300.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 15300.00, 0, 0, '2021-03-17 09:38:36', 'mktg@adroitinfoactive.net', NULL, NULL),
(32, '32', 'd525e30b7bc9ca8e970ea748f4de2a76', 'sravan kumar', 'KUMAR', '1/102,uppal,secunderabad', '1/102,uppal,secunderabad', 0, 0, NULL, NULL, '500064', NULL, '', 'sravanstainely@gmail.com', 'sravan', 'sravan', '12-11-368/8,warasiguda', '12-11-368/8,warasiguda', 0, NULL, NULL, NULL, '500044', NULL, '', 'sravanstainely@gmail.com', 15, 20250.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 13, NULL, 'm', '', 20250.00, 0, 0, '2021-03-17 09:47:11', 'sravanstainely@gmail.com', NULL, NULL),
(33, '33', '3e4dcbe6e0cbd43efce5dea1d78b9254', 'sravan kumar', 'KUMAR', '1/102,uppal,secunderabad', '1/102,uppal,secunderabad', 0, 0, NULL, NULL, '500064', NULL, '', 'sravanstainely@gmail.com', 'sravan', 'sravan', '12-11-368/8,warasiguda', '12-11-368/8,warasiguda', 0, NULL, NULL, NULL, '500044', NULL, '', 'sravanstainely@gmail.com', 20, 75000.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 13, NULL, 'm', '', 75000.00, 0, 0, '2021-03-17 09:52:15', 'sravanstainely@gmail.com', NULL, NULL),
(34, '34', '3e4dcbe6e0cbd43efce5dea1d78b9254', 'sravan', 'sravan', '102/2,WARASIGUDA', '', 0, 0, NULL, NULL, '500054', NULL, '', 'sravanstainely@gmail.com1234', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 50, 187500.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 22, NULL, 'm', '', 187500.00, 0, 0, '2021-03-17 10:02:36', 'sravanstainely@gmail.com1234', NULL, NULL),
(35, '35', '81df79fe404dfc674b377e52e5e31533', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '', 'mktg@adroitinfoactive.net', 15, 11475.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 11475.00, 0, 0, '2021-03-17 10:04:04', 'mktg@adroitinfoactive.net', NULL, NULL),
(36, '36', '05278d18bd72e9a29a8e8f85af95a21e', '', '', '', '', 0, 0, NULL, NULL, '', NULL, '', '', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 11114, 11336280.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 23, NULL, 's', '', 11336280.00, 0, 0, '2021-03-17 10:04:23', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(37, '37', '81df79fe404dfc674b377e52e5e31533', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '', 'mktg@adroitinfoactive.net', 20, 15300.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 15300.00, 0, 0, '2021-03-17 10:05:44', 'mktg@adroitinfoactive.net', NULL, NULL),
(38, '38', '3e4dcbe6e0cbd43efce5dea1d78b9254', 'RAVI KUMAR', 'RAVI KUMAR', '123/201,tankband,secunderabad', '', 0, 0, NULL, NULL, '500054', NULL, '', 'ravikumar@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 10, 37500.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 24, NULL, 'm', '', 37500.00, 0, 0, '2021-03-17 10:06:41', 'ravikumar@gmail.com', NULL, NULL),
(39, '39', '05278d18bd72e9a29a8e8f85af95a21e', 'Ravi Kumar', 'Ravi Kumar', 'Basheerbagh', '', 0, 0, NULL, NULL, '500020', NULL, '', 'ravikumar@adroitinfoactive.net', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 22, 19635.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 23, NULL, 'm', '', 19635.00, 0, 0, '2021-03-17 10:20:30', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(40, '40', '3e4dcbe6e0cbd43efce5dea1d78b9254', 'Ravi Prasad', 'Ravi Prasad', '123/201,libaty', '', 0, 0, NULL, NULL, '500064', NULL, '', 'RaviPrasad@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 15, 11475.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 25, NULL, 'm', '', 11475.00, 0, 0, '2021-03-17 10:20:51', 'RaviPrasad@gmail.com', NULL, NULL),
(41, '41', '2e26a5267c96a2181b0f3d0b09edc06a', 'Ravi Kumar', 'Ravi Kumar', 'Basheerbagh', '', 0, 0, NULL, NULL, '500020', NULL, '', 'ravikumar@adroitinfoactive.net', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 16, 13515.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 23, NULL, 's', '', 13515.00, 0, 0, '2021-03-17 10:23:42', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(42, '42', '2e26a5267c96a2181b0f3d0b09edc06a', 'krishna', 'krishna', 'egt, nallagutta', 'secunderabad', 0, 0, NULL, NULL, '500003', NULL, '', 'krishnaagarwal99@yahoo.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 15, 15300.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 27, NULL, 'm', '', 15300.00, 0, 0, '2021-03-17 10:31:45', 'krishnaagarwal99@yahoo.com', NULL, NULL),
(43, '43', '81df79fe404dfc674b377e52e5e31533', 'kalyani', 'kalyani', 'domalguda', '', 0, 0, NULL, NULL, '500029', NULL, '', 'kal@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 20, 15300.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 28, NULL, 'm', '', 15300.00, 0, 0, '2021-03-17 11:46:35', 'kal@gmail.com', NULL, NULL),
(44, '44', 'ddca34c9c81325033cf6b7895fa49c7e', 'kalyani', 'kalyani', '102-10-01,uppal', '', 0, 0, NULL, NULL, '500060', NULL, '', 'kalyani@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 15, 11475.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 29, NULL, 'm', '', 11475.00, 0, 0, '2021-03-17 11:53:24', 'kalyani@gmail.com', NULL, NULL),
(45, '45', 'ddca34c9c81325033cf6b7895fa49c7e', 'bunty', 'bunty', '12-55-102,warasiguda', '', 0, 0, NULL, NULL, '500064', NULL, '', 'bunty@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 15, 11475.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 30, NULL, 'm', '', 11475.00, 0, 0, '2021-03-17 11:56:44', 'bunty@gmail.com', NULL, NULL),
(46, '46', '81df79fe404dfc674b377e52e5e31533', 'abc', 'abc', '123 Domalguda', '', 0, 0, NULL, NULL, '500029', NULL, '', 'abc@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 25, 25500.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 31, NULL, 'm', '', 25500.00, 0, 0, '2021-03-17 11:59:33', 'abc@gmail.com', NULL, NULL),
(47, '47', '81df79fe404dfc674b377e52e5e31533', 'abc', 'abc', '123 Domalguda', '', 0, 0, NULL, NULL, '500029', NULL, '', 'abc@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 15, 15300.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 31, NULL, 's', '', 15300.00, 0, 0, '2021-03-17 12:01:17', 'abc@gmail.com', NULL, NULL),
(48, '48', '81df79fe404dfc674b377e52e5e31533', 'apple', 'apple', '140 domalguda', '', 0, 0, NULL, NULL, '500029', NULL, '', 'apple@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 15, 15300.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 32, NULL, 'm', '', 15300.00, 0, 0, '2021-03-17 12:11:43', 'apple@gmail.com', NULL, NULL),
(49, '49', '81df79fe404dfc674b377e52e5e31533', 'ball', 'ball', '150 domalguda', '', 0, 0, NULL, NULL, '500020', NULL, '', 'ball@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 15, 15300.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 33, NULL, 'm', '', 15300.00, 0, 0, '2021-03-17 12:14:26', 'ball@gmail.com', NULL, NULL),
(50, '50', 'ddca34c9c81325033cf6b7895fa49c7e', 'kushal', 'kushal', '12-12/102,osmania', '', 0, 0, NULL, NULL, '500054', NULL, '', 'kushal@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 42, 88920.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 35, NULL, 'm', '', 88920.00, 0, 0, '2021-03-17 01:11:40', 'kushal@gmail.com', NULL, NULL),
(51, '51', '42ea3f6ec1407868c51b7735c0f1613d', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '', 'mktg@adroitinfoactive.net', 25, 19125.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 19125.00, 0, 0, '2021-03-18 09:49:37', 'mktg@adroitinfoactive.net', NULL, NULL),
(52, '52', '42ea3f6ec1407868c51b7735c0f1613d', 'abcd', 'abcd', '111', '', 0, 0, NULL, NULL, '500029', NULL, '', 'abcd@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 25, 19125.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 36, NULL, 'm', '', 19125.00, 0, 0, '2021-03-18 10:33:59', 'abcd@gmail.com', NULL, NULL),
(53, '53', 'df8d03eb65ca08357bf2580d2f5f61b7', 'sravan kumar', 'KUMAR', '1/102,uppal,secunderabad', '1/102,uppal,secunderabad', 0, 0, NULL, NULL, '500064', NULL, '9100684366', 'sravanstainely@gmail.com', 'sravan kumar', 'KUMAR', '1/102,uppal,secunderabad', '1/102,uppal,secunderabad', 0, NULL, NULL, NULL, '500064', NULL, '9100684366', 'sravanstainely@gmail.com', 15, 11475.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 13, NULL, 'm', '', 11475.00, 0, 0, '2021-03-18 02:18:36', 'sravanstainely@gmail.com', NULL, NULL),
(54, '54', 'fee394064fdb1be69da3e76e6ae4d202', 'abc123', 'abc123', '121', '', 0, 0, NULL, NULL, '500029', NULL, '8878826021', '123@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 20, 20400.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 37, NULL, 'm', '', 20400.00, 0, 0, '2021-03-19 04:41:10', '123@gmail.com', NULL, NULL),
(55, '55', 'fee394064fdb1be69da3e76e6ae4d202', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '9290448184', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '9290448184', 'mktg@adroitinfoactive.net', 20, 20400.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 20400.00, 0, 0, '2021-03-19 04:46:25', 'mktg@adroitinfoactive.net', NULL, NULL),
(56, '56', 'ecabd6fa5c417620c913f20800b17d58', 'sravan kumar', 'KUMAR', '1/102,uppal,secunderabad', '1/102,uppal,secunderabad', 0, 0, NULL, NULL, '500064', NULL, '9100684366', 'sravanstainely@gmail.com', 'sravan kumar', 'KUMAR', '1/102,uppal,secunderabad', '1/102,uppal,secunderabad', 0, NULL, NULL, NULL, '500064', NULL, '9100684366', 'sravanstainely@gmail.com', 15, 11475.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 13, NULL, 'm', '', 11475.00, 0, 0, '2021-03-20 07:54:14', 'sravanstainely@gmail.com', NULL, NULL),
(57, '57', '0298279565c77279bcbdaed680b9f0db', 'Guest Login', 'Guest Login', 'Guest', '', 0, 0, NULL, NULL, '555555', NULL, '9700974844', 'guest@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 11, 10965.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 39, NULL, 'm', '', 10965.00, 0, 0, '2021-03-20 09:20:00', 'guest@gmail.com', NULL, NULL),
(58, '58', '268fb5e486501da182e34d0829e3b67c', 'Guest', 'Guest', 'Guest', '', 0, 0, NULL, NULL, '500061', NULL, '9700974844', 'guest@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 40, NULL, 'm', '', 10200.00, 0, 0, '2021-03-20 09:35:24', 'guest@gmail.com', NULL, NULL),
(59, '59', 'ecabd6fa5c417620c913f20800b17d58', 'arun', 'arun', '102-368/1,rtc-x road', '', 0, 0, NULL, NULL, '500044', NULL, '910068999', 'arun@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 20, 17850.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 41, NULL, 'm', '', 17850.00, 0, 0, '2021-03-20 09:49:41', 'arun@gmail.com', NULL, NULL),
(60, '60', 'ecabd6fa5c417620c913f20800b17d58', 'arun', 'arun', '102-368/1,rtc-x road', '', 0, 0, NULL, NULL, '500044', NULL, '9100684333', 'arun@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 42, NULL, 's', '', 10200.00, 0, 0, '2021-03-20 09:53:04', 'arun@gmail.com', NULL, NULL),
(61, '61', 'ecabd6fa5c417620c913f20800b17d58', 'arun', 'arun', '15-102,ntr nagar,secunderbad', '', 0, 0, NULL, NULL, '500044', NULL, '9100684333', 'arun@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 43, NULL, 'm', '', 10200.00, 0, 0, '2021-03-20 09:55:51', 'arun@gmail.com', NULL, NULL),
(62, '62', 'ecabd6fa5c417620c913f20800b17d58', 'sai', 'sai', '113-3/8,l r nagar', '', 0, 0, NULL, NULL, '500044', NULL, '9100684333', 'sai@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 44, NULL, 'm', '', 10200.00, 0, 0, '2021-03-20 10:32:51', 'sai@gmail.com', NULL, NULL),
(63, '63', 'ecabd6fa5c417620c913f20800b17d58', 'sai', 'sai', '102-3/8,ram  nagar', '', 0, 0, NULL, NULL, '500044', NULL, '9100684333', 'sai@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 13, 10710.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 45, NULL, 'm', '', 10710.00, 0, 0, '2021-03-20 10:39:50', 'sai@gmail.com', NULL, NULL),
(64, '64', 'd3359999e381e1245eaa8f7bbc0eed14', 'abc', 'abc', '1124', '', 0, 0, NULL, NULL, '500029', NULL, '1245679400', 'abc@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 47, NULL, 'm', '', 10200.00, 0, 0, '2021-03-22 04:47:18', 'abc@gmail.com', NULL, NULL),
(65, '65', 'd3359999e381e1245eaa8f7bbc0eed14', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '9290448184', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '9290448184', 'mktg@adroitinfoactive.net', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 10200.00, 0, 0, '2021-03-22 09:01:01', 'mktg@adroitinfoactive.net', NULL, NULL),
(66, '66', '766ed8629ef23e2d2696ff40449bff66', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '9290448184', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '9290448184', 'mktg@adroitinfoactive.net', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 10200.00, 0, 0, '2021-03-23 05:03:18', 'mktg@adroitinfoactive.net', NULL, NULL),
(67, '67', '4b1b5636324390b79b68d213ed82d559', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '9290448184', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '9290448184', 'mktg@adroitinfoactive.net', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 10200.00, 0, 0, '2021-03-23 06:25:59', 'mktg@adroitinfoactive.net', NULL, NULL),
(68, '68', '4b1b5636324390b79b68d213ed82d559', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '9290448184', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '9290448184', 'mktg@adroitinfoactive.net', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 10200.00, 0, 0, '2021-03-23 06:36:07', 'mktg@adroitinfoactive.net', NULL, NULL),
(69, '69', '4b1b5636324390b79b68d213ed82d559', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '9290448184', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '9290448184', 'mktg@adroitinfoactive.net', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 10200.00, 0, 0, '2021-03-23 07:40:59', 'mktg@adroitinfoactive.net', NULL, NULL),
(70, '70', '4b1b5636324390b79b68d213ed82d559', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '9290448184', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '9290448184', 'mktg@adroitinfoactive.net', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 10200.00, 0, 0, '2021-03-23 07:48:01', 'mktg@adroitinfoactive.net', NULL, NULL),
(71, '71', '4b1b5636324390b79b68d213ed82d559', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '9290448184', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '9290448184', 'mktg@adroitinfoactive.net', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 10200.00, 0, 0, '2021-03-23 07:58:29', 'mktg@adroitinfoactive.net', NULL, NULL),
(72, '72', '4b1b5636324390b79b68d213ed82d559', 'abc', 'abc', '111', '123', 0, 0, NULL, NULL, '500029', NULL, '8978826021', 'vengafashions@test2.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 49, NULL, 'm', '', 10200.00, 0, 0, '2021-03-23 08:05:13', 'vengafashions@test2.com', NULL, NULL),
(73, '73', '3cc772a28f88d916a0d957fcaab41772', 'sai', 'sai', 'domalduga', '', 0, 0, NULL, NULL, '500029', NULL, '8978826021', 'sai@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 11, 11220.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 50, NULL, 'm', '', 11220.00, 0, 0, '2021-03-23 08:14:41', 'sai@gmail.com', NULL, NULL),
(74, '74', '32d4774dec739e095ffd84001f0a33b9', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '9290448184', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '9290448184', 'mktg@adroitinfoactive.net', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 10200.00, 0, 0, '2021-03-23 08:59:50', 'mktg@adroitinfoactive.net', NULL, NULL),
(75, '75', '32d4774dec739e095ffd84001f0a33b9', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '9290448184', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '9290448184', 'mktg@adroitinfoactive.net', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 10200.00, 0, 0, '2021-03-23 09:47:58', 'mktg@adroitinfoactive.net', NULL, NULL),
(76, '76', '32d4774dec739e095ffd84001f0a33b9', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '9290448184', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '9290448184', 'mktg@adroitinfoactive.net', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 10200.00, 0, 0, '2021-03-23 09:49:59', 'mktg@adroitinfoactive.net', NULL, NULL),
(77, '77', '32d4774dec739e095ffd84001f0a33b9', 'sri sai', 'sri sai', 'Devi prasad bagh', '', 0, 0, NULL, NULL, '500029', NULL, '8978826021', 'kalyani.kaluvala@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 51, NULL, 'm', '', 10200.00, 0, 0, '2021-03-23 10:03:01', 'kalyani.kaluvala@gmail.com', NULL, NULL),
(78, '78', '32d4774dec739e095ffd84001f0a33b9', 'ksvya', 'ksvya', 'devi', '', 0, 0, NULL, NULL, '500029', NULL, '978826021', 'kal@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 52, NULL, 'm', '', 10200.00, 0, 0, '2021-03-23 10:13:26', 'kal@gmail.com', NULL, NULL),
(79, '79', '32d4774dec739e095ffd84001f0a33b9', 'sanvi', 'sanvi', 'gsngd', '', 0, 0, NULL, NULL, '500029', NULL, '9866214561', 'sanvi@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 53, NULL, 'm', '', 10200.00, 0, 0, '2021-03-23 10:17:03', 'sanvi@gmail.com', NULL, NULL),
(80, '80', 'e9a9e26e6e141d70e36e95cfdf42386e', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '9290448184', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '9290448184', 'mktg@adroitinfoactive.net', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 10200.00, 0, 0, '2021-03-23 10:32:28', 'mktg@adroitinfoactive.net', NULL, NULL),
(81, '81', 'e9a9e26e6e141d70e36e95cfdf42386e', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '9290448184', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '9290448184', 'mktg@adroitinfoactive.net', 40, 31050.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 31050.00, 0, 0, '2021-03-23 11:09:17', 'mktg@adroitinfoactive.net', NULL, NULL),
(82, '82', 'e6b33cd5a066dfa598059ac077c2801d', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '9290448184', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '9290448184', 'mktg@adroitinfoactive.net', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 10200.00, 0, 0, '2021-03-24 05:11:56', 'mktg@adroitinfoactive.net', NULL, NULL),
(83, '83', '45e48e403918d557719ee3828b46028b', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, 0, NULL, NULL, '500061', NULL, '7569861057', 'subramanyampeddada@gmail.com', 'Subramanyam', 'Subramanyam', 'TEST1', 'TEST2', 0, NULL, NULL, NULL, '500061', NULL, '7569861057', 'subramanyampeddada@gmail.com', 13, 13260.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 1, NULL, 'm', '', 13260.00, 0, 0, '2021-03-24 10:56:38', 'subramanyampeddada@gmail.com', NULL, NULL),
(84, '84', '45e48e403918d557719ee3828b46028b', 'Subramanyam', 'Subramanyam', 'Guest', '', 0, 0, NULL, NULL, '500061', NULL, '9700974844', 'subramanyampeddada@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 12, 11985.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 60, NULL, 'm', '', 11985.00, 0, 0, '2021-03-24 12:00:35', 'subramanyampeddada@gmail.com', NULL, NULL),
(85, '85', '6c3336355c353ed0f10fb977f15281f5', 'sravan kumar', 'KUMAR', '1/102,uppal,secunderabad', '1/102,uppal,secunderabad', 0, 0, NULL, NULL, '500064', NULL, '9100684366', 'sravanstainely@gmail.com', 'sravan kumar', 'KUMAR', '1/102,uppal,secunderabad', '1/102,uppal,secunderabad', 0, NULL, NULL, NULL, '500064', NULL, '9100684366', 'sravanstainely@gmail.com', 12, 11985.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 13, NULL, 'm', '', 11985.00, 0, 0, '2021-03-24 12:04:08', 'sravanstainely@gmail.com', NULL, NULL),
(86, '86', '7076c05754ca5403f19f565d5b0db7f0', '', '', '', '', 0, 0, NULL, NULL, '', NULL, '', '', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 16, 14280.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 62, NULL, 'm', '', 14280.00, 0, 0, '2021-03-24 12:16:24', 'ektagarments@yahoo.co.in', NULL, NULL),
(87, '87', '7076c05754ca5403f19f565d5b0db7f0', '', '', '', '', 0, 0, NULL, NULL, '', NULL, '', '', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 15, 15300.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 62, NULL, 'm', '', 15300.00, 0, 0, '2021-03-24 12:19:54', 'ektagarments@yahoo.co.in', NULL, NULL),
(88, '88', '6c3336355c353ed0f10fb977f15281f5', 'sravan kumar', 'KUMAR', '1/102,uppal,secunderabad', '1/102,uppal,secunderabad', 0, 0, NULL, NULL, '500064', NULL, '9100684366', 'sravanstainely@gmail.com', 'sravan kumar', 'KUMAR', '1/102,uppal,secunderabad', '1/102,uppal,secunderabad', 0, NULL, NULL, NULL, '500064', NULL, '9100684366', 'sravanstainely@gmail.com', 13, 10710.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 13, NULL, 'm', '', 10710.00, 0, 0, '2021-03-24 12:22:29', 'sravanstainely@gmail.com', NULL, NULL),
(89, '89', '45e48e403918d557719ee3828b46028b', 'Subramanyam', 'Subramanyam', 'Guest', '', 0, 0, NULL, NULL, '500061', NULL, '9700974844', '123456789@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 21, 18615.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 63, NULL, 'm', '', 18615.00, 0, 0, '2021-03-24 12:51:30', '123456789@gmail.com', NULL, NULL),
(90, '90', '997819fb3e4dbeeeaa215de4ec175c01', 'venga', 'venga', 'nallakunta', '', 0, 0, NULL, NULL, '500020', NULL, '9789789789', 'venga@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 30, 22950.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 64, NULL, 'm', '', 22950.00, 0, 0, '2021-03-24 12:55:12', 'venga@gmail.com', NULL, NULL),
(91, '91', '6c3336355c353ed0f10fb977f15281f5', 'sravan', 'sravan', '12-102/b,liberty,secunderabad', '', 0, 0, NULL, NULL, '500044', NULL, '9100684386', 'sravanadroit175@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 15, 11475.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 65, NULL, 'm', '', 11475.00, 0, 0, '2021-03-24 12:58:48', 'sravanadroit175@gmail.com', NULL, NULL),
(92, '92', '36f01a83a321a69a1e9c10434cf2a8b1', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '9290448184', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '9290448184', 'mktg@adroitinfoactive.net', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 10200.00, 0, 0, '2021-03-24 01:03:56', 'mktg@adroitinfoactive.net', NULL, NULL),
(93, '93', '0400550e1fb3707002c664cdd1205448', 'Ravi Kumar', 'Ravi Kumar', 'Basheerbagh', '', 0, 0, NULL, NULL, '500020', NULL, '9290448184', 'ravikumar@adroitinfoactive.net', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 14, 11730.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 23, NULL, 'm', '', 11730.00, 0, 0, '2021-03-24 02:58:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(94, '94', '45e48e403918d557719ee3828b46028b', 'Subramanyam', 'Subramanyam', 'Adroit', 'Adroit', 0, 0, NULL, NULL, '500061', NULL, '1234567890', 'aaa@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 11, 11400.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 66, NULL, 'm', '', 11400.00, 0, 0, '2021-03-24 05:09:06', 'aaa@gmail.com', NULL, NULL),
(95, '95', '0400550e1fb3707002c664cdd1205448', 'Ravi Kumar', 'Ravi Kumar', 'Basheerbagh', '', 0, 0, NULL, NULL, '500020', NULL, '9290448184', 'ravikumar@adroitinfoactive.net', 'Ravi Kumar', 'Ravi Kumar', 'Basheerbagh', '', 0, NULL, NULL, NULL, '500020', NULL, '9290448184', 'ravikumar@adroitinfoactive.net', 12, 11730.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 23, NULL, 'm', '', 11730.00, 0, 0, '2021-03-24 05:14:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(96, '96', '0400550e1fb3707002c664cdd1205448', 'Ravi Kumar', 'Ravi Kumar', 'Basheerbagh', '', 0, 0, NULL, NULL, '500020', NULL, '9290448184', 'ravikumar@adroitinfoactive.net', 'Ravi Kumar', 'Ravi Kumar', 'Basheerbagh', '', 0, NULL, NULL, NULL, '500020', NULL, '9290448184', 'ravikumar@adroitinfoactive.net', 10, 10750.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 23, NULL, 'm', '', 10750.00, 0, 0, '2021-03-24 05:17:11', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(97, '97', '6c3336355c353ed0f10fb977f15281f5', 'vengafashion', 'vengafashion', 'liberty', '', 0, 0, NULL, NULL, '500044', NULL, '09100684333', 'vengafashions510', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 20, 17850.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 67, NULL, 'm', '', 17850.00, 0, 0, '2021-03-24 05:33:04', 'vengafashions510', NULL, NULL),
(98, '98', '524d9c066cbb8290347da7d4e864e1c8', 'kalyani', 'kalyani', 'test', 'test', 0, 0, NULL, NULL, '500029', NULL, '9290448184', 'mktg@adroitinfoactive.net', 'mktg', 'mktg', 'hyd', 'hyd', 0, NULL, NULL, NULL, '500060', NULL, '9290448184', 'mktg@adroitinfoactive.net', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 2, NULL, 'm', '', 10200.00, 0, 0, '2021-03-25 04:43:14', 'mktg@adroitinfoactive.net', NULL, NULL),
(99, '99', '524d9c066cbb8290347da7d4e864e1c8', 'kalyani', 'kalyani', 'domalguda', '', 0, 0, NULL, NULL, '500029', NULL, '8978826021', 'sridharkannam@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 68, NULL, 'm', '', 10200.00, 0, 0, '2021-03-25 05:07:51', 'sridharkannam@gmail.com', NULL, NULL),
(100, '100', '524d9c066cbb8290347da7d4e864e1c8', 'sri', 'sri', 'domalguda', '', 0, 0, NULL, NULL, '500029', NULL, '8978826021', 'kannamsridhar@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 69, NULL, 'm', '', 10200.00, 0, 0, '2021-03-25 05:14:17', 'kannamsridhar@gmail.com', NULL, NULL),
(101, '101', '464e5610d6a9c3daa00a0117d12165a6', 'Rajendra prasad', 'Rajendra prasad', 'OPP VIJAYA MILK DAIRY, SARADANAGAR 1ST CROSS', '', 0, 0, NULL, NULL, '515001', NULL, '9441261901', 'bvgfashions@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 13, 13005.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 71, NULL, 'm', '', 13005.00, 0, 0, '2021-04-30 12:43:27', 'bvgfashions@gmail.com', NULL, NULL),
(102, '102', 'd8f751362bf3bb4ccb4fc93e4f7dafc1', '', '', '', '', 0, 0, NULL, NULL, '', NULL, '', '', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 14, 14025.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 78, NULL, 'm', '', 14025.00, 0, 0, '2021-08-23 08:06:46', 'kusumaraju.surya@gmail.com', NULL, NULL),
(103, '103', '58a0b71d26eee0e49159d0fb5f826eb1', 'Derek Lucas', 'Derek Lucas', 'Culpa in facilis al', '', 0, 0, NULL, NULL, '32114', NULL, '9289073868', 'zopeqeti@mailinator.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 82, NULL, 'm', '', 10200.00, 0, 0, '2021-10-05 12:57:08', 'zopeqeti@mailinator.com', NULL, NULL),
(104, '104', 'a72a54cb1f3866de59a3abbd929db45e', '', '', '', '', 0, 0, NULL, NULL, '', NULL, '', '', 'gfdgd fgdfg', 'gfdgd fgdfg', 'gdfgfdgdfg', '', 0, NULL, NULL, NULL, '35005', NULL, 'Dolor tempora id ame', 'xexazi@mailinator.com', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 83, NULL, 'm', '', 10200.00, 0, 0, '2021-10-08 04:00:48', 'xexazi@mailinator.com', NULL, NULL),
(105, '105', '8350898248350dbde1c03d0e459561de', 'venkatesan arumugam', 'venkatesan arumugam', 'Vengikal', '', 0, 0, NULL, NULL, '606601', NULL, '7708480004', 'venkatesan05061997@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 10, 10200.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 88, NULL, 'm', '', 10200.00, 0, 0, '2021-11-26 10:49:14', 'venkatesan05061997@gmail.com', NULL, NULL),
(106, '106', 'b3f03e9b79d3bbc5285acb0d2e2aa1d9', 'Khaled Syed', 'Khaled Syed', 'Old busstand road', '', 0, 0, NULL, NULL, '503306', NULL, '9949042570', 'perfectdresses.bkd@gmail.com', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '', '', 12, 12240.00, NULL, '', 'r', 'r', 'n', '', 0, 0.00, '', '', 0.00, 89, NULL, 'm', '', 12240.00, 0, 0, '2021-11-27 08:12:36', 'perfectdresses.bkd@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cty_mst`
--

CREATE TABLE `cty_mst` (
  `ctym_id` int(15) NOT NULL,
  `ctym_name` varchar(250) NOT NULL COMMENT 'Name of the city',
  `ctym_cntym_id` int(15) NOT NULL COMMENT 'Refer cnty_mst -> cntym_id',
  `ctym_cntrym_id` int(15) DEFAULT NULL,
  `ctym_iso` varchar(250) NOT NULL,
  `ctym_sts` char(1) DEFAULT NULL COMMENT 'Status of the county',
  `ctym_prty` int(15) DEFAULT NULL COMMENT 'Priority of the county',
  `ctym_crtdon` datetime DEFAULT NULL COMMENT 'Date on which the county is created',
  `ctym_crtdby` varchar(250) DEFAULT NULL COMMENT 'By whom the county is created',
  `ctym_mdfdon` datetime DEFAULT NULL COMMENT 'Date on which the county is modified',
  `ctym_mdfdby` varchar(250) DEFAULT NULL COMMENT 'By whom the county is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cty_mst`
--

INSERT INTO `cty_mst` (`ctym_id`, `ctym_name`, `ctym_cntym_id`, `ctym_cntrym_id`, `ctym_iso`, `ctym_sts`, `ctym_prty`, `ctym_crtdon`, `ctym_crtdby`, `ctym_mdfdon`, `ctym_mdfdby`) VALUES
(1, 'Hyderabad', 28, 2, 'HYD', 'a', 1, '2021-12-29 00:00:00', 'admin', NULL, NULL),
(2, 'VIJAYAWADA', 1, 2, 'ap', 'a', 1, '2021-12-29 00:00:00', NULL, NULL, NULL),
(3, 'uppal ', 28, 2, '', 'a', 1, NULL, NULL, NULL, NULL),
(4, 'nalagoda ', 28, 2, '', 'a', 1, NULL, NULL, NULL, NULL),
(7, 'secunderanbad', 28, 0, '', 'a', 1, NULL, NULL, NULL, NULL),
(8, 'Warangal', 28, 0, '', 'a', 1, NULL, NULL, NULL, NULL),
(9, 'Hyd', 28, 0, '', 'a', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lgntrck_mst`
--

CREATE TABLE `lgntrck_mst` (
  `lgntrckm_id` int(15) NOT NULL,
  `lgntrckm_sesid` varchar(250) NOT NULL,
  `lgntrckm_ipadrs` varchar(250) DEFAULT NULL,
  `lgntrckm_lgnm_id` int(15) NOT NULL,
  `lgntrckm_crtdon` datetime DEFAULT NULL,
  `lgntrckm_crtdby` varchar(250) DEFAULT NULL,
  `lgntrckm_mdfdon` datetime DEFAULT NULL,
  `lgntrckm_mdfdby` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgntrck_mst`
--

INSERT INTO `lgntrck_mst` (`lgntrckm_id`, `lgntrckm_sesid`, `lgntrckm_ipadrs`, `lgntrckm_lgnm_id`, `lgntrckm_crtdon`, `lgntrckm_crtdby`, `lgntrckm_mdfdon`, `lgntrckm_mdfdby`) VALUES
(1, 'e4f6ec04350e75fba0921ce7c226a4a2', '183.83.117.166', 1, '2014-06-23 08:35:08', 'admin', '2014-06-23 08:35:13', ''),
(2, 'd5952eb36de6e334a79cdcd8ae22d200', '183.83.84.145', 1, '2014-06-23 08:38:24', 'admin', NULL, NULL),
(3, 'd5952eb36de6e334a79cdcd8ae22d200', '183.83.84.145', 1, '2014-06-23 08:39:15', 'admin', NULL, NULL),
(4, '416b27d589bd1ac052727fed94ae8296', '183.83.84.145', 1, '2014-06-24 01:58:51', 'admin', NULL, NULL),
(5, '416b27d589bd1ac052727fed94ae8296', '183.83.84.145', 1, '2014-06-24 02:39:01', 'admin', NULL, NULL),
(6, '416b27d589bd1ac052727fed94ae8296', '183.83.84.145', 1, '2014-06-24 02:39:54', 'admin', NULL, NULL),
(7, 'd51180504a102c5a379e8ef0965ea12a', '183.83.84.145', 1, '2014-06-24 02:42:49', 'admin', NULL, NULL),
(8, '416b27d589bd1ac052727fed94ae8296', '183.83.84.145', 1, '2014-06-24 03:10:13', 'admin', NULL, NULL),
(9, 'd578e51069edb5717114c17ea7d0fe58', '117.195.188.116', 1, '2014-06-24 03:45:15', 'admin', NULL, NULL),
(10, '416b27d589bd1ac052727fed94ae8296', '183.83.84.145', 1, '2014-06-24 03:46:17', 'admin', NULL, NULL),
(11, '416b27d589bd1ac052727fed94ae8296', '183.83.84.145', 1, '2014-06-24 03:47:52', 'admin', '2014-06-24 03:48:03', ''),
(12, 'a3bdef4e826986946d72a7156bd5294d', '183.83.84.145', 1, '2014-06-24 07:56:57', 'admin', NULL, NULL),
(13, 'a3bdef4e826986946d72a7156bd5294d', '183.83.84.145', 1, '2014-06-24 07:58:23', 'admin', NULL, NULL),
(14, '0d651d942751f172cee2acdc018aa167', '183.83.84.145', 1, '2014-06-25 09:51:04', 'admin', NULL, NULL),
(15, '0d651d942751f172cee2acdc018aa167', '183.83.84.145', 1, '2014-06-25 10:02:24', 'admin', NULL, NULL),
(16, '23b7cae98ba042990e4194bc6f56152c', '183.83.84.145', 1, '2014-06-25 10:08:17', 'admin', NULL, NULL),
(17, '01229af01f552217cd2ca732f6a65a70', '117.195.160.120', 1, '2014-06-25 11:06:34', 'admin', NULL, NULL),
(18, '01229af01f552217cd2ca732f6a65a70', '117.195.160.120', 1, '2014-06-25 11:17:00', 'admin', NULL, NULL),
(19, 'eb8b7a755cb4e29f8c7fd5055951e790', '183.83.84.145', 1, '2014-06-25 12:03:59', 'admin', '2014-06-25 12:04:16', ''),
(20, '6ffe18000a87d96f90e55b5cd1570fc0', '183.83.84.145', 1, '2014-06-26 06:23:56', 'admin', NULL, NULL),
(21, 'ece9c339c3340c53a86c07c4247bbec8', '103.95.172.158', 1, '2020-09-27 03:18:00', 'admin', NULL, NULL),
(22, 'b42165e821fbbafd41e8a01ae43a07df', '116.73.114.15', 1, '2020-09-27 03:20:21', 'admin', NULL, NULL),
(23, '74853964997322a095258a24685998f1', '106.220.123.112', 1, '2020-09-27 05:18:26', 'admin', NULL, NULL),
(24, '65815015921366599348c2c25ffc0b23', '106.217.235.109', 1, '2020-09-28 04:22:51', 'admin', NULL, NULL),
(25, '65815015921366599348c2c25ffc0b23', '157.44.122.218', 1, '2020-09-28 05:11:15', 'admin', NULL, NULL),
(26, '65815015921366599348c2c25ffc0b23', '157.44.122.218', 1, '2020-09-28 05:12:00', 'admin', NULL, NULL),
(27, '65815015921366599348c2c25ffc0b23', '157.44.122.218', 1, '2020-09-28 06:14:02', 'admin', NULL, NULL),
(28, '65815015921366599348c2c25ffc0b23', '157.44.106.252', 1, '2020-09-28 08:28:52', 'admin', NULL, NULL),
(29, '65815015921366599348c2c25ffc0b23', '157.44.106.252', 1, '2020-09-28 08:29:19', 'admin', NULL, NULL),
(30, '65815015921366599348c2c25ffc0b23', '157.44.106.252', 1, '2020-09-28 08:53:55', 'admin', NULL, NULL),
(31, 'a4742e43a16ba3c7c94095961433377d', '106.200.142.21', 1, '2020-09-28 02:13:28', 'admin', NULL, NULL),
(32, 'a4742e43a16ba3c7c94095961433377d', '106.200.142.21', 1, '2020-09-28 02:35:12', 'admin', NULL, NULL),
(33, 'a4742e43a16ba3c7c94095961433377d', '106.200.142.21', 1, '2020-09-28 02:45:20', 'admin', NULL, NULL),
(34, 'b40f9ff72c0204db3feca1aafa96cda4', '124.123.99.107', 1, '2020-09-30 10:42:54', 'admin', NULL, NULL),
(35, 'c9eff1af0d9e873bb130873e4f3875dc', '183.82.60.224', 1, '2020-10-01 04:30:36', 'admin', NULL, NULL),
(36, 'c9eff1af0d9e873bb130873e4f3875dc', '183.82.60.224', 1, '2020-10-01 04:33:54', 'admin', NULL, NULL),
(37, 'c9eff1af0d9e873bb130873e4f3875dc', '183.82.60.224', 1, '2020-10-01 04:34:04', 'admin', NULL, NULL),
(38, 'c9eff1af0d9e873bb130873e4f3875dc', '183.82.60.224', 1, '2020-10-01 05:18:33', 'admin', NULL, NULL),
(39, 'fd632a752b6e6a9a64714e430c7ba99c', '27.59.217.180', 1, '2020-10-05 10:51:10', 'admin', NULL, NULL),
(40, '783a2143cb4e44603b46fcdcce8d1bd9', '27.59.217.180', 1, '2020-10-05 10:51:23', 'admin', NULL, NULL),
(41, 'fd632a752b6e6a9a64714e430c7ba99c', '27.59.217.180', 1, '2020-10-05 11:49:55', 'admin', NULL, NULL),
(42, '', '116.73.114.15', 1, '2020-10-06 12:22:10', 'admin', NULL, NULL),
(43, '', '116.73.114.15', 1, '2020-10-06 12:22:20', 'admin', NULL, NULL),
(44, '0bfc0ec1de12345e46809c532c0de425', '157.44.18.101', 1, '2020-10-06 07:52:42', 'admin', NULL, NULL),
(45, '99898f47071d22baa8d0606269e5afb0', '27.59.217.180', 1, '2020-10-06 07:57:27', 'admin', NULL, NULL),
(46, '99898f47071d22baa8d0606269e5afb0', '27.59.217.180', 1, '2020-10-06 10:32:35', 'admin', NULL, NULL),
(47, '8e5e47a521baf5fe11e428f21e636d83', '27.59.217.180', 1, '2020-10-06 10:36:59', 'admin', NULL, NULL),
(48, '99898f47071d22baa8d0606269e5afb0', '27.59.217.180', 1, '2020-10-06 01:25:18', 'admin', NULL, NULL),
(49, '', '116.73.114.15', 1, '2020-10-08 12:54:16', 'admin', NULL, NULL),
(50, '', '116.73.114.15', 1, '2020-10-08 02:14:41', 'admin', NULL, NULL),
(51, '', '115.98.20.101', 1, '2020-10-08 02:18:42', 'admin', NULL, NULL),
(52, '', '27.60.231.125', 1, '2020-10-10 07:41:32', 'admin', NULL, NULL),
(53, 'f09b539406137c1fcdcd51d5994642f7', '106.220.126.72', 1, '2020-10-10 07:43:34', 'admin', NULL, NULL),
(54, '', '27.60.231.125', 1, '2020-10-10 07:43:40', 'admin', NULL, NULL),
(55, '', '27.60.231.125', 1, '2020-10-10 07:43:57', 'admin', NULL, NULL),
(56, '', '27.60.231.125', 1, '2020-10-10 07:44:05', 'admin', NULL, NULL),
(57, '', '106.220.120.32', 1, '2020-10-11 09:00:42', 'admin', NULL, NULL),
(58, '', '106.220.120.32', 1, '2020-10-11 09:01:23', 'admin', NULL, NULL),
(59, '', '106.220.120.32', 1, '2020-10-11 09:02:58', 'admin', NULL, NULL),
(60, '', '27.60.231.125', 1, '2020-10-12 06:38:23', 'admin', NULL, NULL),
(61, '0b01e0791eec1e39473d5d25d60bb3d5', '27.60.231.125', 1, '2020-10-12 06:39:11', 'admin', NULL, NULL),
(62, '', '27.60.231.125', 1, '2020-10-12 06:43:02', 'admin', NULL, NULL),
(63, '', '27.60.231.125', 1, '2020-10-12 06:43:14', 'admin', NULL, NULL),
(64, 'b146eb451d5b71cb62317eb50c7bc7d8', '27.60.231.125', 1, '2020-10-12 07:39:33', 'admin', NULL, NULL),
(65, 'd15feece8be55ac466e3a9a9b0ee4ef3', '116.73.114.15', 1, '2020-10-12 08:05:06', 'admin', NULL, NULL),
(66, 'f4f7c2a9ffdd33fcc0440a2e0fb13313', '223.227.103.121', 1, '2020-10-17 05:14:23', 'admin', NULL, NULL),
(67, 'd64e2a4bbe08f34d3d7c9481836ecccc', '106.200.162.134', 1, '2020-10-17 11:58:39', 'admin', NULL, NULL),
(68, '3c2fcbb62b599c39b8ff1601a558539e', '223.227.103.121', 1, '2020-10-18 03:55:28', 'admin', NULL, NULL),
(69, '98a105ad9890797c961c02b1a83e2333', '223.227.103.121', 1, '2020-10-19 04:23:26', 'admin', NULL, NULL),
(70, 'e4bd56a2d03bf70622b297f2720de096', '106.200.142.42', 1, '2020-10-19 06:31:32', 'admin', NULL, NULL),
(71, 'e8b35146bb46338261c19683df9f7978', '106.200.142.42', 1, '2020-10-19 06:41:24', 'admin', NULL, NULL),
(72, '98a105ad9890797c961c02b1a83e2333', '223.227.103.121', 1, '2020-10-19 09:09:35', 'admin', NULL, NULL),
(73, '1345f8f0eb582ef72dfdbe25b68694a2', '157.47.86.118', 1, '2020-10-19 12:15:26', 'admin', NULL, NULL),
(74, '98a105ad9890797c961c02b1a83e2333', '223.227.103.121', 1, '2020-10-19 12:18:49', 'admin', NULL, NULL),
(75, '7bb67ed65c7c13127b87aa2a2d88125a', '223.227.103.121', 1, '2020-10-19 01:20:32', 'admin', NULL, NULL),
(76, '7bb67ed65c7c13127b87aa2a2d88125a', '106.217.221.227', 1, '2020-10-19 01:28:15', 'admin', NULL, NULL),
(77, 'ac80bc5f6c5af13c166b875b05eb9b3c', '223.227.111.115', 1, '2020-10-19 02:41:23', 'admin', NULL, NULL),
(78, 'ac80bc5f6c5af13c166b875b05eb9b3c', '223.227.111.115', 1, '2020-10-19 02:44:32', 'admin', NULL, NULL),
(79, 'cdf0713da83e304b7d66b8176d00a11f', '223.227.111.119', 1, '2020-10-20 05:43:14', 'admin', NULL, NULL),
(80, '64567d2dbb725ba6fc71f388f698a018', '116.73.114.15', 1, '2020-10-20 06:37:24', 'admin', NULL, NULL),
(81, 'cdf0713da83e304b7d66b8176d00a11f', '223.227.111.119', 1, '2020-10-20 10:15:28', 'admin', NULL, NULL),
(82, 'a7e377db889068aaf81f830fbf4a1329', '116.73.114.15', 1, '2020-10-21 12:33:30', 'admin', NULL, NULL),
(83, '0602bf98d4f5546c76a1f79a03b5e55a', '223.227.111.119', 1, '2020-10-21 01:35:27', 'admin', NULL, NULL),
(84, '0602bf98d4f5546c76a1f79a03b5e55a', '223.227.111.119', 1, '2020-10-21 01:39:43', 'admin', NULL, NULL),
(85, 'f06c678e368f2e649ac1287f74dd8014', '106.200.164.187', 1, '2020-10-21 02:12:28', 'admin', NULL, NULL),
(86, '0602bf98d4f5546c76a1f79a03b5e55a', '223.227.111.119', 1, '2020-10-21 02:38:12', 'admin', NULL, NULL),
(87, '0602bf98d4f5546c76a1f79a03b5e55a', '223.227.111.119', 1, '2020-10-21 02:55:12', 'admin', NULL, NULL),
(88, '0602bf98d4f5546c76a1f79a03b5e55a', '223.227.111.119', 1, '2020-10-21 02:57:59', 'admin', NULL, NULL),
(89, '0602bf98d4f5546c76a1f79a03b5e55a', '223.227.111.119', 1, '2020-10-21 02:58:32', 'admin', NULL, NULL),
(90, '0602bf98d4f5546c76a1f79a03b5e55a', '223.227.111.119', 1, '2020-10-21 03:00:06', 'admin', NULL, NULL),
(91, '0602bf98d4f5546c76a1f79a03b5e55a', '223.227.111.119', 1, '2020-10-21 03:05:52', 'admin', NULL, NULL),
(92, '0802ddefba594eb516b1638d698ea5a9', '116.73.114.15', 1, '2020-10-22 10:49:32', 'admin', NULL, NULL),
(93, '0802ddefba594eb516b1638d698ea5a9', '116.73.114.15', 1, '2020-10-22 01:11:16', 'admin', NULL, NULL),
(94, '4baf10c90f27de6aece9337427cdc38d', '27.59.255.115', 1, '2020-10-22 02:10:21', 'admin', NULL, NULL),
(95, 'a592f611454a4cfcad57ced99c483bd6', '183.82.60.224', 1, '2020-10-23 06:35:39', 'admin', NULL, NULL),
(96, 'ec1290d6be58e6a55302d42afdf4e58e', '223.238.84.33', 1, '2020-10-23 09:22:49', 'admin', NULL, NULL),
(97, '03eae4cde8180dc36ce25632b3f1168b', '106.217.221.226', 1, '2020-10-23 03:09:28', 'admin', NULL, NULL),
(98, '03eae4cde8180dc36ce25632b3f1168b', '106.217.221.226', 1, '2020-10-23 04:03:22', 'admin', NULL, NULL),
(99, '0e956ee7fef78c73224bea4a47cb8af6', '106.217.221.226', 1, '2020-10-24 04:36:28', 'admin', NULL, NULL),
(100, '0e956ee7fef78c73224bea4a47cb8af6', '106.217.221.226', 1, '2020-10-24 05:21:23', 'admin', NULL, NULL),
(101, '0e956ee7fef78c73224bea4a47cb8af6', '106.217.221.226', 1, '2020-10-24 07:08:36', 'admin', NULL, NULL),
(102, '20cf159531c24caa3c2f81108805a163', '124.123.99.107', 1, '2020-10-24 02:48:23', 'admin', NULL, NULL),
(103, '277e51d36fdb5520b3dedb46fb8a3a28', '106.200.171.95', 1, '2020-10-30 08:32:35', 'admin', NULL, NULL),
(104, '277e51d36fdb5520b3dedb46fb8a3a28', '106.200.171.95', 1, '2020-10-30 08:45:25', 'admin', NULL, NULL),
(105, '7ec1959e56e3db8cf0644f16785e27ad', '124.123.99.107', 1, '2020-10-31 10:43:05', 'admin', NULL, NULL),
(106, 'aa4b1f43f76f56dd7e96a3ee45db0a3f', '27.59.223.126', 1, '2020-11-03 01:06:27', 'admin', NULL, NULL),
(107, 'ee9a1f10b510db436ffcfce92470cbf3', '223.189.78.132', 1, '2020-11-09 05:05:15', 'admin', NULL, NULL),
(108, 'ee9a1f10b510db436ffcfce92470cbf3', '106.200.157.195', 1, '2020-11-09 01:23:51', 'admin', NULL, NULL),
(109, 'e5a9872dd5ca6f36488bb7ec3819f710', '106.200.187.121', 1, '2020-11-10 05:05:08', 'admin', NULL, NULL),
(110, 'e5a9872dd5ca6f36488bb7ec3819f710', '106.200.187.121', 1, '2020-11-10 07:27:13', 'admin', NULL, NULL),
(111, '79ad8f360f589d50a7a431c49c658d9c', '106.200.141.158', 1, '2020-11-11 07:12:45', 'admin', NULL, NULL),
(112, '79ad8f360f589d50a7a431c49c658d9c', '106.200.141.158', 1, '2020-11-11 07:13:50', 'admin', NULL, NULL),
(113, '79ad8f360f589d50a7a431c49c658d9c', '106.200.141.158', 1, '2020-11-11 08:00:47', 'admin', NULL, NULL),
(114, '3d53235762f39a44e548507dca30135f', '106.220.120.117', 1, '2020-11-11 08:30:08', 'admin', NULL, NULL),
(115, 'dc2d286645182a6305aebf3b4f19f3a6', '116.73.114.15', 1, '2020-11-11 03:05:29', 'admin', NULL, NULL),
(116, '0c9a6f301a17950cff3c6bf614c21e8e', '106.200.187.245', 1, '2020-11-13 05:19:35', 'admin', NULL, NULL),
(117, '94c893721d5265159ae587ed995f745d', '106.200.145.230', 1, '2020-11-13 07:10:23', 'admin', NULL, NULL),
(118, '1b270c5b91a2592ccf45db4bbe55524f', '157.44.20.72', 1, '2020-11-13 07:23:39', 'admin', NULL, NULL),
(119, '4ef9630a01e0fc41b720cb421bec24b2', '223.227.35.64', 1, '2020-11-17 02:54:54', 'admin', NULL, NULL),
(120, '9f42fdf8e5a2e2491f0ff659a2a3efe7', '124.123.99.107', 1, '2020-11-18 07:48:09', 'admin', NULL, NULL),
(121, 'ab7a47fa24fd63ac61fec8c84ffa8ae9', '106.200.171.180', 1, '2020-11-18 08:55:24', 'admin', NULL, NULL),
(122, 'be3bb5372c5911bef447e25fba34efc0', '223.228.112.134', 1, '2020-11-18 10:14:44', 'admin', NULL, NULL),
(123, '9f42fdf8e5a2e2491f0ff659a2a3efe7', '124.123.99.107', 1, '2020-11-18 01:19:46', 'admin', NULL, NULL),
(124, 'ab7a47fa24fd63ac61fec8c84ffa8ae9', '106.200.165.16', 1, '2020-11-18 02:28:34', 'admin', NULL, NULL),
(125, 'ab7a47fa24fd63ac61fec8c84ffa8ae9', '106.200.165.16', 1, '2020-11-18 02:36:45', 'admin', NULL, NULL),
(126, 'ab7a47fa24fd63ac61fec8c84ffa8ae9', '106.200.165.16', 1, '2020-11-18 02:41:09', 'admin', NULL, NULL),
(127, '11cb1c25810547015ea2f63147f78206', '223.228.120.64', 1, '2020-11-19 04:59:43', 'admin', NULL, NULL),
(128, 'd47a3a3e90648097529a791ddb876fd0', '106.200.161.52', 1, '2020-11-20 07:05:05', 'admin', NULL, NULL),
(129, 'd47a3a3e90648097529a791ddb876fd0', '106.200.150.201', 1, '2020-11-20 07:48:19', 'admin', NULL, NULL),
(130, 'd47a3a3e90648097529a791ddb876fd0', '106.200.150.201', 1, '2020-11-20 07:54:53', 'admin', NULL, NULL),
(131, 'd47a3a3e90648097529a791ddb876fd0', '106.200.150.201', 1, '2020-11-20 10:44:02', 'admin', NULL, NULL),
(132, 'aa09f712659e5d15b23fc4de9b235d81', '106.200.150.201', 1, '2020-11-20 12:17:31', 'admin', NULL, NULL),
(133, 'f783fdb9424f64e34bf5e645c3c08c84', '223.237.54.224', 1, '2020-11-21 06:28:09', 'admin', NULL, NULL),
(134, '957f6effdcae7509a9444d0fe23babb6', '183.82.60.224', 1, '2020-11-23 08:12:16', 'admin', NULL, NULL),
(135, 'd53aaa10b9ffa9cbbf437962fb7ab8df', '106.200.151.163', 1, '2020-11-23 03:32:53', 'admin', NULL, NULL),
(136, 'd6371dc57087c8688f2ff2d8f15617f9', '106.200.151.163', 1, '2020-11-24 05:54:37', 'admin', NULL, NULL),
(137, 'd6371dc57087c8688f2ff2d8f15617f9', '106.200.151.163', 1, '2020-11-24 06:35:37', 'admin', NULL, NULL),
(138, 'ebaef4d09fdf32aaa720b3d2cb3217f0', '106.200.162.61', 1, '2020-11-24 10:08:11', 'admin', NULL, NULL),
(139, '611f7aa849c3995e42dca8a9d9af8ef6', '223.227.34.129', 1, '2020-11-25 09:50:35', 'admin', NULL, NULL),
(140, 'abd68980fbf5847bcceb9d38d8f2fda1', '116.73.114.15', 1, '2020-11-25 09:52:37', 'admin', NULL, NULL),
(141, '6fed71d1de3710eb7cd281f939116811', '223.189.79.37', 1, '2020-11-25 10:22:34', 'admin', NULL, NULL),
(142, '6fed71d1de3710eb7cd281f939116811', '223.189.79.37', 1, '2020-11-25 12:35:24', 'admin', NULL, NULL),
(143, '6fed71d1de3710eb7cd281f939116811', '223.189.79.37', 1, '2020-11-25 12:43:50', 'admin', NULL, NULL),
(144, '6fed71d1de3710eb7cd281f939116811', '223.189.79.37', 1, '2020-11-25 01:06:24', 'admin', NULL, NULL),
(145, '21fbf584229bd6458fb693169bb18914', '124.123.99.107', 1, '2020-11-30 08:58:21', 'admin', NULL, NULL),
(146, '8363fac188c708463a6c4b5dc739c4e3', '223.227.30.195', 1, '2020-11-30 02:52:49', 'admin', NULL, NULL),
(147, '2dc59f8cf55c4712a0163b646a3fd3bb', '106.200.175.106', 1, '2020-12-02 08:41:39', 'admin', NULL, NULL),
(148, 'e8baf6e739c8f81d3403a4f2ccee25d5', '106.208.5.93', 1, '2020-12-04 04:40:38', 'admin', NULL, NULL),
(149, 'c6960612f323c5313c08d11a1422e751', '183.82.60.224', 1, '2020-12-06 03:58:46', 'admin', NULL, NULL),
(150, '3ecf7357bb4fc43dbd0901d094c2f1e3', '106.200.172.58', 1, '2020-12-08 05:23:48', 'admin', NULL, NULL),
(151, '3ecf7357bb4fc43dbd0901d094c2f1e3', '106.200.172.58', 1, '2020-12-08 07:05:29', 'admin', NULL, NULL),
(152, '3ecf7357bb4fc43dbd0901d094c2f1e3', '106.200.172.58', 1, '2020-12-08 08:11:45', 'admin', NULL, NULL),
(153, '8598900586349bbd1cb5cad8d322c5f8', '106.220.119.187', 1, '2020-12-08 08:30:58', 'admin', NULL, NULL),
(154, '7b52bd39b78ce7fe4efade40079da0c9', '124.123.99.107', 1, '2020-12-08 08:41:54', 'admin', NULL, NULL),
(155, '3ecf7357bb4fc43dbd0901d094c2f1e3', '106.200.172.58', 1, '2020-12-08 02:28:04', 'admin', NULL, NULL),
(156, '02fa1c8c5eb64791d356e1a2f386856f', '116.73.114.15', 1, '2020-12-12 04:22:06', 'admin', NULL, NULL),
(157, 'c778224b422b7534157ddfb5670743ed', '124.123.92.117', 1, '2020-12-14 10:55:00', 'admin', NULL, NULL),
(158, 'e295b0926e3d6b7f5bbb9e54133c6f24', '116.73.114.15', 1, '2020-12-18 05:10:45', 'admin', NULL, NULL),
(159, '5c8aee8ee77a2df470117d97f1d3b871', '124.123.92.117', 1, '2020-12-21 06:31:39', 'admin', NULL, NULL),
(160, '5c8aee8ee77a2df470117d97f1d3b871', '124.123.92.117', 1, '2020-12-21 07:30:06', 'admin', NULL, NULL),
(161, '18d64f26eb1d0570c44b821a404dbc5e', '124.123.92.117', 1, '2020-12-21 08:23:43', 'admin', NULL, NULL),
(162, '6497bb577434eb784d5c89c8c83b1d14', '124.123.92.117', 1, '2020-12-21 09:23:38', 'admin', NULL, NULL),
(163, '188a1228d8e8d9f7afcfe816d1f11cfd', '124.123.92.117', 1, '2020-12-21 09:41:01', 'admin', NULL, NULL),
(164, 'ca7885445c0f771e1afd7821e57f2b55', '124.123.92.117', 1, '2020-12-21 10:44:56', 'admin', NULL, NULL),
(165, 'ca7885445c0f771e1afd7821e57f2b55', '124.123.92.117', 1, '2020-12-21 11:28:31', 'admin', NULL, NULL),
(166, '571134e7317c7796d5c561c5d56d1257', '124.123.92.117', 1, '2020-12-21 01:46:12', 'admin', NULL, NULL),
(167, '84e2288c178ac8bc56b862207c555bf7', '124.123.92.117', 1, '2020-12-22 05:01:40', 'admin', NULL, NULL),
(168, '84e2288c178ac8bc56b862207c555bf7', '124.123.92.117', 1, '2020-12-22 05:52:18', 'admin', NULL, NULL),
(169, '6f2e228a9127a00db273ffaf1abfe930', '124.123.92.117', 1, '2020-12-22 06:50:19', 'admin', NULL, NULL),
(170, '90c4e1c4c2d8bffdec651e76f4a15c70', '124.123.92.117', 1, '2020-12-22 06:57:41', 'admin', NULL, NULL),
(171, '279f370b537816d0991dbdc0f6029665', '124.123.92.117', 1, '2020-12-22 09:23:57', 'admin', NULL, NULL),
(172, '5daf475dca3f1d06e0778bea8877951b', '124.123.92.117', 1, '2020-12-23 09:49:28', 'admin', NULL, NULL),
(173, '5daf475dca3f1d06e0778bea8877951b', '124.123.92.117', 1, '2020-12-23 11:25:16', 'admin', NULL, NULL),
(174, 'bd916da35a42c0e16e693d81ecc164ee', '124.123.92.117', 1, '2020-12-23 12:41:58', 'admin', NULL, NULL),
(175, '5daf475dca3f1d06e0778bea8877951b', '124.123.92.117', 1, '2020-12-23 12:42:01', 'admin', NULL, NULL),
(176, '5daf475dca3f1d06e0778bea8877951b', '124.123.92.117', 1, '2020-12-23 01:22:29', 'admin', NULL, NULL),
(177, '741f5c54dbd2ff1b90e9479f0c4599b5', '223.227.30.141', 1, '2020-12-23 04:03:36', 'admin', NULL, NULL),
(178, '6aafdb9834613fa945ca47cc3b06a35e', '183.82.58.253', 1, '2020-12-24 05:56:49', 'admin', NULL, NULL),
(179, 'ac34a86232ad95fee9c9bc6b4ef471f5', '183.82.58.253', 1, '2020-12-24 06:26:33', 'admin', NULL, NULL),
(180, '6aafdb9834613fa945ca47cc3b06a35e', '183.82.58.253', 1, '2020-12-24 06:29:21', 'admin', NULL, NULL),
(181, '6aafdb9834613fa945ca47cc3b06a35e', '183.82.58.253', 1, '2020-12-24 06:45:18', 'admin', NULL, NULL),
(182, 'fb5cc5ebddc785602cb2085086609075', '124.123.92.117', 1, '2020-12-25 06:19:38', 'admin', NULL, NULL),
(183, '0f6ce078beef9acd001fc2a55e069ca2', '183.82.58.253', 1, '2020-12-25 06:28:49', 'admin', NULL, NULL),
(184, 'f51c83815cf245ef2fcc54dfd16ad896', '124.123.92.117', 1, '2020-12-25 06:33:31', 'admin', NULL, NULL),
(185, '05f195e0c02ffb2682d98addbe759b90', '116.73.114.15', 1, '2020-12-25 05:36:46', 'admin', NULL, NULL),
(186, 'c9621963317bbab2e7fae6e9d1dec766', '183.82.58.253', 1, '2020-12-26 04:29:44', 'admin', NULL, NULL),
(187, 'c87c73e132d227baa6807f86043c19f4', '115.98.216.25', 1, '2020-12-26 06:24:35', 'admin', '2020-12-26 07:12:23', 'admin'),
(188, 'fb5cc5ebddc785602cb2085086609075', '183.82.58.253', 1, '2020-12-26 09:21:16', 'admin', NULL, NULL),
(189, 'c87c73e132d227baa6807f86043c19f4', '115.98.216.25', 1, '2020-12-26 09:23:12', 'admin', NULL, NULL),
(190, '00ce4b4ed11f81f8f11e0bdbe2352f71', '124.123.92.117', 1, '2020-12-26 09:43:20', 'admin', '2020-12-26 10:01:25', 'admin'),
(191, 'c87c73e132d227baa6807f86043c19f4', '115.98.216.25', 1, '2020-12-26 10:13:09', 'admin', NULL, NULL),
(192, 'c87c73e132d227baa6807f86043c19f4', '115.98.216.25', 1, '2020-12-26 10:33:59', 'admin', NULL, NULL),
(193, '9707d311d7c8f5aea3d398e79cdaa5a7', '124.123.99.107', 1, '2020-12-29 09:29:00', 'admin', NULL, NULL),
(194, '193f44094f52fb63c5b01726c21f540c', '183.82.58.253', 1, '2020-12-29 09:38:40', 'admin', NULL, NULL),
(195, 'e436416ef6079dc61712f305fa9abb52', '157.48.181.186', 1, '2020-12-31 09:56:35', 'admin', NULL, NULL),
(196, 'b277232c4bbc9eb9aa8ca102717589a7', '115.98.216.25', 1, '2020-12-31 10:25:31', 'admin', NULL, NULL),
(197, 'b277232c4bbc9eb9aa8ca102717589a7', '115.98.216.25', 1, '2020-12-31 10:29:42', 'admin', '2020-12-31 11:21:19', 'admin'),
(198, 'b277232c4bbc9eb9aa8ca102717589a7', '115.98.216.25', 1, '2020-12-31 11:53:51', 'admin', NULL, NULL),
(199, '6ecb2da16d750a53eba3fbb3e25a6108', '183.82.60.224', 1, '2021-01-01 02:10:40', 'admin', NULL, NULL),
(200, 'b20b0a64d1774b62e7bef78d3a19b166', '115.98.216.25', 1, '2021-01-02 05:11:22', 'admin', NULL, NULL),
(201, 'b20b0a64d1774b62e7bef78d3a19b166', '115.98.216.25', 1, '2021-01-02 06:22:35', 'admin', NULL, NULL),
(202, 'e6d53ef1ba523d6878881b8868047436', '183.82.58.253', 1, '2021-01-02 07:07:05', 'admin', NULL, NULL),
(203, '6ecb2da16d750a53eba3fbb3e25a6108', '124.123.99.107', 1, '2021-01-02 12:47:03', 'admin', NULL, NULL),
(204, 'e4a36546a4a50d8776754bc170b7a5e3', '183.82.58.253', 1, '2021-01-04 06:18:16', 'admin', NULL, NULL),
(205, '8731312047ad3988163e4c2448dc0bd7', '124.123.92.117', 1, '2021-01-04 10:53:44', 'admin', NULL, NULL),
(206, 'da423367830780542ab650d933655b05', '124.123.99.107', 1, '2021-01-04 10:58:09', 'admin', NULL, NULL),
(207, '17a31f0be5f065cc7c276ce12c97752b', '124.123.92.117', 1, '2021-01-04 11:55:40', 'admin', NULL, NULL),
(208, '09e28b66298e8e745753037405667247', '183.82.58.253', 1, '2021-01-04 12:05:12', 'admin', '2021-01-04 12:21:04', 'admin'),
(209, 'f52e162aba38bc4b849034f626cb56c2', '124.123.99.107', 1, '2021-01-04 02:19:24', 'admin', NULL, NULL),
(210, '13fca2c40e939d9d4f7f23a877e6e77c', '124.123.99.107', 1, '2021-01-04 02:27:43', 'admin', NULL, NULL),
(211, '69fe960c3b861d8e8ec411ee8d1f4661', '115.98.216.25', 1, '2021-01-05 11:28:58', 'admin', NULL, NULL),
(212, '81fb56978773f5087915b5d7c9be1d92', '124.123.99.107', 1, '2021-01-05 12:48:43', 'admin', NULL, NULL),
(213, '81fb56978773f5087915b5d7c9be1d92', '124.123.99.107', 1, '2021-01-05 01:45:02', 'admin', NULL, NULL),
(214, '69fe960c3b861d8e8ec411ee8d1f4661', '115.98.216.25', 1, '2021-01-05 01:59:01', 'admin', NULL, NULL),
(215, '121db4696316c02044df551582211e2d', '115.98.216.25', 1, '2021-01-06 05:44:07', 'admin', '2021-01-06 06:34:35', 'admin'),
(216, '6f6c3056476a06086e62168975fe9e2a', '106.195.79.4', 1, '2021-01-15 06:08:45', 'admin', NULL, NULL),
(217, '30a4e9ccdd7ccddd94a45e3890025f1c', '115.98.216.25', 1, '2021-01-15 12:58:59', 'admin', NULL, NULL),
(218, 'cb609f77c1f1077faaf973b3acb92ca9', '124.123.92.117', 1, '2021-01-23 02:39:46', 'admin', '2021-01-23 03:21:07', 'admin'),
(219, 'd9089cb4d8764474e81dde47b23e772e', '106.200.154.74', 1, '2021-01-23 03:28:51', 'admin', NULL, NULL),
(220, '9bd84042eefbacd8c34fb6daf772971d', '116.73.114.15', 1, '2021-01-23 04:02:08', 'admin', NULL, NULL),
(221, '9bd84042eefbacd8c34fb6daf772971d', '116.73.114.15', 1, '2021-01-23 04:02:56', 'admin', NULL, NULL),
(222, '9b97b465544eaf330a71e7c7cef329a9', '106.195.66.241', 1, '2021-01-24 03:21:05', 'admin', NULL, NULL),
(223, '85941fd89652ef4425a675541e70c272', '115.98.216.25', 1, '2021-01-25 06:34:43', 'admin', NULL, NULL),
(224, '748f23ee9863926a59cfd258352524be', '124.123.92.117', 1, '2021-01-25 10:30:28', 'admin', NULL, NULL),
(225, '3e1cc6971f0f6a8261be12df762970a3', '116.73.114.15', 1, '2021-01-25 10:51:44', 'admin', NULL, NULL),
(226, '192108e5f53cf39238e31a3e662f2d94', '157.47.111.33', 1, '2021-01-25 11:39:59', 'admin', NULL, NULL),
(227, '0d69056cf6f03050f1467834781314a8', '124.123.92.117', 1, '2021-01-25 12:42:03', 'admin', NULL, NULL),
(228, '192108e5f53cf39238e31a3e662f2d94', '157.47.111.33', 1, '2021-01-25 12:44:11', 'admin', NULL, NULL),
(229, '192108e5f53cf39238e31a3e662f2d94', '157.47.111.33', 1, '2021-01-25 01:18:42', 'admin', '2021-01-25 01:31:31', 'admin'),
(230, '7edb738437602d90aa7589d871e99e98', '106.200.140.255', 1, '2021-01-26 04:28:02', 'admin', NULL, NULL),
(231, '2dd5e8ec381f90baf4184c6f9c83d47f', '115.98.216.25', 1, '2021-01-27 04:29:08', 'admin', NULL, NULL),
(232, '7c44bac4e9b1c88fd4d8e30ec1b529cb', '124.123.92.117', 1, '2021-01-27 05:02:29', 'admin', NULL, NULL),
(233, 'c479d280d9a9c7c04ce5153bff5de660', '183.82.58.253', 1, '2021-01-27 06:10:13', 'admin', NULL, NULL),
(234, 'a8bb46d322724820cc17b82447cfcb3a', '157.47.110.79', 1, '2021-01-27 08:20:30', 'admin', NULL, NULL),
(235, 'c479d280d9a9c7c04ce5153bff5de660', '183.82.58.253', 1, '2021-01-27 10:50:21', 'admin', NULL, NULL),
(236, 'dfcccc5b69b9fc64c3d6cd463e6498a9', '124.123.92.117', 1, '2021-01-27 10:54:27', 'admin', NULL, NULL),
(237, '3446d0bb92eedf59781de36a23550008', '124.123.92.117', 1, '2021-01-28 10:50:44', 'admin', NULL, NULL),
(238, 'c5fb3569bf58486cae1b49469423d032', '157.47.112.44', 1, '2021-01-29 12:34:44', 'admin', NULL, NULL),
(239, '19dbc1b2d39d61679fc2279dd090e137', '124.123.92.117', 1, '2021-01-30 12:19:42', 'admin', '2021-01-30 12:31:31', 'admin'),
(240, '14bdb611cd6cf6d173679d031a21eac3', '124.123.92.117', 1, '2021-02-04 01:01:53', 'admin', NULL, NULL),
(241, '14bdb611cd6cf6d173679d031a21eac3', '124.123.92.117', 1, '2021-02-04 01:43:57', 'admin', NULL, NULL),
(242, '0a3a01a0136ce6bc8ab4ebd97c499e08', '124.123.92.117', 1, '2021-02-13 12:16:30', 'admin', NULL, NULL),
(243, '3a49fcd9c32066971d4e521c07796048', '124.123.92.117', 1, '2021-02-13 02:19:26', 'admin', NULL, NULL),
(244, '6e43ee43d1e5ba2ff8e61b9d9ac8726d', '124.123.92.117', 1, '2021-02-13 02:29:44', 'admin', '2021-02-13 02:44:21', 'admin'),
(245, 'bb454168d8de47be1bf52f89eeda1a1a', '124.123.92.117', 1, '2021-02-17 06:43:57', 'admin', '2021-02-17 06:49:51', 'admin'),
(246, '821947dbf7003ca63e14deab0de09863', '124.123.92.117', 1, '2021-02-17 06:54:04', 'admin', NULL, NULL),
(247, '821947dbf7003ca63e14deab0de09863', '124.123.92.117', 1, '2021-02-17 10:35:12', 'admin', NULL, NULL),
(248, '45e184cf20abea48809c9e379c90af07', '124.123.92.117', 1, '2021-02-19 03:13:50', 'admin', NULL, NULL),
(249, '202b7d75f4b783a30742f311abef1fec', '202.153.47.37', 1, '2021-02-20 07:22:44', 'admin', NULL, NULL),
(250, '202b7d75f4b783a30742f311abef1fec', '202.153.47.37', 1, '2021-02-21 05:40:09', 'admin', NULL, NULL),
(251, '45ae201ed63c7d1bb7c738decb1725c2', '124.123.92.117', 1, '2021-02-22 04:45:43', 'admin', NULL, NULL),
(252, 'd393c4e04abff023e35eebf1602502eb', '124.123.92.117', 1, '2021-02-22 09:22:29', 'admin', NULL, NULL),
(253, '', '124.123.92.117', 1, '2021-02-23 05:10:27', 'admin', NULL, NULL),
(254, 'de26f3b9ceec0829a0813f6228e9fd13', '124.123.92.117', 1, '2021-02-23 06:15:13', 'admin', NULL, NULL),
(255, 'de26f3b9ceec0829a0813f6228e9fd13', '124.123.92.117', 1, '2021-02-23 09:42:23', 'admin', NULL, NULL),
(256, 'de26f3b9ceec0829a0813f6228e9fd13', '124.123.92.117', 1, '2021-02-23 10:54:34', 'admin', NULL, NULL),
(257, '408ea768cb74bb78f1f8eca421693bfa', '124.123.92.117', 1, '2021-02-23 11:13:00', 'admin', NULL, NULL),
(258, 'de26f3b9ceec0829a0813f6228e9fd13', '124.123.92.117', 1, '2021-02-23 01:19:20', 'admin', NULL, NULL),
(259, '138e0b7d841b200b06c25839b4c5802a', '124.123.92.117', 1, '2021-02-24 04:53:47', 'admin', NULL, NULL),
(260, '66e1aa4e42e985bb3ea3ee84bfcfc924', '124.123.92.117', 1, '2021-02-24 05:15:55', 'admin', NULL, NULL),
(261, '138e0b7d841b200b06c25839b4c5802a', '124.123.92.117', 1, '2021-02-24 10:23:41', 'admin', NULL, NULL),
(262, '138e0b7d841b200b06c25839b4c5802a', '124.123.92.117', 1, '2021-02-24 11:25:50', 'admin', NULL, NULL),
(263, '7eb51b43a1a0d5f2a86d9ba6cf59001b', '124.123.92.117', 1, '2021-02-24 11:30:29', 'admin', NULL, NULL),
(264, 'bb486afcd35be053951a437965f76af4', '124.123.99.107', 1, '2021-02-24 12:13:03', 'admin', NULL, NULL),
(265, '138e0b7d841b200b06c25839b4c5802a', '124.123.92.117', 1, '2021-02-24 12:22:19', 'admin', NULL, NULL),
(266, '66e1aa4e42e985bb3ea3ee84bfcfc924', '124.123.92.117', 1, '2021-02-24 12:25:50', 'admin', NULL, NULL),
(267, '138e0b7d841b200b06c25839b4c5802a', '124.123.92.117', 1, '2021-02-24 12:30:04', 'admin', NULL, NULL),
(268, '138e0b7d841b200b06c25839b4c5802a', '124.123.92.117', 1, '2021-02-24 12:37:03', 'admin', NULL, NULL),
(269, 'bb486afcd35be053951a437965f76af4', '124.123.99.107', 1, '2021-02-24 12:46:36', 'admin', NULL, NULL),
(270, '66e1aa4e42e985bb3ea3ee84bfcfc924', '124.123.92.117', 1, '2021-02-24 01:00:45', 'admin', NULL, NULL),
(271, 'bb486afcd35be053951a437965f76af4', '124.123.99.107', 1, '2021-02-24 01:41:17', 'admin', NULL, NULL),
(272, '66e1aa4e42e985bb3ea3ee84bfcfc924', '124.123.92.117', 1, '2021-02-24 02:24:54', 'admin', NULL, NULL),
(273, '138e0b7d841b200b06c25839b4c5802a', '124.123.92.117', 1, '2021-02-24 02:32:59', 'admin', NULL, NULL),
(274, '138e0b7d841b200b06c25839b4c5802a', '124.123.92.117', 1, '2021-02-24 02:52:56', 'admin', NULL, NULL),
(275, 'fc07da4199709ca82b235314a684a504', '124.123.99.107', 1, '2021-02-25 08:26:36', 'admin', NULL, NULL),
(276, '2249fab62a36213fcf5124395b266696', '124.123.92.117', 1, '2021-02-27 10:34:20', 'admin', NULL, NULL),
(277, '20f0607e8c0884e33781350a9322c7c7', '124.123.92.117', 1, '2021-03-03 05:36:46', 'admin', NULL, NULL),
(278, '20f0607e8c0884e33781350a9322c7c7', '124.123.92.117', 1, '2021-03-03 05:37:18', 'admin', NULL, NULL),
(279, '20f0607e8c0884e33781350a9322c7c7', '124.123.92.117', 1, '2021-03-03 06:37:08', 'admin', NULL, NULL),
(280, 'e48cfacce87ab0d1d64eeaf313511b6f', '124.123.92.117', 1, '2021-03-04 11:17:27', 'admin', NULL, NULL),
(281, 'c1eb4f3a2d2f3c07dc03c7b71a088c45', '124.123.92.117', 1, '2021-03-04 11:35:26', 'admin', NULL, NULL),
(282, 'acadfddac466a6126ff56031bfc1ea0c', '124.123.92.117', 1, '2021-03-04 11:44:18', 'admin', NULL, NULL),
(283, 'acadfddac466a6126ff56031bfc1ea0c', '124.123.92.117', 1, '2021-03-04 12:50:43', 'admin', NULL, NULL),
(284, 'e45ae797edcaa46875146b8b2ec64dbd', '124.123.92.117', 1, '2021-03-05 11:37:31', 'admin', NULL, NULL),
(285, 'e45ae797edcaa46875146b8b2ec64dbd', '124.123.92.117', 1, '2021-03-05 02:09:01', 'admin', NULL, NULL),
(286, 'aa5d3d614ea78cb1e06a8b1df2b0d61f', '124.123.92.117', 1, '2021-03-10 01:16:43', 'admin', NULL, NULL),
(287, 'e87dc82a3ed1c8e26d885cfe420169e5', '183.82.58.253', 1, '2021-03-10 01:18:18', 'admin', NULL, NULL),
(288, 'c8be818c043387c3b4c6f8da07a5a1c7', '106.195.66.105', 1, '2021-03-10 03:13:13', 'admin', NULL, NULL),
(289, 'c8be818c043387c3b4c6f8da07a5a1c7', '106.195.79.105', 1, '2021-03-10 04:58:57', 'admin', NULL, NULL),
(290, '0ce1739a12d6f21eb63def86ca14b023', '124.123.92.117', 1, '2021-03-11 05:28:57', 'admin', NULL, NULL),
(291, '60ae8b56392566d6d0e0a026fe04893d', '124.123.92.117', 1, '2021-03-11 09:07:35', 'admin', NULL, NULL),
(292, '60ae8b56392566d6d0e0a026fe04893d', '124.123.92.117', 1, '2021-03-11 09:45:47', 'admin', '2021-03-11 09:48:17', 'admin'),
(293, 'b313bb922333bd362882be77aaa513e1', '124.123.92.117', 1, '2021-03-11 09:49:59', 'admin', NULL, NULL),
(294, 'b313bb922333bd362882be77aaa513e1', '124.123.92.117', 1, '2021-03-11 02:03:18', 'admin', NULL, NULL),
(295, 'f9b9130d3e45a1aa94407027ee7bf3f8', '124.123.92.117', 1, '2021-03-12 06:42:32', 'admin', NULL, NULL),
(296, 'a5fe539261d8e6b0a18f94e1a1e4577d', '124.123.92.117', 1, '2021-03-12 02:24:29', 'admin', NULL, NULL),
(297, 'a9e97209838436f47fa424793ccb1cd4', '124.123.92.117', 1, '2021-03-12 02:43:22', 'admin', NULL, NULL),
(298, 'f5201c6fe1fa4c1bc2e990f3b0a21900', '124.123.92.117', 1, '2021-03-12 02:48:24', 'admin', NULL, NULL),
(299, '2d61f83210a8ea95db8433fc61605947', '124.123.92.117', 1, '2021-03-12 02:56:35', 'admin', NULL, NULL),
(300, '1bc91520157caaeb39ce57776a4c3ee1', '124.123.92.117', 1, '2021-03-13 05:36:14', 'admin', NULL, NULL),
(301, '1bc91520157caaeb39ce57776a4c3ee1', '124.123.92.117', 1, '2021-03-13 06:16:27', 'admin', NULL, NULL),
(302, 'ee5b76ce138d80b7ce03b5e438f2e10e', '124.123.92.117', 1, '2021-03-13 09:38:28', 'admin', NULL, NULL),
(303, '52c7d3cecd48c10c0a05e21117819b29', '124.123.92.117', 1, '2021-03-13 09:49:24', 'admin', NULL, NULL),
(304, 'ee5b76ce138d80b7ce03b5e438f2e10e', '124.123.92.117', 1, '2021-03-13 10:34:09', 'admin', NULL, NULL),
(305, '7613582d8476047e13c92915fe6e304f', '124.123.92.117', 1, '2021-03-13 10:45:49', 'admin', NULL, NULL),
(306, '7613582d8476047e13c92915fe6e304f', '124.123.92.117', 1, '2021-03-13 02:42:17', 'admin', NULL, NULL),
(307, '52c7d3cecd48c10c0a05e21117819b29', '124.123.92.117', 1, '2021-03-13 03:36:08', 'admin', NULL, NULL),
(308, 'a48613bd9d66ce744b82b16347be9b23', '124.123.92.117', 1, '2021-03-15 06:15:56', 'admin', NULL, NULL),
(309, 'e483698f14794f9a6c85dd846012becf', '124.123.92.117', 1, '2021-03-15 10:18:40', 'admin', NULL, NULL),
(310, 'a48613bd9d66ce744b82b16347be9b23', '124.123.92.117', 1, '2021-03-15 11:32:50', 'admin', NULL, NULL),
(311, '9fe8cab63655ed50cc2e6093f498c519', '124.123.92.117', 1, '2021-03-15 01:47:18', 'admin', NULL, NULL),
(312, '987553120d8c4bf63fd59a6b808f93c9', '106.195.71.105', 1, '2021-03-15 03:43:36', 'admin', '2021-03-15 03:59:07', 'admin'),
(313, '987553120d8c4bf63fd59a6b808f93c9', '106.195.71.105', 1, '2021-03-15 03:59:34', 'admin', '2021-03-15 04:00:00', 'admin'),
(314, '987553120d8c4bf63fd59a6b808f93c9', '106.195.71.105', 1, '2021-03-15 04:03:09', 'admin', '2021-03-15 04:10:24', 'admin'),
(315, '987553120d8c4bf63fd59a6b808f93c9', '106.195.71.105', 1, '2021-03-15 04:11:58', 'admin', '2021-03-15 04:12:08', 'admin'),
(316, '987553120d8c4bf63fd59a6b808f93c9', '27.59.176.55', 1, '2021-03-15 04:36:11', 'admin', NULL, NULL),
(317, '987553120d8c4bf63fd59a6b808f93c9', '27.59.176.55', 1, '2021-03-15 05:51:02', 'admin', NULL, NULL),
(318, '36af9b0ec7ef74915464e60a20f0e000', '124.123.92.117', 1, '2021-03-16 04:47:47', 'admin', NULL, NULL),
(319, '9ab3e8aab5e1c715fb7010f2c303a815', '124.123.92.117', 1, '2021-03-16 05:33:54', 'admin', NULL, NULL),
(320, '07af2175c170cfb936417c2f1e21cd82', '124.123.92.117', 1, '2021-03-16 05:49:29', 'admin', NULL, NULL),
(321, '338ff6006e5d33671e08abf8238188e0', '124.123.92.117', 1, '2021-03-16 07:14:12', 'admin', NULL, NULL),
(322, '9ab3e8aab5e1c715fb7010f2c303a815', '124.123.92.117', 1, '2021-03-16 08:17:40', 'admin', NULL, NULL),
(323, '338ff6006e5d33671e08abf8238188e0', '124.123.92.117', 1, '2021-03-16 10:15:18', 'admin', NULL, NULL),
(324, '12bcd1da09153ef8baa1d7a032c6fbc6', '124.123.92.117', 1, '2021-03-16 01:30:58', 'admin', NULL, NULL),
(325, '12bcd1da09153ef8baa1d7a032c6fbc6', '124.123.92.117', 1, '2021-03-16 01:52:44', 'admin', NULL, NULL),
(326, 'd525e30b7bc9ca8e970ea748f4de2a76', '124.123.92.117', 1, '2021-03-17 05:11:07', 'admin', NULL, NULL),
(327, 'd525e30b7bc9ca8e970ea748f4de2a76', '124.123.92.117', 1, '2021-03-17 06:38:59', 'admin', NULL, NULL),
(328, '81df79fe404dfc674b377e52e5e31533', '124.123.92.117', 1, '2021-03-17 06:42:12', 'admin', NULL, NULL),
(329, '07c0bb392c4469611c65bcf2c940981a', '124.123.92.117', 1, '2021-03-17 07:29:01', 'admin', NULL, NULL),
(330, 'd525e30b7bc9ca8e970ea748f4de2a76', '124.123.92.117', 1, '2021-03-17 08:57:36', 'admin', NULL, NULL),
(331, 'd525e30b7bc9ca8e970ea748f4de2a76', '124.123.92.117', 1, '2021-03-17 09:04:10', 'admin', NULL, NULL),
(332, '07c0bb392c4469611c65bcf2c940981a', '124.123.92.117', 1, '2021-03-17 09:21:05', 'admin', '2021-03-17 10:14:03', 'admin'),
(333, 'a77aae6856a22a99992ab1aa7cd384dc', '124.123.99.107', 1, '2021-03-17 09:50:14', 'admin', NULL, NULL),
(334, '3e4dcbe6e0cbd43efce5dea1d78b9254', '124.123.92.117', 1, '2021-03-17 10:12:52', 'admin', '2021-03-17 10:12:56', 'admin'),
(335, 'a77aae6856a22a99992ab1aa7cd384dc', '124.123.99.107', 1, '2021-03-17 10:59:21', 'admin', NULL, NULL),
(336, 'df8d03eb65ca08357bf2580d2f5f61b7', '124.123.92.117', 1, '2021-03-18 02:21:43', 'admin', NULL, NULL),
(337, '30bbb2ff440403ccfb965aac8b2d155e', '124.123.92.117', 1, '2021-03-20 06:23:19', 'admin', NULL, NULL),
(338, 'ecabd6fa5c417620c913f20800b17d58', '124.123.92.117', 1, '2021-03-20 07:55:48', 'admin', NULL, NULL),
(339, 'ecabd6fa5c417620c913f20800b17d58', '124.123.92.117', 1, '2021-03-20 09:14:31', 'admin', NULL, NULL),
(340, '0298279565c77279bcbdaed680b9f0db', '124.123.92.117', 1, '2021-03-20 09:39:46', 'admin', NULL, NULL),
(341, '30bbb2ff440403ccfb965aac8b2d155e', '124.123.92.117', 1, '2021-03-20 09:44:57', 'admin', NULL, NULL),
(342, 'ecabd6fa5c417620c913f20800b17d58', '124.123.92.117', 1, '2021-03-20 09:57:21', 'admin', NULL, NULL),
(343, '30bbb2ff440403ccfb965aac8b2d155e', '124.123.92.117', 1, '2021-03-20 11:08:49', 'admin', NULL, NULL),
(344, 'ecabd6fa5c417620c913f20800b17d58', '124.123.92.117', 1, '2021-03-20 11:30:13', 'admin', NULL, NULL),
(345, '30bbb2ff440403ccfb965aac8b2d155e', '124.123.92.117', 1, '2021-03-20 11:49:45', 'admin', NULL, NULL),
(346, '30bbb2ff440403ccfb965aac8b2d155e', '124.123.92.117', 1, '2021-03-20 12:15:05', 'admin', NULL, NULL),
(347, 'ecabd6fa5c417620c913f20800b17d58', '124.123.92.117', 1, '2021-03-20 12:40:54', 'admin', NULL, NULL),
(348, 'd7ae474d7f1c4fd432a87f965b949638', '124.123.92.117', 1, '2021-03-22 05:08:19', 'admin', NULL, NULL),
(349, '3fcebeef8510520b35869bec3892b695', '124.123.92.117', 1, '2021-03-22 07:23:31', 'admin', NULL, NULL),
(350, 'd7ae474d7f1c4fd432a87f965b949638', '124.123.92.117', 1, '2021-03-22 10:43:45', 'admin', NULL, NULL),
(351, '3fcebeef8510520b35869bec3892b695', '124.123.92.117', 1, '2021-03-22 11:37:55', 'admin', NULL, NULL),
(352, '3fcebeef8510520b35869bec3892b695', '124.123.92.117', 1, '2021-03-22 01:02:43', 'admin', NULL, NULL),
(353, '82c8b356e268df66f131e821d91034cd', '124.123.92.117', 1, '2021-03-23 04:29:50', 'admin', NULL, NULL),
(354, '2d8672f0a6f9302cc2b64160b685174d', '124.123.92.117', 1, '2021-03-23 05:05:09', 'admin', NULL, NULL),
(355, '340f16df61b880c1d665be34e8d0dacc', '124.123.92.117', 1, '2021-03-23 05:40:10', 'admin', NULL, NULL),
(356, '82c8b356e268df66f131e821d91034cd', '124.123.92.117', 1, '2021-03-23 06:17:21', 'admin', NULL, NULL),
(357, '340f16df61b880c1d665be34e8d0dacc', '124.123.92.117', 1, '2021-03-23 07:16:57', 'admin', NULL, NULL),
(358, '26e3df305cd9fcd28bc6ecc8c1083ac1', '124.123.92.117', 1, '2021-03-23 08:11:14', 'admin', NULL, NULL),
(359, '16cbad3f904b70a771b61f2d8bb41b03', '124.123.92.117', 1, '2021-03-23 08:44:55', 'admin', NULL, NULL),
(360, '16cbad3f904b70a771b61f2d8bb41b03', '124.123.92.117', 1, '2021-03-23 10:00:06', 'admin', NULL, NULL),
(361, '8b82170984cb6228cc6bccb78eef5dff', '124.123.92.117', 1, '2021-03-23 10:00:56', 'admin', NULL, NULL),
(362, 'e3fedd6836bfff36b2c43a4b2adc9d24', '124.123.92.117', 1, '2021-03-23 10:33:22', 'admin', NULL, NULL),
(363, 'e3fedd6836bfff36b2c43a4b2adc9d24', '124.123.92.117', 1, '2021-03-23 11:15:32', 'admin', NULL, NULL),
(364, '8f0af0ca594ae1f45772958ae4affedd', '124.123.92.117', 1, '2021-03-24 04:41:21', 'admin', NULL, NULL),
(365, '6c3336355c353ed0f10fb977f15281f5', '124.123.92.117', 1, '2021-03-24 05:00:50', 'admin', NULL, NULL),
(366, '8f0af0ca594ae1f45772958ae4affedd', '124.123.92.117', 1, '2021-03-24 06:27:39', 'admin', NULL, NULL),
(367, '6c3336355c353ed0f10fb977f15281f5', '124.123.92.117', 1, '2021-03-24 06:36:26', 'admin', NULL, NULL),
(368, 'b29db60d11184ab1ada6faed34eb1bd4', '124.123.92.117', 1, '2021-03-24 07:36:34', 'admin', NULL, NULL),
(369, '44b13e66ac4c824c960dfbf33841e64c', '124.123.92.117', 1, '2021-03-24 09:18:18', 'admin', NULL, NULL),
(370, 'b29db60d11184ab1ada6faed34eb1bd4', '124.123.92.117', 1, '2021-03-24 10:45:15', 'admin', NULL, NULL),
(371, '45e48e403918d557719ee3828b46028b', '124.123.92.117', 1, '2021-03-24 10:54:45', 'admin', NULL, NULL),
(372, 'b29db60d11184ab1ada6faed34eb1bd4', '124.123.92.117', 1, '2021-03-24 10:55:53', 'admin', NULL, NULL),
(373, '6c3336355c353ed0f10fb977f15281f5', '124.123.92.117', 1, '2021-03-24 12:02:03', 'admin', NULL, NULL),
(374, '6c3336355c353ed0f10fb977f15281f5', '124.123.92.117', 1, '2021-03-24 12:04:43', 'admin', NULL, NULL),
(375, '0400550e1fb3707002c664cdd1205448', '124.123.92.117', 1, '2021-03-24 12:18:38', 'admin', NULL, NULL),
(376, '997819fb3e4dbeeeaa215de4ec175c01', '124.123.92.117', 1, '2021-03-24 12:33:15', 'admin', NULL, NULL),
(377, '997819fb3e4dbeeeaa215de4ec175c01', '124.123.92.117', 1, '2021-03-24 12:33:40', 'admin', NULL, NULL),
(378, '997819fb3e4dbeeeaa215de4ec175c01', '124.123.92.117', 1, '2021-03-24 12:46:22', 'admin', NULL, NULL),
(379, '6c3336355c353ed0f10fb977f15281f5', '124.123.92.117', 1, '2021-03-24 01:15:29', 'admin', NULL, NULL),
(380, '45e48e403918d557719ee3828b46028b', '124.123.92.117', 1, '2021-03-24 02:19:38', 'admin', NULL, NULL),
(381, 'f70c9582302fd1c7376b49ab9a9e7e78', '124.123.92.117', 1, '2021-03-24 02:21:39', 'admin', NULL, NULL),
(382, '0400550e1fb3707002c664cdd1205448', '124.123.92.117', 1, '2021-03-24 02:30:16', 'admin', NULL, NULL),
(383, '45e48e403918d557719ee3828b46028b', '124.123.92.117', 1, '2021-03-24 03:22:14', 'admin', NULL, NULL),
(384, 'f70c9582302fd1c7376b49ab9a9e7e78', '124.123.92.117', 1, '2021-03-24 03:32:10', 'admin', NULL, NULL),
(385, '0400550e1fb3707002c664cdd1205448', '124.123.92.117', 1, '2021-03-24 04:35:42', 'admin', NULL, NULL),
(386, '45e48e403918d557719ee3828b46028b', '124.123.92.117', 1, '2021-03-24 04:50:33', 'admin', NULL, NULL),
(387, '6c3336355c353ed0f10fb977f15281f5', '124.123.92.117', 1, '2021-03-24 05:05:48', 'admin', NULL, NULL),
(388, '7e460fbdbd3509553d30bfa16beba0cf', '124.123.92.117', 1, '2021-03-25 04:33:43', 'admin', NULL, NULL),
(389, 'a6a3103bb9e9929a3cca686919355465', '124.123.92.117', 1, '2021-03-25 05:09:23', 'admin', NULL, NULL),
(390, '3f4925cc2d03c42938b015b40aa48e85', '115.98.216.25', 1, '2021-03-26 05:29:12', 'admin', '2021-03-26 05:31:55', 'admin'),
(391, '3f4925cc2d03c42938b015b40aa48e85', '115.98.216.25', 1, '2021-03-26 05:32:48', 'admin', '2021-03-26 05:33:27', 'admin'),
(392, '3f4925cc2d03c42938b015b40aa48e85', '115.98.216.25', 1, '2021-03-26 05:33:44', 'admin', '2021-03-26 05:33:50', 'admin'),
(393, 'viqpop77h803ps7ogc85jfqtuu', '127.0.0.1', 1, '2021-12-24 10:08:18', 'admin', '2021-12-24 10:55:31', 'admin'),
(394, 'viqpop77h803ps7ogc85jfqtuu', '127.0.0.1', 1, '2021-12-24 10:55:39', 'admin', NULL, NULL),
(395, 'viqpop77h803ps7ogc85jfqtuu', '127.0.0.1', 1, '2021-12-25 05:23:22', 'admin', NULL, NULL),
(396, 'viqpop77h803ps7ogc85jfqtuu', '127.0.0.1', 1, '2021-12-25 05:19:24', 'admin', '2021-12-26 06:52:24', 'admin'),
(397, '6ftet7h2om9g6r1fak68a4p21b', '::1', 1, '2021-12-25 05:58:32', 'admin', NULL, NULL),
(398, 'viqpop77h803ps7ogc85jfqtuu', '127.0.0.1', 1, '2021-12-26 06:52:43', 'admin', '2021-12-26 06:52:49', 'admin'),
(399, 'viqpop77h803ps7ogc85jfqtuu', '127.0.0.1', 1, '2021-12-26 06:53:09', 'admin', NULL, NULL),
(400, '5qgrk7csua2q0a859vj5brj7s0', '::1', 1, '2022-01-05 09:08:52', 'admin', NULL, NULL),
(401, '5qgrk7csua2q0a859vj5brj7s0', '::1', 1, '2022-01-05 09:31:14', 'admin', NULL, NULL),
(402, 'nfful9rns1p9n4onf2hnh508kb', '127.0.0.1', 1, '2022-01-05 11:39:00', 'admin', NULL, NULL),
(403, 'nfful9rns1p9n4onf2hnh508kb', '127.0.0.1', 1, '2022-01-08 05:36:08', 'admin', NULL, NULL),
(404, 'nfful9rns1p9n4onf2hnh508kb', '127.0.0.1', 1, '2022-01-11 05:55:56', 'admin', NULL, NULL),
(405, 'e0qm3lsjf0gg12ttmupd625npd', '127.0.0.1', 1, '2022-01-17 04:45:20', 'admin', NULL, NULL),
(406, 'e0qm3lsjf0gg12ttmupd625npd', '127.0.0.1', 1, '2022-01-17 01:03:54', 'admin', NULL, NULL),
(407, 'e0qm3lsjf0gg12ttmupd625npd', '127.0.0.1', 1, '2022-01-18 10:49:28', 'admin', NULL, NULL),
(408, 'e0qm3lsjf0gg12ttmupd625npd', '127.0.0.1', 1, '2022-01-20 05:57:54', 'admin', NULL, NULL),
(409, 'e0qm3lsjf0gg12ttmupd625npd', '127.0.0.1', 1, '2022-01-22 06:24:59', 'admin', NULL, NULL),
(410, 'e0qm3lsjf0gg12ttmupd625npd', '127.0.0.1', 1, '2022-01-24 04:40:34', 'admin', NULL, NULL),
(411, '84dae2c091cd7a09cce5565db44968e8', '183.82.58.253', 1, '2022-01-27 07:57:06', 'admin', NULL, NULL),
(412, 'c666ae4006d3d5f371be5415fcffd91a', '106.195.68.22', 1, '2022-01-27 10:18:20', 'admin', NULL, NULL),
(413, 'e21485a244bb54ebd4f451b9bb32ab8d', '49.204.184.135', 1, '2022-01-27 11:56:21', 'admin', NULL, NULL),
(414, '4df198a638f23af02dac8f0093019ce2', '49.204.184.135', 1, '2022-01-28 06:49:21', 'admin', NULL, NULL),
(415, '50dc81ddee6ddd939dd8aa1b849c9a0f', '106.195.79.35', 1, '2022-01-31 02:19:25', 'admin', NULL, NULL),
(416, 'c666ae4006d3d5f371be5415fcffd91a', '115.98.216.25', 1, '2022-02-02 12:54:44', 'admin', NULL, NULL),
(417, '1107d07832b5aaedbce570f3061c3fbf', '49.204.184.139', 1, '2022-02-03 06:55:09', 'admin', NULL, NULL),
(418, 'c666ae4006d3d5f371be5415fcffd91a', '115.98.216.25', 1, '2022-02-03 06:58:03', 'admin', NULL, NULL),
(419, '21e548ab3357c82d54c18da06306ca9d', '49.204.184.139', 1, '2022-02-03 08:59:03', 'admin', NULL, NULL),
(420, 'b30df6e6d4d474473cf1dcf292f67b29', '49.204.184.139', 1, '2022-02-04 05:10:53', 'admin', '2022-02-04 05:11:58', 'admin'),
(421, 'b30df6e6d4d474473cf1dcf292f67b29', '49.204.184.139', 1, '2022-02-04 05:12:06', 'admin', NULL, NULL),
(422, '267245f71b9fb2da652e18ce7a9b91a3', '124.123.189.243', 1, '2022-02-04 05:13:31', 'admin', NULL, NULL),
(423, 'c666ae4006d3d5f371be5415fcffd91a', '183.82.58.253', 1, '2022-02-10 09:59:44', 'admin', NULL, NULL),
(424, '9ce4c5e60f82dc2cd5fc4c183ad6607a', '49.204.186.173', 1, '2022-02-11 04:48:13', 'admin', NULL, NULL),
(425, 'c666ae4006d3d5f371be5415fcffd91a', '115.98.216.25', 1, '2022-02-12 12:21:06', 'admin', NULL, NULL),
(426, '535ce42153134d5b8cda91616e25f38e', '49.204.187.123', 1, '2022-02-12 12:40:13', 'admin', NULL, NULL),
(427, 'c666ae4006d3d5f371be5415fcffd91a', '183.82.58.253', 1, '2022-02-14 06:30:10', 'admin', NULL, NULL),
(428, 'c666ae4006d3d5f371be5415fcffd91a', '183.82.58.253', 1, '2022-03-02 06:58:34', 'admin', NULL, NULL),
(429, 'c666ae4006d3d5f371be5415fcffd91a', '183.82.58.253', 1, '2022-03-02 09:41:45', 'admin', NULL, NULL),
(430, '7e81331ba4a11f67f995f138b31351e8', '49.204.221.117', 1, '2022-03-03 12:12:02', 'admin', NULL, NULL),
(431, 'c666ae4006d3d5f371be5415fcffd91a', '183.82.58.253', 1, '2022-03-03 12:27:38', 'admin', NULL, NULL),
(432, '7f3f6e01c681fd13084f8ffc9b76a422', '49.204.221.117', 1, '2022-03-03 12:51:17', 'admin', NULL, NULL),
(433, 'c666ae4006d3d5f371be5415fcffd91a', '183.82.58.253', 1, '2022-03-04 06:51:35', 'admin', NULL, NULL),
(434, '165cf51dd5abee186e5b84eca7c5d1a8', '49.204.221.117', 1, '2022-03-04 11:54:13', 'admin', NULL, NULL),
(435, '07044f07d2995589045b7544b928605f', '49.204.220.177', 1, '2022-03-05 06:01:42', 'admin', NULL, NULL),
(436, '0f958b67001e099df4232bb76d73adae', '124.123.92.117', 1, '2022-03-05 10:17:45', 'admin', NULL, NULL),
(437, '0f958b67001e099df4232bb76d73adae', '124.123.92.117', 1, '2022-03-05 10:51:39', 'admin', NULL, NULL),
(438, 'f6c811b66b6174fd3a3f3c4f8f5d7ef3', '49.204.223.57', 1, '2022-06-09 07:54:12', 'admin', NULL, NULL),
(439, '7c63bd697db0c55bad608901ee683a90', '49.204.220.165', 1, '2022-10-26 01:12:30', 'admin', NULL, NULL),
(440, '6c24d9f0bf48bfd84a4652a1173ec153', '49.204.220.165', 1, '2022-10-27 04:09:51', 'admin', NULL, NULL),
(441, '996b8a5519b452aac53e2fc7d1d1eb52', '183.83.236.70', 1, '2023-04-13 06:56:36', 'admin', '2023-04-13 07:56:36', 'admin'),
(442, '996b8a5519b452aac53e2fc7d1d1eb52', '183.83.236.70', 1, '2023-04-13 07:56:46', 'admin', NULL, NULL),
(443, 'a83222540eac5b6384293569e79a56f9', '183.83.236.70', 1, '2023-04-17 08:07:35', 'admin', NULL, NULL),
(444, 'a83222540eac5b6384293569e79a56f9', '183.83.236.70', 1, '2023-04-17 11:15:15', 'admin', NULL, NULL),
(445, '4a65174d99c524f84d339f9b6ab70d8e', '183.83.236.70', 1, '2023-04-18 04:11:02', 'admin', NULL, NULL),
(446, '4a65174d99c524f84d339f9b6ab70d8e', '183.83.236.70', 1, '2023-04-18 06:28:50', 'admin', NULL, NULL),
(447, '10eec30c9b374651b2bd9c925549236c', '183.83.236.70', 1, '2023-04-20 04:08:35', 'admin', NULL, NULL),
(448, '37ec42b6f06c737929d6dbea8099c1fb', '183.83.236.70', 1, '2023-04-21 04:05:27', 'admin', NULL, NULL),
(449, '9u6p4s3cg0f3endd8vfte230fk', '127.0.0.1', 1, '2023-04-21 10:12:48', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lgn_dtl`
--

CREATE TABLE `lgn_dtl` (
  `lgnd_id` int(15) NOT NULL,
  `lgnd_email` varchar(250) NOT NULL DEFAULT '',
  `lgnd_name` varchar(250) DEFAULT NULL,
  `lgnd_adrs` varchar(250) DEFAULT NULL,
  `lgnd_ctym_id` int(15) DEFAULT NULL,
  `lgnd_cntym_id` int(15) DEFAULT NULL,
  `lgnd_cntrym_id` int(15) DEFAULT NULL,
  `lgnd_pin` varchar(250) DEFAULT NULL,
  `lgnd_ph` varchar(250) DEFAULT NULL,
  `lgnd_mob` varchar(250) DEFAULT NULL,
  `lgnd_fax` varchar(250) DEFAULT NULL,
  `lgnd_lgnm_id` int(15) NOT NULL,
  `lgnd_crtdon` datetime DEFAULT NULL,
  `lgnd_crtdby` varchar(250) DEFAULT NULL,
  `lgnd_mdfdon` datetime DEFAULT NULL,
  `lgnd_mdfdby` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lgn_mst`
--

CREATE TABLE `lgn_mst` (
  `lgnm_id` int(15) NOT NULL,
  `lgnm_uid` varchar(250) NOT NULL,
  `lgnm_pwd` varchar(250) DEFAULT NULL,
  `lgnm_typ` char(1) DEFAULT NULL,
  `lgnm_store_id` varchar(10) DEFAULT NULL,
  `lgnm_sts` char(1) DEFAULT NULL,
  `lgnm_crtdon` datetime DEFAULT NULL,
  `lgnm_crtdby` varchar(250) DEFAULT NULL,
  `lgnm_mdfdon` datetime DEFAULT NULL,
  `lgnm_mdfdby` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgn_mst`
--

INSERT INTO `lgn_mst` (`lgnm_id`, `lgnm_uid`, `lgnm_pwd`, `lgnm_typ`, `lgnm_store_id`, `lgnm_sts`, `lgnm_crtdon`, `lgnm_crtdby`, `lgnm_mdfdon`, `lgnm_mdfdby`) VALUES
(1, 'admin', 'b94f5c162745545b03045b6321d91eda', 'a', NULL, 'a', '2022-01-04 06:10:06', NULL, '2022-01-04 06:10:06', NULL),
(2, 'gadmin', '827ccb0eea8a706c4c34a16891f84e7b', 'a', '1', 'a', '2022-01-04 05:12:19', 'admin', NULL, NULL),
(3, 'sc', '827ccb0eea8a706c4c34a16891f84e7b', 'u', '2', 'a', '2022-01-04 05:15:33', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mbrinf_mst`
--

CREATE TABLE `mbrinf_mst` (
  `mbrinfm_id` int(15) NOT NULL,
  `mbrinfm_mbrm_id` int(15) NOT NULL,
  `mbrinfm_email` varchar(250) DEFAULT NULL,
  `mbrinfm_name` varchar(250) NOT NULL,
  `mbrinfm_cmpnynm` varchar(250) DEFAULT NULL,
  `mbrinfm_wbst` varchar(250) DEFAULT NULL,
  `mbrinfm_phno` varchar(250) DEFAULT NULL,
  `mbrinfm_mobno` varchar(250) DEFAULT NULL,
  `mbrinfm_gndr` varchar(250) DEFAULT NULL,
  `mbrinfm_mrtsts` char(1) DEFAULT NULL,
  `mbrinfm_adrs` varchar(250) DEFAULT NULL,
  `mbrinfm_adrs2` varchar(250) DEFAULT NULL,
  `mbrinfm_brthdy` date DEFAULT NULL,
  `mbrinfm_spbrthdy` date DEFAULT NULL,
  `mbrinfm_annvsrydy` date DEFAULT NULL,
  `mbrinfm_cntntm_id` int(15) NOT NULL,
  `mbrinfm_cntrym_id` int(15) DEFAULT NULL,
  `mbrinfm_cntym_id` int(15) DEFAULT NULL,
  `mbrinfm_ctym_id` int(15) DEFAULT NULL,
  `mbrinfm_rlgn` char(1) DEFAULT NULL,
  `mbrinfm_prty` int(15) DEFAULT NULL,
  `mbrinfm_sts` char(1) DEFAULT NULL,
  `mbrinfm_zpcode` int(15) DEFAULT NULL,
  `mbrinfm_dnd` char(1) DEFAULT NULL,
  `mbrinfm_crtdon` datetime DEFAULT NULL,
  `mbrinfm_crtdby` varchar(250) DEFAULT NULL,
  `mbrinfm_mdfdon` datetime DEFAULT NULL,
  `mbrinfm_mdfdby` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mbr_dtl`
--

CREATE TABLE `mbr_dtl` (
  `mbrd_id` int(15) NOT NULL,
  `mbrd_emailid` varchar(250) NOT NULL,
  `mbrd_nckname` varchar(250) DEFAULT NULL COMMENT 'Nickname of the member',
  `mbrd_fstname` varchar(250) NOT NULL,
  `mbrd_lstname` varchar(250) DEFAULT NULL,
  `mbrd_badrs` varchar(250) NOT NULL,
  `mbrd_badrs2` varchar(250) DEFAULT NULL,
  `mbrd_cmpny` varchar(250) NOT NULL,
  `mbrd_gst` varchar(250) NOT NULL,
  `mbrd_bmbrcntrym_id` int(15) DEFAULT NULL,
  `mbrd_bctym_id` int(15) NOT NULL,
  `mbrd_ctynm` varchar(250) NOT NULL,
  `mbrd_bmbrcntym_id` int(15) DEFAULT NULL,
  `mbrd_bcty_id` int(15) NOT NULL,
  `mbrd_bmbrctym_name` varchar(250) DEFAULT NULL,
  `mbrd_bmbrcntym_name` varchar(250) DEFAULT NULL,
  `mbrd_bzip` varchar(250) NOT NULL,
  `mbrd_bdayphone` varchar(250) NOT NULL,
  `mbrd_dfltbil` char(1) DEFAULT NULL,
  `mbrd_dfltshp` char(1) DEFAULT NULL,
  `mbrd_sfstname` varchar(250) DEFAULT NULL,
  `mbrd_slstname` varchar(250) DEFAULT NULL,
  `mbrd_sadrs` varchar(250) DEFAULT NULL,
  `mbrd_sadrs2` varchar(250) DEFAULT NULL,
  `mbrd_smbrcntrym_id` int(15) DEFAULT NULL,
  `mbrd_scty_name` varchar(250) DEFAULT NULL,
  `mbrd_smbrcntym_id` varchar(250) DEFAULT NULL,
  `mbrd_szip` varchar(250) DEFAULT NULL,
  `mbrd_sdayphone` varchar(250) DEFAULT NULL,
  `mbrd_shpchrgm_id` int(15) DEFAULT NULL,
  `mbrd_mbrm_id` int(15) NOT NULL,
  `mbrd_sts` char(1) DEFAULT NULL,
  `mbrd_crtdon` date DEFAULT NULL,
  `mbrd_crtdby` varchar(250) DEFAULT NULL,
  `mbrd_mdfdon` date DEFAULT NULL,
  `mbrd_mdfdby` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mbr_dtl`
--

INSERT INTO `mbr_dtl` (`mbrd_id`, `mbrd_emailid`, `mbrd_nckname`, `mbrd_fstname`, `mbrd_lstname`, `mbrd_badrs`, `mbrd_badrs2`, `mbrd_cmpny`, `mbrd_gst`, `mbrd_bmbrcntrym_id`, `mbrd_bctym_id`, `mbrd_ctynm`, `mbrd_bmbrcntym_id`, `mbrd_bcty_id`, `mbrd_bmbrctym_name`, `mbrd_bmbrcntym_name`, `mbrd_bzip`, `mbrd_bdayphone`, `mbrd_dfltbil`, `mbrd_dfltshp`, `mbrd_sfstname`, `mbrd_slstname`, `mbrd_sadrs`, `mbrd_sadrs2`, `mbrd_smbrcntrym_id`, `mbrd_scty_name`, `mbrd_smbrcntym_id`, `mbrd_szip`, `mbrd_sdayphone`, `mbrd_shpchrgm_id`, `mbrd_mbrm_id`, `mbrd_sts`, `mbrd_crtdon`, `mbrd_crtdby`, `mbrd_mdfdon`, `mbrd_mdfdby`) VALUES
(15, 'sravanstainely@gmail.com', NULL, 'sravan Kumar', NULL, '1021-455,AMBARPET,phase-2', NULL, '', '', 2, 1, 'Hyderabad', 28, 1, '', '', '500061', '9100684386', 'n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-12-31', 'sravanstainely@gmail.com', '2022-01-04', 'sravanstainely@gmail.com'),
(16, 'sravanstainely@gmail.com', NULL, 'sravan Kumar', NULL, 'basheerbagh', NULL, '', '', 2, 1, 'Hyderabad', 28, 1, NULL, NULL, '500024', '9100684385', 'y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-01-06', 'sravanstainely@gmail.com', NULL, NULL),
(17, 'mktg@adroitinfoactive.net', NULL, 'mktg', NULL, 'basheerbagh', NULL, '', '', 2, 1, 'Hyderabad', 28, 1, '', '', '500029', '8978826021', 'y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, '2022-03-03', 'mktg@adroitinfoactive.net', '2022-03-03', 'mktg@adroitinfoactive.net'),
(18, 'mktg@adroitinfoactive.net', NULL, 'mktg', NULL, 'Liberty', NULL, '', '', 2, 9, 'Hyd', 28, 9, NULL, NULL, '500012', '8978826021', 'n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, '2022-03-03', 'mktg@adroitinfoactive.net', NULL, NULL),
(19, 'k123k@gmail.com', NULL, 'kalyani k', NULL, 'basheerbagh', NULL, '', '', 2, 1, 'Hyderabad', 28, 1, NULL, NULL, '500029', '+918978826021', 'y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, '2022-10-27', 'k123k@gmail.com', NULL, NULL),
(20, 'mktg@adroitinfoactive.net', NULL, 'mktg', NULL, 'test', NULL, '', '', 2, 9, 'Hyd', 28, 9, NULL, NULL, '500047', '8978826021', 'n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, '2023-04-13', 'mktg@adroitinfoactive.net', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mbr_mst`
--

CREATE TABLE `mbr_mst` (
  `mbrm_id` int(15) NOT NULL,
  `mbrm_name` varchar(250) DEFAULT NULL COMMENT 'Name of member',
  `mbrm_emailid` varchar(250) NOT NULL COMMENT 'Emailid of the member',
  `mbrm_pwd` varchar(250) NOT NULL COMMENT 'Password of the member',
  `mbrm_usernm` varchar(250) NOT NULL,
  `mbrm_phno` varchar(250) NOT NULL,
  `mbrm_area` varchar(250) NOT NULL,
  `mbrm_nwsltr` char(1) DEFAULT NULL,
  `mbrm_vchr` char(1) DEFAULT NULL,
  `mbrm_ipadrs` varchar(250) DEFAULT NULL,
  `mbrm_sts` char(1) DEFAULT NULL,
  `mbrm_crtdon` datetime DEFAULT NULL,
  `mbrm_crtdby` varchar(250) DEFAULT NULL,
  `mbrm_mdfdon` datetime DEFAULT NULL,
  `mbrm_mdfdby` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mbr_mst`
--

INSERT INTO `mbr_mst` (`mbrm_id`, `mbrm_name`, `mbrm_emailid`, `mbrm_pwd`, `mbrm_usernm`, `mbrm_phno`, `mbrm_area`, `mbrm_nwsltr`, `mbrm_vchr`, `mbrm_ipadrs`, `mbrm_sts`, `mbrm_crtdon`, `mbrm_crtdby`, `mbrm_mdfdon`, `mbrm_mdfdby`) VALUES
(1, 'sravan Kumar', 'sravanstainely@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'sravan', '9100684386', '', NULL, NULL, '::1', 'a', '2021-12-28 09:50:13', 'sravanstainely@gmail.com', '2022-01-05 00:00:00', 'sravanstainely@gmail.com'),
(2, 'mktg', 'mktg@adroitinfoactive.net', '16d30a720e0d18680d38d85fd99e1dbe', 'adroit', '8978826021', '', NULL, NULL, '49.204.221.117', 'a', '2022-03-03 12:06:36', 'mktg@adroitinfoactive.net', NULL, NULL),
(3, 'bharath', 'bharat@adroitinfoactive.net', '827ccb0eea8a706c4c34a16891f84e7b', 'babblu2151', '9700802151', '', NULL, NULL, '115.98.216.25', 'a', '2022-03-05 07:01:02', 'bharat@adroitinfoactive.net', NULL, NULL),
(4, 'kalyani k', 'k123k@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'adroit', '8978826021', '', NULL, NULL, '49.204.220.165', 'a', '2022-10-27 07:20:46', 'k123k@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordsts_dtl`
--

CREATE TABLE `ordsts_dtl` (
  `ordstsd_id` int(15) NOT NULL,
  `ordstsd_ordstsm_id` int(15) NOT NULL,
  `ordstsd_crtordm_id` int(15) NOT NULL,
  `ordstsd_dttm` datetime NOT NULL,
  `ordstsd_desc` text DEFAULT NULL,
  `ordstsd_sts` char(1) DEFAULT NULL,
  `ordstsd_prty` int(15) DEFAULT NULL,
  `ordstsd_crtdon` datetime DEFAULT NULL,
  `ordstsd_crtdby` varchar(250) DEFAULT NULL,
  `ordstsd_mdfdon` datetime DEFAULT NULL,
  `ordstsd_mdfdby` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ordsts_dtl`
--

INSERT INTO `ordsts_dtl` (`ordstsd_id`, `ordstsd_ordstsm_id`, `ordstsd_crtordm_id`, `ordstsd_dttm`, `ordstsd_desc`, `ordstsd_sts`, `ordstsd_prty`, `ordstsd_crtdon`, `ordstsd_crtdby`, `ordstsd_mdfdon`, `ordstsd_mdfdby`) VALUES
(1, 1, 1, '2021-02-23 11:54:30', NULL, NULL, NULL, '2021-02-23 11:54:30', 'test@gmail.com', NULL, NULL),
(2, 1, 2, '2021-02-23 03:05:58', NULL, NULL, NULL, '2021-02-23 03:05:58', 'subramanyampeddada@gmail.com', NULL, NULL),
(3, 1, 3, '2021-02-24 11:23:46', NULL, NULL, NULL, '2021-02-24 11:23:46', 'sravanstainely@gmail.com', NULL, NULL),
(4, 1, 4, '2021-02-24 01:42:04', NULL, NULL, NULL, '2021-02-24 01:42:04', 'subramanyampeddada@gmail.com', NULL, NULL),
(5, 1, 5, '2021-02-24 02:00:59', NULL, NULL, NULL, '2021-02-24 02:00:59', 'sravanstainely@gmail.com', NULL, NULL),
(6, 1, 6, '2021-02-24 02:06:53', NULL, NULL, NULL, '2021-02-24 02:06:53', 'sravanstainely@gmail.com', NULL, NULL),
(7, 1, 8, '2021-02-24 02:12:25', NULL, NULL, NULL, '2021-02-24 02:12:25', 'subramanyampeddada@gmail.com', NULL, NULL),
(8, 1, 9, '2021-02-24 04:19:50', NULL, NULL, NULL, '2021-02-24 04:19:50', 'subramanyampeddada@gmail.com', NULL, NULL),
(9, 1, 10, '2021-02-26 11:23:35', NULL, NULL, NULL, '2021-02-26 11:23:35', 'sravanstainely@gmail.com', NULL, NULL),
(10, 1, 11, '2021-03-02 11:26:14', NULL, NULL, NULL, '2021-03-02 11:26:14', 'ekta_garments@yahoo.co.in', NULL, NULL),
(11, 1, 12, '2021-03-03 10:00:26', NULL, NULL, NULL, '2021-03-03 10:00:26', 'mktg@adroitinfoactive.net', NULL, NULL),
(12, 1, 13, '2021-03-03 11:01:08', NULL, NULL, NULL, '2021-03-03 11:01:08', 'mktg@adroitinfoactive.net', NULL, NULL),
(13, 1, 14, '2021-03-03 11:39:22', NULL, NULL, NULL, '2021-03-03 11:39:22', 'mktg@adroitinfoactive.net', NULL, NULL),
(14, 1, 15, '2021-03-12 06:32:35', NULL, NULL, NULL, '2021-03-12 06:32:35', 'mktg@adroitinfoactive.net', NULL, NULL),
(15, 1, 16, '2021-03-12 06:33:43', NULL, NULL, NULL, '2021-03-12 06:33:43', 'mktg@adroitinfoactive.net', NULL, NULL),
(16, 1, 17, '2021-03-12 06:36:01', NULL, NULL, NULL, '2021-03-12 06:36:01', 'mktg@adroitinfoactive.net', NULL, NULL),
(17, 1, 18, '2021-03-15 04:09:47', NULL, NULL, NULL, '2021-03-15 04:09:47', 'subramanyampeddada@gmail.com', NULL, NULL),
(18, 1, 21, '2021-03-15 06:09:55', NULL, NULL, NULL, '2021-03-15 06:09:55', 'subramanyampeddada@gmail.com', NULL, NULL),
(19, 2, 5, '2021-03-16 11:23:00', '<p>Dear sir/ maam,</p>\r\n\r\n<p>Your order has been confirmed, your order will be dispached shortly.</p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Thankyou.</p>', NULL, NULL, '2021-03-16 05:53:34', '', NULL, NULL),
(20, 2, 21, '2021-03-16 11:38:00', '<p>Dear sir/ maam,</p>\r\n\r\n<p>Your order has been confirmed, your order will be dispached shortly.</p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Thankyou.</p>', NULL, NULL, '2021-03-16 06:05:08', '', NULL, NULL),
(21, 1, 22, '2021-03-16 07:10:20', NULL, NULL, NULL, '2021-03-16 07:10:20', 'mktg@adroitinfoactive.net', NULL, NULL),
(22, 1, 23, '2021-03-16 01:44:25', NULL, NULL, NULL, '2021-03-16 01:44:25', 'sravanstainely@gmail.com', NULL, NULL),
(23, 1, 24, '2021-03-16 01:48:36', NULL, NULL, NULL, '2021-03-16 01:48:36', 'sravanstainely@gmail.com', NULL, NULL),
(24, 1, 25, '2021-03-16 02:00:51', NULL, NULL, NULL, '2021-03-16 02:00:51', 'sravanstainely@gmail.com', NULL, NULL),
(25, 1, 26, '2021-03-16 02:10:24', NULL, NULL, NULL, '2021-03-16 02:10:24', 'sravanstainely@gmail.com', NULL, NULL),
(26, 2, 24, '2021-02-19 16:37:00', '', NULL, NULL, '2021-03-16 02:16:03', '', NULL, NULL),
(27, 3, 24, '2021-02-19 15:54:00', '', NULL, NULL, '2021-03-16 02:16:31', '', NULL, NULL),
(28, 1, 27, '2021-03-17 06:08:52', NULL, NULL, NULL, '2021-03-17 06:08:52', 'mktg@adroitinfoactive.net', NULL, NULL),
(29, 1, 28, '2021-03-17 06:17:05', NULL, NULL, NULL, '2021-03-17 06:17:05', 'mktg@adroitinfoactive.net', NULL, NULL),
(30, 1, 29, '2021-03-17 06:19:58', NULL, NULL, NULL, '2021-03-17 06:19:58', 'mktg@adroitinfoactive.net', NULL, NULL),
(31, 1, 30, '2021-03-17 06:39:06', NULL, NULL, NULL, '2021-03-17 06:39:06', 'mktg@adroitinfoactive.net', NULL, NULL),
(32, 1, 31, '2021-03-17 09:38:36', NULL, NULL, NULL, '2021-03-17 09:38:36', 'mktg@adroitinfoactive.net', NULL, NULL),
(33, 1, 32, '2021-03-17 09:47:11', NULL, NULL, NULL, '2021-03-17 09:47:11', 'sravanstainely@gmail.com', NULL, NULL),
(34, 1, 33, '2021-03-17 09:52:15', NULL, NULL, NULL, '2021-03-17 09:52:15', 'sravanstainely@gmail.com', NULL, NULL),
(35, 1, 34, '2021-03-17 10:02:36', NULL, NULL, NULL, '2021-03-17 10:02:36', 'sravanstainely@gmail.com1234', NULL, NULL),
(36, 1, 35, '2021-03-17 10:04:04', NULL, NULL, NULL, '2021-03-17 10:04:04', 'mktg@adroitinfoactive.net', NULL, NULL),
(37, 1, 36, '2021-03-17 10:04:23', NULL, NULL, NULL, '2021-03-17 10:04:23', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(38, 1, 37, '2021-03-17 10:05:44', NULL, NULL, NULL, '2021-03-17 10:05:44', 'mktg@adroitinfoactive.net', NULL, NULL),
(39, 1, 38, '2021-03-17 10:06:41', NULL, NULL, NULL, '2021-03-17 10:06:41', 'ravikumar@gmail.com', NULL, NULL),
(40, 1, 39, '2021-03-17 10:20:30', NULL, NULL, NULL, '2021-03-17 10:20:30', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(41, 1, 40, '2021-03-17 10:20:51', NULL, NULL, NULL, '2021-03-17 10:20:51', 'RaviPrasad@gmail.com', NULL, NULL),
(42, 1, 41, '2021-03-17 10:23:42', NULL, NULL, NULL, '2021-03-17 10:23:42', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(43, 1, 42, '2021-03-17 10:31:45', NULL, NULL, NULL, '2021-03-17 10:31:45', 'krishnaagarwal99@yahoo.com', NULL, NULL),
(44, 1, 43, '2021-03-17 11:46:35', NULL, NULL, NULL, '2021-03-17 11:46:35', 'kal@gmail.com', NULL, NULL),
(45, 1, 44, '2021-03-17 11:53:24', NULL, NULL, NULL, '2021-03-17 11:53:24', 'kalyani@gmail.com', NULL, NULL),
(46, 1, 45, '2021-03-17 11:56:44', NULL, NULL, NULL, '2021-03-17 11:56:44', 'bunty@gmail.com', NULL, NULL),
(47, 1, 46, '2021-03-17 11:59:33', NULL, NULL, NULL, '2021-03-17 11:59:33', 'abc@gmail.com', NULL, NULL),
(48, 1, 47, '2021-03-17 12:01:17', NULL, NULL, NULL, '2021-03-17 12:01:17', 'abc@gmail.com', NULL, NULL),
(49, 1, 48, '2021-03-17 12:11:43', NULL, NULL, NULL, '2021-03-17 12:11:43', 'apple@gmail.com', NULL, NULL),
(50, 1, 49, '2021-03-17 12:14:26', NULL, NULL, NULL, '2021-03-17 12:14:26', 'ball@gmail.com', NULL, NULL),
(51, 1, 50, '2021-03-17 01:11:40', NULL, NULL, NULL, '2021-03-17 01:11:40', 'kushal@gmail.com', NULL, NULL),
(52, 1, 51, '2021-03-18 09:49:37', NULL, NULL, NULL, '2021-03-18 09:49:37', 'mktg@adroitinfoactive.net', NULL, NULL),
(53, 1, 52, '2021-03-18 10:33:59', NULL, NULL, NULL, '2021-03-18 10:33:59', 'abcd@gmail.com', NULL, NULL),
(54, 1, 53, '2021-03-18 02:18:36', NULL, NULL, NULL, '2021-03-18 02:18:36', 'sravanstainely@gmail.com', NULL, NULL),
(55, 1, 54, '2021-03-19 04:41:10', NULL, NULL, NULL, '2021-03-19 04:41:10', '123@gmail.com', NULL, NULL),
(56, 1, 55, '2021-03-19 04:46:25', NULL, NULL, NULL, '2021-03-19 04:46:25', 'mktg@adroitinfoactive.net', NULL, NULL),
(57, 1, 56, '2021-03-20 07:54:14', NULL, NULL, NULL, '2021-03-20 07:54:14', 'sravanstainely@gmail.com', NULL, NULL),
(58, 1, 57, '2021-03-20 09:20:00', NULL, NULL, NULL, '2021-03-20 09:20:00', 'guest@gmail.com', NULL, NULL),
(59, 1, 58, '2021-03-20 09:35:24', NULL, NULL, NULL, '2021-03-20 09:35:24', 'guest@gmail.com', NULL, NULL),
(60, 1, 59, '2021-03-20 09:49:41', NULL, NULL, NULL, '2021-03-20 09:49:41', 'arun@gmail.com', NULL, NULL),
(61, 1, 60, '2021-03-20 09:53:04', NULL, NULL, NULL, '2021-03-20 09:53:04', 'arun@gmail.com', NULL, NULL),
(62, 1, 61, '2021-03-20 09:55:51', NULL, NULL, NULL, '2021-03-20 09:55:51', 'arun@gmail.com', NULL, NULL),
(63, 1, 62, '2021-03-20 10:32:51', NULL, NULL, NULL, '2021-03-20 10:32:51', 'sai@gmail.com', NULL, NULL),
(64, 1, 63, '2021-03-20 10:39:50', NULL, NULL, NULL, '2021-03-20 10:39:50', 'sai@gmail.com', NULL, NULL),
(65, 1, 64, '2021-03-22 04:47:18', NULL, NULL, NULL, '2021-03-22 04:47:18', 'abc@gmail.com', NULL, NULL),
(66, 1, 65, '2021-03-22 09:01:01', NULL, NULL, NULL, '2021-03-22 09:01:01', 'mktg@adroitinfoactive.net', NULL, NULL),
(67, 3, 5, '2021-03-22 00:00:00', '', NULL, NULL, '2021-03-22 01:45:29', '', NULL, NULL),
(68, 2, 56, '2021-02-19 14:38:00', '<p>Dear sir/ maam,</p>\r\n\r\n<p>Your order has been confirmed, your order will be dispached shortly.</p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Thankyou.</p>', NULL, NULL, '2021-03-22 01:46:42', '', NULL, NULL),
(69, 3, 56, '2021-03-22 00:00:00', '', NULL, NULL, '2021-03-22 01:50:31', '', NULL, NULL),
(70, 1, 66, '2021-03-23 05:03:18', NULL, NULL, NULL, '2021-03-23 05:03:18', 'mktg@adroitinfoactive.net', NULL, NULL),
(71, 2, 66, '0000-00-00 00:00:00', '<p>Dear sir/ maam,</p>\r\n\r\n<p>Your order has been confirmed, your order will be dispached shortly.</p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Thankyou.</p>', NULL, NULL, '2021-03-23 05:05:56', '', NULL, NULL),
(72, 3, 66, '2021-03-23 00:00:00', '', NULL, NULL, '2021-03-23 05:06:53', '', NULL, NULL),
(73, 2, 65, '2021-03-23 11:50:00', '', NULL, NULL, '2021-03-23 06:21:41', '', NULL, NULL),
(74, 3, 65, '2021-03-23 00:00:00', '', NULL, NULL, '2021-03-23 06:23:30', '', NULL, NULL),
(75, 1, 67, '2021-03-23 06:25:59', NULL, NULL, NULL, '2021-03-23 06:25:59', 'mktg@adroitinfoactive.net', NULL, NULL),
(76, 2, 67, '2021-03-23 12:00:00', 'Date Should Be After Order Date', NULL, NULL, '2021-03-23 06:33:27', '', NULL, NULL),
(77, 1, 68, '2021-03-23 06:36:07', NULL, NULL, NULL, '2021-03-23 06:36:07', 'mktg@adroitinfoactive.net', NULL, NULL),
(78, 3, 67, '2021-03-23 00:00:00', '', NULL, NULL, '2021-03-23 06:37:31', '', NULL, NULL),
(79, 2, 68, '2021-03-23 12:00:00', 'Date Should Be After Order Date', NULL, NULL, '2021-03-23 06:41:19', '', NULL, NULL),
(80, 2, 55, '2021-03-23 12:48:00', '', NULL, NULL, '2021-03-23 07:17:52', '', NULL, NULL),
(81, 3, 55, '2021-03-23 00:00:00', '', NULL, NULL, '2021-03-23 07:19:09', '', NULL, NULL),
(82, 2, 51, '2021-03-23 14:51:00', '', NULL, NULL, '2021-03-23 07:19:48', '', NULL, NULL),
(83, 3, 51, '2021-03-23 00:00:00', '', NULL, NULL, '2021-03-23 07:20:31', '', NULL, NULL),
(84, 3, 37, '2021-03-23 00:00:00', '', NULL, NULL, '2021-03-23 07:38:36', '', NULL, NULL),
(85, 1, 69, '2021-03-23 07:40:59', NULL, NULL, NULL, '2021-03-23 07:40:59', 'mktg@adroitinfoactive.net', NULL, NULL),
(86, 2, 69, '2021-03-23 14:30:00', 'Date Should Be After Order Date', NULL, NULL, '2021-03-23 07:42:42', '', NULL, NULL),
(87, 3, 69, '2021-03-23 00:00:00', '', NULL, NULL, '2021-03-23 07:43:05', '', NULL, NULL),
(88, 1, 70, '2021-03-23 07:48:01', NULL, NULL, NULL, '2021-03-23 07:48:01', 'mktg@adroitinfoactive.net', NULL, NULL),
(89, 1, 71, '2021-03-23 07:58:29', NULL, NULL, NULL, '2021-03-23 07:58:29', 'mktg@adroitinfoactive.net', NULL, NULL),
(90, 2, 71, '2021-03-23 15:39:00', 'Date Should Be After Order Date', NULL, NULL, '2021-03-23 08:04:41', '', NULL, NULL),
(91, 1, 72, '2021-03-23 08:05:13', NULL, NULL, NULL, '2021-03-23 08:05:13', 'vengafashions@test2.com', NULL, NULL),
(92, 2, 72, '2021-03-23 12:21:00', 'Date Should Be After Order Date', NULL, NULL, '2021-03-23 08:06:24', '', NULL, NULL),
(93, 3, 72, '2021-03-23 00:00:00', '', NULL, NULL, '2021-03-23 08:06:36', '', NULL, NULL),
(94, 1, 73, '2021-03-23 08:14:41', NULL, NULL, NULL, '2021-03-23 08:14:41', 'sai@gmail.com', NULL, NULL),
(95, 2, 73, '2021-03-23 11:32:00', 'Date Should Be After Order Date', NULL, NULL, '2021-03-23 08:15:49', '', NULL, NULL),
(96, 3, 73, '2021-03-23 00:00:00', '', NULL, NULL, '2021-03-23 08:38:29', '', NULL, NULL),
(97, 3, 71, '2021-03-23 00:00:00', '', 'd', NULL, '2021-03-23 10:41:30', '', NULL, NULL),
(98, 1, 74, '2021-03-23 08:59:50', NULL, NULL, NULL, '2021-03-23 08:59:50', 'mktg@adroitinfoactive.net', NULL, NULL),
(99, 4, 74, '2021-03-23 18:41:00', '<p>Dear sir/maam,</p>\r\n\r\n<p>Your order is been suspended for some reason, for more details contact customer support team.</p>\r\n\r\n<p>Customer support information:Â http://ektagarments.com/contact.php</p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Thankyou.</p>', NULL, NULL, '2021-03-23 09:00:41', '', NULL, NULL),
(100, 1, 75, '2021-03-23 09:47:58', NULL, NULL, NULL, '2021-03-23 09:47:58', 'mktg@adroitinfoactive.net', NULL, NULL),
(101, 1, 76, '2021-03-23 09:49:59', NULL, NULL, NULL, '2021-03-23 09:49:59', 'mktg@adroitinfoactive.net', NULL, NULL),
(102, 1, 77, '2021-03-23 10:03:01', NULL, NULL, NULL, '2021-03-23 10:03:01', 'kalyani.kaluvala@gmail.com', NULL, NULL),
(103, 1, 78, '2021-03-23 10:13:26', NULL, NULL, NULL, '2021-03-23 10:13:26', 'kal@gmail.com', NULL, NULL),
(104, 1, 79, '2021-03-23 10:17:03', NULL, NULL, NULL, '2021-03-23 10:17:03', 'sanvi@gmail.com', NULL, NULL),
(105, 1, 80, '2021-03-23 10:32:28', NULL, NULL, NULL, '2021-03-23 10:32:28', 'mktg@adroitinfoactive.net', NULL, NULL),
(106, 2, 80, '2021-03-23 15:50:00', 'Date Should Be After Order Date', NULL, NULL, '2021-03-23 10:34:56', '', NULL, NULL),
(107, 3, 80, '2021-03-23 00:00:00', '', NULL, NULL, '2021-03-23 10:35:17', '', NULL, NULL),
(108, 2, 76, '2021-03-23 11:32:00', 'Date Should Be After Order Date', NULL, NULL, '2021-03-23 10:38:27', '', NULL, NULL),
(109, 3, 71, '2021-03-23 13:41:00', '', NULL, NULL, '2021-03-23 10:41:30', '', NULL, NULL),
(110, 1, 81, '2021-03-23 11:09:17', NULL, NULL, NULL, '2021-03-23 11:09:17', 'mktg@adroitinfoactive.net', NULL, NULL),
(111, 3, 81, '2021-03-24 00:00:00', '<p>Dear sir/maam,</p>\r\n\r\n<p>Your order has been declined, please contact customer support team for more details.</p>\r\n\r\n<p>customer support details:Â http://vengafashions.com/contact.php</p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Thankyou.</p>', NULL, NULL, '2021-03-24 04:43:49', '', NULL, NULL),
(112, 2, 75, '2021-03-24 11:08:00', '', NULL, NULL, '2021-03-24 04:50:33', '', NULL, NULL),
(113, 3, 75, '2021-03-24 00:00:00', '', NULL, NULL, '2021-03-24 04:50:42', '', NULL, NULL),
(114, 1, 82, '2021-03-24 05:11:56', NULL, NULL, NULL, '2021-03-24 05:11:56', 'mktg@adroitinfoactive.net', NULL, NULL),
(115, 4, 79, '2021-03-24 07:28:00', '<p>Dear sir/maam,</p>\r\n\r\n<p>Your order is been suspended for some reason, for more details contact customer support team.</p>', NULL, NULL, '2021-03-24 05:15:23', '', NULL, NULL),
(116, 1, 83, '2021-03-24 10:56:38', NULL, NULL, NULL, '2021-03-24 10:56:38', 'subramanyampeddada@gmail.com', NULL, NULL),
(117, 2, 83, '2021-03-31 00:00:00', '', NULL, NULL, '2021-03-24 10:58:52', '', NULL, NULL),
(118, 3, 83, '2021-03-24 00:00:00', '', 'd', NULL, '2021-03-24 11:07:35', '', NULL, NULL),
(119, 3, 83, '2021-03-30 00:00:00', '', NULL, NULL, '2021-03-24 11:07:35', '', NULL, NULL),
(120, 3, 18, '2021-03-31 00:00:00', '', NULL, NULL, '2021-03-24 11:08:32', '', NULL, NULL),
(121, 2, 4, '2021-03-31 00:00:00', '', NULL, NULL, '2021-03-24 11:51:22', '', NULL, NULL),
(122, 3, 4, '2021-03-24 00:00:00', '', NULL, NULL, '2021-03-24 11:51:34', '', NULL, NULL),
(123, 1, 84, '2021-03-24 12:00:35', NULL, NULL, NULL, '2021-03-24 12:00:35', 'subramanyampeddada@gmail.com', NULL, NULL),
(124, 1, 85, '2021-03-24 12:04:08', NULL, NULL, NULL, '2021-03-24 12:04:08', 'sravanstainely@gmail.com', NULL, NULL),
(125, 2, 85, '2021-03-24 08:23:00', '<p>Dear sir/ maam,</p>\r\n\r\n<p>Your order has been confirmed, your order will be dispached shortly.</p>', NULL, NULL, '2021-03-24 12:06:05', '', NULL, NULL),
(126, 3, 85, '2021-03-24 00:00:00', '', NULL, NULL, '2021-03-24 12:06:54', '', NULL, NULL),
(127, 1, 86, '2021-03-24 12:16:24', NULL, NULL, NULL, '2021-03-24 12:16:24', 'ektagarments@yahoo.co.in', NULL, NULL),
(128, 1, 87, '2021-03-24 12:19:54', NULL, NULL, NULL, '2021-03-24 12:19:54', 'ektagarments@yahoo.co.in', NULL, NULL),
(129, 1, 88, '2021-03-24 12:22:29', NULL, NULL, NULL, '2021-03-24 12:22:29', 'sravanstainely@gmail.com', NULL, NULL),
(130, 1, 89, '2021-03-24 12:51:30', NULL, NULL, NULL, '2021-03-24 12:51:30', '123456789@gmail.com', NULL, NULL),
(131, 1, 90, '2021-03-24 12:55:12', NULL, NULL, NULL, '2021-03-24 12:55:12', 'venga@gmail.com', NULL, NULL),
(132, 1, 91, '2021-03-24 12:58:48', NULL, NULL, NULL, '2021-03-24 12:58:48', 'sravanadroit175@gmail.com', NULL, NULL),
(133, 1, 92, '2021-03-24 01:03:56', NULL, NULL, NULL, '2021-03-24 01:03:56', 'mktg@adroitinfoactive.net', NULL, NULL),
(134, 2, 92, '2021-03-24 18:35:00', 'Date Should Be After Order Date', NULL, NULL, '2021-03-24 01:05:08', '', NULL, NULL),
(135, 3, 92, '2021-03-24 00:00:00', '', NULL, NULL, '2021-03-24 01:05:39', '', NULL, NULL),
(136, 1, 93, '2021-03-24 02:58:34', NULL, NULL, NULL, '2021-03-24 02:58:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(137, 1, 94, '2021-03-24 05:09:06', NULL, NULL, NULL, '2021-03-24 05:09:06', 'aaa@gmail.com', NULL, NULL),
(138, 1, 95, '2021-03-24 05:14:34', NULL, NULL, NULL, '2021-03-24 05:14:34', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(139, 1, 96, '2021-03-24 05:17:11', NULL, NULL, NULL, '2021-03-24 05:17:11', 'ravikumar@adroitinfoactive.net', NULL, NULL),
(140, 1, 97, '2021-03-24 05:33:04', NULL, NULL, NULL, '2021-03-24 05:33:04', 'vengafashions510', NULL, NULL),
(141, 2, 97, '2021-03-24 05:18:00', 'Date Should Be After Order Date', 'd', NULL, '2021-03-24 05:38:53', '', NULL, NULL),
(142, 3, 97, '2021-03-24 00:00:00', '', NULL, NULL, '2021-03-24 05:38:31', '', NULL, NULL),
(143, 2, 97, '2021-03-24 10:27:00', '<p>Your order has been confirmed, your order will be dispached shortly.</p>', NULL, NULL, '2021-03-24 05:38:53', '', NULL, NULL),
(144, 1, 98, '2021-03-25 04:43:14', NULL, NULL, NULL, '2021-03-25 04:43:14', 'mktg@adroitinfoactive.net', NULL, NULL),
(145, 1, 99, '2021-03-25 05:07:51', NULL, NULL, NULL, '2021-03-25 05:07:51', 'sridharkannam@gmail.com', NULL, NULL),
(146, 2, 99, '2021-03-25 11:20:00', 'Date Should Be After Order Date', NULL, NULL, '2021-03-25 05:10:20', '', NULL, NULL),
(147, 3, 99, '2021-03-25 00:00:00', '', NULL, NULL, '2021-03-25 05:11:01', '', NULL, NULL),
(148, 1, 100, '2021-03-25 05:14:17', NULL, NULL, NULL, '2021-03-25 05:14:17', 'kannamsridhar@gmail.com', NULL, NULL),
(149, 1, 101, '2021-04-30 12:43:27', NULL, NULL, NULL, '2021-04-30 12:43:27', 'bvgfashions@gmail.com', NULL, NULL),
(150, 1, 102, '2021-08-23 08:06:46', NULL, NULL, NULL, '2021-08-23 08:06:46', 'kusumaraju.surya@gmail.com', NULL, NULL),
(151, 1, 103, '2021-10-05 12:57:08', NULL, NULL, NULL, '2021-10-05 12:57:08', 'zopeqeti@mailinator.com', NULL, NULL),
(152, 1, 104, '2021-10-08 04:00:48', NULL, NULL, NULL, '2021-10-08 04:00:48', 'xexazi@mailinator.com', NULL, NULL),
(153, 1, 105, '2021-11-26 10:49:14', NULL, NULL, NULL, '2021-11-26 10:49:14', 'venkatesan05061997@gmail.com', NULL, NULL),
(154, 1, 106, '2021-11-27 08:12:36', NULL, NULL, NULL, '2021-11-27 08:12:36', 'perfectdresses.bkd@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordsts_mst`
--

CREATE TABLE `ordsts_mst` (
  `ordstsm_id` int(15) NOT NULL,
  `ordstsm_name` varchar(250) NOT NULL,
  `ordstsm_desc` text DEFAULT NULL,
  `ordstsm_sts` char(1) DEFAULT NULL,
  `ordstsm_prty` int(15) DEFAULT NULL,
  `ordstsm_crtdon` datetime DEFAULT NULL,
  `ordstsm_crtdby` varchar(250) DEFAULT NULL,
  `ordstsm_mdfdon` datetime DEFAULT NULL,
  `ordstsm_mdfdby` varchar(2580) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordsts_mst`
--

INSERT INTO `ordsts_mst` (`ordstsm_id`, `ordstsm_name`, `ordstsm_desc`, `ordstsm_sts`, `ordstsm_prty`, `ordstsm_crtdon`, `ordstsm_crtdby`, `ordstsm_mdfdon`, `ordstsm_mdfdby`) VALUES
(2, 'Confirmed', '<p>Your order has been confirmed, your order will be dispached shortly.</p>', 'a', 2, '2014-08-23 05:27:03', 'admin', '2021-03-24 01:15:55', ''),
(3, 'Declined', '<p>Your order has been declined, please contact customer support team for more details.</p>', 'a', 3, '2014-08-23 05:27:13', 'admin', '2021-03-24 01:16:07', ''),
(6, 'Dispached', '<p>Your order has been dispached. For more details contact customer support team.</p>', 'a', 6, '2014-08-23 05:28:16', 'admin', '2021-03-24 01:17:19', ''),
(5, 'Incomplete orders', '<p>The order given is incomplete, sorry forÂ inconvenience.</p>', 'a', 4, '2014-08-23 05:28:03', 'admin', '2021-03-24 01:16:24', ''),
(1, 'New', '<p>Thankyou for placing the order, your order will be processed soon.</p>', 'a', 1, '2014-07-11 11:48:39', 'admin', '2021-03-24 05:01:14', ''),
(4, 'Suspended', '<p>Your order is been suspended for some reason, for more details contact customer support team.</p>', 'a', 5, '2014-08-23 05:27:26', 'admin', '2021-03-24 01:16:55', '');

-- --------------------------------------------------------

--
-- Table structure for table `prdprchsind_inventory`
--

CREATE TABLE `prdprchsind_inventory` (
  `prdprchsind_id` int(11) NOT NULL,
  `prdprchsind_prdprchs_id` int(11) DEFAULT NULL,
  `prdprchsind_prdid` int(11) NOT NULL,
  `prdprchsind_dat` datetime NOT NULL,
  `prdprchsind_lcn` varchar(250) NOT NULL,
  `prdprchsind_prc` int(11) NOT NULL,
  `prdprchsind_in` int(11) NOT NULL,
  `prdprchsind_prdsle_id` int(11) DEFAULT NULL,
  `prdprchsind_trns_sts` varchar(2) DEFAULT NULL,
  `prdprchsind_sts` varchar(2) DEFAULT NULL,
  `prdprchsind_crton` datetime NOT NULL,
  `prdprchsind_crtby` varchar(250) NOT NULL,
  `prdprchsind_updton` datetime NOT NULL,
  `prdprchsind_updtby` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prdprchsind_inventory`
--

INSERT INTO `prdprchsind_inventory` (`prdprchsind_id`, `prdprchsind_prdprchs_id`, `prdprchsind_prdid`, `prdprchsind_dat`, `prdprchsind_lcn`, `prdprchsind_prc`, `prdprchsind_in`, `prdprchsind_prdsle_id`, `prdprchsind_trns_sts`, `prdprchsind_sts`, `prdprchsind_crton`, `prdprchsind_crtby`, `prdprchsind_updton`, `prdprchsind_updtby`) VALUES
(1, 1, 7, '2022-02-03 00:00:00', '1', 2188, 1, 1, 's', 'i', '2022-02-03 07:06:23', 'admin', '2022-02-10 10:21:31', 'admin'),
(2, 1, 7, '2022-02-03 00:00:00', '1', 2188, 1, 1, 's', 'i', '2022-02-03 07:06:23', 'admin', '2022-02-10 10:21:31', 'admin'),
(3, 2, 7, '2022-02-03 00:00:00', '1', 2188, 1, 2, 's', 'i', '2022-02-03 08:59:34', 'admin', '2022-02-11 04:49:14', 'admin'),
(4, 2, 7, '2022-02-03 00:00:00', '1', 2188, 1, 2, 's', 'i', '2022-02-03 08:59:34', 'admin', '2022-02-11 04:49:14', 'admin'),
(5, 2, 7, '2022-02-03 00:00:00', '1', 2188, 1, 2, 's', 'i', '2022-02-03 08:59:34', 'admin', '2022-02-11 04:49:14', 'admin'),
(6, 2, 7, '2022-02-03 00:00:00', '1', 2188, 1, 2, 's', 'i', '2022-02-03 08:59:34', 'admin', '2022-02-11 04:49:14', 'admin'),
(7, 2, 7, '2022-02-03 00:00:00', '1', 2188, 1, 2, 's', 'i', '2022-02-03 08:59:34', 'admin', '2022-02-11 04:49:14', 'admin'),
(8, 2, 7, '2022-02-03 00:00:00', '1', 2188, 1, 2, 's', 'i', '2022-02-03 08:59:34', 'admin', '2022-02-11 04:49:14', 'admin'),
(9, 2, 7, '2022-02-03 00:00:00', '1', 2188, 1, 2, 's', 'i', '2022-02-03 08:59:34', 'admin', '2022-02-11 04:49:14', 'admin'),
(10, 2, 7, '2022-02-03 00:00:00', '1', 2188, 1, 2, 's', 'i', '2022-02-03 08:59:34', 'admin', '2022-02-11 04:49:14', 'admin'),
(11, 2, 7, '2022-02-03 00:00:00', '1', 2188, 1, 2, 's', 'i', '2022-02-03 08:59:34', 'admin', '2022-02-11 04:49:14', 'admin'),
(12, 2, 7, '2022-02-03 00:00:00', '1', 2188, 1, 2, 's', 'i', '2022-02-03 08:59:34', 'admin', '2022-02-11 04:49:14', 'admin'),
(13, 3, 7, '2022-02-10 00:00:00', '2', 2188, 1, 3, 's', 'i', '2022-02-10 10:21:31', 'admin', '2022-02-11 04:50:07', 'admin'),
(14, 3, 7, '2022-02-10 00:00:00', '2', 2188, 1, 3, 's', 'i', '2022-02-10 10:21:31', 'admin', '2022-02-11 04:50:07', 'admin'),
(15, 4, 7, '2022-02-11 00:00:00', '2', 2188, 1, 3, 's', 'i', '2022-02-11 04:49:14', 'admin', '2022-02-11 04:50:07', 'admin'),
(16, 4, 7, '2022-02-11 00:00:00', '2', 2188, 1, 3, 's', 'i', '2022-02-11 04:49:14', 'admin', '2022-02-11 04:50:07', 'admin'),
(17, 4, 7, '2022-02-11 00:00:00', '2', 2188, 1, 3, 's', 'i', '2022-02-11 04:49:14', 'admin', '2022-02-11 04:50:07', 'admin'),
(18, 4, 7, '2022-02-11 00:00:00', '2', 2188, 1, 3, 's', 'i', '2022-02-11 04:49:14', 'admin', '2022-02-11 04:50:07', 'admin'),
(19, 4, 7, '2022-02-11 00:00:00', '2', 2188, 1, 3, 's', 'i', '2022-02-11 04:49:14', 'admin', '2022-02-11 04:50:07', 'admin'),
(20, 4, 7, '2022-02-11 00:00:00', '2', 2188, 1, 3, 's', 'i', '2022-02-11 04:49:14', 'admin', '2022-02-11 04:50:07', 'admin'),
(21, 4, 7, '2022-02-11 00:00:00', '2', 2188, 1, 3, 's', 'i', '2022-02-11 04:49:14', 'admin', '2022-02-11 04:50:07', 'admin'),
(22, 4, 7, '2022-02-11 00:00:00', '2', 2188, 1, 3, 's', 'i', '2022-02-11 04:49:14', 'admin', '2022-02-11 04:50:07', 'admin'),
(23, 4, 7, '2022-02-11 00:00:00', '2', 2188, 1, 4, 's', 'i', '2022-02-11 04:49:14', 'admin', '2022-02-11 04:50:10', 'admin'),
(24, 4, 7, '2022-02-11 00:00:00', '2', 2188, 1, 4, 's', 'i', '2022-02-11 04:49:14', 'admin', '2022-02-11 04:50:10', 'admin'),
(25, 5, 7, '2022-02-11 00:00:00', '1', 2188, 1, 5, 's', 'i', '2022-02-11 04:50:07', 'admin', '2022-02-11 04:50:59', 'admin'),
(26, 5, 7, '2022-02-11 00:00:00', '1', 2188, 1, 5, 's', 'i', '2022-02-11 04:50:07', 'admin', '2022-02-11 04:50:59', 'admin'),
(27, 5, 7, '2022-02-11 00:00:00', '1', 2188, 1, 5, 's', 'i', '2022-02-11 04:50:07', 'admin', '2022-02-11 04:50:59', 'admin'),
(28, 5, 7, '2022-02-11 00:00:00', '1', 2188, 1, 5, 's', 'i', '2022-02-11 04:50:07', 'admin', '2022-02-11 04:50:59', 'admin'),
(29, 5, 7, '2022-02-11 00:00:00', '1', 2188, 1, 5, 's', 'i', '2022-02-11 04:50:07', 'admin', '2022-02-11 04:50:59', 'admin'),
(30, 5, 7, '2022-02-11 00:00:00', '1', 2188, 1, NULL, 'r', 'a', '2022-02-11 04:50:07', 'admin', '0000-00-00 00:00:00', ''),
(31, 5, 7, '2022-02-11 00:00:00', '1', 2188, 1, NULL, 'r', 'a', '2022-02-11 04:50:07', 'admin', '0000-00-00 00:00:00', ''),
(32, 5, 7, '2022-02-11 00:00:00', '1', 2188, 1, NULL, 'r', 'a', '2022-02-11 04:50:07', 'admin', '0000-00-00 00:00:00', ''),
(33, 5, 7, '2022-02-11 00:00:00', '1', 2188, 1, NULL, 'r', 'a', '2022-02-11 04:50:07', 'admin', '0000-00-00 00:00:00', ''),
(34, 5, 7, '2022-02-11 00:00:00', '1', 2188, 1, NULL, 'r', 'a', '2022-02-11 04:50:07', 'admin', '0000-00-00 00:00:00', ''),
(35, 6, 7, '2022-02-11 00:00:00', '1', 2188, 1, NULL, 'r', 'a', '2022-02-11 04:50:10', 'admin', '0000-00-00 00:00:00', ''),
(36, 6, 7, '2022-02-11 00:00:00', '1', 2188, 1, NULL, 'r', 'a', '2022-02-11 04:50:10', 'admin', '0000-00-00 00:00:00', ''),
(37, 7, 7, '2022-02-11 00:00:00', '2', 2188, 1, NULL, 'r', 'a', '2022-02-11 04:50:59', 'admin', '0000-00-00 00:00:00', ''),
(38, 7, 7, '2022-02-11 00:00:00', '2', 2188, 1, NULL, 'r', 'a', '2022-02-11 04:50:59', 'admin', '0000-00-00 00:00:00', ''),
(39, 7, 7, '2022-02-11 00:00:00', '2', 2188, 1, NULL, 'r', 'a', '2022-02-11 04:50:59', 'admin', '0000-00-00 00:00:00', ''),
(40, 7, 7, '2022-02-11 00:00:00', '2', 2188, 1, NULL, 'r', 'a', '2022-02-11 04:50:59', 'admin', '0000-00-00 00:00:00', ''),
(41, 7, 7, '2022-02-11 00:00:00', '2', 2188, 1, NULL, 'r', 'a', '2022-02-11 04:50:59', 'admin', '0000-00-00 00:00:00', ''),
(42, 8, 12, '2022-06-09 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2022-06-09 07:57:40', 'admin', '0000-00-00 00:00:00', ''),
(43, 8, 12, '2022-06-09 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2022-06-09 07:57:40', 'admin', '0000-00-00 00:00:00', ''),
(44, 8, 12, '2022-06-09 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2022-06-09 07:57:40', 'admin', '0000-00-00 00:00:00', ''),
(45, 8, 12, '2022-06-09 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2022-06-09 07:57:40', 'admin', '0000-00-00 00:00:00', ''),
(46, 8, 12, '2022-06-09 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2022-06-09 07:57:40', 'admin', '0000-00-00 00:00:00', ''),
(47, 9, 13, '2022-10-26 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-26 01:19:59', 'admin', '0000-00-00 00:00:00', ''),
(48, 9, 13, '2022-10-26 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-26 01:19:59', 'admin', '0000-00-00 00:00:00', ''),
(49, 9, 13, '2022-10-26 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-26 01:19:59', 'admin', '0000-00-00 00:00:00', ''),
(50, 9, 13, '2022-10-26 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-26 01:19:59', 'admin', '0000-00-00 00:00:00', ''),
(51, 9, 13, '2022-10-26 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-26 01:19:59', 'admin', '0000-00-00 00:00:00', ''),
(52, 9, 13, '2022-10-26 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-26 01:19:59', 'admin', '0000-00-00 00:00:00', ''),
(53, 9, 13, '2022-10-26 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-26 01:19:59', 'admin', '0000-00-00 00:00:00', ''),
(54, 9, 13, '2022-10-26 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-26 01:19:59', 'admin', '0000-00-00 00:00:00', ''),
(55, 9, 13, '2022-10-26 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-26 01:19:59', 'admin', '0000-00-00 00:00:00', ''),
(56, 9, 13, '2022-10-26 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-26 01:19:59', 'admin', '0000-00-00 00:00:00', ''),
(57, 10, 11, '2022-10-27 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2022-10-27 04:20:47', 'admin', '0000-00-00 00:00:00', ''),
(58, 10, 11, '2022-10-27 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2022-10-27 04:20:47', 'admin', '0000-00-00 00:00:00', ''),
(59, 10, 11, '2022-10-27 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2022-10-27 04:20:47', 'admin', '0000-00-00 00:00:00', ''),
(60, 10, 11, '2022-10-27 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2022-10-27 04:20:47', 'admin', '0000-00-00 00:00:00', ''),
(61, 10, 11, '2022-10-27 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2022-10-27 04:20:47', 'admin', '0000-00-00 00:00:00', ''),
(62, 10, 11, '2022-10-27 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2022-10-27 04:20:47', 'admin', '0000-00-00 00:00:00', ''),
(63, 10, 11, '2022-10-27 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2022-10-27 04:20:47', 'admin', '0000-00-00 00:00:00', ''),
(64, 10, 11, '2022-10-27 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2022-10-27 04:20:47', 'admin', '0000-00-00 00:00:00', ''),
(65, 10, 11, '2022-10-27 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2022-10-27 04:20:47', 'admin', '0000-00-00 00:00:00', ''),
(66, 10, 11, '2022-10-27 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2022-10-27 04:20:47', 'admin', '0000-00-00 00:00:00', ''),
(67, 11, 9, '2022-10-27 00:00:00', '1', 5748, 1, NULL, NULL, 'a', '2022-10-27 04:21:41', 'admin', '0000-00-00 00:00:00', ''),
(68, 11, 9, '2022-10-27 00:00:00', '1', 5748, 1, NULL, NULL, 'a', '2022-10-27 04:21:41', 'admin', '0000-00-00 00:00:00', ''),
(69, 11, 9, '2022-10-27 00:00:00', '1', 5748, 1, NULL, NULL, 'a', '2022-10-27 04:21:41', 'admin', '0000-00-00 00:00:00', ''),
(70, 11, 9, '2022-10-27 00:00:00', '1', 5748, 1, NULL, NULL, 'a', '2022-10-27 04:21:41', 'admin', '0000-00-00 00:00:00', ''),
(71, 11, 9, '2022-10-27 00:00:00', '1', 5748, 1, NULL, NULL, 'a', '2022-10-27 04:21:41', 'admin', '0000-00-00 00:00:00', ''),
(72, 11, 9, '2022-10-27 00:00:00', '1', 5748, 1, NULL, NULL, 'a', '2022-10-27 04:21:41', 'admin', '0000-00-00 00:00:00', ''),
(73, 11, 9, '2022-10-27 00:00:00', '1', 5748, 1, NULL, NULL, 'a', '2022-10-27 04:21:41', 'admin', '0000-00-00 00:00:00', ''),
(74, 11, 9, '2022-10-27 00:00:00', '1', 5748, 1, NULL, NULL, 'a', '2022-10-27 04:21:41', 'admin', '0000-00-00 00:00:00', ''),
(75, 11, 9, '2022-10-27 00:00:00', '1', 5748, 1, NULL, NULL, 'a', '2022-10-27 04:21:41', 'admin', '0000-00-00 00:00:00', ''),
(76, 11, 9, '2022-10-27 00:00:00', '1', 5748, 1, NULL, NULL, 'a', '2022-10-27 04:21:41', 'admin', '0000-00-00 00:00:00', ''),
(77, 12, 5, '2022-10-27 00:00:00', '1', 5486, 1, NULL, NULL, 'a', '2022-10-27 04:21:50', 'admin', '0000-00-00 00:00:00', ''),
(78, 12, 5, '2022-10-27 00:00:00', '1', 5486, 1, NULL, NULL, 'a', '2022-10-27 04:21:50', 'admin', '0000-00-00 00:00:00', ''),
(79, 12, 5, '2022-10-27 00:00:00', '1', 5486, 1, NULL, NULL, 'a', '2022-10-27 04:21:50', 'admin', '0000-00-00 00:00:00', ''),
(80, 12, 5, '2022-10-27 00:00:00', '1', 5486, 1, NULL, NULL, 'a', '2022-10-27 04:21:50', 'admin', '0000-00-00 00:00:00', ''),
(81, 12, 5, '2022-10-27 00:00:00', '1', 5486, 1, NULL, NULL, 'a', '2022-10-27 04:21:50', 'admin', '0000-00-00 00:00:00', ''),
(82, 12, 5, '2022-10-27 00:00:00', '1', 5486, 1, NULL, NULL, 'a', '2022-10-27 04:21:50', 'admin', '0000-00-00 00:00:00', ''),
(83, 12, 5, '2022-10-27 00:00:00', '1', 5486, 1, NULL, NULL, 'a', '2022-10-27 04:21:50', 'admin', '0000-00-00 00:00:00', ''),
(84, 12, 5, '2022-10-27 00:00:00', '1', 5486, 1, NULL, NULL, 'a', '2022-10-27 04:21:50', 'admin', '0000-00-00 00:00:00', ''),
(85, 12, 5, '2022-10-27 00:00:00', '1', 5486, 1, NULL, NULL, 'a', '2022-10-27 04:21:50', 'admin', '0000-00-00 00:00:00', ''),
(86, 12, 5, '2022-10-27 00:00:00', '1', 5486, 1, NULL, NULL, 'a', '2022-10-27 04:21:50', 'admin', '0000-00-00 00:00:00', ''),
(87, 13, 2, '2022-10-27 00:00:00', '1', 5019, 1, NULL, NULL, 'a', '2022-10-27 04:21:59', 'admin', '0000-00-00 00:00:00', ''),
(88, 13, 2, '2022-10-27 00:00:00', '1', 5019, 1, NULL, NULL, 'a', '2022-10-27 04:21:59', 'admin', '0000-00-00 00:00:00', ''),
(89, 13, 2, '2022-10-27 00:00:00', '1', 5019, 1, NULL, NULL, 'a', '2022-10-27 04:21:59', 'admin', '0000-00-00 00:00:00', ''),
(90, 13, 2, '2022-10-27 00:00:00', '1', 5019, 1, NULL, NULL, 'a', '2022-10-27 04:21:59', 'admin', '0000-00-00 00:00:00', ''),
(91, 13, 2, '2022-10-27 00:00:00', '1', 5019, 1, NULL, NULL, 'a', '2022-10-27 04:21:59', 'admin', '0000-00-00 00:00:00', ''),
(92, 14, 4, '2022-10-27 00:00:00', '1', 5211, 1, NULL, NULL, 'a', '2022-10-27 04:22:06', 'admin', '0000-00-00 00:00:00', ''),
(93, 14, 4, '2022-10-27 00:00:00', '1', 5211, 1, NULL, NULL, 'a', '2022-10-27 04:22:06', 'admin', '0000-00-00 00:00:00', ''),
(94, 14, 4, '2022-10-27 00:00:00', '1', 5211, 1, NULL, NULL, 'a', '2022-10-27 04:22:06', 'admin', '0000-00-00 00:00:00', ''),
(95, 14, 4, '2022-10-27 00:00:00', '1', 5211, 1, NULL, NULL, 'a', '2022-10-27 04:22:06', 'admin', '0000-00-00 00:00:00', ''),
(96, 14, 4, '2022-10-27 00:00:00', '1', 5211, 1, NULL, NULL, 'a', '2022-10-27 04:22:06', 'admin', '0000-00-00 00:00:00', ''),
(97, 15, 10, '2022-10-27 00:00:00', '1', 3964, 1, NULL, NULL, 'a', '2022-10-27 04:22:14', 'admin', '0000-00-00 00:00:00', ''),
(98, 15, 10, '2022-10-27 00:00:00', '1', 3964, 1, NULL, NULL, 'a', '2022-10-27 04:22:14', 'admin', '0000-00-00 00:00:00', ''),
(99, 15, 10, '2022-10-27 00:00:00', '1', 3964, 1, NULL, NULL, 'a', '2022-10-27 04:22:14', 'admin', '0000-00-00 00:00:00', ''),
(100, 15, 10, '2022-10-27 00:00:00', '1', 3964, 1, NULL, NULL, 'a', '2022-10-27 04:22:14', 'admin', '0000-00-00 00:00:00', ''),
(101, 15, 10, '2022-10-27 00:00:00', '1', 3964, 1, NULL, NULL, 'a', '2022-10-27 04:22:14', 'admin', '0000-00-00 00:00:00', ''),
(102, 16, 3, '2022-10-27 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-27 04:22:22', 'admin', '0000-00-00 00:00:00', ''),
(103, 16, 3, '2022-10-27 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-27 04:22:22', 'admin', '0000-00-00 00:00:00', ''),
(104, 16, 3, '2022-10-27 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-27 04:22:22', 'admin', '0000-00-00 00:00:00', ''),
(105, 16, 3, '2022-10-27 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-27 04:22:22', 'admin', '0000-00-00 00:00:00', ''),
(106, 16, 3, '2022-10-27 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-27 04:22:22', 'admin', '0000-00-00 00:00:00', ''),
(107, 16, 3, '2022-10-27 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-27 04:22:22', 'admin', '0000-00-00 00:00:00', ''),
(108, 16, 3, '2022-10-27 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-27 04:22:22', 'admin', '0000-00-00 00:00:00', ''),
(109, 16, 3, '2022-10-27 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-27 04:22:22', 'admin', '0000-00-00 00:00:00', ''),
(110, 16, 3, '2022-10-27 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-27 04:22:22', 'admin', '0000-00-00 00:00:00', ''),
(111, 16, 3, '2022-10-27 00:00:00', '1', 4481, 1, NULL, NULL, 'a', '2022-10-27 04:22:22', 'admin', '0000-00-00 00:00:00', ''),
(112, 17, 6, '2022-10-27 00:00:00', '1', 3668, 1, NULL, NULL, 'a', '2022-10-27 04:22:29', 'admin', '0000-00-00 00:00:00', ''),
(113, 17, 6, '2022-10-27 00:00:00', '1', 3668, 1, NULL, NULL, 'a', '2022-10-27 04:22:29', 'admin', '0000-00-00 00:00:00', ''),
(114, 17, 6, '2022-10-27 00:00:00', '1', 3668, 1, NULL, NULL, 'a', '2022-10-27 04:22:29', 'admin', '0000-00-00 00:00:00', ''),
(115, 17, 6, '2022-10-27 00:00:00', '1', 3668, 1, NULL, NULL, 'a', '2022-10-27 04:22:29', 'admin', '0000-00-00 00:00:00', ''),
(116, 17, 6, '2022-10-27 00:00:00', '1', 3668, 1, NULL, NULL, 'a', '2022-10-27 04:22:29', 'admin', '0000-00-00 00:00:00', ''),
(117, 17, 6, '2022-10-27 00:00:00', '1', 3668, 1, NULL, NULL, 'a', '2022-10-27 04:22:29', 'admin', '0000-00-00 00:00:00', ''),
(118, 17, 6, '2022-10-27 00:00:00', '1', 3668, 1, NULL, NULL, 'a', '2022-10-27 04:22:29', 'admin', '0000-00-00 00:00:00', ''),
(119, 17, 6, '2022-10-27 00:00:00', '1', 3668, 1, NULL, NULL, 'a', '2022-10-27 04:22:29', 'admin', '0000-00-00 00:00:00', ''),
(120, 17, 6, '2022-10-27 00:00:00', '1', 3668, 1, NULL, NULL, 'a', '2022-10-27 04:22:29', 'admin', '0000-00-00 00:00:00', ''),
(121, 17, 6, '2022-10-27 00:00:00', '1', 3668, 1, NULL, NULL, 'a', '2022-10-27 04:22:29', 'admin', '0000-00-00 00:00:00', ''),
(122, 18, 8, '2022-10-27 00:00:00', '1', 2822, 1, NULL, NULL, 'a', '2022-10-27 04:22:38', 'admin', '0000-00-00 00:00:00', ''),
(123, 18, 8, '2022-10-27 00:00:00', '1', 2822, 1, NULL, NULL, 'a', '2022-10-27 04:22:38', 'admin', '0000-00-00 00:00:00', ''),
(124, 18, 8, '2022-10-27 00:00:00', '1', 2822, 1, NULL, NULL, 'a', '2022-10-27 04:22:38', 'admin', '0000-00-00 00:00:00', ''),
(125, 18, 8, '2022-10-27 00:00:00', '1', 2822, 1, NULL, NULL, 'a', '2022-10-27 04:22:38', 'admin', '0000-00-00 00:00:00', ''),
(126, 18, 8, '2022-10-27 00:00:00', '1', 2822, 1, NULL, NULL, 'a', '2022-10-27 04:22:38', 'admin', '0000-00-00 00:00:00', ''),
(127, 19, 1, '2022-10-27 00:00:00', '1', 3183, 1, NULL, NULL, 'a', '2022-10-27 04:22:45', 'admin', '0000-00-00 00:00:00', ''),
(128, 19, 1, '2022-10-27 00:00:00', '1', 3183, 1, NULL, NULL, 'a', '2022-10-27 04:22:45', 'admin', '0000-00-00 00:00:00', ''),
(129, 19, 1, '2022-10-27 00:00:00', '1', 3183, 1, NULL, NULL, 'a', '2022-10-27 04:22:45', 'admin', '0000-00-00 00:00:00', ''),
(130, 19, 1, '2022-10-27 00:00:00', '1', 3183, 1, NULL, NULL, 'a', '2022-10-27 04:22:45', 'admin', '0000-00-00 00:00:00', ''),
(131, 19, 1, '2022-10-27 00:00:00', '1', 3183, 1, NULL, NULL, 'a', '2022-10-27 04:22:45', 'admin', '0000-00-00 00:00:00', ''),
(132, 19, 1, '2022-10-27 00:00:00', '1', 3183, 1, NULL, NULL, 'a', '2022-10-27 04:22:45', 'admin', '0000-00-00 00:00:00', ''),
(133, 19, 1, '2022-10-27 00:00:00', '1', 3183, 1, NULL, NULL, 'a', '2022-10-27 04:22:45', 'admin', '0000-00-00 00:00:00', ''),
(134, 19, 1, '2022-10-27 00:00:00', '1', 3183, 1, NULL, NULL, 'a', '2022-10-27 04:22:45', 'admin', '0000-00-00 00:00:00', ''),
(135, 19, 1, '2022-10-27 00:00:00', '1', 3183, 1, NULL, NULL, 'a', '2022-10-27 04:22:45', 'admin', '0000-00-00 00:00:00', ''),
(136, 19, 1, '2022-10-27 00:00:00', '1', 3183, 1, NULL, NULL, 'a', '2022-10-27 04:22:45', 'admin', '0000-00-00 00:00:00', ''),
(137, 20, 7, '2023-04-13 00:00:00', '1', 2188, 1, NULL, NULL, 'a', '2023-04-13 07:05:08', 'admin', '0000-00-00 00:00:00', ''),
(138, 20, 7, '2023-04-13 00:00:00', '1', 2188, 1, NULL, NULL, 'a', '2023-04-13 07:05:08', 'admin', '0000-00-00 00:00:00', ''),
(139, 20, 7, '2023-04-13 00:00:00', '1', 2188, 1, NULL, NULL, 'a', '2023-04-13 07:05:08', 'admin', '0000-00-00 00:00:00', ''),
(140, 20, 7, '2023-04-13 00:00:00', '1', 2188, 1, NULL, NULL, 'a', '2023-04-13 07:05:08', 'admin', '0000-00-00 00:00:00', ''),
(141, 20, 7, '2023-04-13 00:00:00', '1', 2188, 1, NULL, NULL, 'a', '2023-04-13 07:05:08', 'admin', '0000-00-00 00:00:00', ''),
(142, 20, 7, '2023-04-13 00:00:00', '1', 2188, 1, NULL, NULL, 'a', '2023-04-13 07:05:08', 'admin', '0000-00-00 00:00:00', ''),
(143, 20, 7, '2023-04-13 00:00:00', '1', 2188, 1, NULL, NULL, 'a', '2023-04-13 07:05:08', 'admin', '0000-00-00 00:00:00', ''),
(144, 20, 7, '2023-04-13 00:00:00', '1', 2188, 1, NULL, NULL, 'a', '2023-04-13 07:05:08', 'admin', '0000-00-00 00:00:00', ''),
(145, 20, 7, '2023-04-13 00:00:00', '1', 2188, 1, NULL, NULL, 'a', '2023-04-13 07:05:08', 'admin', '0000-00-00 00:00:00', ''),
(146, 20, 7, '2023-04-13 00:00:00', '1', 2188, 1, NULL, NULL, 'a', '2023-04-13 07:05:08', 'admin', '0000-00-00 00:00:00', ''),
(147, 21, 7, '2023-04-13 00:00:00', '1', 2188, 1, NULL, NULL, 'a', '2023-04-13 07:05:18', 'admin', '0000-00-00 00:00:00', ''),
(148, 21, 7, '2023-04-13 00:00:00', '1', 2188, 1, NULL, NULL, 'a', '2023-04-13 07:05:18', 'admin', '0000-00-00 00:00:00', ''),
(149, 21, 7, '2023-04-13 00:00:00', '1', 2188, 1, NULL, NULL, 'a', '2023-04-13 07:05:18', 'admin', '0000-00-00 00:00:00', ''),
(150, 21, 7, '2023-04-13 00:00:00', '1', 2188, 1, NULL, NULL, 'a', '2023-04-13 07:05:18', 'admin', '0000-00-00 00:00:00', ''),
(151, 21, 7, '2023-04-13 00:00:00', '1', 2188, 1, NULL, NULL, 'a', '2023-04-13 07:05:18', 'admin', '0000-00-00 00:00:00', ''),
(152, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(153, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(154, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(155, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(156, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(157, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(158, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(159, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(160, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(161, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(162, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(163, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(164, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(165, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(166, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(167, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(168, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(169, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(170, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(171, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(172, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(173, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(174, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(175, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(176, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(177, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(178, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(179, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(180, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(181, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(182, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(183, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(184, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(185, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(186, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(187, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(188, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(189, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(190, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(191, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(192, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(193, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(194, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(195, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(196, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(197, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(198, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(199, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(200, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(201, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(202, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(203, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(204, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(205, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(206, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(207, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(208, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(209, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(210, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(211, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(212, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(213, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(214, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(215, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(216, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(217, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(218, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(219, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(220, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(221, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(222, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(223, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(224, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(225, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(226, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(227, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(228, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(229, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(230, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(231, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(232, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(233, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(234, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(235, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(236, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(237, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(238, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(239, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(240, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(241, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(242, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(243, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(244, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(245, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(246, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(247, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(248, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(249, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(250, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(251, 22, 17, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(252, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(253, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(254, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(255, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(256, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(257, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(258, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(259, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(260, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(261, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(262, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(263, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(264, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(265, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(266, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(267, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(268, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(269, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(270, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(271, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(272, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(273, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(274, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(275, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(276, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(277, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(278, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(279, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(280, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(281, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(282, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(283, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(284, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(285, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(286, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(287, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(288, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(289, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(290, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(291, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(292, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(293, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(294, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(295, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(296, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(297, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(298, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(299, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(300, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(301, 23, 18, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(302, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(303, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(304, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(305, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(306, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(307, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(308, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(309, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(310, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(311, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(312, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(313, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(314, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(315, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(316, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(317, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(318, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(319, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(320, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(321, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(322, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(323, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(324, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(325, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(326, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(327, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(328, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(329, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(330, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(331, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(332, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(333, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(334, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(335, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(336, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(337, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(338, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(339, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(340, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(341, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(342, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(343, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(344, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(345, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(346, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(347, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(348, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(349, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(350, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(351, 24, 20, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(352, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(353, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(354, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(355, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(356, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(357, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(358, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(359, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(360, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(361, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(362, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(363, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(364, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(365, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(366, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(367, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(368, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(369, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(370, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(371, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(372, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(373, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(374, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(375, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(376, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(377, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(378, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(379, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(380, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(381, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(382, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(383, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(384, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(385, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(386, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(387, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(388, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(389, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(390, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(391, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(392, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(393, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(394, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(395, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(396, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', '');
INSERT INTO `prdprchsind_inventory` (`prdprchsind_id`, `prdprchsind_prdprchs_id`, `prdprchsind_prdid`, `prdprchsind_dat`, `prdprchsind_lcn`, `prdprchsind_prc`, `prdprchsind_in`, `prdprchsind_prdsle_id`, `prdprchsind_trns_sts`, `prdprchsind_sts`, `prdprchsind_crton`, `prdprchsind_crtby`, `prdprchsind_updton`, `prdprchsind_updtby`) VALUES
(397, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(398, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(399, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(400, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(401, 25, 19, '2023-04-20 00:00:00', '1', 2000, 1, NULL, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(402, 26, 35, '2023-04-21 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2023-04-21 01:03:17', 'admin', '0000-00-00 00:00:00', ''),
(403, 26, 35, '2023-04-21 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2023-04-21 01:03:17', 'admin', '0000-00-00 00:00:00', ''),
(404, 26, 35, '2023-04-21 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2023-04-21 01:03:17', 'admin', '0000-00-00 00:00:00', ''),
(405, 26, 35, '2023-04-21 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2023-04-21 01:03:17', 'admin', '0000-00-00 00:00:00', ''),
(406, 26, 35, '2023-04-21 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2023-04-21 01:03:17', 'admin', '0000-00-00 00:00:00', ''),
(407, 26, 35, '2023-04-21 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2023-04-21 01:03:17', 'admin', '0000-00-00 00:00:00', ''),
(408, 26, 35, '2023-04-21 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2023-04-21 01:03:17', 'admin', '0000-00-00 00:00:00', ''),
(409, 26, 35, '2023-04-21 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2023-04-21 01:03:17', 'admin', '0000-00-00 00:00:00', ''),
(410, 26, 35, '2023-04-21 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2023-04-21 01:03:17', 'admin', '0000-00-00 00:00:00', ''),
(411, 26, 35, '2023-04-21 00:00:00', '1', 1500, 1, NULL, NULL, 'a', '2023-04-21 01:03:17', 'admin', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `prdprchs_inventory`
--

CREATE TABLE `prdprchs_inventory` (
  `prdprchs_id` int(11) NOT NULL,
  `prdprchs_prdid` int(11) NOT NULL,
  `prdprchs_dat` datetime NOT NULL,
  `prdprchs_lcn` varchar(250) NOT NULL,
  `prdprchs_ntprc` varchar(200) NOT NULL,
  `prdprchs_prc` int(11) NOT NULL,
  `prdprchs_in` int(11) NOT NULL,
  `prdprchs_trns_in` int(11) DEFAULT NULL,
  `prdprchs_sts` varchar(2) DEFAULT NULL,
  `prdprchs_crton` datetime NOT NULL,
  `prdprchs_crtby` varchar(250) NOT NULL,
  `prdprchs_updton` datetime NOT NULL,
  `prdprchs_updtby` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prdprchs_inventory`
--

INSERT INTO `prdprchs_inventory` (`prdprchs_id`, `prdprchs_prdid`, `prdprchs_dat`, `prdprchs_lcn`, `prdprchs_ntprc`, `prdprchs_prc`, `prdprchs_in`, `prdprchs_trns_in`, `prdprchs_sts`, `prdprchs_crton`, `prdprchs_crtby`, `prdprchs_updton`, `prdprchs_updtby`) VALUES
(1, 7, '2022-02-03 00:00:00', '1', '4376', 2188, 2, NULL, 'a', '2022-02-03 07:06:23', 'admin', '0000-00-00 00:00:00', ''),
(2, 7, '2022-02-03 00:00:00', '1', '21880', 2188, 10, NULL, 'a', '2022-02-03 08:59:34', 'admin', '0000-00-00 00:00:00', ''),
(3, 7, '2022-02-10 00:00:00', '2', '4376', 2188, 0, 2, 'a', '2022-02-10 10:21:31', 'admin', '0000-00-00 00:00:00', ''),
(4, 7, '2022-02-11 00:00:00', '2', '21880', 2188, 0, 10, 'a', '2022-02-11 04:49:14', 'admin', '0000-00-00 00:00:00', ''),
(5, 7, '2022-02-11 00:00:00', '1', '21880', 2188, 0, 10, 'a', '2022-02-11 04:50:07', 'admin', '0000-00-00 00:00:00', ''),
(6, 7, '2022-02-11 00:00:00', '1', '4376', 2188, 0, 2, 'a', '2022-02-11 04:50:10', 'admin', '0000-00-00 00:00:00', ''),
(7, 7, '2022-02-11 00:00:00', '2', '10940', 2188, 0, 5, 'a', '2022-02-11 04:50:59', 'admin', '0000-00-00 00:00:00', ''),
(8, 12, '2022-06-09 00:00:00', '1', '7500', 1500, 5, NULL, 'a', '2022-06-09 07:57:40', 'admin', '0000-00-00 00:00:00', ''),
(9, 13, '2022-10-26 00:00:00', '1', '44810', 4481, 10, NULL, 'a', '2022-10-26 01:19:59', 'admin', '0000-00-00 00:00:00', ''),
(10, 11, '2022-10-27 00:00:00', '1', '15000', 1500, 10, NULL, 'a', '2022-10-27 04:20:47', 'admin', '0000-00-00 00:00:00', ''),
(11, 9, '2022-10-27 00:00:00', '1', '57480', 5748, 10, NULL, 'a', '2022-10-27 04:21:41', 'admin', '0000-00-00 00:00:00', ''),
(12, 5, '2022-10-27 00:00:00', '1', '54860', 5486, 10, NULL, 'a', '2022-10-27 04:21:50', 'admin', '0000-00-00 00:00:00', ''),
(13, 2, '2022-10-27 00:00:00', '1', '25095', 5019, 5, NULL, 'a', '2022-10-27 04:21:59', 'admin', '0000-00-00 00:00:00', ''),
(14, 4, '2022-10-27 00:00:00', '1', '26055', 5211, 5, NULL, 'a', '2022-10-27 04:22:06', 'admin', '0000-00-00 00:00:00', ''),
(15, 10, '2022-10-27 00:00:00', '1', '19820', 3964, 5, NULL, 'a', '2022-10-27 04:22:14', 'admin', '0000-00-00 00:00:00', ''),
(16, 3, '2022-10-27 00:00:00', '1', '44810', 4481, 10, NULL, 'a', '2022-10-27 04:22:22', 'admin', '0000-00-00 00:00:00', ''),
(17, 6, '2022-10-27 00:00:00', '1', '36680', 3668, 10, NULL, 'a', '2022-10-27 04:22:29', 'admin', '0000-00-00 00:00:00', ''),
(18, 8, '2022-10-27 00:00:00', '1', '14110', 2822, 5, NULL, 'a', '2022-10-27 04:22:38', 'admin', '0000-00-00 00:00:00', ''),
(19, 1, '2022-10-27 00:00:00', '1', '31830', 3183, 10, NULL, 'a', '2022-10-27 04:22:45', 'admin', '0000-00-00 00:00:00', ''),
(20, 7, '2023-04-13 00:00:00', '1', '21880', 2188, 10, NULL, 'a', '2023-04-13 07:05:08', 'admin', '0000-00-00 00:00:00', ''),
(21, 7, '2023-04-13 00:00:00', '1', '10940', 2188, 5, NULL, 'a', '2023-04-13 07:05:18', 'admin', '0000-00-00 00:00:00', ''),
(22, 17, '2023-04-20 00:00:00', '1', '200000', 2000, 100, NULL, 'a', '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(23, 18, '2023-04-20 00:00:00', '1', '100000', 2000, 50, NULL, 'a', '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(24, 20, '2023-04-20 00:00:00', '1', '100000', 2000, 50, NULL, 'a', '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(25, 19, '2023-04-20 00:00:00', '1', '100000', 2000, 50, NULL, 'a', '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(26, 35, '2023-04-21 00:00:00', '1', '15000', 1500, 10, NULL, 'a', '2023-04-21 01:03:17', 'admin', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `prdsle_inventory`
--

CREATE TABLE `prdsle_inventory` (
  `prdsle_id` int(11) NOT NULL,
  `prdsle_prdid` int(11) NOT NULL,
  `prdsle_dat` datetime NOT NULL,
  `prdsle_lcn` varchar(250) NOT NULL,
  `prdsle_sleqty` int(15) DEFAULT NULL,
  `prdsle_trns_out` int(15) DEFAULT NULL,
  `prdsle_cstprc` varchar(250) DEFAULT NULL,
  `prdsle_slprc` varchar(250) DEFAULT NULL,
  `prdsle_ntprc` varchar(250) DEFAULT NULL,
  `prdsle_mbrid` varchar(64) DEFAULT NULL,
  `prdsle_crton` datetime NOT NULL,
  `prdsle_crtby` varchar(250) NOT NULL,
  `prdsle_updton` datetime NOT NULL,
  `prdsle_updtby` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prdsle_inventory`
--

INSERT INTO `prdsle_inventory` (`prdsle_id`, `prdsle_prdid`, `prdsle_dat`, `prdsle_lcn`, `prdsle_sleqty`, `prdsle_trns_out`, `prdsle_cstprc`, `prdsle_slprc`, `prdsle_ntprc`, `prdsle_mbrid`, `prdsle_crton`, `prdsle_crtby`, `prdsle_updton`, `prdsle_updtby`) VALUES
(1, 7, '2022-02-10 00:00:00', '1', NULL, 2, NULL, NULL, NULL, NULL, '2022-02-10 10:21:31', 'admin', '0000-00-00 00:00:00', ''),
(2, 7, '2022-02-11 00:00:00', '1', NULL, 10, NULL, NULL, NULL, NULL, '2022-02-11 04:49:14', 'admin', '0000-00-00 00:00:00', ''),
(3, 7, '2022-02-11 00:00:00', '2', NULL, 10, NULL, NULL, NULL, NULL, '2022-02-11 04:50:07', 'admin', '0000-00-00 00:00:00', ''),
(4, 7, '2022-02-11 00:00:00', '2', NULL, 2, NULL, NULL, NULL, NULL, '2022-02-11 04:50:10', 'admin', '0000-00-00 00:00:00', ''),
(5, 7, '2022-02-11 00:00:00', '1', NULL, 5, NULL, NULL, NULL, NULL, '2022-02-11 04:50:59', 'admin', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `prodimg_dtl`
--

CREATE TABLE `prodimg_dtl` (
  `prodimgd_id` int(15) NOT NULL,
  `prodimgd_prodm_id` int(15) NOT NULL COMMENT 'Product Id',
  `prodimgd_title` varchar(250) DEFAULT NULL,
  `prodimgd_simg` varchar(250) NOT NULL,
  `prodimgd_bimg` varchar(256) NOT NULL,
  `prodimgd_prty` int(15) DEFAULT NULL,
  `prodimgd_sts` char(1) DEFAULT NULL,
  `prodimgd_crtdon` date DEFAULT NULL,
  `prodimgd_crtdby` varchar(250) DEFAULT NULL,
  `prodimgd_mdfdon` date DEFAULT NULL,
  `prodimgd_mdfdby` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prodimg_dtl`
--

INSERT INTO `prodimg_dtl` (`prodimgd_id`, `prodimgd_prodm_id`, `prodimgd_title`, `prodimgd_simg`, `prodimgd_bimg`, `prodimgd_prty`, `prodimgd_sts`, `prodimgd_crtdon`, `prodimgd_crtdby`, `prodimgd_mdfdon`, `prodimgd_mdfdby`) VALUES
(1, 1, '165/65R13 MILAZE X3 TL 77T', 'prodsimg61f3940997b8e', 'prodbimg61f3940997baf', 10, 'a', '2022-01-28', 'admin', '2022-03-04', 'admin'),
(2, 2, '195/65R15 SECURADRIVE TL 91V', 'prodsimg61f395e8bd561', 'prodbimg61f395e8bd580', 10, 'a', '2022-01-28', 'admin', NULL, NULL),
(3, 3, '185/60R15 SECURADRIVE  TL 84H', 'prodsimg61f398ba80b52', 'prodbimg61f398ba80b74', 10, 'a', '2022-01-28', 'admin', '2022-10-27', 'admin'),
(4, 4, '195/60R15 SECURADRIVE  TL 88V', 'prodsimg61f39cdda8139', 'prodbimg61f39cdda815d', 10, 'a', '2022-01-28', 'admin', '2022-10-27', 'admin'),
(5, 5, '205/65R16 MILAZE X3  TL 95H', 'prodsimg61f39ee1cdc19', 'prodbimg61f39ee1cdc53', 10, 'a', '2022-01-28', 'admin', '2022-10-27', 'admin'),
(6, 6, '175/60R15 SecuraDrive TL 81H', 'prodsimg61f39f7ad6921', 'prodbimg61f39f7ad6949', 10, 'a', '2022-01-28', 'admin', '2022-10-27', 'admin'),
(7, 7, '145/70R12 MILAZE X3 TL 69T', 'prodsimg61f3a0569b33a', 'prodbimg61f3a0569b373', 10, 'a', '2022-01-28', 'admin', '2023-04-13', 'admin'),
(8, 8, '165/70R14 MILAZE X3 TL 81T', 'prodsimg61f3a12e6816a', 'prodbimg61f3a12e6818d', 10, 'a', '2022-01-28', 'admin', '2022-03-04', 'admin'),
(9, 9, '215/75R15 CZAR HT  TL 100S', 'prodsimg61f3a1f8b1918', 'prodbimg61f3a1f8b193c', 10, 'a', '2022-01-28', 'admin', NULL, NULL),
(10, 10, '185/65R14 MILAZE X3 TL 86T', 'prodsimg61f3a2a12c084', 'prodbimg61f3a2a12c0b2', 10, 'a', '2022-01-28', 'admin', NULL, NULL),
(11, 13, 'p1', 'prodsimg635a053c63b12', 'prodbimg635a053c63b32', 180, 'a', '2022-10-27', 'admin', NULL, NULL),
(12, 12, 'p1', 'prodsimg635a056586ab4', 'prodbimg635a056586ad4', 40, 'a', '2022-10-27', 'admin', NULL, NULL),
(13, 26, 'i1', 'prodsimg644261d1baffa', 'prodbimg644261d1bb07e', 1, 'a', '2023-04-21', 'admin', NULL, NULL),
(14, 35, 'i1', 'prodsimg6442764d81b0c', 'prodbimg6442764d81b7a', 1, 'a', '2023-04-21', 'admin', '2023-04-21', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `product_inventory`
--

CREATE TABLE `product_inventory` (
  `prdinvt_id` int(11) NOT NULL,
  `prdinvt_prdprchs_id` int(11) DEFAULT NULL,
  `prdinvt_prdsle_id` int(11) DEFAULT NULL,
  `prdinvt_trnsfr_id` int(11) DEFAULT NULL,
  `prdinvt_prdid` int(11) NOT NULL,
  `prdinvt_dat` datetime NOT NULL,
  `prdinvt_lcn` varchar(250) NOT NULL,
  `prdinvt_cstprc` int(11) DEFAULT NULL,
  `prdinvt_prdprchs_in` int(15) DEFAULT NULL,
  `prdinvt_prdprchs_trns_in` int(15) DEFAULT NULL,
  `prdinvt_prdsle_sleqty` int(15) DEFAULT NULL,
  `prdinvt_prdsle_trns_out` int(15) DEFAULT NULL,
  `prdinvt_trnsfr_bls` int(15) DEFAULT NULL,
  `prdinvt_inv_bls` int(15) DEFAULT NULL,
  `prdinvt_sts` varchar(2) DEFAULT NULL,
  `prdinvt_opnbls` int(11) DEFAULT NULL,
  `prdinvt_clsbls` int(11) NOT NULL,
  `prdinvt_crton` datetime NOT NULL,
  `prdinvt_crtby` varchar(250) NOT NULL,
  `prdinvt_updton` datetime NOT NULL,
  `prdinvt_updtby` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_inventory`
--

INSERT INTO `product_inventory` (`prdinvt_id`, `prdinvt_prdprchs_id`, `prdinvt_prdsle_id`, `prdinvt_trnsfr_id`, `prdinvt_prdid`, `prdinvt_dat`, `prdinvt_lcn`, `prdinvt_cstprc`, `prdinvt_prdprchs_in`, `prdinvt_prdprchs_trns_in`, `prdinvt_prdsle_sleqty`, `prdinvt_prdsle_trns_out`, `prdinvt_trnsfr_bls`, `prdinvt_inv_bls`, `prdinvt_sts`, `prdinvt_opnbls`, `prdinvt_clsbls`, `prdinvt_crton`, `prdinvt_crtby`, `prdinvt_updton`, `prdinvt_updtby`) VALUES
(1, 1, NULL, NULL, 7, '2022-02-03 00:00:00', '1', 2188, 12, NULL, NULL, NULL, NULL, NULL, 'a', 0, 12, '2022-02-03 07:06:23', 'admin', '2022-02-03 08:59:34', 'admin'),
(2, 3, NULL, NULL, 7, '2022-02-10 00:00:00', '2', 2188, NULL, 2, NULL, NULL, NULL, NULL, 'a', 0, 2, '2022-02-10 10:21:31', 'admin', '0000-00-00 00:00:00', ''),
(3, NULL, 1, NULL, 7, '2022-02-10 00:00:00', '1', 2188, NULL, NULL, NULL, 2, NULL, NULL, 'a', 12, 10, '2022-02-10 10:21:31', 'admin', '0000-00-00 00:00:00', ''),
(4, 4, 0, NULL, 7, '2022-02-11 00:00:00', '2', 2188, NULL, 15, NULL, 12, NULL, NULL, 'a', 2, 5, '2022-02-11 04:49:14', 'admin', '2022-02-11 04:50:59', 'admin'),
(5, NULL, 2, NULL, 7, '2022-02-11 00:00:00', '1', 2188, NULL, 12, NULL, 15, NULL, NULL, 'a', 10, 7, '2022-02-11 04:49:14', 'admin', '2022-02-11 04:50:59', 'admin'),
(6, 8, NULL, NULL, 12, '2022-06-09 00:00:00', '1', 1500, 5, NULL, NULL, NULL, NULL, NULL, 'a', 0, 5, '2022-06-09 07:57:40', 'admin', '0000-00-00 00:00:00', ''),
(7, 9, NULL, NULL, 13, '2022-10-26 00:00:00', '1', 4481, 10, NULL, NULL, NULL, NULL, NULL, 'a', 0, 10, '2022-10-26 01:19:59', 'admin', '0000-00-00 00:00:00', ''),
(8, 10, NULL, NULL, 11, '2022-10-27 00:00:00', '1', 1500, 10, NULL, NULL, NULL, NULL, NULL, 'a', 0, 10, '2022-10-27 04:20:47', 'admin', '0000-00-00 00:00:00', ''),
(9, 11, NULL, NULL, 9, '2022-10-27 00:00:00', '1', 5748, 10, NULL, NULL, NULL, NULL, NULL, 'a', 0, 10, '2022-10-27 04:21:41', 'admin', '0000-00-00 00:00:00', ''),
(10, 12, NULL, NULL, 5, '2022-10-27 00:00:00', '1', 5486, 10, NULL, NULL, NULL, NULL, NULL, 'a', 0, 10, '2022-10-27 04:21:50', 'admin', '0000-00-00 00:00:00', ''),
(11, 13, NULL, NULL, 2, '2022-10-27 00:00:00', '1', 5019, 5, NULL, NULL, NULL, NULL, NULL, 'a', 0, 5, '2022-10-27 04:21:59', 'admin', '0000-00-00 00:00:00', ''),
(12, 14, NULL, NULL, 4, '2022-10-27 00:00:00', '1', 5211, 5, NULL, NULL, NULL, NULL, NULL, 'a', 0, 5, '2022-10-27 04:22:06', 'admin', '0000-00-00 00:00:00', ''),
(13, 15, NULL, NULL, 10, '2022-10-27 00:00:00', '1', 3964, 5, NULL, NULL, NULL, NULL, NULL, 'a', 0, 5, '2022-10-27 04:22:14', 'admin', '0000-00-00 00:00:00', ''),
(14, 16, NULL, NULL, 3, '2022-10-27 00:00:00', '1', 4481, 10, NULL, NULL, NULL, NULL, NULL, 'a', 0, 10, '2022-10-27 04:22:22', 'admin', '0000-00-00 00:00:00', ''),
(15, 17, NULL, NULL, 6, '2022-10-27 00:00:00', '1', 3668, 10, NULL, NULL, NULL, NULL, NULL, 'a', 0, 10, '2022-10-27 04:22:29', 'admin', '0000-00-00 00:00:00', ''),
(16, 18, NULL, NULL, 8, '2022-10-27 00:00:00', '1', 2822, 5, NULL, NULL, NULL, NULL, NULL, 'a', 0, 5, '2022-10-27 04:22:38', 'admin', '0000-00-00 00:00:00', ''),
(17, 19, NULL, NULL, 1, '2022-10-27 00:00:00', '1', 3183, 10, NULL, NULL, NULL, NULL, NULL, 'a', 0, 10, '2022-10-27 04:22:45', 'admin', '0000-00-00 00:00:00', ''),
(18, 20, NULL, NULL, 7, '2023-04-13 00:00:00', '1', 2188, 15, NULL, NULL, NULL, NULL, NULL, 'a', 7, 22, '2023-04-13 07:05:08', 'admin', '2023-04-13 07:05:18', 'admin'),
(19, 22, NULL, NULL, 17, '2023-04-20 00:00:00', '1', 2000, 100, NULL, NULL, NULL, NULL, NULL, 'a', 0, 100, '2023-04-20 04:27:17', 'admin', '0000-00-00 00:00:00', ''),
(20, 23, NULL, NULL, 18, '2023-04-20 00:00:00', '1', 2000, 50, NULL, NULL, NULL, NULL, NULL, 'a', 0, 50, '2023-04-20 04:27:25', 'admin', '0000-00-00 00:00:00', ''),
(21, 24, NULL, NULL, 20, '2023-04-20 00:00:00', '1', 2000, 50, NULL, NULL, NULL, NULL, NULL, 'a', 0, 50, '2023-04-20 04:27:31', 'admin', '0000-00-00 00:00:00', ''),
(22, 25, NULL, NULL, 19, '2023-04-20 00:00:00', '1', 2000, 50, NULL, NULL, NULL, NULL, NULL, 'a', 0, 50, '2023-04-20 04:27:48', 'admin', '0000-00-00 00:00:00', ''),
(23, 26, NULL, NULL, 35, '2023-04-21 00:00:00', '1', 1500, 10, NULL, NULL, NULL, NULL, NULL, 'a', 0, 10, '2023-04-21 01:03:17', 'admin', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `prod_mst`
--

CREATE TABLE `prod_mst` (
  `prodm_id` int(11) NOT NULL,
  `prodm_sku` varchar(128) NOT NULL,
  `prodm_code` varchar(128) NOT NULL,
  `prodm_name` varchar(128) NOT NULL,
  `prodm_tyr_brnd` varchar(128) NOT NULL,
  `prodm_vehtyp` varchar(64) NOT NULL,
  `prodm_tyrwdth` varchar(16) NOT NULL,
  `prodm_tyrprfl` varchar(16) NOT NULL,
  `prodm_tyrrmsz` varchar(16) NOT NULL,
  `prodm_tyrtyp` varchar(16) NOT NULL,
  `prodm_tub_dtl` varchar(16) NOT NULL,
  `prodm_size` varchar(128) NOT NULL,
  `prodm_ptrn` varchar(128) NOT NULL,
  `prodm_cstprc` varchar(50) NOT NULL,
  `prodm_sleprc` varchar(50) NOT NULL,
  `prodm_ofrprc` varchar(50) NOT NULL,
  `prodm_dsc` text NOT NULL,
  `prodm_sdsc` text NOT NULL,
  `prodm_st` varchar(250) NOT NULL,
  `prodm_sky` text NOT NULL,
  `prodm_sotl` varchar(250) NOT NULL,
  `prodm_sodsc` text NOT NULL,
  `prodm_sttle` varchar(250) NOT NULL,
  `prodm_stdsc` text NOT NULL,
  `prodm_sts` varchar(200) NOT NULL,
  `prodm_rnk` int(11) NOT NULL,
  `prodm_crton` datetime NOT NULL,
  `prodm_crtby` varchar(250) NOT NULL,
  `prodm_mdyon` datetime NOT NULL,
  `prodm_mdfyby` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prod_mst`
--

INSERT INTO `prod_mst` (`prodm_id`, `prodm_sku`, `prodm_code`, `prodm_name`, `prodm_tyr_brnd`, `prodm_vehtyp`, `prodm_tyrwdth`, `prodm_tyrprfl`, `prodm_tyrrmsz`, `prodm_tyrtyp`, `prodm_tub_dtl`, `prodm_size`, `prodm_ptrn`, `prodm_cstprc`, `prodm_sleprc`, `prodm_ofrprc`, `prodm_dsc`, `prodm_sdsc`, `prodm_st`, `prodm_sky`, `prodm_sotl`, `prodm_sodsc`, `prodm_sttle`, `prodm_stdsc`, `prodm_sts`, `prodm_rnk`, `prodm_crton`, `prodm_crtby`, `prodm_mdyon`, `prodm_mdfyby`) VALUES
(1, '105049', 'PCR', '165/65R13 MILAZE X3 TL 77T', '1', '1', '1', '1', '1', '2', '', '13', 'Car Tyre', '3183', '2487', '', '', '', '', '', '', '', '', '', 'i', 100, '2022-01-28 06:58:17', 'admin', '2022-03-04 06:54:46', 'admin'),
(2, '105759', 'PCR1', '195/65R15 SECURADRIVE TL 91V', '1', '1', '1', '1', '1', '2', '', '15', 'Car Tyre', '5019', '3921', '', '', '', '', '', '', '', '', '', 'i', 80, '2022-01-28 07:06:16', 'admin', '0000-00-00 00:00:00', ''),
(3, '105831', 'PCR', '185/60R15 SECURADRIVE  TL 84H', '1', '1', '5', '4', '6', '2', '', '15', 'Car Tyre', '4481', '3501', '', '', '', '', '', '', '', '', '', 'i', 80, '2022-01-28 07:18:18', 'admin', '2022-10-27 04:24:33', 'admin'),
(4, '105832', 'PCR', '195/60R15 SECURADRIVE  TL 88V', '1', '1', '2', '2', '2', '2', '', '15', 'Car Tyre', '5211', '4071', '', '', '', '', '', '', '', '', '', 'i', 50, '2022-01-28 07:35:57', 'admin', '2022-10-27 04:25:24', 'admin'),
(5, '105757', 'UVR', '205/65R16 MILAZE X3  TL 95H', '1', '1', '4', '8', '15', '2', '', '16', 'Car Tyre', '5486', '4286', '', '', '', '', '', '', '', '', '', 'i', 80, '2022-01-28 07:44:33', 'admin', '2022-10-27 04:23:44', 'admin'),
(6, '105076', 'PCR', '175/60R15 SecuraDrive TL 81H', '1', '1', '6', '5', '10', '2', '', '15', 'Car Tyre', '3668', '2866', '', '', '', '', '', '', '', '', '', 'i', 60, '2022-01-28 07:47:06', 'admin', '2022-10-27 04:25:02', 'admin'),
(7, '105037', 'PCR123', '145/70R12 MILAZE X3 TL 69T', '1', '1', '9', '11', '16', '2', '', '12', 'Car Tyre', '2188', '1709', '', '', '', '', '', '', '', '', '', 'i', 60, '2022-01-28 07:50:46', 'admin', '2023-04-13 07:42:51', 'admin'),
(8, '106271', 'PCR', '165/70R14 MILAZE X3 TL 81T', '1', '1', '1', '1', '17', '2', '', '14', 'Car Tyre', '2822', '2205', '', '', '', '', '', '', '', '', '', 'i', 80, '2022-01-28 07:54:22', 'admin', '2022-03-04 06:54:06', 'admin'),
(9, '101716', 'UVR', '215/75R15 CZAR HT  TL 100S', '1', '1', '3', '7', '13', '2', '', '15', 'Car Tyre', '5748', '4491', '', '', '', '', '', '', '', '', '', 'i', 80, '2022-01-28 07:57:44', 'admin', '0000-00-00 00:00:00', ''),
(10, '105032', 'PCR', '185/65R14 MILAZE X3 TL 86T', '1', '1', '5', '4', '5', '2', '', '14', 'Car Tyre', '3964', '3097', '', '', '', '', '', '', '', '', '', 'i', 50, '2022-01-28 08:00:33', 'admin', '0000-00-00 00:00:00', ''),
(11, '123', 'PCR123', 'bike123', '1', '2', '10', '12', '18', '2', '', '15', 'bike Tyre', '1500', '1200', '300', '', '', '', '', '', '', '', '', 'i', 10, '2022-03-05 06:12:47', 'admin', '0000-00-00 00:00:00', ''),
(12, '12345', 'PCR00', 'TL', '1', '1', '9', '11', '16', '2', '', '10', 'Car Tyre', '1500', '1200', '1000', '', '', '', '', '', '', '', '', 'a', 80, '2022-06-09 07:55:04', 'admin', '2022-10-27 04:13:25', 'admin'),
(13, '1111', '1111pcu', 'TL', '1', '1', '7', '3', '3', '1', 'yes', '10', 'Car Tyre', '4481', '3501', '1800', '', '', '', '', '', '', '', '', 'a', 100, '2022-10-26 01:16:32', 'admin', '2022-10-27 04:12:44', 'admin'),
(14, '101', '111', 'CEAT 135/70R12 TL', '1', '1', '11', '', '16', '2', '', '135/70R12 TL', 'MILAZE X3', '2500', '2200', '', '', '', '', '', '', '', '', '', 'a', 10, '2023-04-17 08:45:11', 'admin', '2023-04-17 08:49:49', 'admin'),
(15, '102', '222', 'CEAT 145/70R12 TL', '1', '1', '9', '11', '16', '2', '', '145/70R12 TL', 'MILAZE X3', '2000', '2075', '', '', '', '', '', '', '', '', '', 'a', 20, '2023-04-17 08:47:50', 'admin', '0000-00-00 00:00:00', ''),
(16, '333', '103', '145/70R12 TT', '1', '1', '12', '14', '20', '1', 'yes', '145', 'MILAZE X3', '2000', '2375', '', '', '', '', '', '', '', '', '', 'a', 10, '2023-04-18 04:20:32', 'admin', '0000-00-00 00:00:00', ''),
(17, '444', '104', 'CEAT 145/80R12 TL', '1', '1', '9', '11', '16', '2', '', '145/80R12 TL', 'MILAZE X3', '2000', '2425', '', '', '', '', '', '', '', '', '', 'a', 10, '2023-04-20 04:13:10', 'admin', '0000-00-00 00:00:00', ''),
(18, '555', '105', 'CEAT 145/80R12 TT', '1', '1', '9', '13', '22', '1', 'yes', '145/80R12 TT', 'MILAZE X3', '2000', '2525', '', '', '', '', '', '', '', '', '', 'a', 20, '2023-04-20 04:17:04', 'admin', '0000-00-00 00:00:00', ''),
(19, '666', '106', 'CEAT 155/65R12 TL', '1', '1', '12', '15', '23', '2', '', '155/65R12 TL', 'MILAZE X3', '2000', '2775', '', '', '', '', '', '', '', '', '', 'a', 20, '2023-04-20 04:19:48', 'admin', '0000-00-00 00:00:00', ''),
(20, '777', '107', 'CEAT 145/70R13 TL', '1', '1', '9', '11', '24', '2', '', '145/70R13 TL', 'MILAZE X3', '2000', '2800', '', '', '', '', '', '', '', '', '', 'a', 20, '2023-04-20 04:22:15', 'admin', '0000-00-00 00:00:00', ''),
(21, '888', '108', 'CEAT 145/70R13 TT', '1', '1', '9', '13', '19', '1', 'yes', '145/70R13 TT', 'MILAZE X3', '2000', '2975', '', '', '', '', '', '', '', '', '', 'a', 50, '2023-04-20 04:23:27', 'admin', '0000-00-00 00:00:00', ''),
(22, '999', '109', '155/65R13 TL', '1', '1', '12', '15', '8', '2', '', '155/65R13 TL', 'MILAZE X3', '2500', '3150', '', '', '', '', '', '', '', '', '', 'a', 50, '2023-04-20 04:24:30', 'admin', '2023-04-20 04:25:34', 'admin'),
(23, '523760', '523760', 'GOODYEAR 145/70R12', '2', '1', '9', '13', '16', '1', 'yes', '145/70R12', 'DUCARO HI-MILER TT', '1888', '2256', '', '145/70R12 69T DUCARO HI-MILER TT', '', '', '', '', '', '', '', 'a', 10, '2023-04-21 04:14:14', 'admin', '2023-04-21 04:20:23', 'admin'),
(24, '523761', '523761', 'GOODYEAR 145/70R12', '2', '1', '9', '11', '16', '2', '', '145/70R12', 'DUCARO HI-MILER TT', '1816', '2093', '', '145/70R12 69T DUCARO HI-MILER', '', '', '', '', '', '', '', 'a', 20, '2023-04-21 04:15:28', 'admin', '2023-04-21 04:19:58', 'admin'),
(25, '523763', '523763', 'GOODYEAR 145/80R12', '2', '1', '9', '11', '16', '2', '', '145/80R12', 'DUCARO HI-MILER TT', '1985', '2301', '', '', '', '', '', '', '', '', '', 'a', 30, '2023-04-21 04:16:21', 'admin', '2023-04-21 04:21:24', 'admin'),
(26, '549914', '549914', 'GOODYEAR 145/70R13', '2', '1', '9', '11', '19', '2', '', '145/70R13', 'GPS 2', '2184', '2545', '', '145/70R13 71T GPS 2', '', '', '', '', '', '', '', 'a', 40, '2023-04-21 04:17:53', 'admin', '2023-04-21 10:13:37', 'admin'),
(27, '524547', '524547', 'GOODYEAR 165/65R13', '2', '1', '1', '1', '1', '2', '', '165/65R13', 'DUCARO HI-MILER', '3070', '3332', '', '165/65R13 77T DUCARO HI-MILER', '', '', '', '', '', '', '', 'a', 30, '2023-04-21 04:24:01', 'admin', '0000-00-00 00:00:00', ''),
(28, '536934', '536934', 'GOODYEAR165/65R13 77T DUCARO HI-MILER TT', '2', '1', '1', '1', '1', '1', 'no', '165/65R13 77T', 'DUCARO HI-MILER TT', '3071', '3646', '', '', '', '', '', '', '', '', '', 'a', 40, '2023-04-21 04:25:26', 'admin', '0000-00-00 00:00:00', ''),
(29, '544515', '544515', 'GOODYEAR  145/70R13', '2', '1', '9', '13', '19', '1', 'yes', '145/70R13', 'ASSURANCE DURAPLUS 2 TT', '2426', '2897', '', '145/70R13 71T ASSURANCE DURAPLUS 2 TT', '', '', '', '', '', '', '', 'a', 50, '2023-04-21 04:27:09', 'admin', '0000-00-00 00:00:00', ''),
(30, '544516', '544516', 'GOODYEAR 145/70R13 71T', '2', '1', '9', '11', '1', '2', '', '145/70R13 71T', 'ASSURANCE DURAPLUS 2', '2452', '2634', '', '145/70R13 71T ASSURANCE DURAPLUS 2', '', '', '', '', '', '', '', 'a', 60, '2023-04-21 05:01:41', 'admin', '2023-04-21 05:02:13', 'admin'),
(31, '544517', '544517', 'GOODYEAR 145/80R13 75T', '2', '1', '9', '11', '19', '2', '', '145/80R13 75T', 'ASSURANCE DURAPLUS 2', '2497', '2685', '', '145/80R13 75T ASSURANCE DURAPLUS 2', '', '', '', '', '', '', '', 'a', 60, '2023-04-21 05:03:40', 'admin', '2023-04-21 05:05:15', 'admin'),
(32, 'PSR0769', 'PSR0769', 'BRIDGESTONE 135 70 R12 65T', '3', '1', '11', '17', '26', '2', '', '135 70 R12 65T', 'STURDO', '2141', '3137', '', '', '', '', '', '', '', '', '', 'a', 20, '2023-04-21 05:19:16', 'admin', '0000-00-00 00:00:00', ''),
(33, 'PSR0D252/018', 'PSR0D252/018', 'BRIDGESTONE 145 70 R12 69S', '3', '1', '9', '13', '19', '1', 'yes', '145 70 R12 69S', 'S322', '2422', '3550', '', '', '', '', '', '', '', '', '', 'a', 50, '2023-04-21 05:20:27', 'admin', '0000-00-00 00:00:00', ''),
(34, 'PSR0D771', 'PSR0D771', 'BRIDGESTONE 145 80 R12 74T', '3', '1', '9', '11', '16', '2', '', '145 80 R12 74T', 'STURDO', '2597', '3806', '', '', '', '', '', '', '', '', '', 'a', 50, '2023-04-21 05:21:37', 'admin', '0000-00-00 00:00:00', ''),
(35, 'test', 'test', 'test', '1', '1', '12', '14', '20', '1', 'yes', '50', 't1', '1500', '2000', '1800', 'test', '', '', '', '', '', '', '', 'a', 1, '2023-04-21 11:41:01', 'admin', '2023-04-21 12:56:24', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `prod_store_dtl`
--

CREATE TABLE `prod_store_dtl` (
  `prods_id` int(11) NOT NULL,
  `prods_prodm_id` int(15) NOT NULL,
  `prods_store_id` varchar(128) NOT NULL,
  `prods_sts` varchar(200) NOT NULL,
  `prods_crton` datetime NOT NULL,
  `prods_crtby` varchar(250) NOT NULL,
  `prods_mdyon` datetime NOT NULL,
  `prods_mdfyby` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prod_store_dtl`
--

INSERT INTO `prod_store_dtl` (`prods_id`, `prods_prodm_id`, `prods_store_id`, `prods_sts`, `prods_crton`, `prods_crtby`, `prods_mdyon`, `prods_mdfyby`) VALUES
(14, 1, '1', 'a', '2022-03-04 06:54:46', 'admin', '0000-00-00 00:00:00', ''),
(2, 2, '2', 'a', '2022-01-28 07:06:16', 'admin', '0000-00-00 00:00:00', ''),
(34, 3, '1', 'a', '2022-10-27 04:24:33', 'admin', '0000-00-00 00:00:00', ''),
(36, 4, '1', 'a', '2022-10-27 04:25:24', 'admin', '0000-00-00 00:00:00', ''),
(33, 5, '2', 'a', '2022-10-27 04:23:44', 'admin', '0000-00-00 00:00:00', ''),
(35, 6, '2', 'a', '2022-10-27 04:25:02', 'admin', '0000-00-00 00:00:00', ''),
(37, 7, '2', 'a', '2023-04-13 07:42:51', 'admin', '0000-00-00 00:00:00', ''),
(13, 8, '1', 'a', '2022-03-04 06:54:06', 'admin', '0000-00-00 00:00:00', ''),
(9, 9, '2', 'a', '2022-01-28 07:57:44', 'admin', '0000-00-00 00:00:00', ''),
(10, 10, '2', 'a', '2022-01-28 08:00:33', 'admin', '0000-00-00 00:00:00', ''),
(16, 11, '1', 'a', '2022-03-05 06:12:47', 'admin', '0000-00-00 00:00:00', ''),
(32, 12, '2', 'a', '2022-10-27 04:13:25', 'admin', '0000-00-00 00:00:00', ''),
(31, 12, '1', 'a', '2022-10-27 04:13:25', 'admin', '0000-00-00 00:00:00', ''),
(30, 13, '2', 'a', '2022-10-27 04:12:44', 'admin', '0000-00-00 00:00:00', ''),
(29, 13, '1', 'a', '2022-10-27 04:12:44', 'admin', '0000-00-00 00:00:00', ''),
(40, 14, '2', 'a', '2023-04-17 08:49:49', 'admin', '0000-00-00 00:00:00', ''),
(39, 15, '1', 'a', '2023-04-17 08:47:50', 'admin', '0000-00-00 00:00:00', ''),
(41, 16, '1', 'a', '2023-04-18 04:20:32', 'admin', '0000-00-00 00:00:00', ''),
(42, 17, '2', 'a', '2023-04-20 04:13:10', 'admin', '0000-00-00 00:00:00', ''),
(43, 18, '2', 'a', '2023-04-20 04:17:04', 'admin', '0000-00-00 00:00:00', ''),
(44, 19, '2', 'a', '2023-04-20 04:19:48', 'admin', '0000-00-00 00:00:00', ''),
(45, 20, '2', 'a', '2023-04-20 04:22:15', 'admin', '0000-00-00 00:00:00', ''),
(46, 21, '2', 'a', '2023-04-20 04:23:27', 'admin', '0000-00-00 00:00:00', ''),
(48, 22, '2', 'a', '2023-04-20 04:25:34', 'admin', '0000-00-00 00:00:00', ''),
(55, 23, '2', 'a', '2023-04-21 04:20:23', 'admin', '0000-00-00 00:00:00', ''),
(54, 24, '2', 'a', '2023-04-21 04:19:58', 'admin', '0000-00-00 00:00:00', ''),
(57, 25, '2', 'a', '2023-04-21 04:21:24', 'admin', '0000-00-00 00:00:00', ''),
(68, 26, '2', 'a', '2023-04-21 10:13:37', 'admin', '0000-00-00 00:00:00', ''),
(58, 27, '2', 'a', '2023-04-21 04:24:01', 'admin', '0000-00-00 00:00:00', ''),
(59, 28, '2', 'a', '2023-04-21 04:25:26', 'admin', '0000-00-00 00:00:00', ''),
(60, 29, '2', 'a', '2023-04-21 04:27:09', 'admin', '0000-00-00 00:00:00', ''),
(62, 30, '2', 'a', '2023-04-21 05:02:13', 'admin', '0000-00-00 00:00:00', ''),
(64, 31, '2', 'a', '2023-04-21 05:05:15', 'admin', '0000-00-00 00:00:00', ''),
(65, 32, '2', 'a', '2023-04-21 05:19:16', 'admin', '0000-00-00 00:00:00', ''),
(66, 33, '2', 'a', '2023-04-21 05:20:27', 'admin', '0000-00-00 00:00:00', ''),
(67, 34, '2', 'a', '2023-04-21 05:21:37', 'admin', '0000-00-00 00:00:00', ''),
(74, 35, '2', 'a', '2023-04-21 12:56:24', 'admin', '0000-00-00 00:00:00', ''),
(73, 35, '1', 'a', '2023-04-21 12:56:24', 'admin', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `prod_veh_dtl`
--

CREATE TABLE `prod_veh_dtl` (
  `prodd_id` int(11) NOT NULL,
  `prodd_prodm_id` int(15) NOT NULL,
  `prodd_veh_typ` varchar(128) NOT NULL,
  `prodd_veh_brnd` varchar(128) NOT NULL,
  `prodd_veh_mdl` varchar(128) NOT NULL,
  `prodd_veh_vrnt` varchar(128) NOT NULL,
  `prodd_sts` varchar(200) NOT NULL,
  `prodd_crton` datetime NOT NULL,
  `prodd_crtby` varchar(250) NOT NULL,
  `prodd_mdyon` datetime NOT NULL,
  `prodd_mdfyby` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prod_veh_dtl`
--

INSERT INTO `prod_veh_dtl` (`prodd_id`, `prodd_prodm_id`, `prodd_veh_typ`, `prodd_veh_brnd`, `prodd_veh_mdl`, `prodd_veh_vrnt`, `prodd_sts`, `prodd_crton`, `prodd_crtby`, `prodd_mdyon`, `prodd_mdfyby`) VALUES
(14, 1, '1', '5', '3', '1', 'a', '2022-03-04 06:54:46', 'admin', '0000-00-00 00:00:00', ''),
(2, 2, '1', '', '', '', 'a', '2022-01-28 07:06:16', 'admin', '0000-00-00 00:00:00', ''),
(31, 3, '1', '', '', '', 'a', '2022-10-27 04:24:33', 'admin', '0000-00-00 00:00:00', ''),
(33, 6, '1', '', '', '', 'a', '2022-10-27 04:25:02', 'admin', '0000-00-00 00:00:00', ''),
(39, 7, '1', '5', '2', '2', 'a', '2023-04-13 07:42:51', 'admin', '0000-00-00 00:00:00', ''),
(13, 8, '1', '5', '2', '2', 'a', '2022-03-04 06:54:06', 'admin', '0000-00-00 00:00:00', ''),
(9, 9, '1', '', '', '', 'a', '2022-01-28 07:57:44', 'admin', '0000-00-00 00:00:00', ''),
(10, 10, '1', '', '', '', 'a', '2022-01-28 08:00:33', 'admin', '0000-00-00 00:00:00', ''),
(37, 4, '1', '5', '2', '2', 'a', '2022-10-27 04:25:24', 'admin', '0000-00-00 00:00:00', ''),
(36, 4, '1', '5', '3', '1', 'a', '2022-10-27 04:25:24', 'admin', '0000-00-00 00:00:00', ''),
(17, 11, '2', '1', '4', '4', 'a', '2022-03-05 06:12:47', 'admin', '0000-00-00 00:00:00', ''),
(18, 11, '2', '1', '5', '3', 'a', '2022-03-05 06:12:47', 'admin', '0000-00-00 00:00:00', ''),
(27, 12, '1', '5', '3', '1', 'a', '2022-10-27 04:13:25', 'admin', '0000-00-00 00:00:00', ''),
(26, 13, '1', '5', '3', '1', 'a', '2022-10-27 04:12:44', 'admin', '0000-00-00 00:00:00', ''),
(28, 5, '1', '5', '3', '1', 'a', '2022-10-27 04:23:44', 'admin', '0000-00-00 00:00:00', ''),
(29, 5, '1', '4', '6', '5', 'a', '2022-10-27 04:23:44', 'admin', '0000-00-00 00:00:00', ''),
(30, 5, '1', '3', '7', '6', 'a', '2022-10-27 04:23:44', 'admin', '0000-00-00 00:00:00', ''),
(32, 3, '1', '4', '6', '5', 'a', '2022-10-27 04:24:33', 'admin', '0000-00-00 00:00:00', ''),
(34, 6, '1', '3', '7', '6', 'a', '2022-10-27 04:25:02', 'admin', '0000-00-00 00:00:00', ''),
(35, 6, '1', '5', '3', '1', 'a', '2022-10-27 04:25:02', 'admin', '0000-00-00 00:00:00', ''),
(38, 4, '1', '4', '6', '5', 'a', '2022-10-27 04:25:24', 'admin', '0000-00-00 00:00:00', ''),
(46, 14, '1', '3', '7', '6', 'a', '2023-04-17 08:49:49', 'admin', '0000-00-00 00:00:00', ''),
(45, 14, '1', '4', '6', '5', 'a', '2023-04-17 08:49:49', 'admin', '0000-00-00 00:00:00', ''),
(44, 14, '1', '5', '2', '2', 'a', '2023-04-17 08:49:49', 'admin', '0000-00-00 00:00:00', ''),
(43, 15, '1', '4', '6', '5', 'a', '2023-04-17 08:47:50', 'admin', '0000-00-00 00:00:00', ''),
(47, 16, '1', '5', '3', '1', 'a', '2023-04-18 04:20:32', 'admin', '0000-00-00 00:00:00', ''),
(48, 17, '1', '', '', '', 'a', '2023-04-20 04:13:10', 'admin', '0000-00-00 00:00:00', ''),
(49, 18, '1', '', '', '', 'a', '2023-04-20 04:17:04', 'admin', '0000-00-00 00:00:00', ''),
(50, 19, '1', '4', '6', '5', 'a', '2023-04-20 04:19:48', 'admin', '0000-00-00 00:00:00', ''),
(51, 20, '1', '', '', '', 'a', '2023-04-20 04:22:15', 'admin', '0000-00-00 00:00:00', ''),
(52, 21, '1', '3', '7', '6', 'a', '2023-04-20 04:23:27', 'admin', '0000-00-00 00:00:00', ''),
(54, 22, '1', '4', '6', '5', 'a', '2023-04-20 04:25:34', 'admin', '0000-00-00 00:00:00', ''),
(61, 23, '1', '5', '2', '2', 'a', '2023-04-21 04:20:23', 'admin', '0000-00-00 00:00:00', ''),
(60, 24, '1', '4', '6', '5', 'a', '2023-04-21 04:19:58', 'admin', '0000-00-00 00:00:00', ''),
(64, 25, '1', '5', '3', '1', 'a', '2023-04-21 04:21:24', 'admin', '0000-00-00 00:00:00', ''),
(76, 26, '1', '3', '7', '6', 'a', '2023-04-21 10:13:37', 'admin', '0000-00-00 00:00:00', ''),
(75, 26, '1', '5', '2', '2', 'a', '2023-04-21 10:13:37', 'admin', '0000-00-00 00:00:00', ''),
(65, 27, '1', '', '', '', 'a', '2023-04-21 04:24:01', 'admin', '0000-00-00 00:00:00', ''),
(66, 28, '1', '', '', '', 'a', '2023-04-21 04:25:26', 'admin', '0000-00-00 00:00:00', ''),
(67, 29, '1', '4', '6', '5', 'a', '2023-04-21 04:27:09', 'admin', '0000-00-00 00:00:00', ''),
(69, 30, '1', '', '', '', 'a', '2023-04-21 05:02:13', 'admin', '0000-00-00 00:00:00', ''),
(71, 31, '1', '', '', '', 'a', '2023-04-21 05:05:15', 'admin', '0000-00-00 00:00:00', ''),
(72, 32, '1', '', '', '', 'a', '2023-04-21 05:19:16', 'admin', '0000-00-00 00:00:00', ''),
(73, 33, '1', '', '', '', 'a', '2023-04-21 05:20:27', 'admin', '0000-00-00 00:00:00', ''),
(74, 34, '1', '', '', '', 'a', '2023-04-21 05:21:37', 'admin', '0000-00-00 00:00:00', ''),
(82, 35, '1', '4', '6', '5', 'a', '2023-04-21 12:56:24', 'admin', '0000-00-00 00:00:00', ''),
(81, 35, '1', '5', '2', '2', 'a', '2023-04-21 12:56:24', 'admin', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `store_loc_mst`
--

CREATE TABLE `store_loc_mst` (
  `strlocm_id` int(15) NOT NULL,
  `strlocm_name` varchar(250) NOT NULL COMMENT 'Unique name for each type',
  `strlocm_desc` text DEFAULT NULL,
  `strlocm_seotitle` varchar(250) DEFAULT NULL,
  `strlocm_seodesc` text DEFAULT NULL,
  `strlocm_seokywrd` tinytext DEFAULT NULL,
  `strlocm_seohonetitle` varchar(250) DEFAULT NULL,
  `strlocm_seohonedesc` text DEFAULT NULL,
  `strlocm_seohtwotitle` varchar(250) DEFAULT NULL,
  `strlocm_seohtwodesc` text DEFAULT NULL,
  `strlocm_sts` char(1) NOT NULL COMMENT 'Status of each type',
  `strlocm_prty` int(15) NOT NULL COMMENT 'Priority of each type',
  `strlocm_crtdon` date DEFAULT NULL COMMENT 'Date on which the type is created',
  `strlocm_crtdby` varchar(250) DEFAULT NULL COMMENT 'By whom the type is created',
  `strlocm_mdfdon` date DEFAULT NULL COMMENT 'Date on which the type is modified',
  `strlocm_mdfdby` varchar(250) DEFAULT NULL COMMENT 'By whom the type is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_loc_mst`
--

INSERT INTO `store_loc_mst` (`strlocm_id`, `strlocm_name`, `strlocm_desc`, `strlocm_seotitle`, `strlocm_seodesc`, `strlocm_seokywrd`, `strlocm_seohonetitle`, `strlocm_seohonedesc`, `strlocm_seohtwotitle`, `strlocm_seohtwodesc`, `strlocm_sts`, `strlocm_prty`, `strlocm_crtdon`, `strlocm_crtdby`, `strlocm_mdfdon`, `strlocm_mdfdby`) VALUES
(1, 'Godown', 'godown', '', '', '', '', '', '', '', 'a', 1, '2022-01-04', 'admin', NULL, NULL),
(2, 'Secunderabad', 'Secunderabad', '', '', '', '', '', '', '', 'a', 2, '2022-01-04', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trnsfr_inventory`
--

CREATE TABLE `trnsfr_inventory` (
  `trnsfr_id` int(11) NOT NULL,
  `trnsfr_prdid` int(11) NOT NULL,
  `trnsfr_dat` datetime NOT NULL,
  `trnsfr_frm_lcn` varchar(250) NOT NULL,
  `trnsfr_to_lcn` varchar(250) NOT NULL,
  `trnsfr_bls` int(15) DEFAULT NULL,
  `trnsfr_sts` varchar(2) DEFAULT NULL,
  `trnsfr_crton` datetime NOT NULL,
  `trnsfr_crtby` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trnsfr_inventory`
--

INSERT INTO `trnsfr_inventory` (`trnsfr_id`, `trnsfr_prdid`, `trnsfr_dat`, `trnsfr_frm_lcn`, `trnsfr_to_lcn`, `trnsfr_bls`, `trnsfr_sts`, `trnsfr_crton`, `trnsfr_crtby`) VALUES
(1, 7, '2022-02-10 00:00:00', '1', '2', 2, 'a', '2022-02-10 10:21:31', 'admin'),
(2, 7, '2022-02-11 00:00:00', '1', '2', 10, 'a', '2022-02-11 04:49:14', 'admin'),
(3, 7, '2022-02-11 00:00:00', '2', '1', 10, 'a', '2022-02-11 04:50:07', 'admin'),
(4, 7, '2022-02-11 00:00:00', '2', '1', 2, 'a', '2022-02-11 04:50:10', 'admin'),
(5, 7, '2022-02-11 00:00:00', '1', '2', 5, 'a', '2022-02-11 04:50:59', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tyr_brnd_mst`
--

CREATE TABLE `tyr_brnd_mst` (
  `tyrbrndm_id` int(15) NOT NULL,
  `tyrbrndm_name` varchar(250) NOT NULL COMMENT 'Name of the tyre brand',
  `tyrbrndm_desc` text DEFAULT NULL,
  `tyrbrndm_brndimg` varchar(250) DEFAULT NULL,
  `tyrbrndm_sts` char(1) DEFAULT NULL COMMENT 'Status of the tyre brand',
  `tyrbrndm_prty` int(15) DEFAULT NULL COMMENT 'Priority of the tyre brand',
  `tyrbrndm_seotitle` varchar(250) DEFAULT NULL,
  `tyrbrndm_seodesc` text DEFAULT NULL,
  `tyrbrndm_seokywrd` text DEFAULT NULL,
  `tyrbrndm_seohonetitle` varchar(250) DEFAULT NULL,
  `tyrbrndm_seohonedesc` text DEFAULT NULL,
  `tyrbrndm_seohtwotitle` varchar(250) DEFAULT NULL,
  `tyrbrndm_seohtwodesc` text DEFAULT NULL,
  `tyrbrndm_crtdon` datetime DEFAULT NULL COMMENT 'Date on which tyre brand is created',
  `tyrbrndm_crtdby` varchar(250) DEFAULT NULL COMMENT 'By whom the tyre brand is created',
  `tyrbrndm_mdfdon` datetime DEFAULT NULL COMMENT 'Date on which the tyre brand is modified',
  `tyrbrndm_mdfdby` varchar(250) DEFAULT NULL COMMENT 'BY whom the tyre brand is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tyr_brnd_mst`
--

INSERT INTO `tyr_brnd_mst` (`tyrbrndm_id`, `tyrbrndm_name`, `tyrbrndm_desc`, `tyrbrndm_brndimg`, `tyrbrndm_sts`, `tyrbrndm_prty`, `tyrbrndm_seotitle`, `tyrbrndm_seodesc`, `tyrbrndm_seokywrd`, `tyrbrndm_seohonetitle`, `tyrbrndm_seohonedesc`, `tyrbrndm_seohtwotitle`, `tyrbrndm_seohtwodesc`, `tyrbrndm_crtdon`, `tyrbrndm_crtdby`, `tyrbrndm_mdfdon`, `tyrbrndm_mdfdby`) VALUES
(1, 'Ceat', '', 'tyrbrndimg61f3939b5ead8.png', 'a', 100, '', '', '', '', '', '', '', '2022-01-28 06:56:27', 'admin', NULL, NULL),
(2, 'GOODYEAR', '', 'tyrbrndimg64420ed20fe49.png', 'a', 20, '', '', '', '', '', '', '', '2023-04-21 04:19:30', 'admin', NULL, NULL),
(3, 'BRIDGESTONE', '', 'tyrbrndimg64421a56e2c11.png', 'a', 60, '', '', '', '', '', '', '', '2023-04-21 05:08:38', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tyr_prfl_mst`
--

CREATE TABLE `tyr_prfl_mst` (
  `tyrprflm_id` int(15) NOT NULL,
  `tyrprflm_name` varchar(250) NOT NULL COMMENT 'Name of the Tyre profile',
  `tyrprflm_desc` text DEFAULT NULL,
  `tyrprflm_vehtypm_id` int(15) NOT NULL,
  `tyrprflm_tyrwdthm_id` int(15) NOT NULL,
  `tyrprflm_sts` char(1) DEFAULT NULL COMMENT 'Status of the Tyre profile',
  `tyrprflm_prty` int(15) DEFAULT NULL COMMENT 'Priority of the Tyre profile',
  `tyrprflm_seotitle` varchar(250) DEFAULT NULL,
  `tyrprflm_seodesc` text DEFAULT NULL,
  `tyrprflm_seokywrd` text DEFAULT NULL,
  `tyrprflm_seohonetitle` varchar(250) DEFAULT NULL,
  `tyrprflm_seohonedesc` text DEFAULT NULL,
  `tyrprflm_seohtwotitle` varchar(250) DEFAULT NULL,
  `tyrprflm_seohtwodesc` text DEFAULT NULL,
  `tyrprflm_crtdon` datetime DEFAULT NULL COMMENT 'Date on which Tyre profile is created',
  `tyrprflm_crtdby` varchar(250) DEFAULT NULL COMMENT 'By whom the Tyre profile is created',
  `tyrprflm_mdfdon` datetime DEFAULT NULL COMMENT 'Date on which the Tyre profile is modified',
  `tyrprflm_mdfdby` varchar(250) DEFAULT NULL COMMENT 'BY whom the Tyre profile is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tyr_prfl_mst`
--

INSERT INTO `tyr_prfl_mst` (`tyrprflm_id`, `tyrprflm_name`, `tyrprflm_desc`, `tyrprflm_vehtypm_id`, `tyrprflm_tyrwdthm_id`, `tyrprflm_sts`, `tyrprflm_prty`, `tyrprflm_seotitle`, `tyrprflm_seodesc`, `tyrprflm_seokywrd`, `tyrprflm_seohonetitle`, `tyrprflm_seohonedesc`, `tyrprflm_seohtwotitle`, `tyrprflm_seohtwodesc`, `tyrprflm_crtdon`, `tyrprflm_crtdby`, `tyrprflm_mdfdon`, `tyrprflm_mdfdby`) VALUES
(1, 'Tubeless Car Tyre', '', 1, 1, 'a', 100, '', '', '', '', '', '', '', '2022-01-28 06:53:58', 'admin', NULL, NULL),
(2, 'Tubeless', '', 1, 2, 'a', 80, '', '', '', '', '', '', '', '2022-01-28 07:07:42', 'admin', NULL, NULL),
(3, 'TL', '', 1, 7, 'a', 50, '', '', '', '', '', '', '', '2022-01-28 07:09:50', 'admin', NULL, NULL),
(4, 'TL', '', 1, 5, 'a', 70, '', '', '', '', '', '', '', '2022-01-28 07:09:58', 'admin', NULL, NULL),
(5, 'TL', '', 1, 6, 'a', 60, '', '', '', '', '', '', '', '2022-01-28 07:10:06', 'admin', NULL, NULL),
(6, 'TL', '', 1, 8, 'a', 10, '', '', '', '', '', '', '', '2022-01-28 07:10:13', 'admin', NULL, NULL),
(7, 'TL', '', 1, 3, 'a', 70, '', '', '', '', '', '', '', '2022-01-28 07:10:37', 'admin', NULL, NULL),
(8, 'TL', '', 1, 4, 'a', 60, '', '', '', '', '', '', '', '2022-01-28 07:10:45', 'admin', NULL, NULL),
(9, 'TL', '', 1, 2, 'a', 50, '', '', '', '', '', '', '', '2022-01-28 07:10:55', 'admin', NULL, NULL),
(10, '16', '', 1, 4, 'a', 10, '', '', '', '', '', '', '', '2022-01-28 07:42:42', 'admin', NULL, NULL),
(11, 'TL', '', 1, 9, 'a', 60, '', '', '', '', '', '', '', '2022-01-28 07:49:01', 'admin', NULL, NULL),
(12, '115TL', '', 2, 10, 'a', 10, '', '', '', '', '', '', '', '2022-03-05 06:09:04', 'admin', '2022-03-05 06:10:02', 'admin'),
(13, 'TT', '', 1, 9, 'a', 10, '', '', '', '', '', '', '', '2023-04-17 08:48:44', 'admin', NULL, NULL),
(14, 'TT', '', 1, 12, 'a', 10, '', '', '', '', '', '', '', '2023-04-18 04:17:50', 'admin', NULL, NULL),
(15, 'TL', '', 1, 12, 'a', 20, '', '', '', '', '', '', '', '2023-04-20 04:18:12', 'admin', NULL, NULL),
(16, 'TL', '', 1, 11, 'a', 40, '', '', '', '', '', '', '', '2023-04-21 05:16:24', 'admin', NULL, NULL),
(17, 'TT', '', 1, 11, 'a', 30, '', '', '', '', '', '', '', '2023-04-21 05:16:31', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tyr_rimsize_mst`
--

CREATE TABLE `tyr_rimsize_mst` (
  `tyrrmszm_id` int(15) NOT NULL,
  `tyrrmszm_name` varchar(250) NOT NULL COMMENT 'Name of the tyre rim size',
  `tyrrmszm_desc` text DEFAULT NULL,
  `tyrrmszm_vehtypm_id` int(15) NOT NULL,
  `tyrrmszm_tyrwdthm_id` int(15) NOT NULL,
  `tyrrmszm_tyrprflm_id` int(15) NOT NULL,
  `tyrrmszm_sts` char(1) DEFAULT NULL COMMENT 'Status of the tyre rim size',
  `tyrrmszm_prty` int(15) DEFAULT NULL COMMENT 'Priority of the tyre rim size',
  `tyrrmszm_seotitle` varchar(250) DEFAULT NULL,
  `tyrrmszm_seodesc` text DEFAULT NULL,
  `tyrrmszm_seokywrd` text DEFAULT NULL,
  `tyrrmszm_seohonetitle` varchar(250) DEFAULT NULL,
  `tyrrmszm_seohonedesc` text DEFAULT NULL,
  `tyrrmszm_seohtwotitle` varchar(250) DEFAULT NULL,
  `tyrrmszm_seohtwodesc` text DEFAULT NULL,
  `tyrrmszm_crtdon` datetime DEFAULT NULL COMMENT 'Date on which tyre rim size is created',
  `tyrrmszm_crtdby` varchar(250) DEFAULT NULL COMMENT 'By whom the tyre rim size is created',
  `tyrrmszm_mdfdon` datetime DEFAULT NULL COMMENT 'Date on which the vehicle variant is modified',
  `tyrrmszm_mdfdby` varchar(250) DEFAULT NULL COMMENT 'BY whom the tyre rim size is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tyr_rimsize_mst`
--

INSERT INTO `tyr_rimsize_mst` (`tyrrmszm_id`, `tyrrmszm_name`, `tyrrmszm_desc`, `tyrrmszm_vehtypm_id`, `tyrrmszm_tyrwdthm_id`, `tyrrmszm_tyrprflm_id`, `tyrrmszm_sts`, `tyrrmszm_prty`, `tyrrmszm_seotitle`, `tyrrmszm_seodesc`, `tyrrmszm_seokywrd`, `tyrrmszm_seohonetitle`, `tyrrmszm_seohonedesc`, `tyrrmszm_seohtwotitle`, `tyrrmszm_seohtwodesc`, `tyrrmszm_crtdon`, `tyrrmszm_crtdby`, `tyrrmszm_mdfdon`, `tyrrmszm_mdfdby`) VALUES
(1, '13', '', 1, 1, 1, 'a', 100, '', '', '', '', '', '', '', '2022-01-28 06:54:19', 'admin', NULL, NULL),
(2, 'Tubeless Car Tyre', '', 1, 2, 2, 'a', 80, '', '', '', '', '', '', '', '2022-01-28 07:07:59', 'admin', NULL, NULL),
(3, '16', '', 1, 7, 3, 'a', 70, '', '', '', '', '', '', '', '2022-01-28 07:11:40', 'admin', NULL, NULL),
(4, '17', '', 1, 7, 3, 'a', 70, '', '', '', '', '', '', '', '2022-01-28 07:11:52', 'admin', NULL, NULL),
(5, '14', '', 1, 5, 4, 'a', 50, '', '', '', '', '', '', '', '2022-01-28 07:12:33', 'admin', NULL, NULL),
(6, '15', '', 1, 5, 4, 'a', 60, '', '', '', '', '', '', '', '2022-01-28 07:12:40', 'admin', NULL, NULL),
(7, '16', '', 1, 5, 4, 'a', 60, '', '', '', '', '', '', '', '2022-01-28 07:12:49', 'admin', NULL, NULL),
(8, '13', '', 1, 6, 5, 'a', 70, '', '', '', '', '', '', '', '2022-01-28 07:13:13', 'admin', NULL, NULL),
(9, '14', '', 1, 6, 5, 'a', 10, '', '', '', '', '', '', '', '2022-01-28 07:13:21', 'admin', NULL, NULL),
(10, '15', '', 1, 6, 5, 'a', 50, '', '', '', '', '', '', '', '2022-01-28 07:13:32', 'admin', NULL, NULL),
(11, '17', '', 1, 8, 6, 'a', 70, '', '', '', '', '', '', '', '2022-01-28 07:13:53', 'admin', NULL, NULL),
(12, '18', '', 1, 8, 6, 'a', 50, '', '', '', '', '', '', '', '2022-01-28 07:14:09', 'admin', NULL, NULL),
(13, '15', '', 1, 3, 7, 'a', 10, '', '', '', '', '', '', '', '2022-01-28 07:14:41', 'admin', NULL, NULL),
(14, '16', '', 1, 3, 7, 'a', 60, '', '', '', '', '', '', '', '2022-01-28 07:14:52', 'admin', NULL, NULL),
(15, '16', '', 1, 4, 8, 'a', 70, '', '', '', '', '', '', '', '2022-01-28 07:43:23', 'admin', NULL, NULL),
(16, '12', '', 1, 9, 11, 'a', 70, '', '', '', '', '', '', '', '2022-01-28 07:49:27', 'admin', NULL, NULL),
(17, '14', '', 1, 1, 1, 'a', 50, '', '', '', '', '', '', '', '2022-01-28 07:53:10', 'admin', NULL, NULL),
(18, '15', '', 2, 10, 12, 'a', 10, '', '', '', '', '', '', '', '2022-03-05 06:11:27', 'admin', NULL, NULL),
(19, '13', '', 1, 9, 13, 'a', 20, '', '', '', '', '', '', '', '2023-04-18 04:16:24', 'admin', NULL, NULL),
(20, '13', '', 1, 12, 14, 'a', 10, '', '', '', '', '', '', '', '2023-04-18 04:18:03', 'admin', NULL, NULL),
(21, '12', '', 1, 12, 14, 'a', 10, '', '', '', '', '', '', '', '2023-04-20 04:15:08', 'admin', NULL, NULL),
(22, '80R12', '', 1, 9, 13, 'a', 20, '', '', '', '', '', '', '', '2023-04-20 04:16:11', 'admin', NULL, NULL),
(23, '65R12', '', 1, 12, 15, 'a', 10, '', '', '', '', '', '', '', '2023-04-20 04:18:56', 'admin', NULL, NULL),
(24, '13', '', 1, 9, 11, 'a', 10, '', '', '', '', '', '', '', '2023-04-20 04:21:26', 'admin', '2023-04-21 05:29:28', 'admin'),
(25, '65R13', '', 1, 12, 15, 'a', 20, '', '', '', '', '', '', '', '2023-04-20 04:25:10', 'admin', NULL, NULL),
(26, '12', '', 1, 11, 17, 'a', 60, '', '', '', '', '', '', '', '2023-04-21 05:16:51', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tyr_type_mst`
--

CREATE TABLE `tyr_type_mst` (
  `tyrtypm_id` int(15) NOT NULL,
  `tyrtypm_name` varchar(250) NOT NULL COMMENT 'Unique name for each tyre type',
  `tyrtypm_cde` varchar(250) NOT NULL COMMENT 'Unique code for each tyre type',
  `tyrtypm_desc` text DEFAULT NULL,
  `tyrtypm_seotitle` varchar(250) DEFAULT NULL,
  `tyrtypm_seodesc` text DEFAULT NULL,
  `tyrtypm_seokywrd` tinytext DEFAULT NULL,
  `tyrtypm_seohonetitle` varchar(250) DEFAULT NULL,
  `tyrtypm_seohonedesc` text DEFAULT NULL,
  `tyrtypm_seohtwotitle` varchar(250) DEFAULT NULL,
  `tyrtypm_seohtwodesc` text DEFAULT NULL,
  `tyrtypm_sts` char(1) NOT NULL COMMENT 'Status of each tyre type',
  `tyrtypm_prty` int(15) NOT NULL COMMENT 'Priority of each tyre type',
  `tyrtypm_hmprty` int(15) NOT NULL,
  `tyrtypm_crtdon` date DEFAULT NULL COMMENT 'Date on which the tyre type is created',
  `tyrtypm_crtdby` varchar(250) DEFAULT NULL COMMENT 'By whom the tyre type is created',
  `tyrtypm_mdfdon` date DEFAULT NULL COMMENT 'Date on which the tyre type is modified',
  `tyrtypm_mdfdby` varchar(250) DEFAULT NULL COMMENT 'By whom the tyre type is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tyr_type_mst`
--

INSERT INTO `tyr_type_mst` (`tyrtypm_id`, `tyrtypm_name`, `tyrtypm_cde`, `tyrtypm_desc`, `tyrtypm_seotitle`, `tyrtypm_seodesc`, `tyrtypm_seokywrd`, `tyrtypm_seohonetitle`, `tyrtypm_seohonedesc`, `tyrtypm_seohtwotitle`, `tyrtypm_seohtwodesc`, `tyrtypm_sts`, `tyrtypm_prty`, `tyrtypm_hmprty`, `tyrtypm_crtdon`, `tyrtypm_crtdby`, `tyrtypm_mdfdon`, `tyrtypm_mdfdby`) VALUES
(1, 'Tyre', 'TT', 'tyre', '', '', '', '', '', '', '', 'a', 1, 0, '2022-01-22', 'admin', '2023-04-21', 'admin'),
(2, 'Tyre (Tube Less)', 'TL', 'Tube Less Tyre', '', '', '', '', '', '', '', 'a', 2, 0, '2022-01-22', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tyr_wdth_mst`
--

CREATE TABLE `tyr_wdth_mst` (
  `tyrwdthm_id` int(15) NOT NULL,
  `tyrwdthm_name` varchar(250) NOT NULL COMMENT 'Name of the tyre width',
  `tyrwdthm_vehtypm_id` varchar(250) NOT NULL COMMENT 'Vehicle type ID',
  `tyrwdthm_desc` text DEFAULT NULL,
  `tyrwdthm_sts` char(1) DEFAULT NULL COMMENT 'Status of the tyre width',
  `tyrwdthm_prty` int(15) DEFAULT NULL COMMENT 'Priority of the tyre width',
  `tyrwdthm_seotitle` varchar(250) DEFAULT NULL,
  `tyrwdthm_seodesc` text DEFAULT NULL,
  `tyrwdthm_seokywrd` text DEFAULT NULL,
  `tyrwdthm_seohonetitle` varchar(250) DEFAULT NULL,
  `tyrwdthm_seohonedesc` text DEFAULT NULL,
  `tyrwdthm_seohtwotitle` varchar(250) DEFAULT NULL,
  `tyrwdthm_seohtwodesc` text DEFAULT NULL,
  `tyrwdthm_crtdon` datetime DEFAULT NULL COMMENT 'Date on which tyre width is created',
  `tyrwdthm_crtdby` varchar(250) DEFAULT NULL COMMENT 'By whom the tyre width is created',
  `tyrwdthm_mdfdon` datetime DEFAULT NULL COMMENT 'Date on which the tyre width is modified',
  `tyrwdthm_mdfdby` varchar(250) DEFAULT NULL COMMENT 'BY whom the tyre width is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tyr_wdth_mst`
--

INSERT INTO `tyr_wdth_mst` (`tyrwdthm_id`, `tyrwdthm_name`, `tyrwdthm_vehtypm_id`, `tyrwdthm_desc`, `tyrwdthm_sts`, `tyrwdthm_prty`, `tyrwdthm_seotitle`, `tyrwdthm_seodesc`, `tyrwdthm_seokywrd`, `tyrwdthm_seohonetitle`, `tyrwdthm_seohonedesc`, `tyrwdthm_seohtwotitle`, `tyrwdthm_seohtwodesc`, `tyrwdthm_crtdon`, `tyrwdthm_crtdby`, `tyrwdthm_mdfdon`, `tyrwdthm_mdfdby`) VALUES
(1, '165', '1', '', 'a', 100, '', '', '', '', '', '', '', '2022-01-28 06:53:34', 'admin', NULL, NULL),
(2, '195', '1', '', 'a', 80, '', '', '', '', '', '', '', '2022-01-28 07:06:40', 'admin', NULL, NULL),
(3, '215', '1', '', 'a', 70, '', '', '', '', '', '', '', '2022-01-28 07:08:28', 'admin', NULL, NULL),
(4, '205', '1', '', 'a', 70, '', '', '', '', '', '', '', '2022-01-28 07:08:37', 'admin', NULL, NULL),
(5, '185', '1', '', 'a', 60, '', '', '', '', '', '', '', '2022-01-28 07:08:45', 'admin', NULL, NULL),
(6, '175', '1', '', 'a', 60, '', '', '', '', '', '', '', '2022-01-28 07:08:54', 'admin', NULL, NULL),
(7, '235', '1', '', 'a', 10, '', '', '', '', '', '', '', '2022-01-28 07:09:07', 'admin', NULL, NULL),
(8, '265', '1', '', 'a', 60, '', '', '', '', '', '', '', '2022-01-28 07:09:12', 'admin', NULL, NULL),
(9, '145', '1', '', 'a', 10, '', '', '', '', '', '', '', '2022-01-28 07:48:41', 'admin', NULL, NULL),
(10, '115', '2', '', 'a', 10, '', '', '', '', '', '', '', '2022-03-05 06:08:54', 'admin', NULL, NULL),
(11, '135', '1', '', 'a', 10, '', '', '', '', '', '', '', '2023-04-17 08:48:58', 'admin', NULL, NULL),
(12, '155', '1', '', 'a', 10, '', '', '', '', '', '', '', '2023-04-18 04:17:10', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usrwshlst_dtl`
--

CREATE TABLE `usrwshlst_dtl` (
  `usrwshlstd_id` int(11) NOT NULL,
  `usrwshlstd_sesid` varchar(250) NOT NULL COMMENT 'Stores the session value',
  `usrwshlstd_prodm_id` int(15) NOT NULL COMMENT 'Stores the product id',
  `usrwshlstd_untm_id` int(15) NOT NULL COMMENT 'Stores the size id',
  `usrwshlstd_clrm_id` int(15) NOT NULL,
  `usrwshlstd_szm_id` int(15) NOT NULL,
  `usrwshlstd_qty` int(15) NOT NULL COMMENT 'Quantity for wish list',
  `usrwshlstd_cartsts` char(1) DEFAULT NULL COMMENT 'Store the value of cart status',
  `usrwshlstd_sendsts` char(1) DEFAULT NULL COMMENT 'Store the value of send status',
  `usrwshlstd_mbrm_id` int(15) NOT NULL COMMENT 'Refer mbr_mst -> mbrm_id',
  `usrwshlstd_sts` char(1) DEFAULT NULL COMMENT 'Store the value of user status',
  `usrwshlstd_crtdon` datetime DEFAULT NULL COMMENT 'Date and time of user wish created',
  `usrwshlstd_crtdby` varchar(250) DEFAULT NULL COMMENT 'By whom the user wish created',
  `usrwshlstd_mdfdon` datetime DEFAULT NULL COMMENT 'Date and time of user wish modified',
  `usrwshlstd_mdfdby` varchar(250) DEFAULT NULL COMMENT 'By whom the user wish is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usrwshlst_dtl`
--

INSERT INTO `usrwshlst_dtl` (`usrwshlstd_id`, `usrwshlstd_sesid`, `usrwshlstd_prodm_id`, `usrwshlstd_untm_id`, `usrwshlstd_clrm_id`, `usrwshlstd_szm_id`, `usrwshlstd_qty`, `usrwshlstd_cartsts`, `usrwshlstd_sendsts`, `usrwshlstd_mbrm_id`, `usrwshlstd_sts`, `usrwshlstd_crtdon`, `usrwshlstd_crtdby`, `usrwshlstd_mdfdon`, `usrwshlstd_mdfdby`) VALUES
(9, 'c87c73e132d227baa6807f86043c19f4', 8, 0, 0, 4, 1, 'n', '', 1, 'a', '2020-12-26 10:43:38', '1', NULL, NULL),
(8, 'c9621963317bbab2e7fae6e9d1dec766', 9, 0, 0, 4, 1, 'n', '', 1, 'a', '2020-12-26 09:51:40', '1', NULL, NULL),
(5, 'f3d96d5ff763dcda1d04f225395e51c2', 3, 0, 0, 4, 1, 'n', '', 2, 'a', '2020-12-04 04:58:07', '2', NULL, NULL),
(6, 'f3d96d5ff763dcda1d04f225395e51c2', 5, 0, 0, 8, 1, 'n', '', 2, 'a', '2020-12-04 04:58:18', '2', NULL, NULL),
(7, 'e8baf6e739c8f81d3403a4f2ccee25d5', 4, 0, 0, 0, 1, 'n', '', 2, 'a', '2020-12-04 04:55:19', '2', NULL, NULL),
(11, '7486411bba349326dfe734d9066a2027', 69, 0, 0, 1, 1, 'n', '', 1, 'a', '2021-02-26 09:36:07', '1', NULL, NULL),
(12, '7486411bba349326dfe734d9066a2027', 275, 0, 0, 1, 1, 'n', '', 1, 'a', '2021-02-26 09:44:56', '1', NULL, NULL),
(13, '7486411bba349326dfe734d9066a2027', 187, 0, 0, 1, 1, 'n', '', 1, 'a', '2021-02-26 09:45:16', '1', NULL, NULL),
(14, '7486411bba349326dfe734d9066a2027', 189, 0, 0, 1, 1, 'n', '', 1, 'a', '2021-02-26 10:14:38', '1', NULL, NULL),
(21, '81df79fe404dfc674b377e52e5e31533', 166, 0, 0, 1, 1, 'n', '', 2, 'a', '2021-03-17 10:07:20', '2', NULL, NULL),
(19, '7d532088066735bcbfc53a07fe811f7c', 194, 0, 0, 1, 1, 'n', '', 13, 'a', '2021-03-13 12:44:08', '13', NULL, NULL),
(20, '81df79fe404dfc674b377e52e5e31533', 304, 0, 0, 1, 1, 'n', '', 2, 'a', '2021-03-17 10:07:04', '2', NULL, NULL),
(22, 'd7ae474d7f1c4fd432a87f965b949638', 306, 0, 0, 1, 1, 'n', '', 2, 'a', '2021-03-22 11:25:55', '2', NULL, NULL),
(23, 'c3b0c3319ae28ccad8b788264bb153a2', 58, 0, 0, 1, 1, 'n', '', 56, 'a', '2021-03-23 12:46:20', '56', NULL, NULL),
(24, 'f70c9582302fd1c7376b49ab9a9e7e78', 304, 0, 0, 1, 1, 'n', '', 23, 'a', '2021-03-24 03:55:10', '23', NULL, NULL),
(25, 'f70c9582302fd1c7376b49ab9a9e7e78', 132, 0, 0, 1, 1, 'n', '', 23, 'a', '2021-03-24 03:55:22', '23', NULL, NULL),
(26, 'f70c9582302fd1c7376b49ab9a9e7e78', 259, 0, 0, 1, 1, 'n', '', 23, 'a', '2021-03-24 03:56:16', '23', NULL, NULL),
(27, 'fef7e24bfdd74084a14a5fd7536eac9a', 306, 0, 0, 1, 1, 'n', '', 23, 'a', '2021-03-24 05:27:38', '23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `veh_brnd_mst`
--

CREATE TABLE `veh_brnd_mst` (
  `vehbrndm_id` int(15) NOT NULL,
  `vehbrndm_name` varchar(250) NOT NULL COMMENT 'Name of the vehicle brand',
  `vehbrndm_desc` text DEFAULT NULL,
  `vehbrndm_vehtypm_id` int(15) NOT NULL,
  `vehbrndm_brndimg` varchar(250) DEFAULT NULL,
  `vehbrndm_sts` char(1) DEFAULT NULL COMMENT 'Status of the vehicle brand',
  `vehbrndm_prty` int(15) DEFAULT NULL COMMENT 'Priority of the vehicle brand',
  `vehbrndm_seotitle` varchar(250) DEFAULT NULL,
  `vehbrndm_seodesc` text DEFAULT NULL,
  `vehbrndm_seokywrd` text DEFAULT NULL,
  `vehbrndm_seohonetitle` varchar(250) DEFAULT NULL,
  `vehbrndm_seohonedesc` text DEFAULT NULL,
  `vehbrndm_seohtwotitle` varchar(250) DEFAULT NULL,
  `vehbrndm_seohtwodesc` text DEFAULT NULL,
  `vehbrndm_crtdon` datetime DEFAULT NULL COMMENT 'Date on which vehicle brand is created',
  `vehbrndm_crtdby` varchar(250) DEFAULT NULL COMMENT 'By whom the vehicle brand is created',
  `vehbrndm_mdfdon` datetime DEFAULT NULL COMMENT 'Date on which the vehicle brand is modified',
  `vehbrndm_mdfdby` varchar(250) DEFAULT NULL COMMENT 'BY whom the vehicle brand is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `veh_brnd_mst`
--

INSERT INTO `veh_brnd_mst` (`vehbrndm_id`, `vehbrndm_name`, `vehbrndm_desc`, `vehbrndm_vehtypm_id`, `vehbrndm_brndimg`, `vehbrndm_sts`, `vehbrndm_prty`, `vehbrndm_seotitle`, `vehbrndm_seodesc`, `vehbrndm_seokywrd`, `vehbrndm_seohonetitle`, `vehbrndm_seohonedesc`, `vehbrndm_seohtwotitle`, `vehbrndm_seohtwodesc`, `vehbrndm_crtdon`, `vehbrndm_crtdby`, `vehbrndm_mdfdon`, `vehbrndm_mdfdby`) VALUES
(1, 'TVS Motor', '', 2, 'brndimg635936090a974.png', 'a', 70, '', '', '', '', '', '', '', '2022-03-03 12:34:12', 'admin', '2022-10-26 01:28:41', 'admin'),
(2, 'Bajaj Auto', '', 2, 'brndimg635935792e9e7.png', 'a', 60, '', '', '', '', '', '', '', '2022-03-03 12:34:26', 'admin', '2022-10-26 01:26:17', 'admin'),
(3, 'Hyundai', '', 1, 'brndimg635936f3d66f3.png', 'a', 100, '', '', '', '', '', '', '', '2022-03-03 12:34:45', 'admin', '2022-10-26 01:32:35', 'admin'),
(4, 'Tata Motors', '', 1, 'brndimg635936c30ac46.png', 'a', 10, '', '', '', '', '', '', '', '2022-03-03 12:34:57', 'admin', '2022-10-26 01:31:47', 'admin'),
(5, 'Toyota', '', 1, 'brndimg635937635f0e7.jpg', 'a', 60, '', '', '', '', '', '', '', '2022-03-03 12:35:13', 'admin', '2022-10-26 01:34:27', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `veh_model_mst`
--

CREATE TABLE `veh_model_mst` (
  `vehmodlm_id` int(15) NOT NULL,
  `vehmodlm_name` varchar(250) NOT NULL COMMENT 'Name of the vehicle model',
  `vehmodlm_desc` text DEFAULT NULL,
  `vehmodlm_vehtypm_id` int(15) NOT NULL,
  `vehmodlm_vehbrndm_id` int(15) NOT NULL,
  `vehmodlm_sts` char(1) DEFAULT NULL COMMENT 'Status of the vehicle model',
  `vehmodlm_prty` int(15) DEFAULT NULL COMMENT 'Priority of the vehicle model',
  `vehmodlm_seotitle` varchar(250) DEFAULT NULL,
  `vehmodlm_seodesc` text DEFAULT NULL,
  `vehmodlm_seokywrd` text DEFAULT NULL,
  `vehmodlm_seohonetitle` varchar(250) DEFAULT NULL,
  `vehmodlm_seohonedesc` text DEFAULT NULL,
  `vehmodlm_seohtwotitle` varchar(250) DEFAULT NULL,
  `vehmodlm_seohtwodesc` text DEFAULT NULL,
  `vehmodlm_crtdon` datetime DEFAULT NULL COMMENT 'Date on which vehicle model is created',
  `vehmodlm_crtdby` varchar(250) DEFAULT NULL COMMENT 'By whom the vehicle model is created',
  `vehmodlm_mdfdon` datetime DEFAULT NULL COMMENT 'Date on which the vehicle model is modified',
  `vehmodlm_mdfdby` varchar(250) DEFAULT NULL COMMENT 'BY whom the vehicle model is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `veh_model_mst`
--

INSERT INTO `veh_model_mst` (`vehmodlm_id`, `vehmodlm_name`, `vehmodlm_desc`, `vehmodlm_vehtypm_id`, `vehmodlm_vehbrndm_id`, `vehmodlm_sts`, `vehmodlm_prty`, `vehmodlm_seotitle`, `vehmodlm_seodesc`, `vehmodlm_seokywrd`, `vehmodlm_seohonetitle`, `vehmodlm_seohonedesc`, `vehmodlm_seohtwotitle`, `vehmodlm_seohtwodesc`, `vehmodlm_crtdon`, `vehmodlm_crtdby`, `vehmodlm_mdfdon`, `vehmodlm_mdfdby`) VALUES
(1, 'Accent', '', 1, 3, 'a', 60, '', '', '', '', '', '', '', '2022-03-03 12:36:12', 'admin', NULL, NULL),
(2, 'Avalon', '', 1, 5, 'a', 50, '', '', '', '', '', '', '', '2022-03-03 12:36:30', 'admin', NULL, NULL),
(3, 'bZ4X', '', 1, 5, 'a', 10, '', '', '', '', '', '', '', '2022-03-03 12:37:12', 'admin', NULL, NULL),
(4, 'iQube', '', 2, 1, 'a', 70, '', '', '', '', '', '', '', '2022-03-03 12:41:30', 'admin', NULL, NULL),
(5, 'Apache RTR 200 Fi E100', '', 2, 1, 'a', 100, '', '', '', '', '', '', '', '2022-03-03 12:41:48', 'admin', NULL, NULL),
(6, 'Tata Nano GenX', '', 1, 4, 'a', 70, '', '', '', '', '', '', '', '2022-10-26 01:42:13', 'admin', NULL, NULL),
(7, 'Hyundai i20', '', 1, 3, 'a', 60, '', '', '', '', '', '', '', '2022-10-26 01:43:23', 'admin', NULL, NULL),
(8, 'TVS Apache RR310', '', 2, 1, 'a', 80, '', '', '', '', '', '', '', '2022-10-27 04:18:49', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `veh_type_mst`
--

CREATE TABLE `veh_type_mst` (
  `vehtypm_id` int(15) NOT NULL,
  `vehtypm_name` varchar(250) NOT NULL COMMENT 'Unique name for each type',
  `vehtypm_desc` text DEFAULT NULL,
  `vehtypm_seotitle` varchar(250) DEFAULT NULL,
  `vehtypm_seodesc` text DEFAULT NULL,
  `vehtypm_seokywrd` tinytext DEFAULT NULL,
  `vehtypm_seohonetitle` varchar(250) DEFAULT NULL,
  `vehtypm_seohonedesc` text DEFAULT NULL,
  `vehtypm_seohtwotitle` varchar(250) DEFAULT NULL,
  `vehtypm_seohtwodesc` text DEFAULT NULL,
  `vehtypm_sts` char(1) NOT NULL COMMENT 'Status of each type',
  `vehtypm_prty` int(15) NOT NULL COMMENT 'Priority of each type',
  `vehtypm_hmprty` int(15) NOT NULL,
  `vehtypm_crtdon` date DEFAULT NULL COMMENT 'Date on which the type is created',
  `vehtypm_crtdby` varchar(250) DEFAULT NULL COMMENT 'By whom the type is created',
  `vehtypm_mdfdon` date DEFAULT NULL COMMENT 'Date on which the type is modified',
  `vehtypm_mdfdby` varchar(250) DEFAULT NULL COMMENT 'By whom the type is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `veh_type_mst`
--

INSERT INTO `veh_type_mst` (`vehtypm_id`, `vehtypm_name`, `vehtypm_desc`, `vehtypm_seotitle`, `vehtypm_seodesc`, `vehtypm_seokywrd`, `vehtypm_seohonetitle`, `vehtypm_seohonedesc`, `vehtypm_seohtwotitle`, `vehtypm_seohtwodesc`, `vehtypm_sts`, `vehtypm_prty`, `vehtypm_hmprty`, `vehtypm_crtdon`, `vehtypm_crtdby`, `vehtypm_mdfdon`, `vehtypm_mdfdby`) VALUES
(1, 'Car', 'car', '', '', '', '', '', '', '', 'a', 1, 0, '2021-12-25', 'admin', NULL, NULL),
(2, 'Bike', 'bike', '', '', '', '', '', '', '', 'a', 2, 0, '2021-12-25', 'admin', '2021-12-30', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `veh_vrnt_mst`
--

CREATE TABLE `veh_vrnt_mst` (
  `vehvrntm_id` int(15) NOT NULL,
  `vehvrntm_name` varchar(250) NOT NULL COMMENT 'Name of the vehicle variant',
  `vehvrntm_desc` text DEFAULT NULL,
  `vehvrntm_vehtypm_id` int(15) NOT NULL,
  `vehvrntm_vehbrndm_id` int(15) NOT NULL,
  `vehvrntm_vehmdlm_id` int(15) NOT NULL,
  `vehvrntm_sts` char(1) DEFAULT NULL COMMENT 'Status of the vehicle variant',
  `vehvrntm_prty` int(15) DEFAULT NULL COMMENT 'Priority of the vehicle variant',
  `vehvrntm_seotitle` varchar(250) DEFAULT NULL,
  `vehvrntm_seodesc` text DEFAULT NULL,
  `vehvrntm_seokywrd` text DEFAULT NULL,
  `vehvrntm_seohonetitle` varchar(250) DEFAULT NULL,
  `vehvrntm_seohonedesc` text DEFAULT NULL,
  `vehvrntm_seohtwotitle` varchar(250) DEFAULT NULL,
  `vehvrntm_seohtwodesc` text DEFAULT NULL,
  `vehvrntm_crtdon` datetime DEFAULT NULL COMMENT 'Date on which vehicle variant is created',
  `vehvrntm_crtdby` varchar(250) DEFAULT NULL COMMENT 'By whom the vehicle variant is created',
  `vehvrntm_mdfdon` datetime DEFAULT NULL COMMENT 'Date on which the vehicle variant is modified',
  `vehvrntm_mdfdby` varchar(250) DEFAULT NULL COMMENT 'BY whom the vehicle variant is modified'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `veh_vrnt_mst`
--

INSERT INTO `veh_vrnt_mst` (`vehvrntm_id`, `vehvrntm_name`, `vehvrntm_desc`, `vehvrntm_vehtypm_id`, `vehvrntm_vehbrndm_id`, `vehvrntm_vehmdlm_id`, `vehvrntm_sts`, `vehvrntm_prty`, `vehvrntm_seotitle`, `vehvrntm_seodesc`, `vehvrntm_seokywrd`, `vehvrntm_seohonetitle`, `vehvrntm_seohonedesc`, `vehvrntm_seohtwotitle`, `vehvrntm_seohtwodesc`, `vehvrntm_crtdon`, `vehvrntm_crtdby`, `vehvrntm_mdfdon`, `vehvrntm_mdfdby`) VALUES
(1, 'G Smart Hybrid', '', 1, 5, 3, 'a', 60, '', '', '', '', '', '', '', '2022-03-03 12:44:26', 'admin', NULL, NULL),
(2, 'V CVT', '', 1, 5, 2, 'a', 50, '', '', '', '', '', '', '', '2022-03-03 12:51:35', 'admin', NULL, NULL),
(3, 'Apache', '', 2, 1, 5, 'a', 100, '', '', '', '', '', '', '', '2022-03-05 06:06:12', 'admin', '2023-04-13 06:57:23', 'admin'),
(4, 'iube', '', 2, 1, 4, 'a', 10, '', '', '', '', '', '', '', '2022-03-05 06:06:34', 'admin', NULL, NULL),
(5, 'Tata Nano GenX', '', 1, 4, 6, 'a', 50, '', '', '', '', '', '', '', '2022-10-27 04:15:31', 'admin', NULL, NULL),
(6, 'Hyundai i20', '', 1, 3, 7, 'a', 70, '', '', '', '', '', '', '', '2022-10-27 04:15:53', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_cntnt_cntry_cnty_cty_mst`
-- (See below for the actual view)
--
CREATE TABLE `vw_cntnt_cntry_cnty_cty_mst` (
`cntntm_id` int(15)
,`cntntm_name` varchar(250)
,`cntntm_iso` varchar(250)
,`cntntm_prty` int(15)
,`cntntm_sts` char(1)
,`cntntm_crtdon` datetime
,`cntntm_crtdby` varchar(250)
,`cntntm_mdfdon` datetime
,`cntntm_mdfdby` varchar(250)
,`cntrym_id` int(15)
,`cntrym_name` varchar(250)
,`cntrym_isothr` varchar(250)
,`cntrym_isotwo` varchar(250)
,`cntrym_cntntm_id` int(15)
,`cntrym_isonum` varchar(250)
,`cntrym_sts` char(1)
,`cntrym_prty` int(15)
,`cntrym_crtdon` date
,`cntrym_crtdby` varchar(250)
,`cntrym_mdfdon` date
,`cntrym_mdfdby` varchar(250)
,`cntym_id` int(15)
,`cntym_name` varchar(250)
,`cntym_cntrym_id` int(15)
,`cntym_iso` varchar(250)
,`cntym_sts` char(1)
,`cntym_prty` int(15)
,`cntym_crtdon` date
,`cntym_crtdby` varchar(250)
,`cntym_mdfdon` date
,`cntym_mdfdby` varchar(250)
,`ctym_id` int(15)
,`ctym_name` varchar(250)
,`ctym_cntym_id` int(15)
,`ctym_cntrym_id` int(15)
,`ctym_iso` varchar(250)
,`ctym_sts` char(1)
,`ctym_prty` int(15)
,`ctym_crtdon` datetime
,`ctym_crtdby` varchar(250)
,`ctym_mdfdon` datetime
,`ctym_mdfdby` varchar(250)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_cntry_cntnt_mst`
-- (See below for the actual view)
--
CREATE TABLE `vw_cntry_cntnt_mst` (
`cntrym_id` int(15)
,`cntrym_name` varchar(250)
,`cntrym_isothr` varchar(250)
,`cntrym_isotwo` varchar(250)
,`cntrym_cntntm_id` int(15)
,`cntrym_isonum` varchar(250)
,`cntrym_sts` char(1)
,`cntrym_prty` int(15)
,`cntrym_crtdon` date
,`cntrym_crtdby` varchar(250)
,`cntrym_mdfdon` date
,`cntrym_mdfdby` varchar(250)
,`cntntm_id` int(15)
,`cntntm_name` varchar(250)
,`cntntm_iso` varchar(250)
,`cntntm_prty` int(15)
,`cntntm_sts` char(1)
,`cntntm_crtdon` datetime
,`cntntm_crtdby` varchar(250)
,`cntntm_mdfdon` datetime
,`cntntm_mdfdby` varchar(250)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_cntry_cnty_cty_mst`
-- (See below for the actual view)
--
CREATE TABLE `vw_cntry_cnty_cty_mst` (
`ctym_id` int(15)
,`ctym_name` varchar(250)
,`ctym_cntym_id` int(15)
,`ctym_cntrym_id` int(15)
,`ctym_iso` varchar(250)
,`ctym_sts` char(1)
,`ctym_prty` int(15)
,`ctym_crtdon` datetime
,`ctym_crtdby` varchar(250)
,`ctym_mdfdon` datetime
,`ctym_mdfdby` varchar(250)
,`cntym_id` int(15)
,`cntym_name` varchar(250)
,`cntym_cntrym_id` int(15)
,`cntym_iso` varchar(250)
,`cntym_sts` char(1)
,`cntym_prty` int(15)
,`cntym_crtdon` date
,`cntym_crtdby` varchar(250)
,`cntym_mdfdon` date
,`cntym_mdfdby` varchar(250)
,`cntrym_id` int(15)
,`cntrym_name` varchar(250)
,`cntrym_isothr` varchar(250)
,`cntrym_isotwo` varchar(250)
,`cntrym_cntntm_id` int(15)
,`cntrym_isonum` varchar(250)
,`cntrym_sts` char(1)
,`cntrym_prty` int(15)
,`cntrym_crtdon` date
,`cntrym_crtdby` varchar(250)
,`cntrym_mdfdon` date
,`cntrym_mdfdby` varchar(250)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_cntry_cnty_mst`
-- (See below for the actual view)
--
CREATE TABLE `vw_cntry_cnty_mst` (
`cntym_id` int(15)
,`cntym_name` varchar(250)
,`cntym_cntrym_id` int(15)
,`cntym_iso` varchar(250)
,`cntym_sts` char(1)
,`cntym_prty` int(15)
,`cntym_crtdon` date
,`cntym_crtdby` varchar(250)
,`cntym_mdfdon` date
,`cntym_mdfdby` varchar(250)
,`cntrym_id` int(15)
,`cntrym_name` varchar(250)
,`cntrym_isothr` varchar(250)
,`cntrym_isotwo` varchar(250)
,`cntrym_cntntm_id` int(15)
,`cntrym_isonum` varchar(250)
,`cntrym_sts` char(1)
,`cntrym_prty` int(15)
,`cntrym_crtdon` date
,`cntrym_crtdby` varchar(250)
,`cntrym_mdfdon` date
,`cntrym_mdfdby` varchar(250)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_cntry_mst`
-- (See below for the actual view)
--
CREATE TABLE `vw_cntry_mst` (
`cntrym_id` int(15)
,`cntrym_name` varchar(250)
,`cntrym_isothr` varchar(250)
,`cntrym_isotwo` varchar(250)
,`cntrym_cntntm_id` int(15)
,`cntrym_isonum` varchar(250)
,`cntrym_sts` char(1)
,`cntrym_prty` int(15)
,`cntrym_crtdon` date
,`cntrym_crtdby` varchar(250)
,`cntrym_mdfdon` date
,`cntrym_mdfdby` varchar(250)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_cnty_mst`
-- (See below for the actual view)
--
CREATE TABLE `vw_cnty_mst` (
`cntym_id` int(15)
,`cntym_name` varchar(250)
,`cntym_cntrym_id` int(15)
,`cntym_iso` varchar(250)
,`cntym_sts` char(1)
,`cntym_prty` int(15)
,`cntym_crtdon` date
,`cntym_crtdby` varchar(250)
,`cntym_mdfdon` date
,`cntym_mdfdby` varchar(250)
,`cntrym_id` int(15)
,`cntrym_name` varchar(250)
,`cntrym_isothr` varchar(250)
,`cntrym_isotwo` varchar(250)
,`cntrym_cntntm_id` int(15)
,`cntrym_isonum` varchar(250)
,`cntrym_sts` char(1)
,`cntrym_prty` int(15)
,`cntrym_crtdon` date
,`cntrym_crtdby` varchar(250)
,`cntrym_mdfdon` date
,`cntrym_mdfdby` varchar(250)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_mbr_mst_bil`
-- (See below for the actual view)
--
CREATE TABLE `vw_mbr_mst_bil` (
`mbrm_id` int(15)
,`mbrm_name` varchar(250)
,`mbrm_usernm` varchar(250)
,`mbrm_emailid` varchar(250)
,`mbrm_pwd` varchar(250)
,`mbrm_nwsltr` char(1)
,`mbrm_vchr` char(1)
,`mbrm_phno` varchar(250)
,`mbrm_ipadrs` varchar(250)
,`mbrm_sts` char(1)
,`mbrm_crtdon` datetime
,`mbrm_crtdby` varchar(250)
,`mbrm_mdfdon` datetime
,`mbrm_mdfdby` varchar(250)
,`mbrd_id` int(15)
,`mbrd_emailid` varchar(250)
,`mbrd_nckname` varchar(250)
,`mbrd_fstname` varchar(250)
,`mbrd_lstname` varchar(250)
,`mbrd_badrs` varchar(250)
,`mbrd_badrs2` varchar(250)
,`mbrd_bmbrcntrym_id` int(15)
,`mbrd_bctym_id` int(15)
,`mbrd_bmbrcntym_id` int(15)
,`mbrd_bmbrctym_name` varchar(250)
,`mbrd_bmbrcntym_name` varchar(250)
,`mbrd_bzip` varchar(250)
,`mbrd_bdayphone` varchar(250)
,`mbrd_dfltbil` char(1)
,`mbrd_dfltshp` char(1)
,`mbrd_sfstname` varchar(250)
,`mbrd_slstname` varchar(250)
,`mbrd_sadrs` varchar(250)
,`mbrd_sadrs2` varchar(250)
,`mbrd_smbrcntrym_id` int(15)
,`mbrd_scty_name` varchar(250)
,`mbrd_smbrcntym_id` varchar(250)
,`mbrd_szip` varchar(250)
,`mbrd_sdayphone` varchar(250)
,`mbrd_shpchrgm_id` int(15)
,`mbrd_mbrm_id` int(15)
,`mbrd_sts` char(1)
,`mbrd_crtdon` date
,`mbrd_crtdby` varchar(250)
,`mbrd_mdfdon` date
,`mbrd_mdfdby` varchar(250)
,`cntrym_id` int(15)
,`cntrym_name` varchar(250)
,`cntrym_isothr` varchar(250)
,`cntrym_isotwo` varchar(250)
,`cntrym_cntntm_id` int(15)
,`cntrym_isonum` varchar(250)
,`cntrym_sts` char(1)
,`cntrym_prty` int(15)
,`cntrym_crtdon` date
,`cntrym_crtdby` varchar(250)
,`cntrym_mdfdon` date
,`cntrym_mdfdby` varchar(250)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_mbr_mst_dtl_bil`
-- (See below for the actual view)
--
CREATE TABLE `vw_mbr_mst_dtl_bil` (
`mbrm_id` int(15)
,`mbrm_name` varchar(250)
,`mbrm_emailid` varchar(250)
,`mbrm_pwd` varchar(250)
,`mbrm_usernm` varchar(250)
,`mbrm_phno` varchar(250)
,`mbrm_area` varchar(250)
,`mbrm_nwsltr` char(1)
,`mbrm_vchr` char(1)
,`mbrm_ipadrs` varchar(250)
,`mbrm_sts` char(1)
,`mbrm_crtdon` datetime
,`mbrm_crtdby` varchar(250)
,`mbrm_mdfdon` datetime
,`mbrm_mdfdby` varchar(250)
,`mbrd_id` int(15)
,`mbrd_emailid` varchar(250)
,`mbrd_nckname` varchar(250)
,`mbrd_fstname` varchar(250)
,`mbrd_lstname` varchar(250)
,`mbrd_badrs` varchar(250)
,`mbrd_badrs2` varchar(250)
,`mbrd_gst` varchar(250)
,`mbrd_ctynm` varchar(250)
,`mbrd_cmpny` varchar(250)
,`mbrd_bmbrcntrym_id` int(15)
,`mbrd_bctym_id` int(15)
,`mbrd_bmbrcntym_id` int(15)
,`mbrd_bmbrctym_name` varchar(250)
,`mbrd_bmbrcntym_name` varchar(250)
,`mbrd_bzip` varchar(250)
,`mbrd_bdayphone` varchar(250)
,`mbrd_dfltbil` char(1)
,`mbrd_dfltshp` char(1)
,`mbrd_sfstname` varchar(250)
,`mbrd_slstname` varchar(250)
,`mbrd_sadrs` varchar(250)
,`mbrd_sadrs2` varchar(250)
,`mbrd_smbrcntrym_id` int(15)
,`mbrd_scty_name` varchar(250)
,`mbrd_smbrcntym_id` varchar(250)
,`mbrd_szip` varchar(250)
,`mbrd_sdayphone` varchar(250)
,`mbrd_shpchrgm_id` int(15)
,`mbrd_mbrm_id` int(15)
,`mbrd_sts` char(1)
,`mbrd_crtdon` date
,`mbrd_crtdby` varchar(250)
,`mbrd_mdfdon` date
,`mbrd_mdfdby` varchar(250)
,`ctym_id` int(15)
,`ctym_name` varchar(250)
,`ctym_cntym_id` int(15)
,`ctym_cntrym_id` int(15)
,`ctym_iso` varchar(250)
,`ctym_sts` char(1)
,`ctym_prty` int(15)
,`ctym_crtdon` datetime
,`ctym_crtdby` varchar(250)
,`ctym_mdfdon` datetime
,`ctym_mdfdby` varchar(250)
,`cntym_id` int(15)
,`cntym_name` varchar(250)
,`cntym_cntrym_id` int(15)
,`cntym_iso` varchar(250)
,`cntym_sts` char(1)
,`cntym_prty` int(15)
,`cntym_crtdon` date
,`cntym_crtdby` varchar(250)
,`cntym_mdfdon` date
,`cntym_mdfdby` varchar(250)
,`cntrym_id` int(15)
,`cntrym_name` varchar(250)
,`cntrym_isothr` varchar(250)
,`cntrym_isotwo` varchar(250)
,`cntrym_cntntm_id` int(15)
,`cntrym_isonum` varchar(250)
,`cntrym_sts` char(1)
,`cntrym_prty` int(15)
,`cntrym_crtdon` date
,`cntrym_crtdby` varchar(250)
,`cntrym_mdfdon` date
,`cntrym_mdfdby` varchar(250)
,`cntntm_id` int(15)
,`cntntm_name` varchar(250)
,`cntntm_iso` varchar(250)
,`cntntm_prty` int(15)
,`cntntm_sts` char(1)
,`cntntm_crtdon` datetime
,`cntntm_crtdby` varchar(250)
,`cntntm_mdfdon` datetime
,`cntntm_mdfdby` varchar(250)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_cntnt_cntry_cnty_cty_mst`
--
DROP TABLE IF EXISTS `vw_cntnt_cntry_cnty_cty_mst`;

CREATE  VIEW `vw_cntnt_cntry_cnty_cty_mst`  AS   (select `cntnt_mst`.`cntntm_id` AS `cntntm_id`,`cntnt_mst`.`cntntm_name` AS `cntntm_name`,`cntnt_mst`.`cntntm_iso` AS `cntntm_iso`,`cntnt_mst`.`cntntm_prty` AS `cntntm_prty`,`cntnt_mst`.`cntntm_sts` AS `cntntm_sts`,`cntnt_mst`.`cntntm_crtdon` AS `cntntm_crtdon`,`cntnt_mst`.`cntntm_crtdby` AS `cntntm_crtdby`,`cntnt_mst`.`cntntm_mdfdon` AS `cntntm_mdfdon`,`cntnt_mst`.`cntntm_mdfdby` AS `cntntm_mdfdby`,`cntry_mst`.`cntrym_id` AS `cntrym_id`,`cntry_mst`.`cntrym_name` AS `cntrym_name`,`cntry_mst`.`cntrym_isothr` AS `cntrym_isothr`,`cntry_mst`.`cntrym_isotwo` AS `cntrym_isotwo`,`cntry_mst`.`cntrym_cntntm_id` AS `cntrym_cntntm_id`,`cntry_mst`.`cntrym_isonum` AS `cntrym_isonum`,`cntry_mst`.`cntrym_sts` AS `cntrym_sts`,`cntry_mst`.`cntrym_prty` AS `cntrym_prty`,`cntry_mst`.`cntrym_crtdon` AS `cntrym_crtdon`,`cntry_mst`.`cntrym_crtdby` AS `cntrym_crtdby`,`cntry_mst`.`cntrym_mdfdon` AS `cntrym_mdfdon`,`cntry_mst`.`cntrym_mdfdby` AS `cntrym_mdfdby`,`cnty_mst`.`cntym_id` AS `cntym_id`,`cnty_mst`.`cntym_name` AS `cntym_name`,`cnty_mst`.`cntym_cntrym_id` AS `cntym_cntrym_id`,`cnty_mst`.`cntym_iso` AS `cntym_iso`,`cnty_mst`.`cntym_sts` AS `cntym_sts`,`cnty_mst`.`cntym_prty` AS `cntym_prty`,`cnty_mst`.`cntym_crtdon` AS `cntym_crtdon`,`cnty_mst`.`cntym_crtdby` AS `cntym_crtdby`,`cnty_mst`.`cntym_mdfdon` AS `cntym_mdfdon`,`cnty_mst`.`cntym_mdfdby` AS `cntym_mdfdby`,`cty_mst`.`ctym_id` AS `ctym_id`,`cty_mst`.`ctym_name` AS `ctym_name`,`cty_mst`.`ctym_cntym_id` AS `ctym_cntym_id`,`cty_mst`.`ctym_cntrym_id` AS `ctym_cntrym_id`,`cty_mst`.`ctym_iso` AS `ctym_iso`,`cty_mst`.`ctym_sts` AS `ctym_sts`,`cty_mst`.`ctym_prty` AS `ctym_prty`,`cty_mst`.`ctym_crtdon` AS `ctym_crtdon`,`cty_mst`.`ctym_crtdby` AS `ctym_crtdby`,`cty_mst`.`ctym_mdfdon` AS `ctym_mdfdon`,`cty_mst`.`ctym_mdfdby` AS `ctym_mdfdby` from (((`cntnt_mst` join `cntry_mst` on(`cntry_mst`.`cntrym_cntntm_id` = `cntnt_mst`.`cntntm_id`)) left join `cnty_mst` on(`cnty_mst`.`cntym_cntrym_id` = `cntry_mst`.`cntrym_id`)) left join `cty_mst` on(`cty_mst`.`ctym_cntym_id` = `cnty_mst`.`cntym_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `vw_cntry_cntnt_mst`
--
DROP TABLE IF EXISTS `vw_cntry_cntnt_mst`;

CREATE  VIEW `vw_cntry_cntnt_mst`  AS   (select `cntry_mst`.`cntrym_id` AS `cntrym_id`,`cntry_mst`.`cntrym_name` AS `cntrym_name`,`cntry_mst`.`cntrym_isothr` AS `cntrym_isothr`,`cntry_mst`.`cntrym_isotwo` AS `cntrym_isotwo`,`cntry_mst`.`cntrym_cntntm_id` AS `cntrym_cntntm_id`,`cntry_mst`.`cntrym_isonum` AS `cntrym_isonum`,`cntry_mst`.`cntrym_sts` AS `cntrym_sts`,`cntry_mst`.`cntrym_prty` AS `cntrym_prty`,`cntry_mst`.`cntrym_crtdon` AS `cntrym_crtdon`,`cntry_mst`.`cntrym_crtdby` AS `cntrym_crtdby`,`cntry_mst`.`cntrym_mdfdon` AS `cntrym_mdfdon`,`cntry_mst`.`cntrym_mdfdby` AS `cntrym_mdfdby`,`cntnt_mst`.`cntntm_id` AS `cntntm_id`,`cntnt_mst`.`cntntm_name` AS `cntntm_name`,`cntnt_mst`.`cntntm_iso` AS `cntntm_iso`,`cntnt_mst`.`cntntm_prty` AS `cntntm_prty`,`cntnt_mst`.`cntntm_sts` AS `cntntm_sts`,`cntnt_mst`.`cntntm_crtdon` AS `cntntm_crtdon`,`cntnt_mst`.`cntntm_crtdby` AS `cntntm_crtdby`,`cntnt_mst`.`cntntm_mdfdon` AS `cntntm_mdfdon`,`cntnt_mst`.`cntntm_mdfdby` AS `cntntm_mdfdby` from (`cntry_mst` join `cntnt_mst` on(`cntry_mst`.`cntrym_cntntm_id` = `cntnt_mst`.`cntntm_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `vw_cntry_cnty_cty_mst`
--
DROP TABLE IF EXISTS `vw_cntry_cnty_cty_mst`;

CREATE  VIEW `vw_cntry_cnty_cty_mst`  AS   (select `cty_mst`.`ctym_id` AS `ctym_id`,`cty_mst`.`ctym_name` AS `ctym_name`,`cty_mst`.`ctym_cntym_id` AS `ctym_cntym_id`,`cty_mst`.`ctym_cntrym_id` AS `ctym_cntrym_id`,`cty_mst`.`ctym_iso` AS `ctym_iso`,`cty_mst`.`ctym_sts` AS `ctym_sts`,`cty_mst`.`ctym_prty` AS `ctym_prty`,`cty_mst`.`ctym_crtdon` AS `ctym_crtdon`,`cty_mst`.`ctym_crtdby` AS `ctym_crtdby`,`cty_mst`.`ctym_mdfdon` AS `ctym_mdfdon`,`cty_mst`.`ctym_mdfdby` AS `ctym_mdfdby`,`cnty_mst`.`cntym_id` AS `cntym_id`,`cnty_mst`.`cntym_name` AS `cntym_name`,`cnty_mst`.`cntym_cntrym_id` AS `cntym_cntrym_id`,`cnty_mst`.`cntym_iso` AS `cntym_iso`,`cnty_mst`.`cntym_sts` AS `cntym_sts`,`cnty_mst`.`cntym_prty` AS `cntym_prty`,`cnty_mst`.`cntym_crtdon` AS `cntym_crtdon`,`cnty_mst`.`cntym_crtdby` AS `cntym_crtdby`,`cnty_mst`.`cntym_mdfdon` AS `cntym_mdfdon`,`cnty_mst`.`cntym_mdfdby` AS `cntym_mdfdby`,`cntry_mst`.`cntrym_id` AS `cntrym_id`,`cntry_mst`.`cntrym_name` AS `cntrym_name`,`cntry_mst`.`cntrym_isothr` AS `cntrym_isothr`,`cntry_mst`.`cntrym_isotwo` AS `cntrym_isotwo`,`cntry_mst`.`cntrym_cntntm_id` AS `cntrym_cntntm_id`,`cntry_mst`.`cntrym_isonum` AS `cntrym_isonum`,`cntry_mst`.`cntrym_sts` AS `cntrym_sts`,`cntry_mst`.`cntrym_prty` AS `cntrym_prty`,`cntry_mst`.`cntrym_crtdon` AS `cntrym_crtdon`,`cntry_mst`.`cntrym_crtdby` AS `cntrym_crtdby`,`cntry_mst`.`cntrym_mdfdon` AS `cntrym_mdfdon`,`cntry_mst`.`cntrym_mdfdby` AS `cntrym_mdfdby` from (`cty_mst` join (`cnty_mst` join `cntry_mst` on(`cnty_mst`.`cntym_cntrym_id` = `cntry_mst`.`cntrym_id`)) on(`cty_mst`.`ctym_cntym_id` = `cnty_mst`.`cntym_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `vw_cntry_cnty_mst`
--
DROP TABLE IF EXISTS `vw_cntry_cnty_mst`;

CREATE  VIEW `vw_cntry_cnty_mst`  AS   (select `cnty_mst`.`cntym_id` AS `cntym_id`,`cnty_mst`.`cntym_name` AS `cntym_name`,`cnty_mst`.`cntym_cntrym_id` AS `cntym_cntrym_id`,`cnty_mst`.`cntym_iso` AS `cntym_iso`,`cnty_mst`.`cntym_sts` AS `cntym_sts`,`cnty_mst`.`cntym_prty` AS `cntym_prty`,`cnty_mst`.`cntym_crtdon` AS `cntym_crtdon`,`cnty_mst`.`cntym_crtdby` AS `cntym_crtdby`,`cnty_mst`.`cntym_mdfdon` AS `cntym_mdfdon`,`cnty_mst`.`cntym_mdfdby` AS `cntym_mdfdby`,`cntry_mst`.`cntrym_id` AS `cntrym_id`,`cntry_mst`.`cntrym_name` AS `cntrym_name`,`cntry_mst`.`cntrym_isothr` AS `cntrym_isothr`,`cntry_mst`.`cntrym_isotwo` AS `cntrym_isotwo`,`cntry_mst`.`cntrym_cntntm_id` AS `cntrym_cntntm_id`,`cntry_mst`.`cntrym_isonum` AS `cntrym_isonum`,`cntry_mst`.`cntrym_sts` AS `cntrym_sts`,`cntry_mst`.`cntrym_prty` AS `cntrym_prty`,`cntry_mst`.`cntrym_crtdon` AS `cntrym_crtdon`,`cntry_mst`.`cntrym_crtdby` AS `cntrym_crtdby`,`cntry_mst`.`cntrym_mdfdon` AS `cntrym_mdfdon`,`cntry_mst`.`cntrym_mdfdby` AS `cntrym_mdfdby` from (`cnty_mst` join `cntry_mst` on(`cnty_mst`.`cntym_cntrym_id` = `cntry_mst`.`cntrym_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `vw_cntry_mst`
--
DROP TABLE IF EXISTS `vw_cntry_mst`;

CREATE  VIEW `vw_cntry_mst`  AS   (select `cntry_mst`.`cntrym_id` AS `cntrym_id`,`cntry_mst`.`cntrym_name` AS `cntrym_name`,`cntry_mst`.`cntrym_isothr` AS `cntrym_isothr`,`cntry_mst`.`cntrym_isotwo` AS `cntrym_isotwo`,`cntry_mst`.`cntrym_cntntm_id` AS `cntrym_cntntm_id`,`cntry_mst`.`cntrym_isonum` AS `cntrym_isonum`,`cntry_mst`.`cntrym_sts` AS `cntrym_sts`,`cntry_mst`.`cntrym_prty` AS `cntrym_prty`,`cntry_mst`.`cntrym_crtdon` AS `cntrym_crtdon`,`cntry_mst`.`cntrym_crtdby` AS `cntrym_crtdby`,`cntry_mst`.`cntrym_mdfdon` AS `cntrym_mdfdon`,`cntry_mst`.`cntrym_mdfdby` AS `cntrym_mdfdby` from `cntry_mst`)  ;

-- --------------------------------------------------------

--
-- Structure for view `vw_cnty_mst`
--
DROP TABLE IF EXISTS `vw_cnty_mst`;

CREATE  VIEW `vw_cnty_mst`  AS   (select `cnty_mst`.`cntym_id` AS `cntym_id`,`cnty_mst`.`cntym_name` AS `cntym_name`,`cnty_mst`.`cntym_cntrym_id` AS `cntym_cntrym_id`,`cnty_mst`.`cntym_iso` AS `cntym_iso`,`cnty_mst`.`cntym_sts` AS `cntym_sts`,`cnty_mst`.`cntym_prty` AS `cntym_prty`,`cnty_mst`.`cntym_crtdon` AS `cntym_crtdon`,`cnty_mst`.`cntym_crtdby` AS `cntym_crtdby`,`cnty_mst`.`cntym_mdfdon` AS `cntym_mdfdon`,`cnty_mst`.`cntym_mdfdby` AS `cntym_mdfdby`,`cntry_mst`.`cntrym_id` AS `cntrym_id`,`cntry_mst`.`cntrym_name` AS `cntrym_name`,`cntry_mst`.`cntrym_isothr` AS `cntrym_isothr`,`cntry_mst`.`cntrym_isotwo` AS `cntrym_isotwo`,`cntry_mst`.`cntrym_cntntm_id` AS `cntrym_cntntm_id`,`cntry_mst`.`cntrym_isonum` AS `cntrym_isonum`,`cntry_mst`.`cntrym_sts` AS `cntrym_sts`,`cntry_mst`.`cntrym_prty` AS `cntrym_prty`,`cntry_mst`.`cntrym_crtdon` AS `cntrym_crtdon`,`cntry_mst`.`cntrym_crtdby` AS `cntrym_crtdby`,`cntry_mst`.`cntrym_mdfdon` AS `cntrym_mdfdon`,`cntry_mst`.`cntrym_mdfdby` AS `cntrym_mdfdby` from (`cnty_mst` join `cntry_mst` on(`cnty_mst`.`cntym_cntrym_id` = `cntry_mst`.`cntrym_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `vw_mbr_mst_bil`
--
DROP TABLE IF EXISTS `vw_mbr_mst_bil`;

CREATE  VIEW `vw_mbr_mst_bil`  AS   (select `mbr_mst`.`mbrm_id` AS `mbrm_id`,`mbr_mst`.`mbrm_name` AS `mbrm_name`,`mbr_mst`.`mbrm_usernm` AS `mbrm_usernm`,`mbr_mst`.`mbrm_emailid` AS `mbrm_emailid`,`mbr_mst`.`mbrm_pwd` AS `mbrm_pwd`,`mbr_mst`.`mbrm_nwsltr` AS `mbrm_nwsltr`,`mbr_mst`.`mbrm_vchr` AS `mbrm_vchr`,`mbr_mst`.`mbrm_phno` AS `mbrm_phno`,`mbr_mst`.`mbrm_ipadrs` AS `mbrm_ipadrs`,`mbr_mst`.`mbrm_sts` AS `mbrm_sts`,`mbr_mst`.`mbrm_crtdon` AS `mbrm_crtdon`,`mbr_mst`.`mbrm_crtdby` AS `mbrm_crtdby`,`mbr_mst`.`mbrm_mdfdon` AS `mbrm_mdfdon`,`mbr_mst`.`mbrm_mdfdby` AS `mbrm_mdfdby`,`mbr_dtl`.`mbrd_id` AS `mbrd_id`,`mbr_dtl`.`mbrd_emailid` AS `mbrd_emailid`,`mbr_dtl`.`mbrd_nckname` AS `mbrd_nckname`,`mbr_dtl`.`mbrd_fstname` AS `mbrd_fstname`,`mbr_dtl`.`mbrd_lstname` AS `mbrd_lstname`,`mbr_dtl`.`mbrd_badrs` AS `mbrd_badrs`,`mbr_dtl`.`mbrd_badrs2` AS `mbrd_badrs2`,`mbr_dtl`.`mbrd_bmbrcntrym_id` AS `mbrd_bmbrcntrym_id`,`mbr_dtl`.`mbrd_bctym_id` AS `mbrd_bctym_id`,`mbr_dtl`.`mbrd_bmbrcntym_id` AS `mbrd_bmbrcntym_id`,`mbr_dtl`.`mbrd_bmbrctym_name` AS `mbrd_bmbrctym_name`,`mbr_dtl`.`mbrd_bmbrcntym_name` AS `mbrd_bmbrcntym_name`,`mbr_dtl`.`mbrd_bzip` AS `mbrd_bzip`,`mbr_dtl`.`mbrd_bdayphone` AS `mbrd_bdayphone`,`mbr_dtl`.`mbrd_dfltbil` AS `mbrd_dfltbil`,`mbr_dtl`.`mbrd_dfltshp` AS `mbrd_dfltshp`,`mbr_dtl`.`mbrd_sfstname` AS `mbrd_sfstname`,`mbr_dtl`.`mbrd_slstname` AS `mbrd_slstname`,`mbr_dtl`.`mbrd_sadrs` AS `mbrd_sadrs`,`mbr_dtl`.`mbrd_sadrs2` AS `mbrd_sadrs2`,`mbr_dtl`.`mbrd_smbrcntrym_id` AS `mbrd_smbrcntrym_id`,`mbr_dtl`.`mbrd_scty_name` AS `mbrd_scty_name`,`mbr_dtl`.`mbrd_smbrcntym_id` AS `mbrd_smbrcntym_id`,`mbr_dtl`.`mbrd_szip` AS `mbrd_szip`,`mbr_dtl`.`mbrd_sdayphone` AS `mbrd_sdayphone`,`mbr_dtl`.`mbrd_shpchrgm_id` AS `mbrd_shpchrgm_id`,`mbr_dtl`.`mbrd_mbrm_id` AS `mbrd_mbrm_id`,`mbr_dtl`.`mbrd_sts` AS `mbrd_sts`,`mbr_dtl`.`mbrd_crtdon` AS `mbrd_crtdon`,`mbr_dtl`.`mbrd_crtdby` AS `mbrd_crtdby`,`mbr_dtl`.`mbrd_mdfdon` AS `mbrd_mdfdon`,`mbr_dtl`.`mbrd_mdfdby` AS `mbrd_mdfdby`,`cntry_mst`.`cntrym_id` AS `cntrym_id`,`cntry_mst`.`cntrym_name` AS `cntrym_name`,`cntry_mst`.`cntrym_isothr` AS `cntrym_isothr`,`cntry_mst`.`cntrym_isotwo` AS `cntrym_isotwo`,`cntry_mst`.`cntrym_cntntm_id` AS `cntrym_cntntm_id`,`cntry_mst`.`cntrym_isonum` AS `cntrym_isonum`,`cntry_mst`.`cntrym_sts` AS `cntrym_sts`,`cntry_mst`.`cntrym_prty` AS `cntrym_prty`,`cntry_mst`.`cntrym_crtdon` AS `cntrym_crtdon`,`cntry_mst`.`cntrym_crtdby` AS `cntrym_crtdby`,`cntry_mst`.`cntrym_mdfdon` AS `cntrym_mdfdon`,`cntry_mst`.`cntrym_mdfdby` AS `cntrym_mdfdby` from (`mbr_mst` left join (`mbr_dtl` left join `cntry_mst` on(`mbr_dtl`.`mbrd_bmbrcntrym_id` = `cntry_mst`.`cntrym_id`)) on(`mbr_dtl`.`mbrd_mbrm_id` = `mbr_mst`.`mbrm_id`)) where `mbr_mst`.`mbrm_sts` = 'a')  ;

-- --------------------------------------------------------

--
-- Structure for view `vw_mbr_mst_dtl_bil`
--
DROP TABLE IF EXISTS `vw_mbr_mst_dtl_bil`;

CREATE  VIEW `vw_mbr_mst_dtl_bil`  AS   (select `mbr_mst`.`mbrm_id` AS `mbrm_id`,`mbr_mst`.`mbrm_name` AS `mbrm_name`,`mbr_mst`.`mbrm_emailid` AS `mbrm_emailid`,`mbr_mst`.`mbrm_pwd` AS `mbrm_pwd`,`mbr_mst`.`mbrm_usernm` AS `mbrm_usernm`,`mbr_mst`.`mbrm_phno` AS `mbrm_phno`,`mbr_mst`.`mbrm_area` AS `mbrm_area`,`mbr_mst`.`mbrm_nwsltr` AS `mbrm_nwsltr`,`mbr_mst`.`mbrm_vchr` AS `mbrm_vchr`,`mbr_mst`.`mbrm_ipadrs` AS `mbrm_ipadrs`,`mbr_mst`.`mbrm_sts` AS `mbrm_sts`,`mbr_mst`.`mbrm_crtdon` AS `mbrm_crtdon`,`mbr_mst`.`mbrm_crtdby` AS `mbrm_crtdby`,`mbr_mst`.`mbrm_mdfdon` AS `mbrm_mdfdon`,`mbr_mst`.`mbrm_mdfdby` AS `mbrm_mdfdby`,`mbr_dtl`.`mbrd_id` AS `mbrd_id`,`mbr_dtl`.`mbrd_emailid` AS `mbrd_emailid`,`mbr_dtl`.`mbrd_nckname` AS `mbrd_nckname`,`mbr_dtl`.`mbrd_fstname` AS `mbrd_fstname`,`mbr_dtl`.`mbrd_lstname` AS `mbrd_lstname`,`mbr_dtl`.`mbrd_badrs` AS `mbrd_badrs`,`mbr_dtl`.`mbrd_badrs2` AS `mbrd_badrs2`,`mbr_dtl`.`mbrd_gst` AS `mbrd_gst`,`mbr_dtl`.`mbrd_ctynm` AS `mbrd_ctynm`,`mbr_dtl`.`mbrd_cmpny` AS `mbrd_cmpny`,`mbr_dtl`.`mbrd_bmbrcntrym_id` AS `mbrd_bmbrcntrym_id`,`mbr_dtl`.`mbrd_bctym_id` AS `mbrd_bctym_id`,`mbr_dtl`.`mbrd_bmbrcntym_id` AS `mbrd_bmbrcntym_id`,`mbr_dtl`.`mbrd_bmbrctym_name` AS `mbrd_bmbrctym_name`,`mbr_dtl`.`mbrd_bmbrcntym_name` AS `mbrd_bmbrcntym_name`,`mbr_dtl`.`mbrd_bzip` AS `mbrd_bzip`,`mbr_dtl`.`mbrd_bdayphone` AS `mbrd_bdayphone`,`mbr_dtl`.`mbrd_dfltbil` AS `mbrd_dfltbil`,`mbr_dtl`.`mbrd_dfltshp` AS `mbrd_dfltshp`,`mbr_dtl`.`mbrd_sfstname` AS `mbrd_sfstname`,`mbr_dtl`.`mbrd_slstname` AS `mbrd_slstname`,`mbr_dtl`.`mbrd_sadrs` AS `mbrd_sadrs`,`mbr_dtl`.`mbrd_sadrs2` AS `mbrd_sadrs2`,`mbr_dtl`.`mbrd_smbrcntrym_id` AS `mbrd_smbrcntrym_id`,`mbr_dtl`.`mbrd_scty_name` AS `mbrd_scty_name`,`mbr_dtl`.`mbrd_smbrcntym_id` AS `mbrd_smbrcntym_id`,`mbr_dtl`.`mbrd_szip` AS `mbrd_szip`,`mbr_dtl`.`mbrd_sdayphone` AS `mbrd_sdayphone`,`mbr_dtl`.`mbrd_shpchrgm_id` AS `mbrd_shpchrgm_id`,`mbr_dtl`.`mbrd_mbrm_id` AS `mbrd_mbrm_id`,`mbr_dtl`.`mbrd_sts` AS `mbrd_sts`,`mbr_dtl`.`mbrd_crtdon` AS `mbrd_crtdon`,`mbr_dtl`.`mbrd_crtdby` AS `mbrd_crtdby`,`mbr_dtl`.`mbrd_mdfdon` AS `mbrd_mdfdon`,`mbr_dtl`.`mbrd_mdfdby` AS `mbrd_mdfdby`,`cty_mst`.`ctym_id` AS `ctym_id`,`cty_mst`.`ctym_name` AS `ctym_name`,`cty_mst`.`ctym_cntym_id` AS `ctym_cntym_id`,`cty_mst`.`ctym_cntrym_id` AS `ctym_cntrym_id`,`cty_mst`.`ctym_iso` AS `ctym_iso`,`cty_mst`.`ctym_sts` AS `ctym_sts`,`cty_mst`.`ctym_prty` AS `ctym_prty`,`cty_mst`.`ctym_crtdon` AS `ctym_crtdon`,`cty_mst`.`ctym_crtdby` AS `ctym_crtdby`,`cty_mst`.`ctym_mdfdon` AS `ctym_mdfdon`,`cty_mst`.`ctym_mdfdby` AS `ctym_mdfdby`,`cnty_mst`.`cntym_id` AS `cntym_id`,`cnty_mst`.`cntym_name` AS `cntym_name`,`cnty_mst`.`cntym_cntrym_id` AS `cntym_cntrym_id`,`cnty_mst`.`cntym_iso` AS `cntym_iso`,`cnty_mst`.`cntym_sts` AS `cntym_sts`,`cnty_mst`.`cntym_prty` AS `cntym_prty`,`cnty_mst`.`cntym_crtdon` AS `cntym_crtdon`,`cnty_mst`.`cntym_crtdby` AS `cntym_crtdby`,`cnty_mst`.`cntym_mdfdon` AS `cntym_mdfdon`,`cnty_mst`.`cntym_mdfdby` AS `cntym_mdfdby`,`cntry_mst`.`cntrym_id` AS `cntrym_id`,`cntry_mst`.`cntrym_name` AS `cntrym_name`,`cntry_mst`.`cntrym_isothr` AS `cntrym_isothr`,`cntry_mst`.`cntrym_isotwo` AS `cntrym_isotwo`,`cntry_mst`.`cntrym_cntntm_id` AS `cntrym_cntntm_id`,`cntry_mst`.`cntrym_isonum` AS `cntrym_isonum`,`cntry_mst`.`cntrym_sts` AS `cntrym_sts`,`cntry_mst`.`cntrym_prty` AS `cntrym_prty`,`cntry_mst`.`cntrym_crtdon` AS `cntrym_crtdon`,`cntry_mst`.`cntrym_crtdby` AS `cntrym_crtdby`,`cntry_mst`.`cntrym_mdfdon` AS `cntrym_mdfdon`,`cntry_mst`.`cntrym_mdfdby` AS `cntrym_mdfdby`,`cntnt_mst`.`cntntm_id` AS `cntntm_id`,`cntnt_mst`.`cntntm_name` AS `cntntm_name`,`cntnt_mst`.`cntntm_iso` AS `cntntm_iso`,`cntnt_mst`.`cntntm_prty` AS `cntntm_prty`,`cntnt_mst`.`cntntm_sts` AS `cntntm_sts`,`cntnt_mst`.`cntntm_crtdon` AS `cntntm_crtdon`,`cntnt_mst`.`cntntm_crtdby` AS `cntntm_crtdby`,`cntnt_mst`.`cntntm_mdfdon` AS `cntntm_mdfdon`,`cntnt_mst`.`cntntm_mdfdby` AS `cntntm_mdfdby` from (`mbr_mst` left join (`mbr_dtl` left join (`cty_mst` left join (`cnty_mst` left join (`cntry_mst` left join `cntnt_mst` on(`cntnt_mst`.`cntntm_id` = `cntry_mst`.`cntrym_cntntm_id`)) on(`cntry_mst`.`cntrym_id` = `cnty_mst`.`cntym_cntrym_id`)) on(`cnty_mst`.`cntym_id` = `cty_mst`.`ctym_cntym_id`)) on(`cty_mst`.`ctym_id` = `mbr_dtl`.`mbrd_bctym_id`)) on(`mbr_mst`.`mbrm_id` = `mbr_dtl`.`mbrd_mbrm_id`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads_mst`
--
ALTER TABLE `ads_mst`
  ADD PRIMARY KEY (`adsm_name`),
  ADD KEY `adsm_id` (`adsm_id`);

--
-- Indexes for table `bnr_mst`
--
ALTER TABLE `bnr_mst`
  ADD PRIMARY KEY (`bnrm_id`);

--
-- Indexes for table `cntnt_mst`
--
ALTER TABLE `cntnt_mst`
  ADD PRIMARY KEY (`cntntm_name`),
  ADD UNIQUE KEY `cntntm_id` (`cntntm_id`);

--
-- Indexes for table `cntry_mst`
--
ALTER TABLE `cntry_mst`
  ADD PRIMARY KEY (`cntrym_name`,`cntrym_cntntm_id`),
  ADD KEY `cntrym_id` (`cntrym_id`);

--
-- Indexes for table `cnty_mst`
--
ALTER TABLE `cnty_mst`
  ADD PRIMARY KEY (`cntym_name`,`cntym_cntrym_id`),
  ADD KEY `cntym_id` (`cntym_id`),
  ADD KEY `FK_cnty_mst` (`cntym_cntrym_id`);

--
-- Indexes for table `crtord_dtl`
--
ALTER TABLE `crtord_dtl`
  ADD PRIMARY KEY (`crtordd_id`),
  ADD KEY `FK_crtord_dtl` (`crtordd_crtordm_id`);

--
-- Indexes for table `crtord_mst`
--
ALTER TABLE `crtord_mst`
  ADD PRIMARY KEY (`crtordm_code`),
  ADD KEY `crtordm_id` (`crtordm_id`);

--
-- Indexes for table `cty_mst`
--
ALTER TABLE `cty_mst`
  ADD PRIMARY KEY (`ctym_name`,`ctym_cntym_id`),
  ADD KEY `FK_cty_mst` (`ctym_cntym_id`),
  ADD KEY `ctym_id` (`ctym_id`);

--
-- Indexes for table `lgntrck_mst`
--
ALTER TABLE `lgntrck_mst`
  ADD PRIMARY KEY (`lgntrckm_id`),
  ADD KEY `FK_lgntrck_mst` (`lgntrckm_lgnm_id`);

--
-- Indexes for table `lgn_dtl`
--
ALTER TABLE `lgn_dtl`
  ADD PRIMARY KEY (`lgnd_email`),
  ADD KEY `FK_lgn_dtl` (`lgnd_lgnm_id`),
  ADD KEY `FK_lgn_dtl_ctym` (`lgnd_ctym_id`),
  ADD KEY `FK_lgn_dtl_cntym` (`lgnd_cntym_id`),
  ADD KEY `FK_lgn_dtl_cntry` (`lgnd_cntrym_id`),
  ADD KEY `lgnd_id` (`lgnd_id`);

--
-- Indexes for table `lgn_mst`
--
ALTER TABLE `lgn_mst`
  ADD PRIMARY KEY (`lgnm_uid`),
  ADD UNIQUE KEY `lgnm_id` (`lgnm_id`);

--
-- Indexes for table `mbrinf_mst`
--
ALTER TABLE `mbrinf_mst`
  ADD PRIMARY KEY (`mbrinfm_mbrm_id`,`mbrinfm_name`),
  ADD UNIQUE KEY `mbrinfm_id` (`mbrinfm_id`);

--
-- Indexes for table `mbr_dtl`
--
ALTER TABLE `mbr_dtl`
  ADD PRIMARY KEY (`mbrd_id`);

--
-- Indexes for table `mbr_mst`
--
ALTER TABLE `mbr_mst`
  ADD PRIMARY KEY (`mbrm_emailid`),
  ADD KEY `mbrm_id` (`mbrm_id`);

--
-- Indexes for table `ordsts_dtl`
--
ALTER TABLE `ordsts_dtl`
  ADD PRIMARY KEY (`ordstsd_ordstsm_id`,`ordstsd_crtordm_id`,`ordstsd_dttm`),
  ADD KEY `ordstsd_id` (`ordstsd_id`),
  ADD KEY `FK_ordsts_dtl` (`ordstsd_crtordm_id`);

--
-- Indexes for table `ordsts_mst`
--
ALTER TABLE `ordsts_mst`
  ADD PRIMARY KEY (`ordstsm_name`),
  ADD KEY `ordstsm_id` (`ordstsm_id`);

--
-- Indexes for table `prdprchsind_inventory`
--
ALTER TABLE `prdprchsind_inventory`
  ADD PRIMARY KEY (`prdprchsind_id`);

--
-- Indexes for table `prdprchs_inventory`
--
ALTER TABLE `prdprchs_inventory`
  ADD PRIMARY KEY (`prdprchs_id`);

--
-- Indexes for table `prdsle_inventory`
--
ALTER TABLE `prdsle_inventory`
  ADD PRIMARY KEY (`prdsle_id`);

--
-- Indexes for table `prodimg_dtl`
--
ALTER TABLE `prodimg_dtl`
  ADD PRIMARY KEY (`prodimgd_prodm_id`,`prodimgd_simg`),
  ADD KEY `prodm_id` (`prodimgd_id`);

--
-- Indexes for table `product_inventory`
--
ALTER TABLE `product_inventory`
  ADD PRIMARY KEY (`prdinvt_id`);

--
-- Indexes for table `prod_mst`
--
ALTER TABLE `prod_mst`
  ADD PRIMARY KEY (`prodm_id`);

--
-- Indexes for table `prod_store_dtl`
--
ALTER TABLE `prod_store_dtl`
  ADD PRIMARY KEY (`prods_id`);

--
-- Indexes for table `prod_veh_dtl`
--
ALTER TABLE `prod_veh_dtl`
  ADD PRIMARY KEY (`prodd_id`);

--
-- Indexes for table `store_loc_mst`
--
ALTER TABLE `store_loc_mst`
  ADD PRIMARY KEY (`strlocm_name`),
  ADD KEY `strlocm_id` (`strlocm_id`);

--
-- Indexes for table `trnsfr_inventory`
--
ALTER TABLE `trnsfr_inventory`
  ADD PRIMARY KEY (`trnsfr_id`);

--
-- Indexes for table `tyr_brnd_mst`
--
ALTER TABLE `tyr_brnd_mst`
  ADD PRIMARY KEY (`tyrbrndm_name`),
  ADD UNIQUE KEY `tyrbrndm_id` (`tyrbrndm_id`);

--
-- Indexes for table `tyr_prfl_mst`
--
ALTER TABLE `tyr_prfl_mst`
  ADD PRIMARY KEY (`tyrprflm_name`,`tyrprflm_vehtypm_id`,`tyrprflm_tyrwdthm_id`),
  ADD KEY `tyrprflm2_id` (`tyrprflm_id`),
  ADD KEY `FK_tyr_prfl_mst` (`tyrprflm_vehtypm_id`,`tyrprflm_tyrwdthm_id`);

--
-- Indexes for table `tyr_rimsize_mst`
--
ALTER TABLE `tyr_rimsize_mst`
  ADD PRIMARY KEY (`tyrrmszm_name`,`tyrrmszm_vehtypm_id`,`tyrrmszm_tyrwdthm_id`,`tyrrmszm_tyrprflm_id`),
  ADD KEY `tyrrmsxz_id` (`tyrrmszm_id`),
  ADD KEY `FK_tyr_rimsize_mst` (`tyrrmszm_vehtypm_id`,`tyrrmszm_tyrwdthm_id`);

--
-- Indexes for table `tyr_type_mst`
--
ALTER TABLE `tyr_type_mst`
  ADD PRIMARY KEY (`tyrtypm_name`),
  ADD KEY `tyrtypm_id` (`tyrtypm_id`);

--
-- Indexes for table `tyr_wdth_mst`
--
ALTER TABLE `tyr_wdth_mst`
  ADD PRIMARY KEY (`tyrwdthm_name`,`tyrwdthm_vehtypm_id`),
  ADD UNIQUE KEY `tyrwdthm_id` (`tyrwdthm_id`),
  ADD KEY `FK_veh_typ_mst` (`tyrwdthm_vehtypm_id`);

--
-- Indexes for table `usrwshlst_dtl`
--
ALTER TABLE `usrwshlst_dtl`
  ADD UNIQUE KEY `usrwshlstd_id` (`usrwshlstd_id`);

--
-- Indexes for table `veh_brnd_mst`
--
ALTER TABLE `veh_brnd_mst`
  ADD PRIMARY KEY (`vehbrndm_name`,`vehbrndm_vehtypm_id`),
  ADD UNIQUE KEY `vehbrndm_id` (`vehbrndm_id`),
  ADD KEY `FK_veh_brnd_mst` (`vehbrndm_vehtypm_id`);

--
-- Indexes for table `veh_model_mst`
--
ALTER TABLE `veh_model_mst`
  ADD PRIMARY KEY (`vehmodlm_name`,`vehmodlm_vehtypm_id`,`vehmodlm_vehbrndm_id`),
  ADD KEY `prodmncatm2_id` (`vehmodlm_id`),
  ADD KEY `FK_veh_model_mst` (`vehmodlm_vehtypm_id`,`vehmodlm_vehbrndm_id`);

--
-- Indexes for table `veh_type_mst`
--
ALTER TABLE `veh_type_mst`
  ADD PRIMARY KEY (`vehtypm_name`),
  ADD KEY `vehtypm_id` (`vehtypm_id`);

--
-- Indexes for table `veh_vrnt_mst`
--
ALTER TABLE `veh_vrnt_mst`
  ADD PRIMARY KEY (`vehvrntm_name`,`vehvrntm_vehtypm_id`,`vehvrntm_vehbrndm_id`,`vehvrntm_vehmdlm_id`),
  ADD KEY `vehvrnt_id` (`vehvrntm_id`),
  ADD KEY `FK_veh_vrnt_mst` (`vehvrntm_vehtypm_id`,`vehvrntm_vehbrndm_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads_mst`
--
ALTER TABLE `ads_mst`
  MODIFY `adsm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bnr_mst`
--
ALTER TABLE `bnr_mst`
  MODIFY `bnrm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cntnt_mst`
--
ALTER TABLE `cntnt_mst`
  MODIFY `cntntm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cntry_mst`
--
ALTER TABLE `cntry_mst`
  MODIFY `cntrym_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `cnty_mst`
--
ALTER TABLE `cnty_mst`
  MODIFY `cntym_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `crtord_dtl`
--
ALTER TABLE `crtord_dtl`
  MODIFY `crtordd_id` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Auto increment id for each order detail', AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `crtord_mst`
--
ALTER TABLE `crtord_mst`
  MODIFY `crtordm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `cty_mst`
--
ALTER TABLE `cty_mst`
  MODIFY `ctym_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `lgntrck_mst`
--
ALTER TABLE `lgntrck_mst`
  MODIFY `lgntrckm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=450;

--
-- AUTO_INCREMENT for table `lgn_dtl`
--
ALTER TABLE `lgn_dtl`
  MODIFY `lgnd_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lgn_mst`
--
ALTER TABLE `lgn_mst`
  MODIFY `lgnm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mbrinf_mst`
--
ALTER TABLE `mbrinf_mst`
  MODIFY `mbrinfm_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mbr_dtl`
--
ALTER TABLE `mbr_dtl`
  MODIFY `mbrd_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `mbr_mst`
--
ALTER TABLE `mbr_mst`
  MODIFY `mbrm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ordsts_dtl`
--
ALTER TABLE `ordsts_dtl`
  MODIFY `ordstsd_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `ordsts_mst`
--
ALTER TABLE `ordsts_mst`
  MODIFY `ordstsm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `prdprchsind_inventory`
--
ALTER TABLE `prdprchsind_inventory`
  MODIFY `prdprchsind_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=412;

--
-- AUTO_INCREMENT for table `prdprchs_inventory`
--
ALTER TABLE `prdprchs_inventory`
  MODIFY `prdprchs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `prdsle_inventory`
--
ALTER TABLE `prdsle_inventory`
  MODIFY `prdsle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `prodimg_dtl`
--
ALTER TABLE `prodimg_dtl`
  MODIFY `prodimgd_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_inventory`
--
ALTER TABLE `product_inventory`
  MODIFY `prdinvt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `prod_mst`
--
ALTER TABLE `prod_mst`
  MODIFY `prodm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `prod_store_dtl`
--
ALTER TABLE `prod_store_dtl`
  MODIFY `prods_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `prod_veh_dtl`
--
ALTER TABLE `prod_veh_dtl`
  MODIFY `prodd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `store_loc_mst`
--
ALTER TABLE `store_loc_mst`
  MODIFY `strlocm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trnsfr_inventory`
--
ALTER TABLE `trnsfr_inventory`
  MODIFY `trnsfr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tyr_brnd_mst`
--
ALTER TABLE `tyr_brnd_mst`
  MODIFY `tyrbrndm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tyr_prfl_mst`
--
ALTER TABLE `tyr_prfl_mst`
  MODIFY `tyrprflm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tyr_rimsize_mst`
--
ALTER TABLE `tyr_rimsize_mst`
  MODIFY `tyrrmszm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tyr_type_mst`
--
ALTER TABLE `tyr_type_mst`
  MODIFY `tyrtypm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tyr_wdth_mst`
--
ALTER TABLE `tyr_wdth_mst`
  MODIFY `tyrwdthm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `usrwshlst_dtl`
--
ALTER TABLE `usrwshlst_dtl`
  MODIFY `usrwshlstd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `veh_brnd_mst`
--
ALTER TABLE `veh_brnd_mst`
  MODIFY `vehbrndm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `veh_model_mst`
--
ALTER TABLE `veh_model_mst`
  MODIFY `vehmodlm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `veh_type_mst`
--
ALTER TABLE `veh_type_mst`
  MODIFY `vehtypm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `veh_vrnt_mst`
--
ALTER TABLE `veh_vrnt_mst`
  MODIFY `vehvrntm_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

