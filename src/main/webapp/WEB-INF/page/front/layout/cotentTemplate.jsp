<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=7" />
    <title>${title}</title>
    <meta content="" name="keywords" />
    <meta content="" name="description" />
    <link href="<c:url value='/base/templates/css/common.css' />" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<c:url value='/base/js/base.js' />"></script>
    <script type="text/javascript" src="<c:url value='/base/js/common.js' />"></script>
    <script type="text/javascript" src="<c:url value='/base/js/form.js' />"></script>
    <script type="text/javascript" src="<c:url value='/base/js/blockui.js' />"></script>
    <!--  reload-->
</head>
<body style='background:#ffd700 url(../../effect/source/bg/x09.jpg) no-repeat fixed center top'>
<script>
    var PDV_PAGEID='313';
    var PDV_RP='../../';
    var PDV_COLTYPE='page';
    var PDV_PAGENAME='html_service';
</script>

<div id='contain' style='width:990px;background:none transparent scroll repeat 0% 0%;margin:0px auto;padding:0px'>

<div id='top' style='width:990px;height:365px;background:none transparent scroll repeat 0% 0%'>


    <!-- 头部自定义效果图 -->

    <div id='pdv_4950' class='pdv_class'  title='' style='width:990px;height:320px;top:43px;left:0px; z-index:1'>
        <div id='spdv_4950' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
            <div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px  solid;background:;">
                <div style="height:25px;margin:1px;display:none;background:;">
                    <div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">

                    </div>
                    <div style="float:right;margin-right:10px;display:none">
                        <a href="-1" style="line-height:25px;color:">更多</a>
                    </div>
                </div>
                <div style="padding:0px">


                    <img alt="" src="<c:url value='/diy/pics/20090623/1245726750.jpg' />" border="0" width="100%"/>

                </div>
            </div>

        </div>
    </div>

    <!-- 头部透明flash特效 -->

    <div id='pdv_4947' class='pdv_class'   style='width:976px;height:306px;top:44px;left:0px; z-index:4'>
        <div id='spdv_4947' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
            <div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px  solid;background:;">
                <div style="height:25px;margin:1px;display:none;background:;">
                    <div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">

                    </div>
                    <div style="float:right;margin-right:10px;display:none">
                        <a href="#" style="line-height:25px;color:">更多</a>
                    </div>
                </div>
                <div style="padding:0px">
                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="100%" height="100%">
                        <param name="movie" value="<c:url value='/effect/templates/images/traflash/4.swf' />">
                        <param name="quality" value="high">
                        <param name="wmode" value="transparent">
                        <embed src="<c:url value='/effect/templates/images/traflash/4.swf' />" wmode="transparent" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="100%" height="100%"></embed>
                    </object>

                </div>
            </div>

        </div>
    </div>

    <!-- 网站标志 -->

    <div id='pdv_4948' class='pdv_class'  title='' style='width:285px;height:86px;top:73px;left:66px; z-index:5'>
        <div id='spdv_4948' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
            <div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px  solid;background:;">
                <div style="height:25px;margin:1px;display:none;background:;">
                    <div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">

                    </div>
                    <div style="float:right;margin-right:10px;display:none">
                        <a href="#" style="line-height:25px;color:">更多</a>
                    </div>
                </div>
                <div style="padding:0px">

                </div>
            </div>

        </div>
    </div>

    <!-- 全站搜索表单 -->

    <div id='pdv_4945' class='pdv_class'  title='全站搜索' style='width:357px;height:55px;top:0px;left:633px; z-index:8'>
        <div id='spdv_4945' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
            <tiles:insertAttribute name="searchform"/>

        </div>
    </div>

    <!-- 一级导航菜单 -->

    <div id='pdv_4949' class='pdv_class'   style='width:656px;height:59px;top:0px;left:0px; z-index:9'>
        <div id='spdv_4949' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
           <tiles:insertAttribute name="toplink" />

        </div>
    </div>
</div>

<div id='content' style='width:990px;height:419px;background:#ffffff;margin:0px auto'>

    <tiles:insertAttribute name="content" />
    <!-- 网页标题(菜单) -->

    <div id='pdv_4660' class='pdv_class'  title='企业介绍' style='width:220px;height:396px;top:7px;left:2px; z-index:3'>
        <div id='spdv_4660' class='pdv_content' style='overflow:hidden;width:100%;height:100%'>
        <tiles:insertAttribute name="leftlink" />

        </div>
    </div>
</div>
<div id='bottom' style='width:990px;height:42px;background:url(<c:url value='/effect/source/bg/x09.jpg'/>) #000000'>


    <!-- 底部信息编辑区 -->

    <div id='pdv_4951' class='pdv_class'  title='脚注信息' style='width:306px;height:23px;top:15px;left:594px; z-index:6'>
        <div id='spdv_4951' class='pdv_bottom' style='overflow:hidden;width:100%;height:100%'>
            <div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px  solid;background:;">
                <div style="height:25px;margin:1px;display:none;background:;">
                    <div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">
                        脚注信息
                    </div>
                    <div style="float:right;margin-right:10px;display:none">
                        <a href="#" style="line-height:25px;color:">更多</a>
                    </div>
                </div>
                <div style="padding:0px">
                    <div style="width:100%;text-align:center;font:12px/20px Arial, Helvetica, sans-serif">
                        <p style="MARGIN: 0px; COLOR: #ffffff">古之美美容养生馆 Copyright(C)2013</p>
                    </div>

                </div>
            </div>

        </div>
    </div>

    <!-- 底部菜单（一级） -->

    <div id='pdv_4946' class='pdv_class'   style='width:331px;height:33px;top:7px;left:0px; z-index:7'>
        <div id='spdv_4946' class='pdv_bottom' style='overflow:hidden;width:100%;height:100%'>
            <tiles:insertAttribute name="bottomlink" />

        </div>
    </div>
</div>
</div><div id='bodyex'>

</div>

</body>
</html>
