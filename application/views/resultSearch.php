<!DOCTYPE html>
<html>
<head>
    <?php $this->load->view('layout/meta'); ?>
	<title>Tiket Pesawat - Tiket Soppeng</title>
	<?php $this->load->view('layout/css'); ?>
</head>
<body>

<?php $this->load->view('layout/header'); ?>

<div class="back-banner box-shadow-bt">
    <div class="title-all">
        <h2 class="font-white">Hasil Pencarian Pesawat</h2>   
    </div>
</div>
<div class="container-fluid">
    <div class="section" style="margin-bottom: 8%;">
        <div class="mt-inner">
            <div class="pt-inner2">
                <?php 
                    if($pesawat != null) {
                ?>
                <div class="row">
                    <?php
                        foreach($pesawat as $row) {
                    ?>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img src="<?php echo base_url('assets/front/images/plane.png'); ?>" style="padding-top: 22px" class="img-auto">
                            <div class="caption">
                                <div style="display: flex;padding-top: 22px;padding-bottom: 2px;">
                                    <h4 style="width: 100%;"><p><b>Jam Berangkat</b></p><?php echo $row->jam_keberangkatan; ?></h4>
                                    <h4 style="float: right;text-align: right;width: 100%;"><p><b>Jam Tiba</b></p><?php echo $row->jam_tiba; ?></h4>
                                </div>
                                <div style="display: flex;padding-bottom: 6px;">
                                    <input type="hidden" value="<?php echo $row->id; ?>">
                                    <h4 style="width: 100%;"><p><b>Keberangkatan</b></p><?php echo $row->keberangkatan ?></h4>
                                    <input type="hidden" name="tgl_keberangkatan" value="<?php echo $this->session->userdata('tgl'); ?>" />
                                    <h4 style="float: right;text-align: right;width: 100%;"><p><b>Tujuan</b></p><?php echo $row->tujuan; ?></h4>
                                </div>
                                <div style="display: flex;padding-bottom: 6px;">
                                    <input type="hidden" value="<?php echo $row->id; ?>">
                                    <h4 style="width: 100%;"><p><b>Nama Pesawat</b></p><?php echo $row->nama_pesawat ?></h4>
                                    <input type="hidden" name="tgl_keberangkatan" value="<?php echo $this->session->userdata('tgl'); ?>" />
                                    <h4 style="float: right;text-align: right;width: 100%;"><p><b>Harga</b></p>Rp. <?php echo $row->harga; ?></h4>
                                </div>
                                <?php 
                                    $id_pesawat = $row->id;
                                    $id_encode = urlencode(base64_encode($id_pesawat));
                                ?>
                                <a href="<?php echo base_url('transaksi/details/'.$id_encode) ?>" class="btn btn-default">Pilih Pesawat</a>
                                <?php ?>
                            </div>
                        </div>
                    </div>
                    <?php
                        }
                    } 
                    else {
                    ?>
                    <div class="row">
                        <h3 class="bold" style="text-align: center;">Tidak Ada Data Yang Ditemukan</h3>
                    </div>
                    <?php 
                    }
                    ?>
                </div>

            </div>
        </div>
    </div>
    
	<?php $this->load->view('layout/footer'); ?>
	
</div>

	<a href="#header" id="backtotop" class="bg-purple"><i class="fa fa-chevron-up fa-2x"></i></a>

<?php $this->load->view('layout/js'); ?>
</body>
</html>