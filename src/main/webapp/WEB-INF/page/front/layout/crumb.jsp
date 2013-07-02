<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="pdv_border" style="border:1px #ddd solid;height:100%;padding:0;margin:0;background:#f8f8f8">
    <div style="position:relative;height:8px;line-height:8px;border:0px;padding:0;margin:-1px -1px 0px -1px;background:url(../../base/border/516/images/top.png) 0px 0px no-repeat;">
        <div style="float:left;width:8px;height:8px;line-height:8px;background:url(<c:url value='/base/border/516/images/top.png' />) 0px 0px no-repeat">
        </div>
        <div style="float:right;width:8px;height:8px;line-height:8px;background:url(<c:url value='/base/border/516/images/top.png' />) -892px 0px no-repeat">
        </div>

    </div>

    <div style="margin:0px 7px 0px 7px;padding:2px">

        <link href="<c:url value='/templates/css/nav.css' />" rel="stylesheet" type="text/css" />

        <div id="nav">
            您现在的位置：<a href="${website}/front/index">index</a>
            <c:forEach items="${crumbList}" var="i">
                &gt; <a href="${i.url}" >${i.title}</a>
            </c:forEach>

        </div>

    </div>
</div>