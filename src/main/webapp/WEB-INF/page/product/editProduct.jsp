<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
    <title>Add News</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8"  src="<c:url value='/tiny_mce/tiny_mce.js'/>"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            tinyMCE.init({
                // General options
                mode : "textareas",
                theme : "advanced",
                skin : "o2k7",
                plugins : "insertImg, insertAttachment, example,imgInsert,autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,inlinepopups,autosave",

                // Theme options
                theme_advanced_buttons1 : "insertAttachment, example,imgInsert,save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
                theme_advanced_buttons2 : "insertImg, cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
                theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
                theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft",
                theme_advanced_toolbar_location : "top",
                theme_advanced_toolbar_align : "left",
                theme_advanced_statusbar_location : "bottom",
                theme_advanced_resizing : true,

                // Example word content CSS (should be your site CSS) this one removes paragraph margins
                content_css : "css/word.css",

                // Drop lists for link/image/media/template dialogs
                template_external_list_url : "lists/template_list.js",
                external_link_list_url : "lists/link_list.js",
                external_image_list_url : "lists/image_list.js",
                media_external_list_url : "lists/media_list.js",

                // Replace values for the template plugin
                template_replace_values : {
                    username : "Some User",
                    staffid : "991234"
                }
            });
        });
    </script>
</head>
<body>
<form id="form" action="/backend/saveProduct" method="post" enctype="multipart/form-data">
    <input type="hidden" name="product.id" value="${product.id}">
    <p>name:<input type="text" name="product.name" value="${product.name}"></p>
    <p>function:<input type="text" name="product.function" value="${product.function}"></p>
    <p>price:<input type="text" name="product.price" value="${product.price}"></p>
    <p>volume:<input type="text" name="product.volume" value="${product.volume}"></p>
    <p>include:<input type="text" name="product.include" value="${product.include}"></p>
    <p>
        <select name="type">
            <c:if test="${typeList != null}">
                <c:forEach items="${typeList}" var="i">
                    <option value="${i.id}">${i.name}</option>
                </c:forEach>
            </c:if>
        </select>
    </p>
    <p>
        <textarea name="product.description" rows="25">${product.description}</textarea>
    </p>
    <p>
        <img src="${product.picUrl}">
        <input type="file" name="file">
    </p>
    <p>
        <input type="submit" value="submit">
        <input type="reset" value="reset">
    </p>
</form>
</body>
</html>