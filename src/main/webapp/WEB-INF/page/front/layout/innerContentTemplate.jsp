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
    <meta content="0" name="keywords" />
    <meta content="0" name="description" />
    <link href="<c:url value='/base/templates/css/common.css' />" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<c:url value='/base/js/base.js' />"></script>
    <script type="text/javascript" src="<c:url value='/base/js/common.js' />"></script>
    <script type="text/javascript" src="<c:url value='/base/js/form.js' />"></script>
    <script type="text/javascript" src="<c:url value='/base/js/blockui.js' />"></script>
    <!-reload-!>
</head>
<body style='background:#ffd700 url(<c:url value='/effect/source/bg/x09.jpg' />) no-repeat fixed center top'>
<script>
    var PDV_PAGEID='3';
    var PDV_RP='../../';
    var PDV_COLTYPE='news';
    var PDV_PAGENAME='detail';
</script>

<div id='contain' style='width:990px;background:none transparent scroll repeat 0% 0%;margin:0px auto;padding:0px'>

<div id='top' style='width:990px;height:365px;background:none transparent scroll repeat 0% 0%'>


    <!-- 头部自定义效果图 -->

    <div id='pdv_5038' class='pdv_class'  title='' style='width:990px;height:320px;top:43px;left:0px; z-index:2'>
        <div id='spdv_5038' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
            <div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px  solid;background:;">
                <div style="height:25px;margin:1px;display:none;background:;">
                    <div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">

                    </div>
                    <div style="float:right;margin-right:10px;display:none">
                        <a href="-1" style="line-height:25px;color:">更多</a>
                    </div>
                </div>
                <div style="padding:0px">


                    <img src="<c:url value='/diy/pics/20090623/1245726750.jpg' />" border="0" width="100%" />

                </div>
            </div>

        </div>
    </div>

    <!-- 头部透明flash特效 -->

    <div id='pdv_5040' class='pdv_class'   style='width:976px;height:306px;top:44px;left:0px; z-index:3'>
        <div id='spdv_5040' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
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
                        <embed src="<c:url value='/effect/templates/images/traflash/4.swf ' />" wmode="transparent" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="100%" height="100%"></embed>
                    </object>

                </div>
            </div>

        </div>
    </div>

    <!-- 网站标志 -->

    <div id='pdv_5036' class='pdv_class'  title='' style='width:285px;height:86px;top:73px;left:66px; z-index:4'>
        <div id='spdv_5036' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
            <div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px  solid;background:;">
                <div style="height:25px;margin:1px;display:none;background:;">
                    <div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">

                    </div>
                    <div style="float:right;margin-right:10px;display:none">
                        <a href="-1" style="line-height:25px;color:">更多</a>
                    </div>
                </div>
                <div style="padding:0px">


                    <a href="default.htm#"><img src="<c:url value='/advs/pics/20090623/1245725370.gif' />" border="0" /></a>


                </div>
            </div>

        </div>
    </div>

    <!-- 全站搜索表单 -->

    <div id='pdv_5037' class='pdv_class'  title='全站搜索' style='width:357px;height:55px;top:0px;left:633px; z-index:10'>
        <div id='spdv_5037' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
            <tiles:insertAttribute name="searchform" />

        </div>
    </div>

    <!-- 一级导航菜单 -->

    <div id='pdv_5041' class='pdv_class'   style='width:656px;height:59px;top:0px;left:0px; z-index:11'>
        <div id='spdv_5041' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
            <tiles:insertAttribute name="leftlink" />

        </div>
    </div>
</div>
<div id='content' style='width:990px;height:407px;background:#ffffff;margin:0px auto'>


    <!-- 文章搜索表单 -->

    <div id='pdv_4286' class='pdv_class'  title='新闻搜索' style='width:230px;height:197px;top:1px;left:755px; z-index:1'>
        <div id='spdv_4286' class='pdv_content' style='overflow:hidden;width:100%;height:100%'>
            <div class="pdv_border" style="border:1px #ffd2a3 solid;background:#fff;padding:0px;margin:0px;height:100%">
                <div style="background:#fff5dd;height:26px;border-bottom:1px #ffd2a3 solid">
                    <div style="float:left;background:url(<c:url value='/base/border/509/images/li.gif' />) 10px no-repeat;padding-left:28px;color:#555;text-align:left;font:12px/26px simsun;">新闻搜索</div>
                    <div style="float:right;margin-right:8px">
                        <a href="#" style="font:12px/24px simsun;color:#555;display:none">更多&gt;&gt;</a>
                    </div>
                </div>
                <div  style="padding:10px">
                    <link href="<c:url value = '/templates/css/searchform.css' />" rel="stylesheet" type="text/css" />
                    <div class="newssearchform">
                        <form id="searchform" method="get" action="#">
                            <div class="searchform">
                                <select name="catid" id="catid"  >
                                    <option value="0" >请选择分类</option>

                                    <option value='1'>企业新闻</option><option value='2'>行业动态</option><option value='73'>产品知识</option>

                                </select>
                            </div>
                            <div class="searchform">
                                <input name="key" type="text" id="key" value="" size="16" class="input">
                            </div>
                            <div class="searchform">
                                <input name="imageField" id="button" type="image" src="<c:url value='/templates/images/search5.gif' />" >
                            </div>
                        </form>
                    </div>

                </div>
            </div>

        </div>
    </div>

    <!-- 当前位置提示条 -->

    <div id='pdv_4288' class='pdv_class'  title='当前位置' style='width:744px;height:39px;top:1px;left:1px; z-index:5'>
        <div id='spdv_4288' class='pdv_content' style='overflow:hidden;width:100%;height:100%'>
            <!-- Crumb or border -->
            <tiles:insertAttribute name="crumb" />
            <div style="margin-top:-9px;height:9px;line-height:9px;background:url(<c:url value='/base/border/516/images/top.png' />) 0px -98px no-repeat">&nbsp;</div>
            <div style="float:right;margin-top:-9px;width:10px;height:9px;line-height:9px;background:url(<c:url value='/base/border/516/images/top.png' />) -890px -98px no-repeat">&nbsp;</div>

        </div>
    </div>
    <!--Content-->
    <tiles:insertAttribute name="subTemplate" />
    <!-- 文章一级分类 -->

    <div id='pdv_4912' class='pdv_class'  title='分类导航' style='width:232px;height:200px;top:205px;left:755px; z-index:9'>
        <div id='spdv_4912' class='pdv_content' style='overflow:hidden;width:100%;height:100%'>
            <div class="pdv_border" style="border:1px #ffd2a3 solid;background:#fff;padding:0px;margin:0px;height:100%">
                <div style="background:#fff5dd;height:26px;border-bottom:1px #ffd2a3 solid">
                    <div style="float:left;background:url(<c:url value='/base/border/509/images/li.gif' />) 10px no-repeat;padding-left:28px;color:#555;text-align:left;font:12px/26px simsun;">分类导航</div>
                    <div style="float:right;margin-right:8px">
                        <a href="#" style="font:12px/24px simsun;color:#555;display:none">更多&gt;&gt;</a>
                    </div>
                </div>
                <div  style="padding:12px">

                    <link href="<c:url value='/templates/css/newsclass_menu703.css' />" rel="stylesheet" type="text/css" />
                    <div class="newsclass_menu703">
                        <c:forEach items="${newsTypes}" var="i">
                            <a href="#" target="_self" class="newsclass_menu703">${i.name}</a>
                        </c:forEach>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
<div id='bottom' style='width:990px;height:42px;background:url(<c:url value='/effect/source/bg/x09.jpg' />) #000000'>


    <!-- 底部信息编辑区 -->

    <div id='pdv_5042' class='pdv_class'  title='脚注信息' style='width:306px;height:23px;top:15px;left:594px; z-index:6'>
        <div id='spdv_5042' class='pdv_bottom' style='overflow:hidden;width:100%;height:100%'>
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
                        <p style="MARGIN: 0px; COLOR: #ffffff">健康美容SPA养生馆 Copyright(C)2009-2010</p>
                    </div>

                </div>
            </div>

        </div>
    </div>

    <!-- 底部菜单（一级） -->

    <div id='pdv_5039' class='pdv_class'   style='width:331px;height:33px;top:7px;left:0px; z-index:8'>
        <div id='spdv_5039' class='pdv_bottom' style='overflow:hidden;width:100%;height:100%'>
           <tiles:insertAttribute name="bottomlink" />

        </div>
    </div>
</div>
</div><div id='bodyex'>

</div>

</body>
</html>
