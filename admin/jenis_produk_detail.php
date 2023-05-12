<?php
$id = $_REQUEST['id'];
$model = new JenisProduk();
$jenis_produk = $model->getJenisProduk($id);
?>

<h1 class="mt-4">Detail Jenis Produk</h1>
<div class="card-body">
    <div class="card mb-4">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>Nama</th>
                        <th>Keterangan</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><?= $jenis_produk['nama']?></td>
                        <td><?= $jenis_produk['ket']?></td>
                    </tr>
                </tbody>
            </table>
    </div>
</div>