
CREATE TABLE IF NOT EXISTS `tb_cms_alamat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kantor` text NOT NULL,
  `telepon` text NOT NULL,
  `hp` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO `tb_cms_alamat` (`id`, `nama_kantor`, `telepon`, `hp`) VALUES
	(1, 'watansoppeng', '048480000', '088888888');


CREATE TABLE IF NOT EXISTS `tb_cms_pembayaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bank` varchar(50) NOT NULL,
  `no_rekening` text NOT NULL,
  `atas_nama` text NOT NULL,
  `img_bank` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


INSERT INTO `tb_cms_pembayaran` (`id`, `nama_bank`, `no_rekening`, `atas_nama`, `img_bank`) VALUES
	(1, 'BCA', '3810155271', 'admin tiket', 'bca.png'),
	(2, 'BRI', '140005069563', 'admin tiket', 'bri.png');


CREATE TABLE IF NOT EXISTS `tb_cms_pengaturan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users_pengaturan` int(11) NOT NULL,
  `nama_admin` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO `tb_cms_pengaturan` (`id`, `id_users_pengaturan`, `nama_admin`) VALUES
	(1, 1, 'admin tiket');


CREATE TABLE IF NOT EXISTS `tb_komplain_masukan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(50) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_telpon` varchar(50) NOT NULL,
  `pesan` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;


INSERT INTO `tb_komplain_masukan` (`id`, `jenis`, `nama_lengkap`, `email`, `no_telpon`, `pesan`) VALUES
	(1, 'Masukan', 'cek', 'rasulsoppeng@gmail.com', '98765432', 'kjhgfdsa');

CREATE TABLE IF NOT EXISTS `tb_pesawat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pesawat` varchar(40) NOT NULL,
  `kode_pesawat` varchar(40) NOT NULL,
  `keberangkatan` varchar(40) NOT NULL,
  `tujuan` varchar(40) NOT NULL,
  `jam_keberangkatan` time NOT NULL,
  `jam_tiba` time NOT NULL,
  `kelas_penerbangan` varchar(20) NOT NULL,
  `harga` float NOT NULL,
  `tersedia` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

INSERT INTO `tb_pesawat` (`id`, `nama_pesawat`, `kode_pesawat`, `keberangkatan`, `tujuan`, `jam_keberangkatan`, `jam_tiba`, `kelas_penerbangan`, `harga`, `tersedia`) VALUES
	(1, 'Lion Air', 'LN01', 'Jakarta', 'Bandung', '07:00:00', '07:30:00', 'Ekonomi', 800000, 1),
	(2, 'Sriwijaya Air', 'SWJ01', 'Surabaya', 'Jakarta', '07:00:00', '08:00:00', 'Ekonomi', 600000, 1),
	(3, 'Garuda', 'GD01', 'Jakarta', 'Bali', '16:00:00', '17:30:00', 'Ekonomi', 600000, 1),
	(4, 'pesawat1', 'p01', 'soppeng', 'makassar', '09:00:00', '11:00:00', 'k1', 1000000, 1);

CREATE TABLE IF NOT EXISTS `tb_tiket_pesawat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pesawat` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_keberangkatan` date NOT NULL,
  `kode_booking` varchar(25) NOT NULL,
  `jumlah_tiket` int(11) NOT NULL,
  `harga_total` float NOT NULL,
  `bayar` tinyint(1) NOT NULL,
  `tgl_pemesanan` date NOT NULL,
  `kode_transaksi` varchar(50) NOT NULL,
  `penerbangan` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;



INSERT INTO `tb_tiket_pesawat` (`id`, `id_pesawat`, `id_user`, `tgl_keberangkatan`, `kode_booking`, `jumlah_tiket`, `harga_total`, `bayar`, `tgl_pemesanan`, `kode_transaksi`, `penerbangan`) VALUES
	(8, 27, 11, '2018-10-31', '', 1, 800000, 1, '2018-10-30', 'PS03082', 2),
	(9, 27, 11, '2018-10-31', '', 1, 800000, 1, '2018-10-30', 'PS03075', 2),
	(10, 18, 14, '2018-10-31', '', 1, 1600000, 1, '2018-10-30', 'PS03087', 2),
	(11, 18, 14, '2018-10-31', '', 1, 1600000, 1, '2018-10-30', 'PS03038', 2),
	(12, 18, 15, '2018-11-01', '', 1, 800000, 1, '2018-10-30', 'PS03075', 1),
	(13, 21, 17, '2018-10-31', '', 1, 600000, 1, '2018-10-30', 'PS03013', 1),
	(15, 34, 23, '2018-11-29', '', 1, 500000, 1, '2018-11-28', 'PS02826', 0);


CREATE TABLE IF NOT EXISTS `tb_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama_lengkap` varchar(50) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `no_ktp` varchar(50) NOT NULL,
  `alamat` text DEFAULT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `hak_akses` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;


INSERT INTO `tb_users` (`id`, `email`, `username`, `nama_lengkap`, `no_telp`, `no_ktp`, `alamat`, `password`, `status`, `hak_akses`) VALUES
	(1, 'admintiket@gmail.com', 'admin', 'admin tiket', '085255555322', '', NULL, '21232f297a57a5a743894a0e4a801fc3', 1, 'admin'),
	(2, 'suhe.deb@gmail.com', 'suhermanxor', 'suherman', '08124281510', '73245678909876543456', 'masumpu desa watutoa kecamatan marioriwawo', '21232f297a57a5a743894a0e4a801fc3', 1, 'user');

