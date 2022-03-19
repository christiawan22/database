/*
SQLyog Enterprise v12.5.1 (64 bit)
MySQL - 10.4.6-MariaDB : Database - dbperpusyohan2022
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbperpusyohan2022` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbperpusyohan2022`;

/*Table structure for table `tbl_buku` */

DROP TABLE IF EXISTS `tbl_buku`;

CREATE TABLE `tbl_buku` (
  `id_buku` int(15) NOT NULL AUTO_INCREMENT,
  `judul_buku` varchar(100) NOT NULL,
  `tahun_terbit` int(4) NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `penulis` varchar(50) NOT NULL,
  `id_kategori` int(15) NOT NULL,
  `jumlah` int(5) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_buku`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_buku` */

insert  into `tbl_buku`(`id_buku`,`judul_buku`,`tahun_terbit`,`penerbit`,`penulis`,`id_kategori`,`jumlah`,`gambar`,`isdeleted`) values 
(1,'Bahasa Indonesia SD 2',2001,'Erlangga','Heinrich Terra',1001,40,NULL,0),
(2,'Ilmu Pengetahuan Alam SMP 8',2002,'Pratama','Ambrosius Yudha',1001,50,NULL,0),
(3,'Seni Budaya SMA 10',2003,'Sinar Dunia','Mario Sri',1001,40,NULL,0),
(4,'Matahari',2018,'Cahayaku','Joko Widoyo',1002,10,NULL,0),
(5,'Bulan',2019,'Cahayaku','Joko Widoyo',1002,15,NULL,0),
(6,'Dunia Impian',2020,'Anugerah','Wicaksono',1002,5,NULL,0),
(7,'Tangga Nada',2016,'Musikku','Albertina Sukarsini',1003,20,NULL,0),
(8,'Gitar Pemula',2017,'Bola Dunia','Yuli Ningsih',1003,5,NULL,0),
(9,'Piano Tiles',2021,'Musikku','Andreas Andi',1003,2,NULL,0),
(10,'Fransiskus Asisi',2018,'Obor','Aloysius Sudarso',1004,5,NULL,0),
(11,'Joko Widodo',2019,'Gramedia','Roki Gerung',1004,15,NULL,0),
(12,'Refleksi Hidup',2015,'Kanisius','Theresa',1005,20,NULL,0),
(13,'Perang Dunia II',2010,'Gramedia','Thomas Hook',1006,30,NULL,0),
(14,'Selokan Mataram',2012,'Erlangga','Budi Subur',1006,10,NULL,0);

/*Table structure for table `tbl_kategori` */

DROP TABLE IF EXISTS `tbl_kategori`;

CREATE TABLE `tbl_kategori` (
  `id_kategori` int(15) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(50) DEFAULT NULL,
  `isdeleted` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_kategori` */

insert  into `tbl_kategori`(`id_kategori`,`nama_kategori`,`isdeleted`) values 
(1001,'Pendidikan',0),
(1002,'Fiksi',0),
(1003,'Musik',0),
(1004,'Biografi',0),
(1005,'Rohani',0),
(1006,'Sejarah',0);

/*Table structure for table `tbl_member` */

DROP TABLE IF EXISTS `tbl_member`;

CREATE TABLE `tbl_member` (
  `id_member` varchar(30) NOT NULL,
  `nama_member` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_member`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_member` */

insert  into `tbl_member`(`id_member`,`nama_member`,`alamat`,`email`,`no_telp`,`created`) values 
('A0001','Yohanes','Perumnas Konohagakure','yohaneschristiawanatmaja5@gmail.com','082186905048','2022-02-22 12:22:02');

/*Table structure for table `tbl_peminjaman` */

DROP TABLE IF EXISTS `tbl_peminjaman`;

CREATE TABLE `tbl_peminjaman` (
  `id_peminjaman` varchar(30) NOT NULL,
  `id_member` varchar(30) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_buku` int(15) NOT NULL,
  `tgl_pinjam` datetime NOT NULL,
  `tgl_kembali` datetime DEFAULT NULL,
  `status_pinjam` varchar(15) NOT NULL,
  PRIMARY KEY (`id_peminjaman`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_peminjaman` */

insert  into `tbl_peminjaman`(`id_peminjaman`,`id_member`,`id_user`,`id_buku`,`tgl_pinjam`,`tgl_kembali`,`status_pinjam`) values 
('A1','M0003',3,2,'2021-01-12 11:20:15',NULL,'Pinjam'),
('A2','M0005',5,6,'2020-12-01 13:45:02',NULL,'Pinjam'),
('A3','M0006',6,9,'2019-05-09 16:40:11',NULL,'Pinjam'),
('A4','M0004',4,12,'2021-02-10 15:10:13',NULL,'Pinjam');

/*Table structure for table `tbl_role` */

DROP TABLE IF EXISTS `tbl_role`;

CREATE TABLE `tbl_role` (
  `id_role` int(3) NOT NULL AUTO_INCREMENT,
  `nama_role` varchar(30) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_role` */

insert  into `tbl_role`(`id_role`,`nama_role`) values 
(1,'Manager'),
(2,'Admin'),
(3,'Pustakawan'),
(4,'Member'),
(5,'Pnerbit');

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `id_user` int(15) NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `id_role` int(3) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`id_user`,`nama_user`,`username`,`id_role`,`password`,`isdeleted`) values 
(7,'Christiawan','Christiawan1',2,'christiawan1',0),
(8,'Atmaja','Atmaja1',3,'atmaja1',0),
(9,'Febby','Febby1',4,'febby1',0),
(10,'Lie','Lie1',5,'lie1',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
