<?php
// include_once 'top.php';

// include_once 'menu.php';
$model = new Pelanggan();
$data_pelanggan = $model->dataPelanggan();

// foreach ($data_produk as $row){
//     print $row['kode'];
// }

$sesi =$_SESSION['MEMBER'];
if(isset($sesi)){

?>
                        <h1 class="mt-4">Tables</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header"> 
                                <!-- membuat tombol mengarahkan ke file produk_form.php -->
                                <?php
                                    if($sesi['role'] != 'staff'){
                                ?>
                                
                                <a href="index.php?url=pelanggan_form" class="btn btn-primary btn-sm"> Tambah </a>
                            
                                <?php } ?>
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Kode</th>
                                            <th>Nama Pelanggan</th>
                                            <th>Jenis Kelamin</th>
                                            <th>Tempat Lahir</th>
                                            <th>Tanggal Lahir</th>
                                            <th>Email</th>
                                            <th>Kartu</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>No</th>
                                            <th>Kode</th>
                                            <th>Nama Pelanggan</th>
                                            <th>Jenis Kelamin</th>
                                            <th>Tempat Lahir</th>
                                            <th>Tanggal Lahir</th>
                                            <th>Email</th>
                                            <th>Kartu</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <?php
                                        $no = 1;
                                        foreach($data_pelanggan as $row){

                                        ?>
                                        <tr>
                                            <td><?= $no ?></td>
                                            <td><?= $row['kode']?></td>
                                            <td><?= $row['nama_pelanggan']?></td>
                                            <td><?= $row['jk']?></td>
                                            <td><?= $row['tmp_lahir']?></td>
                                            <td><?= $row['tgl_lahir']?></td>
                                            <td><?= $row['email']?></td>
                                            <td><?= $row['kartu']?></td>
                                            <td>
                                                <form action="pelanggan_controller.php" method="post">
                                                    <a class="btn btn-info btn-sm" href="index.php?url=pelanggan_detail&id=<?= $row ['id'] ?>">Detail</a>
                                                    
                                                    <?php
                                                        if($sesi['role'] == 'admin'){
                                                    ?>

                                                    <a class="btn btn-warning btn-sm" href="index.php?url=pelanggan_form&idedit=<?= $row ['id'] ?>">Ubah</a>
                                                    <button type="submit" class="btn btn-danger btn-sm" name="proses" value="hapus"
                                                    onclick="return confirm('Anda yakin data ini akan dihapus?')">Hapus</button>

                                                    <input type="hidden" name="idx" value="<?= $row['id'] ?>">
                                                    <?php } ?>
                                                </form>
                                            </td>
                                        </tr>
                                      <?php
                                        $no++; 
                                    } 
                                        ?>
                                    </tbody>
                                </table>
                            </div>

</div>
</div>

                <?php
                } else {
                    echo '<script> alert("Anda Tidak Bisa Masuk");history.back();</script>';
                }
        // include_once 'bottom.php';
                ?>