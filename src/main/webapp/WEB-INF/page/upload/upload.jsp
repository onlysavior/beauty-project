<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<c:if test="${imageURLList != null}">
    <script type='text/javascript'>
        setTimeout(function(){
            var url = $("#info").attr("value");
            alert(url);
            self.parent.attachmentDialog.insert(url);}, 1000);
    </script>
    <input type="hidden" value="${imageURLList}" id="info"/>
</c:if>