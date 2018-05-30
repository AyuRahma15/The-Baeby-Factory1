<?php 
	$con   = mysqli_connect("localhost","root","","db_bayi");
	$query =mysqli_query($con,"select * from q_tran");
	$data  =mysqli_fetch_array($query);	
 ?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

	
	<br>
	<br>
	<center>
		<h1>Laporan Transaksi</h1>
<table border="1px solid black" style="text-align: center;width: 90%; height: 50%" class="tabel"">
	
		<tr>


			<td>Kode Transaksi</td>
			<td>Tanggal Pembelian</td>
			<td>Merek</td>
			<td>Harga</td>
			<td>Total</td>

		</tr>
	<?php
	$sql = mysqli_query($con,"select * from q_tran");

	while ($d = mysqli_fetch_array($sql) ) {
		

		?>
		<tr>

			<td><?php echo $d['kd_transaksi']?></td>
			<td><?php echo $d['tgl_pembelian'] ?></td>
			<td><?php echo $d['nama'] ?></td>
			<td><?php echo $d['harga'] ?></td>
			<td><?php echo $d['total'] ?></td>
		</tr>
		<?php
	}
	?>
	</table>
	</center>
</body>
</html>


