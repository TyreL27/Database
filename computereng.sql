-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 11 Eki 2019, 10:16:59
-- Sunucu sürümü: 5.7.26
-- PHP Sürümü: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `computereng`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `announces`
--

DROP TABLE IF EXISTS `announces`;
CREATE TABLE IF NOT EXISTS `announces` (
  `a_ID` int(20) NOT NULL,
  `t_ID` int(20) DEFAULT NULL,
  `std_ID` int(20) DEFAULT NULL,
  `a_Date` date NOT NULL,
  `a_Link` varchar(250) NOT NULL,
  PRIMARY KEY (`a_ID`),
  KEY `t_ID` (`t_ID`),
  KEY `std_ID` (`std_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `announces`
--

INSERT INTO `announces` (`a_ID`, `t_ID`, `std_ID`, `a_Date`, `a_Link`) VALUES
(1, 406300366, NULL, '2019-09-24', 'https://www.hku.edu.tr/ilanlar/ek-yerlestirme-muafiyet-ve-duzey-belirleme-sinavi/'),
(2, NULL, 181501005, '2019-09-13', 'https://www.hku.edu.tr/ilanlar/hazirlik-muafiyet-ve-duzey-belirleme-sinavi-bilgilendirme/'),
(3, 313414038, NULL, '2019-09-24', 'https://www.hku.edu.tr/ilanlar/ek-yerlestirme-muafiyet-ve-duzey-belirleme-sinavi/'),
(4, 824039678, NULL, '2019-09-24', 'https://www.hku.edu.tr/ilanlar/ek-yerlestirme-muafiyet-ve-duzey-belirleme-sinavi/'),
(5, 489658123, 181501005, '2019-09-20', 'https://www.hku.edu.tr/ilanlar/2019-osym-ek-yerlestirme-kayitlari-icin-kayit-kilavuzu/'),
(6, NULL, 181501062, '2019-09-13', 'https://www.hku.edu.tr/ilanlar/hazirlik-muafiyet-ve-duzey-belirleme-sinavi-bilgilendirme/');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `cl_ID` int(20) NOT NULL,
  `cl_Code` varchar(50) NOT NULL,
  `cl_Place` set('Amphitheatre','Classrooms','Laboratories') NOT NULL,
  `cl_Capacity` int(20) NOT NULL,
  PRIMARY KEY (`cl_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `classes`
--

INSERT INTO `classes` (`cl_ID`, `cl_Code`, `cl_Place`, `cl_Capacity`) VALUES
(1, 'MF003', 'Classrooms', 30),
(2, 'MF119', 'Laboratories', 30),
(3, 'YA1', 'Amphitheatre', 90);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `c_ID` int(20) NOT NULL,
  `t_ID` int(20) NOT NULL,
  `std_ID` int(20) NOT NULL,
  `cl_ID` int(20) NOT NULL,
  `c_Name` varchar(250) NOT NULL,
  `c_Hours` varchar(20) NOT NULL,
  PRIMARY KEY (`c_ID`),
  KEY `std_ID` (`std_ID`),
  KEY `t_ID` (`t_ID`),
  KEY `cl_ID` (`cl_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `courses`
--

INSERT INTO `courses` (`c_ID`, `t_ID`, `std_ID`, `cl_ID`, `c_Name`, `c_Hours`) VALUES
(1, 540981114, 181501005, 1, 'Computer Engineering 111', '3'),
(2, 572353009, 181501005, 2, 'Computer Engineering Lab', '2'),
(3, 904284789, 181501005, 3, 'Physics 101', '3'),
(4, 540981114, 181501062, 1, 'Computer Engineering 111', '3'),
(5, 572353009, 181501062, 2, 'Computer Engineering Lab', '2');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `exams`
--

DROP TABLE IF EXISTS `exams`;
CREATE TABLE IF NOT EXISTS `exams` (
  `e_ID` int(20) NOT NULL,
  `t_ID` int(20) NOT NULL,
  `std_ID` int(20) NOT NULL,
  `cl_ID` int(20) NOT NULL,
  `e_Code` varchar(50) NOT NULL,
  `e_Name` varchar(50) NOT NULL,
  `e_date` date NOT NULL,
  `e_Start_Time` varchar(20) NOT NULL,
  PRIMARY KEY (`e_ID`),
  KEY `std_ID` (`std_ID`),
  KEY `t_ID` (`t_ID`),
  KEY `cl_ID` (`cl_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `exams`
--

INSERT INTO `exams` (`e_ID`, `t_ID`, `std_ID`, `cl_ID`, `e_Code`, `e_Name`, `e_date`, `e_Start_Time`) VALUES
(1, 572353009, 181501005, 2, 'CENG111', 'Computer Engineering Lab', '2019-10-31', '10.40'),
(2, 540981114, 181501005, 3, 'PHYS102', 'General Physics 2', '2020-02-13', '13.40'),
(3, 572353009, 181501062, 2, 'CENG111', 'Computer Engineering Lab', '2019-10-31', '10.40');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `exam_results`
--

DROP TABLE IF EXISTS `exam_results`;
CREATE TABLE IF NOT EXISTS `exam_results` (
  `er_ID` int(20) NOT NULL,
  `std_ID` int(20) NOT NULL,
  `e_ID` int(20) NOT NULL,
  `er_Name` varchar(50) NOT NULL,
  `er_Grades` varchar(20) NOT NULL,
  PRIMARY KEY (`er_ID`),
  KEY `std_ID` (`std_ID`),
  KEY `e_ID` (`e_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `exam_results`
--

INSERT INTO `exam_results` (`er_ID`, `std_ID`, `e_ID`, `er_Name`, `er_Grades`) VALUES
(1, 181501005, 1, 'Computer Engineering Lab', 'CB'),
(2, 181501005, 2, 'General Physics 2', 'CC'),
(3, 181501062, 3, 'Computer Engineering Lab', 'BB');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `std_ID` int(20) NOT NULL,
  `std_Name` varchar(250) NOT NULL,
  `std_Surname` varchar(250) NOT NULL,
  `std_Date_of_Birth` date NOT NULL,
  `std_Phone_Number` varchar(20) NOT NULL,
  `std_EMail` varchar(250) NOT NULL,
  `std_Country` varchar(250) NOT NULL,
  `std_Year` set('1st Year','2nd Year','3rd Year','4th Year') NOT NULL,
  PRIMARY KEY (`std_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Computer Engineering Students of HKU';

--
-- Tablo döküm verisi `students`
--

INSERT INTO `students` (`std_ID`, `std_Name`, `std_Surname`, `std_Date_of_Birth`, `std_Phone_Number`, `std_EMail`, `std_Country`, `std_Year`) VALUES
(181501005, 'Tugcan', 'Canki', '2000-01-01', '+90 532 015 3527', 'tugcan.canki@std.hku.edu.tr', 'Gaziantep', '1st Year'),
(181501062, 'Ahmet', 'Kilic', '1999-08-11', '+90 532 155 1597', 'ahmet.kilic@std.hku.edu.tr', 'Gaziantep', '2nd Year');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `t_ID` int(20) NOT NULL,
  `t_Name` varchar(250) NOT NULL,
  `t_Surname` varchar(250) NOT NULL,
  `t_Date_of_Birth` date NOT NULL,
  `t_Phone_Number` varchar(20) NOT NULL,
  `t_EMail` varchar(250) NOT NULL,
  `t_Position` varchar(250) NOT NULL,
  `t_Country` varchar(250) NOT NULL,
  `t_CV_Link` varchar(250) NOT NULL,
  PRIMARY KEY (`t_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Computer Engineering Teachers of HKU';

--
-- Tablo döküm verisi `teachers`
--

INSERT INTO `teachers` (`t_ID`, `t_Name`, `t_Surname`, `t_Date_of_Birth`, `t_Phone_Number`, `t_EMail`, `t_Position`, `t_Country`, `t_CV_Link`) VALUES
(313414038, 'Cihan', 'KUZUDISLI', '1983-04-19', '0(342) 211 80 80', 'cihan.kuzudisli@hku.edu.tr', 'Research/Teaching Assistant', 'Gaziantep', 'https://profil.hku.edu.tr/akademik/cihan-kuzudisli/'),
(362059673, 'Saed', 'ALQARALEH', '1983-05-18', '0(342) 211 80 80', 'saed.alqaraleh@hku.edu.tr', 'Assistant Professor', 'Ma\'an', 'https://profil.hku.edu.tr/wp-content/uploads/Saed-alqaraleh.pdf'),
(406300366, 'Bulent', 'HAZNEDAR', '1978-10-21', '0(342) 211 80 80', 'bulent.haznedar@hku.edu.tr', 'Assistant Professor', 'Kayseri', 'https://profil.hku.edu.tr/wp-content/uploads/bulent-haznedar.pdf'),
(489658123, 'Ulas', 'GULEC', '1986-02-27', '0(342) 211 80 80', 'ulas.gulec@hku.edu.tr', 'Assistant Professor', 'Ankara', 'https://profil.hku.edu.tr/wp-content/uploads/ulas-gulec.pdf'),
(527361259, 'Veysi', 'ISLER', '1964-09-08', '0(342) 211 80 80', 'veysi.isler@hku.edu.tr', 'Full Professor Doctor', 'Ankara', 'https://profil.hku.edu.tr/akademik/veysi-isler/'),
(540981114, 'Muhammet Fatih', 'HASOGLU', '1976-06-18', '0(342) 211 80 80', 'mfatih.hasoglu@hku.edu.tr', 'Associate Professor Doctor', 'Gaziantep', 'https://profil.hku.edu.tr/akademik/fatih-hasoglu/'),
(572353009, 'Nihat Yilmaz', 'SIMSEK', '1991-07-25', '0(342) 211 80 80', 'nyilmaz.simsek@hku.edu.tr', 'Research/Teaching Assistant', 'Malatya', 'https://profil.hku.edu.tr/akademik/nihat-yilmaz-simsek/'),
(824039678, 'Melih', 'YAYLA', '1987-03-08', '0(342) 211 8080', 'melih.yayla@hku.edu.tr', 'Research/Teaching Assistant', 'Antalya', 'https://profil.hku.edu.tr/akademik/melih-yayla/'),
(904284789, 'Mustafa', 'BICAKCI', '1985-12-01', '0(342) 211 80 80', 'mustafa.bicakci@hku.edu.tr', 'Lecturer', 'Konya', 'https://profil.hku.edu.tr/wp-content/uploads/Mustafa-BIÇAKCI.pdf');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `announces`
--
ALTER TABLE `announces`
  ADD CONSTRAINT `announces_ibfk_1` FOREIGN KEY (`t_ID`) REFERENCES `teachers` (`t_ID`),
  ADD CONSTRAINT `announces_ibfk_2` FOREIGN KEY (`std_ID`) REFERENCES `students` (`std_ID`);

--
-- Tablo kısıtlamaları `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`std_ID`) REFERENCES `students` (`std_ID`),
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`t_ID`) REFERENCES `teachers` (`t_ID`),
  ADD CONSTRAINT `courses_ibfk_3` FOREIGN KEY (`cl_ID`) REFERENCES `classes` (`cl_ID`);

--
-- Tablo kısıtlamaları `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`std_ID`) REFERENCES `students` (`std_ID`),
  ADD CONSTRAINT `exams_ibfk_2` FOREIGN KEY (`t_ID`) REFERENCES `teachers` (`t_ID`),
  ADD CONSTRAINT `exams_ibfk_3` FOREIGN KEY (`cl_ID`) REFERENCES `classes` (`cl_ID`);

--
-- Tablo kısıtlamaları `exam_results`
--
ALTER TABLE `exam_results`
  ADD CONSTRAINT `exam_results_ibfk_1` FOREIGN KEY (`std_ID`) REFERENCES `students` (`std_ID`),
  ADD CONSTRAINT `exam_results_ibfk_2` FOREIGN KEY (`e_ID`) REFERENCES `exams` (`e_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
