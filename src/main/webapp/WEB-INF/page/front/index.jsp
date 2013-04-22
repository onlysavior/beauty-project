<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=7" />
    <title>-健康美容SPA养生馆</title>
    <meta content="" name="keywords" />
    <meta content="" name="description" />
    <link href="<c:url value='/base/templates/css/common.css' />" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<c:url value='/base/js/base.js' />"></script>
    <script type="text/javascript" src="<c:url value='/base/js/common.js' />"></script>
    <script type="text/javascript" src="<c:url value='/base/js/form.js' />"></script>
    <script type="text/javascript" src="<c:url value='/base/js/blockui.js' />"></script>
    <!-reload-!>
</head>
<body style='background:#ffd700 url(<c:url value='/effect/source/bg/x09.jpg' />) no-repeat fixed center top'>
<script>
    var PDV_PAGEID='1';
    var PDV_RP='';
    var PDV_COLTYPE='index';
    var PDV_PAGENAME='index';
</script>

<div id='contain' style='width:990px;background:none transparent scroll repeat 0% 0%;margin:0px auto;padding:0px'>

<div id='top' style='width:990px;height:365px;background:none transparent scroll repeat 0% 0%'>


    <!-- 头部自定义效果图 -->

    <div id='pdv_4964' class='pdv_class'  title='' style='width:990px;height:320px;top:43px;left:0px; z-index:3'>
        <div id='spdv_4964' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
            <div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px  solid;background:;">
                <div style="height:25px;margin:1px;display:none;background:;">
                    <div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">

                    </div>
                    <div style="float:right;margin-right:10px;display:none">
                        <a href="#" style="line-height:25px;color:">更多</a>
                    </div>
                </div>
                <div style="padding:0px">


                    <img src="<c:url value='/diy/pics/20090623/1245726750.jpg' />" border="0" width="100%" />

                </div>
            </div>

        </div>
    </div>

    <!-- 头部透明flash特效 -->

    <div id='pdv_4961' class='pdv_class'   style='width:976px;height:306px;top:44px;left:0px; z-index:4'>
        <div id='spdv_4961' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
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

    <div id='pdv_4962' class='pdv_class'  title='' style='width:285px;height:86px;top:73px;left:66px; z-index:5'>
        <div id='spdv_4962' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
            <div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px  solid;background:;">
                <div style="height:25px;margin:1px;display:none;background:;">
                    <div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">

                    </div>
                    <div style="float:right;margin-right:10px;display:none">
                        <a href="#" style="line-height:25px;color:">更多</a>
                    </div>
                </div>
                <div style="padding:0px">


                    <a href="#"><img src="<c:url value='/advs/pics/20090623/1245725370.gif' />" border="0" /></a>


                </div>
            </div>

        </div>
    </div>

    <!-- 全站搜索表单 -->

    <div id='pdv_4959' class='pdv_class'  title='全站搜索' style='width:357px;height:55px;top:0px;left:633px; z-index:14'>
        <div id='spdv_4959' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
           <tiles:insertAttribute name="searchform" />

        </div>
    </div>

    <!-- 一级导航菜单 -->

    <div id='pdv_4963' class='pdv_class'   style='width:656px;height:59px;top:0px;left:0px; z-index:15'>
        <div id='spdv_4963' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
            <!--top link-->
            <tiles:insertAttribute name="toplink" />
        </div>
    </div>
</div>
<div id='content' style='width:990px;height:601px;background:#ffffff;margin:0px auto'>


<!-- 空白边框 -->

<div id='pdv_4138' class='pdv_class'  title='公司简介' style='width:770px;height:228px;top:2px;left:216px; z-index:1'>
    <div id='spdv_4138' class='pdv_content' style='overflow:hidden;width:100%;height:100%'>
        <div class="pdv_border" style="border:1px #ffd2a3 solid;background:#fff;padding:0px;margin:0px;height:100%">
            <div style="background:#fff5dd;height:26px;border-bottom:1px #ffd2a3 solid">

                <div style="float:left;background:url(<c:url value='/base/border/509/images/li.gif' />) 10px no-repeat;padding-left:28px;color:#555;text-align:left;font:12px/26px simsun;">公司简介</div>
                <div style="float:right;margin-right:8px">
                    <a href="page/html/company.htm" style="font:12px/24px simsun;color:#555;display:inline">更多&gt;&gt;</a>
                </div>
            </div>
            <div  style="padding:0px">
                &nbsp;
            </div>
        </div>

    </div>
</div>

<!-- 网页标题(菜单) -->

<div id='pdv_4724' class='pdv_class'  title='企业介绍' style='width:209px;height:361px;top:2px;left:0px; z-index:2'>
    <div id='spdv_4724' class='pdv_content' style='overflow:hidden;width:100%;height:100%'>
        <!--left link -->
        <tiles:insertAttribute name="leftlink" />
    </div>
</div>

<!-- 自选产品列表 -->

<div id='pdv_3529' class='pdv_class'  title='产品系列' style='width:771px;height:206px;top:392px;left:216px; z-index:6'>
    <div id='spdv_3529' class='pdv_content' style='overflow:hidden;width:100%;height:100%'>

        <div class="pdv_border" style="border:1px #ffd2a3 solid;background:#fff;padding:0px;margin:0px;height:100%">

            <div style="background:#fff5dd;height:26px;border-bottom:1px #ffd2a3 solid">

                <div style="float:left;background:url(<c:url value='/base/border/509/images/li.gif' />) 10px no-repeat;padding-left:28px;color:#555;text-align:left;font:12px/26px simsun;">产品系列</div>
                <div style="float:right;margin-right:8px">
                    <a href="#" style="font:12px/24px simsun;color:#555;display:inline">更多&gt;&gt;</a>
                </div>
            </div>
            <div  style="padding:12px">

                <link href="<c:url value='/product/templates/css/productlist.css' />" rel="stylesheet" type="text/css" />
                <c:forEach items="${productList}" var="p">
                <div class="productlist">
                    <div class="fang" style="width:135px;height:115px">
                        <div class="picFit" style="width:135px;height:115px">
                            <a href="/front/showProduct/${p.id}" target="_self" ><img src="<c:url value='${p.picUrl}' />" style="width:135px;height:115px" border="0" /></a>
                        </div>
                    </div>
                    <div class="title">
                        <a href="/front/showProduct/${p.id}" target="_self" class="title" >${p.name}</a>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>


    </div>
</div>

<!-- 文章列表 -->

<div id='pdv_3526' class='pdv_class'  title='企业新闻' style='width:389px;height:154px;top:234px;left:217px; z-index:7'>
    <div id='spdv_3526' class='pdv_content' style='overflow:hidden;width:100%;height:100%'>
        <div class="pdv_border" style="border:1px #ffd2a3 solid;background:#fff;padding:0px;margin:0px;height:100%">
            <div style="background:#fff5dd;height:26px;border-bottom:1px #ffd2a3 solid">
                <div style="float:left;background:url(<c:url value='/base/border/509/images/li.gif' />) 10px no-repeat;padding-left:28px;color:#555;text-align:left;font:12px/26px simsun;">企业新闻</div>
                <div style="float:right;margin-right:8px">
                    <a href="#" style="font:12px/24px simsun;color:#555;display:inline">更多&gt;&gt;</a>
                </div>
            </div>
            <div  style="padding:12px">

                <link href="<c:url value='/news/templates/css/newslist_time.css' />" rel="stylesheet" type="text/css" />
                <ul class="newslist_time">
                    <c:forEach items="${newList}" var="i">
                        <li class="newslist_time">
                            <div class="time">
                              <fmt:formatDate value="${i.updatetime}" pattern="yyyy/MM/dd" />
                            </div>
                            <a href="/front/news/showOne/${i.id}" target="_self" class="newslist_time"   >${i.title}</a>
                        </li>
                    </c:forEach>

                </ul>

            </div>
        </div>

    </div>
</div>

<!-- 图片/FLASH -->

<div id='pdv_4139' class='pdv_class'  title='图片' style='width:248px;height:161px;top:39px;left:223px; z-index:9'>
    <div id='spdv_4139' class='pdv_content' style='overflow:hidden;width:100%;height:100%'>
        <div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px #eeeeee solid;background:#fff;">
            <div style="height:25px;margin:1px;display:none;background:#cccccc;">
                <div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:#fff">
                    图片
                </div>
                <div style="float:right;margin-right:10px;display:none">
                    <a href="#" style="line-height:25px;color:#fff">更多</a>
                </div>
            </div>
            <div style="padding:3px">


                <img src="<c:url value='${gzm.picUrl}' />" border="0" width="100%" />

            </div>
        </div>

    </div>
</div>

<!-- HTML编辑区 -->

<div id='pdv_4727' class='pdv_class'  title='自定内容' style='width:500px;height:186px;top:33px;left:476px; z-index:11'>
    <div id='spdv_4727' class='pdv_content' style='overflow:hidden;width:100%;height:100%'>
        <div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px  solid;background:;">
            <div style="height:25px;margin:1px;display:none;background:;">
                <div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">
                    自定内容
                </div>
                <div style="float:right;margin-right:10px;display:none">
                    <a href="#" style="line-height:25px;color:">更多</a>
                </div>
            </div>
            <div style="padding:0px">
                <p style="FONT: 12px/18px simsun">${gzm.content}</p>
            </div>
        </div>

    </div>
</div>

<!-- 文章列表 -->

<div id='pdv_4136' class='pdv_class'  title='行业资讯' style='width:377px;height:155px;top:234px;left:610px; z-index:12'>
    <div id='spdv_4136' class='pdv_content' style='overflow:hidden;width:100%;height:100%'>
        <div class="pdv_border" style="border:1px #ffd2a3 solid;background:#fff;padding:0px;margin:0px;height:100%">
            <div style="background:#fff5dd;height:26px;border-bottom:1px #ffd2a3 solid">
                <div style="float:left;background:url(<c:url value='/base/border/509/images/li.gif' />) 10px no-repeat;padding-left:28px;color:#555;text-align:left;font:12px/26px simsun;">行业资讯</div>
                <div style="float:right;margin-right:8px">
                    <a href="#" style="font:12px/24px simsun;color:#555;display:inline">更多&gt;&gt;</a>
                </div>
            </div>
            <div  style="padding:12px">

                <link href="<c:url value='/news/templates/css/newslist_time.css' />" rel="stylesheet" type="text/css" />
                <ul class="newslist_time">
                    <c:forEach items="${newList2}" var="i">
                        <li class="newslist_time">
                            <div class="time">
                                <fmt:formatDate value="${i.updatetime}" pattern="yyyy/MM/dd" />
                            </div>
                            <a href="#" target="_self" class="newslist_time">${i.title}</a>
                        </li>
                    </c:forEach>
                </ul>

            </div>
        </div>

    </div>
</div>

<!-- 多行文字 -->

<div id='pdv_4729' class='pdv_class'  title='联系我们' style='width:210px;height:229px;top:370px;left:0px; z-index:13'>
    <div id='spdv_4729' class='pdv_content' style='overflow:hidden;width:100%;height:100%'>
        <div class="pdv_border" style="border:1px #ffd2a3 solid;background:#fff;padding:0px;margin:0px;height:100%">
            <div style="background:#fff5dd;height:26px;border-bottom:1px #ffd2a3 solid">
                <div style="float:left;background:url(base/border/509/images/li.gif) 10px no-repeat;padding-left:28px;color:#555;text-align:left;font:12px/26px simsun;">联系我们</div>
                <div style="float:right;margin-right:8px">
                    <a href="#" style="font:12px/24px simsun;color:#555;display:none">更多&gt;&gt;</a>
                </div>
            </div>
            <div  style="padding:12px">

                <div style="font:12px/20px simsun">地址：杭州市莫干山路2168号<br />
                    邮编: 300009<br />
                    电话：0571-98765432<br />
                    传真：0573-12345678<br />
                    网址: www.abcde.com<br />
                    邮箱: boss@gmail.com</div>

            </div>
        </div>

    </div>
</div>
</div>
<div id='bottom' style='width:990px;height:42px;background:url(<c:url value='/effect/source/bg/x09.jpg' />) #000000'>


    <!-- 底部信息编辑区 -->

    <div id='pdv_4965' class='pdv_class'  title='脚注信息' style='width:306px;height:23px;top:15px;left:594px; z-index:8'>
        <div id='spdv_4965' class='pdv_bottom' style='overflow:hidden;width:100%;height:100%'>
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

    <div id='pdv_4960' class='pdv_class'   style='width:331px;height:33px;top:7px;left:0px; z-index:10'>
        <div id='spdv_4960' class='pdv_bottom' style='overflow:hidden;width:100%;height:100%'>
            <tiles:insertAttribute name="bottomlink" />

        </div>
    </div>
</div>
</div><div id='bodyex'>

</div>
<script>
    $(function() {
        $().picFit("fill");
    });
</script>
</body>
</html>
