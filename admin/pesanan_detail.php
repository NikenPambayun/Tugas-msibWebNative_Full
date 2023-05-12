<?php
$id = $_REQUEST['id'];
$model = new Pesanan();
$pesanan = $model->getPesanan($id);
?>

<h1 class="mt-4">Detail Pesanan</h1>
<div class="card-body">
    <div class="card mb-4">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>Tanggal</th>
                        <th>Total</th>
                        <th>Pelanggan</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><?= $pesanan['tanggal']?></td>
                        <td><?= $pesanan['total']?></td>
                        <td><?= $pesanan['pelanggan']?></td>
                    </tr>
                </tbody>
            </table>
    </div>
</div>