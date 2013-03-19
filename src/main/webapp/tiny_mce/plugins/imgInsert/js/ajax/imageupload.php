<?php
/**
 * This file uploads a file in the back end, without refreshing the page
 *  
 */
@session_start();

if (isset($_POST['id'])) {
	$dirname = "upload";
	$uploadFile=$dirname."/".$_FILES[$_POST['id']]['name'];
	$uploadFileName = $_POST['filenames'];
	if(!is_dir($dirname)) {
		echo '<script> alert("Failed to find the final upload directory: "+"'.$dirname.'");</script>';
	}
	if (!copy($_FILES[$_POST['id']]['tmp_name'], $dirname.'/'.$uploadFileName)) {	
		echo '<script> alert("Failed to upload file");</script>';
	}
}
else {
	$uploadFile=$_GET['dirname']."/".$_GET['filename'];
	$uploadDir = 'js/ajax/upload'."/".$_GET['filename'];
	if (file_exists($uploadFile)) {
		echo "上传成功. <a href='javascript:ImgInsertDialog.insert(\"".$_GET['filename']."\");'>插入</a> &nbsp;&nbsp;&nbsp; <a href='javascript:ImgInsertDialog.resets();'>重选</a><br />";	
	}
	else {
		echo "<img src='loading.gif' alt='loading...' />";
		echo $uploadFile;
	}
}
?>