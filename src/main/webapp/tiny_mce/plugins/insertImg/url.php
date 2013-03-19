<?php

	//处理上传
	//....
	
	//得到url链接地址
	$s =  "http://localhost:8080/EcardDevelopment/resource/images/1x.jpg";
	$ddd = $_GET["name"];
	
	//如果上传成功
	//self.parent.attachmentDialog.insert('url');
	if($ddd == 123) echo "<script type='text/javascript'>"."setTimeout(function(){self.parent.attachmentDialog.insertPre('".$s."');}, 1000);</script>";
	
	//如果上传失败
	//self.parent.attachmentDialog.uploadFail(1);
	//if($ddd == 123) echo "<script type='text/javascript'>"."setTimeout(function(){self.parent.attachmentDialog.uploadFail(1);}, 5000);</script>";
?>