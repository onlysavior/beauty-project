<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
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

            <form name="f1" onsubmit="return g(this)" class="search">

                <div class="globalsearchform">
                    <input name=word size="30" maxlength="100">
                </div>
                <div class="globalsearchform">
                    <input name="imageField" onclick="submit()" id="button" type="image" src="<c:url value='/search/templates/images/search_9001.gif' />">
                </div>
                <input name=tn type=hidden value="bds">
                <input name=cl type=hidden value="3">
                <input name=ct type=hidden>
            </form>
        </div>

    </div>
</div>
<SCRIPT language=javascript>
    function g(formname)	{
        var url = "http://www.baidu.com/baidu";
        formname.ct.value = "0";
        formname.action = url;
        return true;
    }

    function submit() {
        $(".search").submit();
    }
</SCRIPT>
