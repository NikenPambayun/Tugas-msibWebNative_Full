<br>
<?php
error_reporting(0);
$obj_jenis_produk = new JenisProduk();
$data_jenis_produk =$obj_jenis_produk->JenisProduk();
$idedit = $_REQUEST['idedit'];
$jenis_prod = !empty($idedit) ?$obj_jenis_produk->getJenisProduk($idedit) : array();
?>
<form action="jenis_produk_controller.php" method="POST">
      <div class="form-group row">
        <label for="text2" class="col-4 col-form-label">Nama</label> 
        <div class="col-8">
          <input id="nama" name="nama" type="text" class="form-control" value="<?= $jenis_prod['nama'] ?>">
        </div>
      </div>
      <div class="form-group row">
        <label for="text3" class="col-4 col-form-label">Keterangan</label> 
        <div class="col-8">
          <input id="ket" name="ket" type="text" class="form-control" value="<?= $jenis_prod['ket'] ?>">
        </div>
      </div>
      <div class="form-group row">
        <div class="offset-4 col-8">
          
          <?php
            if(empty($idedit)){
          ?>
          <button name="proses" type="submit" value="simpan" class="btn btn-primary">Submit</button>
          <?php
            }
            else{
              ?>
              <button name="proses" type="submit" value="ubah" class="btn btn-primary">Update</button>
              <input type="hidden" name="idx" value="<?= $idedit ?>">
              <?php
            }
            ?>
            <button name="proses" type="submit" value="batal" class="btn btn-primary">Cancel</button>
        </div>
      </div>
    </form>