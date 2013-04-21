<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px  solid;background:;">
    <div style="height:25px;margin:1px;display:none;background:;">
        <div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">
            全站搜索
        </div>
        <div style="float:right;margin-right:10px;display:none">
            <a href="#" style="line-height:25px;color:">更多</a>
        </div>
    </div>
    <div style="padding:0px">
        <link href="<c:url value='/search/templates/css/searchform_9001.css' />" rel="stylesheet" type="text/css"/>
        <script language="javascript" src="<c:url value='/js/searchform.js' />"></script>
        <div class="globalsearchformzone">

            <form id="globalsearchform" method="get" action="#">

                <div class="globalsearchform">
                    <input name="key" type="text" id="globalsearchform_key" value="" size="28" class="input">
                </div>
                <div class="globalsearchform">
                    <input name="imageField" id="button" type="image" src="<c:url value='/search/templates/images/search_9001.gif' />">
                </div>
            </form>
        </div>

    </div>
</div>
