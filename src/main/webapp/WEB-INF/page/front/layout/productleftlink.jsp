<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!-- 产品分类（列表） -->
<div id='pdv_5176' class='pdv_class' title='产品分类' style='width:220px;height:413px;top:5px;left:5px; z-index:10'>
    <div id='spdv_5176' class='pdv_content' style='overflow:visible;width:100%;'>
        <div class="pdv_border" style="border:1px #ffd2a3 solid;background:#fff;padding:0px;margin:0px;height:100%">
            <div style="background:#fff5dd;height:26px;border-bottom:1px #ffd2a3 solid">
                <div style="float:left;background:url(<c:url value='/base/border/509/images/li.gif' />) 10px no-repeat;padding-left:28px;color:#555;text-align:left;font:12px/26px simsun;">
                    产品分类
                </div>
                <div style="float:right;margin-right:8px">
                    <a href="#" style="font:12px/24px simsun;color:#555;display:none">更多&gt;&gt;</a>
                </div>
            </div>
            <div style="padding:12px">

                <link href="<c:url value='/templates/css/productclass_menu703.css' />" rel="stylesheet" type="text/css"/>
                <div class="productclass_menu703">
                   <c:forEach items="${productTypes}" var="i">
                     <a href="#" target="_self" class="productclass_menu703">${i.name}</a>
                   </c:forEach>
                </div>

            </div>
        </div>

    </div>
</div>

<!-- 产品分类（列表） -->
<div id='pdv_5177' class='pdv_class' title='服务项目' style='width:220px;height:173px;top:424px;left:5px; z-index:11'>
    <div id='spdv_5177' class='pdv_content' style='overflow:hidden;width:100%;height:100%'>
        <div class="pdv_border" style="border:1px #ffd2a3 solid;background:#fff;padding:0px;margin:0px;height:100%">
            <div style="background:#fff5dd;height:26px;border-bottom:1px #ffd2a3 solid">
                <div style="float:left;background:url(<c:url value='/base/border/509/images/li.gif' />) 10px no-repeat;padding-left:28px;color:#555;text-align:left;font:12px/26px simsun;">
                    服务项目
                </div>
                <div style="float:right;margin-right:8px">
                    <a href="#" style="font:12px/24px simsun;color:#555;display:none">更多&gt;&gt;</a>
                </div>
            </div>
            <div style="padding:12px">

                <link href="<c:url value='/templates/css/productclass_menu703.css' />" rel="stylesheet" type="text/css"/>
                <div class="productclass_menu703">
                   <c:forEach items="${projectList}" var="i">
                    <a href="#" target="_self" class="productclass_menu703">${i.name}</a>
                   </c:forEach>
                </div>

            </div>
        </div>

    </div>
</div>