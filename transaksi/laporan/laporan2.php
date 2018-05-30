<?php 
	$con   = mysqli_connect("localhost","root","","db_bayi");
	$query =mysqli_query($con,"select * from tmp_transaksi");
	$data  =mysqli_fetch_array($query);	
 ?>
 <!DOCTYPE html>
 <html>
 <head>
 	<title>	</title>
 	<style type="css">
 		.name{
 			font-size:100px;
 		}
 		p.total{
margin-left: 	10px;
 		}
 	</style>
 </head>
 <body>
 <center>
<div style="width: 650px; height: auto; border: 2px solid black ; margin-top:100px;">
	 <h1 style="margin-top:40px; " class="name"><img src="img/dot.png"> The Baeby Factory</h1>
	<br>
	<br>
	<hr style="border:1px solid black; width:650PX	">
	<p style="float: left; margin-left: 30px;">Tanggal Pembelian :  <?php echo date("Y-m-d") ?></p>
	<p style="float: left; margin-left: 230px;">No Faktur  :  <?php echo @$_GET['kode'] ?></p><br>
	<br><br>
	
	<table  style="border:2px solid black; width:650PX	"	>
		<tr >
			<td>No</td>
			<td>Nama Barang</td>
			<td>Harga</td>
			<td>Jumlah</td>
			<td>Total</td>
		</tr>
	<?php
	$sql = mysqli_query($con,"select * from tmp_transaksi");
	$no =0;
	$total  = 0;
	while ($d = mysqli_fetch_array($sql) ) {
		$no++;
		$total = $total + $d['total'];
		?>
		<tr>
			<td><?php echo $no ?></td>
			<td><?php echo $d['nama_barang'] ?></td>
			<td><?php echo $d['harga'] ?></td>
			<td><?php echo $d['jumlah'] ?></td>
			<td><?php echo $d['total'] ?></td>
		</tr>
		<?php
	}
	?>
	</table>
	
	<p style="margin-left:60%">Total Harga :<?php echo $total ?></p>
	<hr <hr style="border:1px solid black; width:650PX	">
	<p>Terima Kasih, Silahkan Kembali Lagi</p>
</div>
</center>
<?php 
	$truncate = mysqli_query($con,"truncate tmp_transaksi");
 ?>
 </body>
 </html>

