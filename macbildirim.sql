-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 16 Ara 2021, 17:21:37
-- Sunucu sürümü: 10.5.13-MariaDB-cll-lve
-- PHP Sürümü: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: ` macbildirim`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bildirimler`
--

CREATE TABLE `bildirimler` (
  `id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `mac_id` int(11) NOT NULL,
  `tarih` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `id` int(11) NOT NULL,
  `tg_user_id` varchar(100) NOT NULL,
  `tg_ad` varchar(50) DEFAULT NULL,
  `tg_soyad` varchar(50) DEFAULT NULL,
  `tg_username` varchar(100) NOT NULL,
  `tg_authdate` varchar(100) NOT NULL,
  `tg_hash` varchar(255) DEFAULT NULL,
  `giris_tarihi` datetime NOT NULL,
  `zaman` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`id`, `tg_user_id`, `tg_ad`, `tg_soyad`, `tg_username`, `tg_authdate`, `tg_hash`, `giris_tarihi`, `zaman`) VALUES
(1, '705636342', 'Emrah', 'Tuncer', 'etuncercom', '1639664349', NULL, '2021-12-16 17:19:09', 30),
(2, '799834155', 'Rıfat', NULL, 'HellOnMars', '1639421704', NULL, '2021-12-13 21:55:05', 30),
(3, '743588167', 'Hakan', NULL, 'hknslvl', '1639496788', NULL, '2021-12-14 18:46:29', 30);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ligler`
--

CREATE TABLE `ligler` (
  `id` int(11) NOT NULL,
  `ad` varchar(50) NOT NULL,
  `r_ad` varchar(100) NOT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ligler`
--

INSERT INTO `ligler` (`id`, `ad`, `r_ad`, `logo`) VALUES
(1, 'Türkiye Süper Lig', 'super-lig', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `loglar`
--

CREATE TABLE `loglar` (
  `id` int(11) NOT NULL,
  `baslik` varchar(100) NOT NULL,
  `icerik` varchar(255) NOT NULL,
  `tarih` datetime NOT NULL,
  `seviye` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `maclar`
--

CREATE TABLE `maclar` (
  `id` int(11) NOT NULL,
  `evsahibi` varchar(50) NOT NULL,
  `misafir` varchar(50) NOT NULL,
  `e_skor` int(2) DEFAULT NULL,
  `m_skor` int(2) DEFAULT NULL,
  `mac_tarihi` datetime NOT NULL,
  `mac_sonucu` int(11) NOT NULL,
  `mac_id` int(11) NOT NULL,
  `takim_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `maclar`
--

INSERT INTO `maclar` (`id`, `evsahibi`, `misafir`, `e_skor`, `m_skor`, `mac_tarihi`, `mac_sonucu`, `mac_id`, `takim_id`) VALUES
(1, 'aytemiz-alanyaspor', 'adana-demirspor', NULL, NULL, '2021-12-18 16:00:00', 0, 1398319, 1),
(2, 'adana-demirspor', 'galatasaray', NULL, NULL, '2021-12-21 17:00:00', 0, 1398509, 1),
(3, 'goztepe', 'adana-demirspor', NULL, NULL, '2021-12-26 13:00:00', 0, 1398524, 1),
(4, 'adana-demirspor', 'ankaraspor-2', NULL, NULL, '2021-12-29 14:00:00', 0, 1407523, 1),
(5, 'fenerbahce', 'adana-demirspor', NULL, NULL, '2022-01-10 17:00:00', 0, 1398331, 1),
(6, 'adana-demirspor', 'yukatel-kayserispor', NULL, NULL, '2022-01-15 10:30:00', 0, 1398339, 1),
(7, 'ittifak-holding-konyaspor', 'adana-demirspor', NULL, NULL, '2022-01-18 14:00:00', 0, 1398357, 1),
(8, 'adana-demirspor', 'fatih-karagumruk', NULL, NULL, '2022-01-22 13:00:00', 0, 1398359, 1),
(9, 'caykur-rizespor', 'adana-demirspor', NULL, NULL, '2022-02-06 00:00:00', 0, 1398371, 1),
(10, 'adana-demirspor', 'besiktas', NULL, NULL, '2022-02-13 00:00:00', 0, 1398379, 1),
(11, 'gaziantep-fk', 'adana-demirspor', NULL, NULL, '2022-02-20 00:00:00', 0, 1398394, 1),
(12, 'adana-demirspor', 'fraport-tav-antalyaspor', NULL, NULL, '2022-02-27 00:00:00', 0, 1398149, 1),
(13, 'yeni-malatyaspor', 'adana-demirspor', NULL, NULL, '2022-03-06 00:00:00', 0, 1398408, 1),
(14, 'adana-demirspor', 'sivasspor', NULL, NULL, '2022-03-13 00:00:00', 0, 1398409, 1),
(15, 'adana-demirspor', 'istanbul-basaksehir', NULL, NULL, '2022-03-20 00:00:00', 0, 1398419, 1),
(16, 'atakas-hatayspor', 'adana-demirspor', NULL, NULL, '2022-04-02 23:00:00', 0, 1398433, 1),
(17, 'adana-demirspor', 'altay-2', NULL, NULL, '2022-04-09 23:00:00', 0, 1398439, 1),
(18, 'aytemiz-alanyaspor', 'adana-demirspor', NULL, NULL, '2021-12-18 16:00:00', 0, 1398319, 2),
(19, 'gaziantep-fk', 'aytemiz-alanyaspor', NULL, NULL, '2021-12-22 17:00:00', 0, 1398514, 2),
(20, 'aytemiz-alanyaspor', 'fatih-karagumruk', NULL, NULL, '2021-12-26 13:00:00', 0, 1398519, 2),
(21, 'aytemiz-alanyaspor', 'Mardin 1969', NULL, NULL, '2021-12-29 10:00:00', 0, 1407524, 2),
(22, 'aytemiz-alanyaspor', 'istanbul-basaksehir', NULL, NULL, '2022-01-08 13:00:00', 0, 1398329, 2),
(23, 'altay-2', 'aytemiz-alanyaspor', NULL, NULL, '2022-01-16 10:30:00', 0, 1398340, 2),
(24, 'aytemiz-alanyaspor', 'atakas-hatayspor', NULL, NULL, '2022-01-20 14:00:00', 0, 1398349, 2),
(25, 'giresunspor', 'aytemiz-alanyaspor', NULL, NULL, '2022-01-23 13:00:00', 0, 1398363, 2),
(26, 'aytemiz-alanyaspor', 'galatasaray', NULL, NULL, '2022-02-06 00:00:00', 0, 1398369, 2),
(27, 'kasimpasa', 'aytemiz-alanyaspor', NULL, NULL, '2022-02-13 00:00:00', 0, 1398386, 2),
(28, 'aytemiz-alanyaspor', 'trabzonspor', NULL, NULL, '2022-02-20 00:00:00', 0, 1398389, 2),
(29, 'aytemiz-alanyaspor', 'ittifak-holding-konyaspor', NULL, NULL, '2022-02-27 00:00:00', 0, 1398150, 2),
(30, 'yukatel-kayserispor', 'aytemiz-alanyaspor', NULL, NULL, '2022-03-06 00:00:00', 0, 1398406, 2),
(31, 'aytemiz-alanyaspor', 'fenerbahce', NULL, NULL, '2022-03-13 00:00:00', 0, 1398410, 2),
(32, 'goztepe', 'aytemiz-alanyaspor', NULL, NULL, '2022-03-20 00:00:00', 0, 1398426, 2),
(33, 'aytemiz-alanyaspor', 'caykur-rizespor', NULL, NULL, '2022-04-02 23:00:00', 0, 1398429, 2),
(34, 'besiktas', 'aytemiz-alanyaspor', NULL, NULL, '2022-04-09 23:00:00', 0, 1398441, 2),
(35, 'giresunspor', 'altay-2', NULL, NULL, '2021-12-17 17:00:00', 0, 1398323, 3),
(36, 'altay-2', 'trabzonspor', NULL, NULL, '2021-12-21 17:00:00', 0, 1398510, 3),
(37, 'kasimpasa', 'altay-2', NULL, NULL, '2021-12-25 10:30:00', 0, 1398525, 3),
(38, 'besiktas', 'altay-2', NULL, NULL, '2021-12-30 18:00:00', 0, 1407526, 3),
(39, 'yukatel-kayserispor', 'altay-2', NULL, NULL, '2022-01-09 13:00:00', 0, 1398336, 3),
(40, 'altay-2', 'aytemiz-alanyaspor', NULL, NULL, '2022-01-16 10:30:00', 0, 1398340, 3),
(41, 'fenerbahce', 'altay-2', NULL, NULL, '2022-01-19 17:00:00', 0, 1398352, 3),
(42, 'altay-2', 'ittifak-holding-konyaspor', NULL, NULL, '2022-01-23 13:00:00', 0, 1398360, 3),
(43, 'goztepe', 'altay-2', NULL, NULL, '2022-02-06 00:00:00', 0, 1398375, 3),
(44, 'altay-2', 'caykur-rizespor', NULL, NULL, '2022-02-13 00:00:00', 0, 1398380, 3),
(45, 'besiktas', 'altay-2', NULL, NULL, '2022-02-20 00:00:00', 0, 1398390, 3),
(46, 'altay-2', 'gaziantep-fk', NULL, NULL, '2022-02-27 00:00:00', 0, 1398151, 3),
(47, 'fatih-karagumruk', 'altay-2', NULL, NULL, '2022-03-06 00:00:00', 0, 1398402, 3),
(48, 'altay-2', 'yeni-malatyaspor', NULL, NULL, '2022-03-13 00:00:00', 0, 1398411, 3),
(49, 'sivasspor', 'altay-2', NULL, NULL, '2022-03-20 00:00:00', 0, 1398427, 3),
(50, 'altay-2', 'fraport-tav-antalyaspor', NULL, NULL, '2022-04-02 23:00:00', 0, 1398430, 3),
(51, 'adana-demirspor', 'altay-2', NULL, NULL, '2022-04-09 23:00:00', 0, 1398439, 3),
(52, 'ittifak-holding-konyaspor', 'fraport-tav-antalyaspor', NULL, NULL, '2021-12-18 13:00:00', 0, 1398327, 4),
(53, 'fraport-tav-antalyaspor', 'kasimpasa', NULL, NULL, '2021-12-21 14:00:00', 0, 1398511, 4),
(54, 'galatasaray', 'fraport-tav-antalyaspor', NULL, NULL, '2021-12-25 13:00:00', 0, 1398522, 4),
(55, 'fraport-tav-antalyaspor', 'giresunspor', NULL, NULL, '2021-12-28 14:00:00', 0, 1407525, 4),
(56, 'goztepe', 'fraport-tav-antalyaspor', NULL, NULL, '2022-01-09 13:00:00', 0, 1398334, 4),
(57, 'fraport-tav-antalyaspor', 'fenerbahce', NULL, NULL, '2022-01-15 16:00:00', 0, 1398341, 4),
(58, 'caykur-rizespor', 'fraport-tav-antalyaspor', NULL, NULL, '2022-01-19 14:00:00', 0, 1398350, 4),
(59, 'fraport-tav-antalyaspor', 'gaziantep-fk', NULL, NULL, '2022-01-22 10:30:00', 0, 1398361, 4),
(60, 'besiktas', 'fraport-tav-antalyaspor', NULL, NULL, '2022-02-06 00:00:00', 0, 1398370, 4),
(61, 'fraport-tav-antalyaspor', 'fatih-karagumruk', NULL, NULL, '2022-02-13 00:00:00', 0, 1398381, 4),
(62, 'yeni-malatyaspor', 'fraport-tav-antalyaspor', NULL, NULL, '2022-02-20 00:00:00', 0, 1398398, 4),
(63, 'adana-demirspor', 'fraport-tav-antalyaspor', NULL, NULL, '2022-02-27 00:00:00', 0, 1398149, 4),
(64, 'fraport-tav-antalyaspor', 'sivasspor', NULL, NULL, '2022-03-06 00:00:00', 0, 1398399, 4),
(65, 'istanbul-basaksehir', 'fraport-tav-antalyaspor', NULL, NULL, '2022-03-13 00:00:00', 0, 1398415, 4),
(66, 'fraport-tav-antalyaspor', 'giresunspor', NULL, NULL, '2022-03-20 00:00:00', 0, 1398420, 4),
(67, 'altay-2', 'fraport-tav-antalyaspor', NULL, NULL, '2022-04-02 23:00:00', 0, 1398430, 4),
(68, 'fraport-tav-antalyaspor', 'atakas-hatayspor', NULL, NULL, '2022-04-09 23:00:00', 0, 1398440, 4),
(69, 'fenerbahce', 'besiktas', NULL, NULL, '2021-12-19 16:00:00', 0, 1398321, 5),
(70, 'besiktas', 'goztepe', NULL, NULL, '2021-12-23 17:00:00', 0, 1398512, 5),
(71, 'ittifak-holding-konyaspor', 'besiktas', NULL, NULL, '2021-12-27 17:00:00', 0, 1398527, 5),
(72, 'besiktas', 'altay-2', NULL, NULL, '2021-12-30 18:00:00', 0, 1407526, 5),
(73, 'caykur-rizespor', 'besiktas', NULL, NULL, '2022-01-09 16:00:00', 0, 1398330, 5),
(74, 'besiktas', 'gaziantep-fk', NULL, NULL, '2022-01-14 17:00:00', 0, 1398342, 5),
(75, 'fatih-karagumruk', 'besiktas', NULL, NULL, '2022-01-18 17:00:00', 0, 1398351, 5),
(76, 'yeni-malatyaspor', 'besiktas', NULL, NULL, '2022-01-21 17:00:00', 0, 1398368, 5),
(77, 'besiktas', 'fraport-tav-antalyaspor', NULL, NULL, '2022-02-06 00:00:00', 0, 1398370, 5),
(78, 'adana-demirspor', 'besiktas', NULL, NULL, '2022-02-13 00:00:00', 0, 1398379, 5),
(79, 'besiktas', 'altay-2', NULL, NULL, '2022-02-20 00:00:00', 0, 1398390, 5),
(80, 'sivasspor', 'besiktas', NULL, NULL, '2022-02-27 00:00:00', 0, 1398157, 5),
(81, 'besiktas', 'istanbul-basaksehir', NULL, NULL, '2022-03-06 00:00:00', 0, 1398400, 5),
(82, 'galatasaray', 'besiktas', NULL, NULL, '2022-03-13 00:00:00', 0, 1398412, 5),
(83, 'besiktas', 'atakas-hatayspor', NULL, NULL, '2022-03-20 00:00:00', 0, 1398421, 5),
(84, 'trabzonspor', 'besiktas', NULL, NULL, '2022-04-02 23:00:00', 0, 1398438, 5),
(85, 'besiktas', 'aytemiz-alanyaspor', NULL, NULL, '2022-04-09 23:00:00', 0, 1398441, 5),
(86, 'caykur-rizespor', 'yeni-malatyaspor', NULL, NULL, '2021-12-19 10:30:00', 0, 1398320, 6),
(87, 'sivasspor', 'caykur-rizespor', NULL, NULL, '2021-12-22 14:00:00', 0, 1398517, 6),
(88, 'caykur-rizespor', 'gaziantep-fk', NULL, NULL, '2021-12-26 10:30:00', 0, 1398520, 6),
(89, 'caykur-rizespor', 'besiktas', NULL, NULL, '2022-01-09 16:00:00', 0, 1398330, 6),
(90, 'fatih-karagumruk', 'caykur-rizespor', NULL, NULL, '2022-01-15 13:00:00', 0, 1398343, 6),
(91, 'caykur-rizespor', 'fraport-tav-antalyaspor', NULL, NULL, '2022-01-19 14:00:00', 0, 1398350, 6),
(92, 'atakas-hatayspor', 'caykur-rizespor', NULL, NULL, '2022-01-23 10:30:00', 0, 1398364, 6),
(93, 'caykur-rizespor', 'adana-demirspor', NULL, NULL, '2022-02-06 00:00:00', 0, 1398371, 6),
(94, 'altay-2', 'caykur-rizespor', NULL, NULL, '2022-02-13 00:00:00', 0, 1398380, 6),
(95, 'caykur-rizespor', 'istanbul-basaksehir', NULL, NULL, '2022-02-20 00:00:00', 0, 1398391, 6),
(96, 'galatasaray', 'caykur-rizespor', NULL, NULL, '2022-02-27 00:00:00', 0, 1398152, 6),
(97, 'caykur-rizespor', 'giresunspor', NULL, NULL, '2022-03-06 00:00:00', 0, 1398401, 6),
(98, 'kasimpasa', 'caykur-rizespor', NULL, NULL, '2022-03-13 00:00:00', 0, 1398416, 6),
(99, 'caykur-rizespor', 'trabzonspor', NULL, NULL, '2022-03-20 00:00:00', 0, 1398422, 6),
(100, 'aytemiz-alanyaspor', 'caykur-rizespor', NULL, NULL, '2022-04-02 23:00:00', 0, 1398429, 6),
(101, 'caykur-rizespor', 'ittifak-holding-konyaspor', NULL, NULL, '2022-04-09 23:00:00', 0, 1398442, 6),
(102, 'goztepe', 'fatih-karagumruk', NULL, NULL, '2021-12-19 13:00:00', 0, 1398324, 7),
(103, 'fatih-karagumruk', 'fenerbahce', NULL, NULL, '2021-12-22 17:00:00', 0, 1398513, 7),
(104, 'aytemiz-alanyaspor', 'fatih-karagumruk', NULL, NULL, '2021-12-26 13:00:00', 0, 1398519, 7),
(105, 'fatih-karagumruk', 'Bodrumspor', NULL, NULL, '2021-12-29 12:00:00', 0, 1407527, 7),
(106, 'gaziantep-fk', 'fatih-karagumruk', NULL, NULL, '2022-01-08 10:30:00', 0, 1398333, 7),
(107, 'fatih-karagumruk', 'caykur-rizespor', NULL, NULL, '2022-01-15 13:00:00', 0, 1398343, 7),
(108, 'fatih-karagumruk', 'besiktas', NULL, NULL, '2022-01-18 17:00:00', 0, 1398351, 7),
(109, 'adana-demirspor', 'fatih-karagumruk', NULL, NULL, '2022-01-22 13:00:00', 0, 1398359, 7),
(110, 'fatih-karagumruk', 'yeni-malatyaspor', NULL, NULL, '2022-02-06 00:00:00', 0, 1398372, 7),
(111, 'fraport-tav-antalyaspor', 'fatih-karagumruk', NULL, NULL, '2022-02-13 00:00:00', 0, 1398381, 7),
(112, 'fatih-karagumruk', 'sivasspor', NULL, NULL, '2022-02-20 00:00:00', 0, 1398392, 7),
(113, 'istanbul-basaksehir', 'fatih-karagumruk', NULL, NULL, '2022-02-27 00:00:00', 0, 1398155, 7),
(114, 'fatih-karagumruk', 'altay-2', NULL, NULL, '2022-03-06 00:00:00', 0, 1398402, 7),
(115, 'atakas-hatayspor', 'fatih-karagumruk', NULL, NULL, '2022-03-13 00:00:00', 0, 1398414, 7),
(116, 'fatih-karagumruk', 'yukatel-kayserispor', NULL, NULL, '2022-03-20 00:00:00', 0, 1398423, 7),
(117, 'galatasaray', 'fatih-karagumruk', NULL, NULL, '2022-04-02 23:00:00', 0, 1398431, 7),
(118, 'fatih-karagumruk', 'kasimpasa', NULL, NULL, '2022-04-09 23:00:00', 0, 1398443, 7),
(119, 'fenerbahce', 'besiktas', NULL, NULL, '2021-12-19 16:00:00', 0, 1398321, 8),
(120, 'fatih-karagumruk', 'fenerbahce', NULL, NULL, '2021-12-22 17:00:00', 0, 1398513, 8),
(121, 'fenerbahce', 'yeni-malatyaspor', NULL, NULL, '2021-12-26 16:00:00', 0, 1398521, 8),
(122, 'fenerbahce', 'afjet-afyonspor', NULL, NULL, '2021-12-29 18:00:00', 0, 1407528, 8),
(123, 'fenerbahce', 'adana-demirspor', NULL, NULL, '2022-01-10 17:00:00', 0, 1398331, 8),
(124, 'fraport-tav-antalyaspor', 'fenerbahce', NULL, NULL, '2022-01-15 16:00:00', 0, 1398341, 8),
(125, 'fenerbahce', 'altay-2', NULL, NULL, '2022-01-19 17:00:00', 0, 1398352, 8),
(126, 'sivasspor', 'fenerbahce', NULL, NULL, '2022-01-22 13:00:00', 0, 1398367, 8),
(127, 'fenerbahce', 'istanbul-basaksehir', NULL, NULL, '2022-02-06 00:00:00', 0, 1398373, 8),
(128, 'giresunspor', 'fenerbahce', NULL, NULL, '2022-02-13 00:00:00', 0, 1398383, 8),
(129, 'fenerbahce', 'slavia-prag', NULL, NULL, '2022-02-17 17:45:00', 0, 1407921, 8),
(130, 'fenerbahce', 'atakas-hatayspor', NULL, NULL, '2022-02-20 00:00:00', 0, 1398393, 8),
(131, 'slavia-prag', 'fenerbahce', NULL, NULL, '2022-02-24 20:00:00', 0, 1407933, 8),
(132, 'kasimpasa', 'fenerbahce', NULL, NULL, '2022-02-27 00:00:00', 0, 1398156, 8),
(133, 'fenerbahce', 'trabzonspor', NULL, NULL, '2022-03-06 00:00:00', 0, 1398403, 8),
(134, 'aytemiz-alanyaspor', 'fenerbahce', NULL, NULL, '2022-03-13 00:00:00', 0, 1398410, 8),
(135, 'fenerbahce', 'ittifak-holding-konyaspor', NULL, NULL, '2022-03-20 00:00:00', 0, 1398424, 8),
(136, 'yukatel-kayserispor', 'fenerbahce', NULL, NULL, '2022-04-02 23:00:00', 0, 1398436, 8),
(137, 'fenerbahce', 'galatasaray', NULL, NULL, '2022-04-09 23:00:00', 0, 1398444, 8),
(138, 'galatasaray', 'istanbul-basaksehir', NULL, NULL, '2021-12-18 16:00:00', 0, 1398322, 9),
(139, 'adana-demirspor', 'galatasaray', NULL, NULL, '2021-12-21 17:00:00', 0, 1398509, 9),
(140, 'galatasaray', 'fraport-tav-antalyaspor', NULL, NULL, '2021-12-25 13:00:00', 0, 1398522, 9),
(141, 'galatasaray', 'denizlispor', NULL, NULL, '2021-12-28 18:00:00', 0, 1407529, 9),
(142, 'galatasaray', 'giresunspor', NULL, NULL, '2022-01-08 16:00:00', 0, 1398332, 9),
(143, 'atakas-hatayspor', 'galatasaray', NULL, NULL, '2022-01-16 16:00:00', 0, 1398345, 9),
(144, 'galatasaray', 'kasimpasa', NULL, NULL, '2022-01-20 17:00:00', 0, 1398353, 9),
(145, 'galatasaray', 'trabzonspor', NULL, NULL, '2022-01-23 16:00:00', 0, 1398362, 9),
(146, 'aytemiz-alanyaspor', 'galatasaray', NULL, NULL, '2022-02-06 00:00:00', 0, 1398369, 9),
(147, 'galatasaray', 'yukatel-kayserispor', NULL, NULL, '2022-02-13 00:00:00', 0, 1398382, 9),
(148, 'goztepe', 'galatasaray', NULL, NULL, '2022-02-20 00:00:00', 0, 1398395, 9),
(149, 'galatasaray', 'caykur-rizespor', NULL, NULL, '2022-02-27 00:00:00', 0, 1398152, 9),
(150, 'ittifak-holding-konyaspor', 'galatasaray', NULL, NULL, '2022-03-06 00:00:00', 0, 1398407, 9),
(151, 'galatasaray', 'besiktas', NULL, NULL, '2022-03-13 00:00:00', 0, 1398412, 9),
(152, 'gaziantep-fk', 'galatasaray', NULL, NULL, '2022-03-20 00:00:00', 0, 1398425, 9),
(153, 'galatasaray', 'fatih-karagumruk', NULL, NULL, '2022-04-02 23:00:00', 0, 1398431, 9),
(154, 'fenerbahce', 'galatasaray', NULL, NULL, '2022-04-09 23:00:00', 0, 1398444, 9),
(155, 'yukatel-kayserispor', 'gaziantep-fk', NULL, NULL, '2021-12-19 13:00:00', 0, 1398326, 10),
(156, 'gaziantep-fk', 'aytemiz-alanyaspor', NULL, NULL, '2021-12-22 17:00:00', 0, 1398514, 10),
(157, 'caykur-rizespor', 'gaziantep-fk', NULL, NULL, '2021-12-26 10:30:00', 0, 1398520, 10),
(158, 'gaziantep-fk', 'bursaspor', NULL, NULL, '2021-12-30 15:30:00', 0, 1407530, 10),
(159, 'gaziantep-fk', 'fatih-karagumruk', NULL, NULL, '2022-01-08 10:30:00', 0, 1398333, 10),
(160, 'besiktas', 'gaziantep-fk', NULL, NULL, '2022-01-14 17:00:00', 0, 1398342, 10),
(161, 'gaziantep-fk', 'yeni-malatyaspor', NULL, NULL, '2022-01-18 14:00:00', 0, 1398354, 10),
(162, 'fraport-tav-antalyaspor', 'gaziantep-fk', NULL, NULL, '2022-01-22 10:30:00', 0, 1398361, 10),
(163, 'gaziantep-fk', 'sivasspor', NULL, NULL, '2022-02-06 00:00:00', 0, 1398374, 10),
(164, 'istanbul-basaksehir', 'gaziantep-fk', NULL, NULL, '2022-02-13 00:00:00', 0, 1398385, 10),
(165, 'gaziantep-fk', 'adana-demirspor', NULL, NULL, '2022-02-20 00:00:00', 0, 1398394, 10),
(166, 'altay-2', 'gaziantep-fk', NULL, NULL, '2022-02-27 00:00:00', 0, 1398151, 10),
(167, 'gaziantep-fk', 'atakas-hatayspor', NULL, NULL, '2022-03-06 00:00:00', 0, 1398404, 10),
(168, 'giresunspor', 'gaziantep-fk', NULL, NULL, '2022-03-13 00:00:00', 0, 1398413, 10),
(169, 'gaziantep-fk', 'galatasaray', NULL, NULL, '2022-03-20 00:00:00', 0, 1398425, 10),
(170, 'kasimpasa', 'gaziantep-fk', NULL, NULL, '2022-04-02 23:00:00', 0, 1398435, 10),
(171, 'gaziantep-fk', 'trabzonspor', NULL, NULL, '2022-04-09 23:00:00', 0, 1398445, 10),
(172, 'giresunspor', 'altay-2', NULL, NULL, '2021-12-17 17:00:00', 0, 1398323, 11),
(173, 'istanbul-basaksehir', 'giresunspor', NULL, NULL, '2021-12-21 14:00:00', 0, 1398516, 11),
(174, 'giresunspor', 'atakas-hatayspor', NULL, NULL, '2021-12-25 13:00:00', 0, 1398523, 11),
(175, 'fraport-tav-antalyaspor', 'giresunspor', NULL, NULL, '2021-12-28 14:00:00', 0, 1407525, 11),
(176, 'galatasaray', 'giresunspor', NULL, NULL, '2022-01-08 16:00:00', 0, 1398332, 11),
(177, 'giresunspor', 'kasimpasa', NULL, NULL, '2022-01-16 13:00:00', 0, 1398344, 11),
(178, 'trabzonspor', 'giresunspor', NULL, NULL, '2022-01-19 17:00:00', 0, 1398358, 11),
(179, 'giresunspor', 'aytemiz-alanyaspor', NULL, NULL, '2022-01-23 13:00:00', 0, 1398363, 11),
(180, 'ittifak-holding-konyaspor', 'giresunspor', NULL, NULL, '2022-02-06 00:00:00', 0, 1398377, 11),
(181, 'giresunspor', 'fenerbahce', NULL, NULL, '2022-02-13 00:00:00', 0, 1398383, 11),
(182, 'yukatel-kayserispor', 'giresunspor', NULL, NULL, '2022-02-20 00:00:00', 0, 1398396, 11),
(183, 'giresunspor', 'goztepe', NULL, NULL, '2022-02-27 00:00:00', 0, 1398153, 11),
(184, 'caykur-rizespor', 'giresunspor', NULL, NULL, '2022-03-06 00:00:00', 0, 1398401, 11),
(185, 'giresunspor', 'gaziantep-fk', NULL, NULL, '2022-03-13 00:00:00', 0, 1398413, 11),
(186, 'fraport-tav-antalyaspor', 'giresunspor', NULL, NULL, '2022-03-20 00:00:00', 0, 1398420, 11),
(187, 'giresunspor', 'sivasspor', NULL, NULL, '2022-04-02 23:00:00', 0, 1398432, 11),
(188, 'yeni-malatyaspor', 'giresunspor', NULL, NULL, '2022-04-09 23:00:00', 0, 1398448, 11),
(189, 'goztepe', 'fatih-karagumruk', NULL, NULL, '2021-12-19 13:00:00', 0, 1398324, 12),
(190, 'besiktas', 'goztepe', NULL, NULL, '2021-12-23 17:00:00', 0, 1398512, 12),
(191, 'goztepe', 'adana-demirspor', NULL, NULL, '2021-12-26 13:00:00', 0, 1398524, 12),
(192, 'goztepe', 'samsunspor', NULL, NULL, '2021-12-29 15:30:00', 0, 1407531, 12),
(193, 'goztepe', 'fraport-tav-antalyaspor', NULL, NULL, '2022-01-09 13:00:00', 0, 1398334, 12),
(194, 'yeni-malatyaspor', 'goztepe', NULL, NULL, '2022-01-14 17:00:00', 0, 1398348, 12),
(195, 'goztepe', 'sivasspor', NULL, NULL, '2022-01-19 14:00:00', 0, 1398355, 12),
(196, 'istanbul-basaksehir', 'goztepe', NULL, NULL, '2022-01-22 16:00:00', 0, 1398365, 12),
(197, 'goztepe', 'altay-2', NULL, NULL, '2022-02-06 00:00:00', 0, 1398375, 12),
(198, 'atakas-hatayspor', 'goztepe', NULL, NULL, '2022-02-13 00:00:00', 0, 1398384, 12),
(199, 'goztepe', 'galatasaray', NULL, NULL, '2022-02-20 00:00:00', 0, 1398395, 12),
(200, 'giresunspor', 'goztepe', NULL, NULL, '2022-02-27 00:00:00', 0, 1398153, 12),
(201, 'goztepe', 'kasimpasa', NULL, NULL, '2022-03-06 00:00:00', 0, 1398405, 12),
(202, 'trabzonspor', 'goztepe', NULL, NULL, '2022-03-13 00:00:00', 0, 1398418, 12),
(203, 'goztepe', 'aytemiz-alanyaspor', NULL, NULL, '2022-03-20 00:00:00', 0, 1398426, 12),
(204, 'ittifak-holding-konyaspor', 'goztepe', NULL, NULL, '2022-04-02 23:00:00', 0, 1398437, 12),
(205, 'goztepe', 'yukatel-kayserispor', NULL, NULL, '2022-04-09 23:00:00', 0, 1398446, 12),
(206, 'trabzonspor', 'atakas-hatayspor', NULL, NULL, '2021-12-18 13:00:00', 0, 1398328, 13),
(207, 'atakas-hatayspor', 'ittifak-holding-konyaspor', NULL, NULL, '2021-12-22 14:00:00', 0, 1398515, 13),
(208, 'giresunspor', 'atakas-hatayspor', NULL, NULL, '2021-12-25 13:00:00', 0, 1398523, 13),
(209, 'atakas-hatayspor', 'menemenspor', NULL, NULL, '2021-12-28 12:00:00', 0, 1407532, 13),
(210, 'kasimpasa', 'atakas-hatayspor', NULL, NULL, '2022-01-08 13:00:00', 0, 1398335, 13),
(211, 'atakas-hatayspor', 'galatasaray', NULL, NULL, '2022-01-16 16:00:00', 0, 1398345, 13),
(212, 'aytemiz-alanyaspor', 'atakas-hatayspor', NULL, NULL, '2022-01-20 14:00:00', 0, 1398349, 13),
(213, 'atakas-hatayspor', 'caykur-rizespor', NULL, NULL, '2022-01-23 10:30:00', 0, 1398364, 13),
(214, 'yukatel-kayserispor', 'atakas-hatayspor', NULL, NULL, '2022-02-06 00:00:00', 0, 1398376, 13),
(215, 'atakas-hatayspor', 'goztepe', NULL, NULL, '2022-02-13 00:00:00', 0, 1398384, 13),
(216, 'fenerbahce', 'atakas-hatayspor', NULL, NULL, '2022-02-20 00:00:00', 0, 1398393, 13),
(217, 'atakas-hatayspor', 'yeni-malatyaspor', NULL, NULL, '2022-02-27 00:00:00', 0, 1398154, 13),
(218, 'gaziantep-fk', 'atakas-hatayspor', NULL, NULL, '2022-03-06 00:00:00', 0, 1398404, 13),
(219, 'atakas-hatayspor', 'fatih-karagumruk', NULL, NULL, '2022-03-13 00:00:00', 0, 1398414, 13),
(220, 'besiktas', 'atakas-hatayspor', NULL, NULL, '2022-03-20 00:00:00', 0, 1398421, 13),
(221, 'atakas-hatayspor', 'adana-demirspor', NULL, NULL, '2022-04-02 23:00:00', 0, 1398433, 13),
(222, 'fraport-tav-antalyaspor', 'atakas-hatayspor', NULL, NULL, '2022-04-09 23:00:00', 0, 1398440, 13),
(223, 'galatasaray', 'istanbul-basaksehir', NULL, NULL, '2021-12-18 16:00:00', 0, 1398322, 14),
(224, 'istanbul-basaksehir', 'giresunspor', NULL, NULL, '2021-12-21 14:00:00', 0, 1398516, 14),
(225, 'trabzonspor', 'istanbul-basaksehir', NULL, NULL, '2021-12-25 16:00:00', 0, 1398528, 14),
(226, 'aytemiz-alanyaspor', 'istanbul-basaksehir', NULL, NULL, '2022-01-08 13:00:00', 0, 1398329, 14),
(227, 'istanbul-basaksehir', 'ittifak-holding-konyaspor', NULL, NULL, '2022-01-15 16:00:00', 0, 1398346, 14),
(228, 'yukatel-kayserispor', 'istanbul-basaksehir', NULL, NULL, '2022-01-19 14:00:00', 0, 1398356, 14),
(229, 'istanbul-basaksehir', 'goztepe', NULL, NULL, '2022-01-22 16:00:00', 0, 1398365, 14),
(230, 'fenerbahce', 'istanbul-basaksehir', NULL, NULL, '2022-02-06 00:00:00', 0, 1398373, 14),
(231, 'istanbul-basaksehir', 'gaziantep-fk', NULL, NULL, '2022-02-13 00:00:00', 0, 1398385, 14),
(232, 'caykur-rizespor', 'istanbul-basaksehir', NULL, NULL, '2022-02-20 00:00:00', 0, 1398391, 14),
(233, 'istanbul-basaksehir', 'fatih-karagumruk', NULL, NULL, '2022-02-27 00:00:00', 0, 1398155, 14),
(234, 'besiktas', 'istanbul-basaksehir', NULL, NULL, '2022-03-06 00:00:00', 0, 1398400, 14),
(235, 'istanbul-basaksehir', 'fraport-tav-antalyaspor', NULL, NULL, '2022-03-13 00:00:00', 0, 1398415, 14),
(236, 'adana-demirspor', 'istanbul-basaksehir', NULL, NULL, '2022-03-20 00:00:00', 0, 1398419, 14),
(237, 'istanbul-basaksehir', 'yeni-malatyaspor', NULL, NULL, '2022-04-02 23:00:00', 0, 1398434, 14),
(238, 'sivasspor', 'istanbul-basaksehir', NULL, NULL, '2022-04-09 23:00:00', 0, 1398447, 14),
(239, 'kasimpasa', 'sivasspor', NULL, NULL, '2021-12-18 10:30:00', 0, 1398325, 15),
(240, 'fraport-tav-antalyaspor', 'kasimpasa', NULL, NULL, '2021-12-21 14:00:00', 0, 1398511, 15),
(241, 'kasimpasa', 'altay-2', NULL, NULL, '2021-12-25 10:30:00', 0, 1398525, 15),
(242, 'kasimpasa', 'kocaelispor', NULL, NULL, '2021-12-28 10:00:00', 0, 1407533, 15),
(243, 'kasimpasa', 'atakas-hatayspor', NULL, NULL, '2022-01-08 13:00:00', 0, 1398335, 15),
(244, 'giresunspor', 'kasimpasa', NULL, NULL, '2022-01-16 13:00:00', 0, 1398344, 15),
(245, 'galatasaray', 'kasimpasa', NULL, NULL, '2022-01-20 17:00:00', 0, 1398353, 15),
(246, 'kasimpasa', 'yukatel-kayserispor', NULL, NULL, '2022-01-23 10:30:00', 0, 1398366, 15),
(247, 'trabzonspor', 'kasimpasa', NULL, NULL, '2022-02-06 00:00:00', 0, 1398378, 15),
(248, 'kasimpasa', 'aytemiz-alanyaspor', NULL, NULL, '2022-02-13 00:00:00', 0, 1398386, 15),
(249, 'ittifak-holding-konyaspor', 'kasimpasa', NULL, NULL, '2022-02-20 00:00:00', 0, 1398397, 15),
(250, 'kasimpasa', 'fenerbahce', NULL, NULL, '2022-02-27 00:00:00', 0, 1398156, 15),
(251, 'goztepe', 'kasimpasa', NULL, NULL, '2022-03-06 00:00:00', 0, 1398405, 15),
(252, 'kasimpasa', 'caykur-rizespor', NULL, NULL, '2022-03-13 00:00:00', 0, 1398416, 15),
(253, 'yeni-malatyaspor', 'kasimpasa', NULL, NULL, '2022-03-20 00:00:00', 0, 1398428, 15),
(254, 'kasimpasa', 'gaziantep-fk', NULL, NULL, '2022-04-02 23:00:00', 0, 1398435, 15),
(255, 'fatih-karagumruk', 'kasimpasa', NULL, NULL, '2022-04-09 23:00:00', 0, 1398443, 15),
(256, 'ittifak-holding-konyaspor', 'fraport-tav-antalyaspor', NULL, NULL, '2021-12-18 13:00:00', 0, 1398327, 17),
(257, 'atakas-hatayspor', 'ittifak-holding-konyaspor', NULL, NULL, '2021-12-22 14:00:00', 0, 1398515, 17),
(258, 'ittifak-holding-konyaspor', 'besiktas', NULL, NULL, '2021-12-27 17:00:00', 0, 1398527, 17),
(259, 'ittifak-holding-konyaspor', 'umraniyespor', NULL, NULL, '2021-12-30 12:00:00', 0, 1407535, 17),
(260, 'ittifak-holding-konyaspor', 'sivasspor', NULL, NULL, '2022-01-09 10:30:00', 0, 1398337, 17),
(261, 'istanbul-basaksehir', 'ittifak-holding-konyaspor', NULL, NULL, '2022-01-15 16:00:00', 0, 1398346, 17),
(262, 'ittifak-holding-konyaspor', 'adana-demirspor', NULL, NULL, '2022-01-18 14:00:00', 0, 1398357, 17),
(263, 'altay-2', 'ittifak-holding-konyaspor', NULL, NULL, '2022-01-23 13:00:00', 0, 1398360, 17),
(264, 'ittifak-holding-konyaspor', 'giresunspor', NULL, NULL, '2022-02-06 00:00:00', 0, 1398377, 17),
(265, 'trabzonspor', 'ittifak-holding-konyaspor', NULL, NULL, '2022-02-13 00:00:00', 0, 1398388, 17),
(266, 'ittifak-holding-konyaspor', 'kasimpasa', NULL, NULL, '2022-02-20 00:00:00', 0, 1398397, 17),
(267, 'aytemiz-alanyaspor', 'ittifak-holding-konyaspor', NULL, NULL, '2022-02-27 00:00:00', 0, 1398150, 17),
(268, 'ittifak-holding-konyaspor', 'galatasaray', NULL, NULL, '2022-03-06 00:00:00', 0, 1398407, 17),
(269, 'yukatel-kayserispor', 'ittifak-holding-konyaspor', NULL, NULL, '2022-03-13 00:00:00', 0, 1398417, 17),
(270, 'fenerbahce', 'ittifak-holding-konyaspor', NULL, NULL, '2022-03-20 00:00:00', 0, 1398424, 17),
(271, 'ittifak-holding-konyaspor', 'goztepe', NULL, NULL, '2022-04-02 23:00:00', 0, 1398437, 17),
(272, 'caykur-rizespor', 'ittifak-holding-konyaspor', NULL, NULL, '2022-04-09 23:00:00', 0, 1398442, 17),
(273, 'kasimpasa', 'sivasspor', NULL, NULL, '2021-12-18 10:30:00', 0, 1398325, 18),
(274, 'sivasspor', 'caykur-rizespor', NULL, NULL, '2021-12-22 14:00:00', 0, 1398517, 18),
(275, 'yukatel-kayserispor', 'sivasspor', NULL, NULL, '2021-12-27 17:00:00', 0, 1398526, 18),
(276, 'sivasspor', 'mke-ankaragucu', NULL, NULL, '2021-12-30 14:00:00', 0, 1407536, 18),
(277, 'ittifak-holding-konyaspor', 'sivasspor', NULL, NULL, '2022-01-09 10:30:00', 0, 1398337, 18),
(278, 'sivasspor', 'trabzonspor', NULL, NULL, '2022-01-15 13:00:00', 0, 1398347, 18),
(279, 'goztepe', 'sivasspor', NULL, NULL, '2022-01-19 14:00:00', 0, 1398355, 18),
(280, 'sivasspor', 'fenerbahce', NULL, NULL, '2022-01-22 13:00:00', 0, 1398367, 18),
(281, 'gaziantep-fk', 'sivasspor', NULL, NULL, '2022-02-06 00:00:00', 0, 1398374, 18),
(282, 'sivasspor', 'yeni-malatyaspor', NULL, NULL, '2022-02-13 00:00:00', 0, 1398387, 18),
(283, 'fatih-karagumruk', 'sivasspor', NULL, NULL, '2022-02-20 00:00:00', 0, 1398392, 18),
(284, 'sivasspor', 'besiktas', NULL, NULL, '2022-02-27 00:00:00', 0, 1398157, 18),
(285, 'fraport-tav-antalyaspor', 'sivasspor', NULL, NULL, '2022-03-06 00:00:00', 0, 1398399, 18),
(286, 'adana-demirspor', 'sivasspor', NULL, NULL, '2022-03-13 00:00:00', 0, 1398409, 18),
(287, 'sivasspor', 'altay-2', NULL, NULL, '2022-03-20 00:00:00', 0, 1398427, 18),
(288, 'giresunspor', 'sivasspor', NULL, NULL, '2022-04-02 23:00:00', 0, 1398432, 18),
(289, 'sivasspor', 'istanbul-basaksehir', NULL, NULL, '2022-04-09 23:00:00', 0, 1398447, 18),
(290, 'trabzonspor', 'atakas-hatayspor', NULL, NULL, '2021-12-18 13:00:00', 0, 1398328, 19),
(291, 'altay-2', 'trabzonspor', NULL, NULL, '2021-12-21 17:00:00', 0, 1398510, 19),
(292, 'trabzonspor', 'istanbul-basaksehir', NULL, NULL, '2021-12-25 16:00:00', 0, 1398528, 19),
(293, 'trabzonspor', 'boluspor', NULL, NULL, '2021-12-28 15:30:00', 0, 1407537, 19),
(294, 'trabzonspor', 'yeni-malatyaspor', NULL, NULL, '2022-01-07 17:00:00', 0, 1398338, 19),
(295, 'sivasspor', 'trabzonspor', NULL, NULL, '2022-01-15 13:00:00', 0, 1398347, 19),
(296, 'trabzonspor', 'giresunspor', NULL, NULL, '2022-01-19 17:00:00', 0, 1398358, 19),
(297, 'galatasaray', 'trabzonspor', NULL, NULL, '2022-01-23 16:00:00', 0, 1398362, 19),
(298, 'trabzonspor', 'kasimpasa', NULL, NULL, '2022-02-06 00:00:00', 0, 1398378, 19),
(299, 'trabzonspor', 'ittifak-holding-konyaspor', NULL, NULL, '2022-02-13 00:00:00', 0, 1398388, 19),
(300, 'aytemiz-alanyaspor', 'trabzonspor', NULL, NULL, '2022-02-20 00:00:00', 0, 1398389, 19),
(301, 'trabzonspor', 'yukatel-kayserispor', NULL, NULL, '2022-02-27 00:00:00', 0, 1398158, 19),
(302, 'fenerbahce', 'trabzonspor', NULL, NULL, '2022-03-06 00:00:00', 0, 1398403, 19),
(303, 'trabzonspor', 'goztepe', NULL, NULL, '2022-03-13 00:00:00', 0, 1398418, 19),
(304, 'caykur-rizespor', 'trabzonspor', NULL, NULL, '2022-03-20 00:00:00', 0, 1398422, 19),
(305, 'trabzonspor', 'besiktas', NULL, NULL, '2022-04-02 23:00:00', 0, 1398438, 19),
(306, 'gaziantep-fk', 'trabzonspor', NULL, NULL, '2022-04-09 23:00:00', 0, 1398445, 19),
(307, 'caykur-rizespor', 'yeni-malatyaspor', NULL, NULL, '2021-12-19 10:30:00', 0, 1398320, 20),
(308, 'yeni-malatyaspor', 'yukatel-kayserispor', NULL, NULL, '2021-12-23 14:00:00', 0, 1398518, 20),
(309, 'fenerbahce', 'yeni-malatyaspor', NULL, NULL, '2021-12-26 16:00:00', 0, 1398521, 20),
(310, 'yeni-malatyaspor', 'bandirmaspor', NULL, NULL, '2021-12-30 10:00:00', 0, 1407538, 20),
(311, 'trabzonspor', 'yeni-malatyaspor', NULL, NULL, '2022-01-07 17:00:00', 0, 1398338, 20),
(312, 'yeni-malatyaspor', 'goztepe', NULL, NULL, '2022-01-14 17:00:00', 0, 1398348, 20),
(313, 'gaziantep-fk', 'yeni-malatyaspor', NULL, NULL, '2022-01-18 14:00:00', 0, 1398354, 20),
(314, 'yeni-malatyaspor', 'besiktas', NULL, NULL, '2022-01-21 17:00:00', 0, 1398368, 20),
(315, 'fatih-karagumruk', 'yeni-malatyaspor', NULL, NULL, '2022-02-06 00:00:00', 0, 1398372, 20),
(316, 'sivasspor', 'yeni-malatyaspor', NULL, NULL, '2022-02-13 00:00:00', 0, 1398387, 20),
(317, 'yeni-malatyaspor', 'fraport-tav-antalyaspor', NULL, NULL, '2022-02-20 00:00:00', 0, 1398398, 20),
(318, 'atakas-hatayspor', 'yeni-malatyaspor', NULL, NULL, '2022-02-27 00:00:00', 0, 1398154, 20),
(319, 'yeni-malatyaspor', 'adana-demirspor', NULL, NULL, '2022-03-06 00:00:00', 0, 1398408, 20),
(320, 'altay-2', 'yeni-malatyaspor', NULL, NULL, '2022-03-13 00:00:00', 0, 1398411, 20),
(321, 'yeni-malatyaspor', 'kasimpasa', NULL, NULL, '2022-03-20 00:00:00', 0, 1398428, 20),
(322, 'istanbul-basaksehir', 'yeni-malatyaspor', NULL, NULL, '2022-04-02 23:00:00', 0, 1398434, 20),
(323, 'yeni-malatyaspor', 'giresunspor', NULL, NULL, '2022-04-09 23:00:00', 0, 1398448, 20);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `takimlar`
--

CREATE TABLE `takimlar` (
  `id` int(11) NOT NULL,
  `ad` varchar(50) NOT NULL,
  `kisa_ad` varchar(5) NOT NULL,
  `r_ad` varchar(50) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `lig_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `takimlar`
--

INSERT INTO `takimlar` (`id`, `ad`, `kisa_ad`, `r_ad`, `logo`, `lig_id`) VALUES
(1, 'Adana Demirspor', 'ADS', 'adana-demirspor', 'adana-demirspor.png', 1),
(2, 'A. Alanyaspor', 'ALA', 'aytemiz-alanyaspor', 'aytemiz-alanyaspor.png', 1),
(3, 'Altay', 'ALT', 'altay-2', 'altay-2.png', 1),
(4, 'FTA Antalyaspor', 'ANT', 'fraport-tav-antalyaspor', 'fraport-tav-antalyaspor.png', 1),
(5, 'Beşiktaş', 'BJK', 'besiktas', 'besiktas.png', 1),
(6, 'Çaykur Rizespor', 'RİZE', 'caykur-rizespor', 'caykur-rizespor.png', 1),
(7, 'VavaCars Fatih Karagümrük', 'KGM', 'fatih-karagumruk', 'fatih-karagumruk.png', 1),
(8, 'Fenerbahçe', 'FB', 'fenerbahce', 'fenerbahce.png', 1),
(9, 'Galatasaray', 'GS', 'galatasaray', 'galatasaray.png', 1),
(10, 'Gaziantep FK', 'GFK', 'gaziantep-fk', 'gaziantep-fk.png', 1),
(11, 'GZT Giresunspor', 'GİR', 'giresunspor', 'giresunspor.png', 1),
(12, 'Göztepe', 'GÖZ', 'goztepe', 'goztepe.png', 1),
(13, 'Atakaş Hatayspor', 'HAT', 'atakas-hatayspor', 'atakas-hatayspor.png', 1),
(14, 'M.Başakşehir', 'MBFK', 'istanbul-basaksehir', 'istanbul-basaksehir.png', 1),
(15, 'Kasımpaşa', 'KPAŞA', 'kasimpasa', 'kasimpasa.png', 1),
(16, 'Yukatel Kayserispor', 'KYS', 'yukatel-kayserispor', 'yukatel-kayserispor.png', 1),
(17, 'İttifak Holding Konyaspor', 'KON', 'ittifak-holding-konyaspor', 'ittifak-holding-konyaspor.png', 1),
(18, 'DG Sivasspor', 'SVS', 'sivasspor', 'sivasspor.png', 1),
(19, 'Trabzonspor', 'TS', 'trabzonspor', 'trabzonspor.png', 1),
(20, 'Öznur Kablo Yeni Malatyaspor', 'MLT', 'yeni-malatyaspor', 'yeni-malatyaspor.png', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `takip_edenler`
--

CREATE TABLE `takip_edenler` (
  `id` int(11) NOT NULL,
  `takim_id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `kayit_tarih` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `takip_edenler`
--

INSERT INTO `takip_edenler` (`id`, `takim_id`, `kullanici_id`, `kayit_tarih`) VALUES
(4, 9, 1, '2021-12-10 11:13:58'),
(42, 9, 3, '2021-12-14 18:46:32'),
(41, 9, 2, '2021-12-13 21:55:12');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `bildirimler`
--
ALTER TABLE `bildirimler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `ligler`
--
ALTER TABLE `ligler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `loglar`
--
ALTER TABLE `loglar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `maclar`
--
ALTER TABLE `maclar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `takimlar`
--
ALTER TABLE `takimlar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `takip_edenler`
--
ALTER TABLE `takip_edenler`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `bildirimler`
--
ALTER TABLE `bildirimler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `ligler`
--
ALTER TABLE `ligler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `loglar`
--
ALTER TABLE `loglar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `maclar`
--
ALTER TABLE `maclar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;

--
-- Tablo için AUTO_INCREMENT değeri `takimlar`
--
ALTER TABLE `takimlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `takip_edenler`
--
ALTER TABLE `takip_edenler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
