<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!-- 产品检索搜索 -->
<div id='pdv_4730' class='pdv_class' title='产品服务' style='width:752px;height:642px;top:5px;left:232px; z-index:4'>
    <div id='spdv_4730' class='pdv_content' style='overflow:visible;width:100%;'>

        <div class="pdv_border" style="border:1px #ffd2a3 solid;background:#fff;padding:0px;margin:0px;height:100%">
            <div style="background:#fff5dd;height:26px;border-bottom:1px #ffd2a3 solid">
                <div style="float:left;background:url(<c:url value='/base/border/509/images/li.gif'/>) 10px no-repeat;padding-left:28px;color:#555;text-align:left;font:12px/26px simsun;">
                    产品服务
                </div>
                <div style="float:right;margin-right:8px">
                    <a href="#" style="font:12px/24px simsun;color:#555;display:none">更多&gt;&gt;</a>
                </div>
            </div>
            <div style="padding:15px">

                <link href="<c:url value='/templates/css/productquery_2.css'/>" rel="stylesheet" type="text/css"/>
                <c:forEach items="${productList}" var="i">
                    <div class="productquery_2">
                        <div class="productquery_2_left">
                            <div class="fang" style="width:145px;height:145px">
                                <div class="picFit" style="width:145px;height:145px">
                                    <a href="/front/project/showOne/${i.id}" target="_self"><img
                                            src="${i.picUrl}" style="width:145px;height:145px"
                                            border="0"/></a>
                                </div>
                            </div>
                        </div>
                        <div class="productquery_2_right">
                            <a href="/front/project/showOne/${i.id}" target="_self" class="prodtitle">${i.description}</a>
                        <span class="prop">



                        介绍：${i.description}<br>

                        </span>
                        </div>
                    </div>
                </c:forEach>

                <script>
                    $(function () {
                        $().picFit("fill");
                    });
                </script>

                <div id="showpages">
                    <c:set scope="request" var="navUrl" value="/backend/newsList" />
                    <c:set scope="request" var="navUrlEnd" value="/front/news/typeproduct/${typeId}"/>
                    <c:set scope="request" var="currentPage" value="pageNo"/>
                    <%@ include file="../../common/page.jsp" %>
                </div>


            </div>
        </div>

    </div>