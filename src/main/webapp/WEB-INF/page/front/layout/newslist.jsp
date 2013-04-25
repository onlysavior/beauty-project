<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 文章翻页检索 -->

<div id='pdv_4279' class='pdv_class'  title='新闻动态' style='width:755px;height:449px;top:4px;left:231px; z-index:4'>
    <div id='spdv_4279' class='pdv_content' style='overflow:visible;width:100%;'>
        <div class="pdv_border" style="border:1px #ffd2a3 solid;background:#fff;padding:0px;margin:0px;height:100%">
            <div style="background:#fff5dd;height:26px;border-bottom:1px #ffd2a3 solid">
                <div style="float:left;background:url(<c:url value='/base/border/509/images/li.gif' />) 10px no-repeat;padding-left:28px;color:#555;text-align:left;font:12px/26px simsun;">新闻动态</div>
                <div style="float:right;margin-right:8px">
                    <a href="#" style="font:12px/24px simsun;color:#555;display:none">更多&gt;&gt;</a>
                </div>
            </div>
            <div  style="padding:10px">

                <link href="<c:url value='/templates/css/newsquery.css' />" rel="stylesheet" type="text/css" />
                <div id="newsquery">
                    <ul id="queryul">
                    <c:forEach items="${newsList}" var="i">
                        <li class="title">
                            <div class="title"><a href="/front/news/showOne/${i.id}" target="_self">${i.title}</a></div>
                            <div class="time">
                                <fmt:formatDate value="${i.updatetime}" pattern="yyyy/MM/dd" />
                            </div>

                        </li>
                    </c:forEach>
                    </ul>
                </div>

                <div id="showpages">
                    <c:set scope="request" var="navUrl" value="/front/news/search" />
                    <c:set scope="request" var="navUrlEnd" value="${query}"/>
                    <c:set scope="request" var="currentPage" value="pageNo"/>
                    <%@ include file="../../common/page.jsp" %>
                </div>


            </div>
        </div>

    </div>
</div>