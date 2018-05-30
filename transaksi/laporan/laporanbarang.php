<?php 
	$con   = mysqli_connect("localhost","root","","db_bayi");
	$query =mysqli_query($con,"select * from tbl_barang");
	$data  =mysqli_fetch_array($query);


 ?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<style type="text/css">
		.tabel {
			border-style: 1px solid black;
		}
	</style>
	<br>
	<br>
	<center>
		<h1>Laporan Barang</h1>
<table border="1" style="text-align: center;width: 90%; height: 50%" class="tabel">
	
		<tr>
			<td>No</td>

			<td>Kode Barang</td>
			<td>Merek</td>
			<td>Harga</td>
			<td>Stok</td>
			<td>Kategori</td>
			<td>Tanggal Kadaluarsa</td>
		</tr>
	<?php
	$sql = mysqli_query($con,"select * from tbl_barang");
	$no =0;

	while ($d = mysqli_fetch_array($sql) ) {
		$no++;

		?>
		<tr>
			<td><?php echo $no ?></td>

			<td><?php echo $d['kd_barang']?></td>
			<td><?php echo $d['nama'] ?></td>
			<td><?php echo $d['harga'] ?></td>
			<td><?php echo $d['stok'] ?></td>
			<td><?php echo $d['kategori'] ?></td>
			<td><?php echo $no ?></td>
		</tr>
		<?php
	}
	?>
	</table>
</center>
</body>
</html>


