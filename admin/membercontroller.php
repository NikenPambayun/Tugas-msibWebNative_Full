<?php
session_start(); //memulai session
include_once 'koneksi.php';
include_once 'models/Member.php';
//1.tangkap request form
$username = $_POST['username'];
$password = $_POST['password'];
//2.simpan ke sebuah array
$data = [
    $username,
    $password
];

$model = new Member();
$rs = $model->cekLogin($data);  //cek login ini diarahkan ke models/Member.php
if (!empty($rs)) {
    $_SESSION['MEMBER'] = $rs;
    header('Location:http://localhost/Tugas-msibWebNative_Full/admin/index.php?url=product');
}
else {
    echo '<script> alert("Username atau Password anda salah");history.back();</script>';
}
?>