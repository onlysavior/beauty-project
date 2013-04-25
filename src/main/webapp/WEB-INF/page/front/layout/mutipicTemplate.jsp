<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id='pdv_4649' class='pdv_class'  title='${title}'style='width:754px;height:357px;top:7px;left:230px; z-index:5'>
    <div id='spdv_4649' class='pdv_content' style='overflow:visible;width:100%;'>
        <div class="pdv_border" style="border:1px #ffd2a3 solid;background:#fff;padding:0px;margin:0px;height:100%">
            <div style="background:#fff5dd;height:26px;border-bottom:1px #ffd2a3 solid">
                <div style="float:left;background:url(<c:url value='/base/border/509/images/li.gif' />) 10px no-repeat;padding-left:28px;color:#555;text-align:left;font:12px/26px simsun;">企业风貌</div>
                <div style="float:right;margin-right:8px">
                    <a href="#" style="font:12px/24px simsun;color:#555;display:none">更多&gt;&gt;</a>
                </div>
            </div>
            <div  style="padding:15px">

                <link href="<c:url value='/photo/templates/css/photoquery.css' />" rel="stylesheet" type="text/css" />
                <div id="photoquery">
                    <c:choose>
                        <c:when test="${picList != null}">
                            <ul >
                            <c:forEach var="i" items="${picList}">
                                <li>
                                    <div class="fang" style="width:190px;height:140px">
                                        <div class="picFit" style="width:190px;height:140px">
                                            <a href="#/${i.id}" target="_self" ><img src="${i.picUrl}" style="width:190px;height:140px" border="0" /></a>
                                        </div>
                                    </div>
                                    <div class="title"><a href="#/${i.id}" target="_self">${i.name}</a></div>
                                </li>
                            </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <ul>
                                No Pic
                            </ul>
                        </c:otherwise>
                    </c:choose>
                    <script>
                    $(function() {
                        $().picFit("fill");
                    });
                    </script>
                </div>
                <div id="showpages" >
                    <c:set scope="request" var="navUrl" value="/front/pic" />
                    <c:set scope="request" var="navUrlEnd" value="${query}"/>
                    <c:set scope="request" var="currentPage" value="pageNo"/>
                    <%@ include file="../../common/page.jsp" %>
                </div>
            </div>
        </div>

    </div>
</div>