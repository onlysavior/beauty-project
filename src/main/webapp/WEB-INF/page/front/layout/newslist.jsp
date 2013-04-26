<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 文章翻页检索 -->

<div id='pdv_4279' class='pdv_class'  title='新闻动态' style='width:743px;height:232px;top:51px;left:3px; z-index:7'>
    <div id='spdv_4279' class='pdv_content' style='overflow:visible;width:100%;'>
        <div class="pdv_border" style="border:1px #ffd2a3 solid;background:#fff;padding:0px;margin:0px;height:100%">
            <div>

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
                    <c:set scope="request" var="navUrlEnd" value="&${query}"/>
                    <c:set scope="request" var="currentPage" value="pageNo"/>
                    <%@ include file="../../common/page.jsp" %>
                </div>
            </div>
        </div>

    </div>
</div>