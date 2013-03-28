<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>News List</title>
    <script type="text/javascript" src="<c:url value='/My97DatePicker/WdatePicker.js'/>"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
</head>
<body>
<form id="form" method="post">
    <p>
        title:<input type="text" name="keyWord" id="title"/>
        start:<input name="startTime" type="text" onClick="WdatePicker()" id="start"  />
        end:<input name="endTime" type="text" onClick="WdatePicker()" id="end" />
        <input type="submit" value="go" id="go">
    </p>
</form>
<c:choose>
 <c:when test="${newList != null}">
     <table>
         <c:forEach items="${newList}" var="i">
             <tr>
                 <td>${i.id}</td>
                 <td>
                     <a href="#">
                         ${i.title}
                     </a>
                 </td>
                 <td>
                     <fmt:formatDate value="${i.updatetime}" pattern="yyyy-MM-dd" />
                 </td>
                 <td>
                      <input type="button" value="edit" class="edit">
                      <input type="button" value="del" class="del">
                 </td>
             </tr>
         </c:forEach>
   </table>
 </c:when>
<c:otherwise>
    <h3>No News</h3>
</c:otherwise>
</c:choose>
   <c:set scope="request" var="navUrl" value="/newsList" />
   <c:set scope="request" var="navUrlEnd" value="${query}"/>
   <c:set scope="request" var="currentPage" value="pageNo"/>
   <%@ include file="../common/page.jsp" %>
</body>
</html>