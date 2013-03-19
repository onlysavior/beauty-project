var http=createRequestObject();
var uploader="";
var uploadDir="";
var dirname="";
var filename="";
var timeInterval="";
var idname="";

function createRequestObject() {
    var obj;
    var browser = navigator.appName;
    if(browser == "Microsoft Internet Explorer"){
    	return new ActiveXObject("Microsoft.XMLHTTP");
    }
    else{
    	return new XMLHttpRequest();
    }   
}
function traceUpload() {
   http.onreadystatechange = handleResponse;
   http.open("GET", 'js/ajax/imageupload.php?uploadDir='+uploadDir+'&dirname='+dirname+'&filename='+filename+'&uploader='+uploader); 
   http.send(null);   
}
function handleResponse() {
	if(http.readyState == 4){
		var response=http.responseText; 
		if(response.indexOf("File uploaded") != -1){
			clearInterval(timeInterval);
			//document.getElementById('loading'+idname).innerHTML="";
		}
        document.getElementById(uploaderId).innerHTML=response;
    }
    else {
    	document.getElementById(uploaderId).innerHTML="Uploading File. Please wait...";
    }
}
function uploadFile(obj, dname) {
	uploadDir=obj.value; //
	idname=obj.name;
	dirname="upload"; //用的是imageupload的相对dir
	var filefix=uploadDir.substr(uploadDir.lastIndexOf('.')+1, uploadDir.length);
	var currentDate = new Date();
	var oriDate = new Date(0); //The time in 1970-01-01
	
	//File`s name will be the seconds to oriDate.
	//It should be uniqueness.
	var phName = parseInt((currentDate.getTime() - oriDate.getTime()) / 1000 ); 
	
	filename = phName + "." + filefix;

	//filename = uploadDir.substr(uploadDir.lastIndexOf('\\')+1);

	//document.getElementById('loading'+idname).innerHTML="<img src='loading.gif' alt='loading...' />";
	uploaderId = 'uploader'+obj.name;
	uploader = obj.name;
	document.getElementById("filenames").value = filename;
	if(store[filefix])
	{
		document.getElementById('formName'+obj.name).submit();
		timeInterval=setInterval("traceUpload()", 1500);
	}
	else
		alert("请插入图片");
	
}