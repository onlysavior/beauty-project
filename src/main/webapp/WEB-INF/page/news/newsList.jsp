<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

</head>
<body>
   <table>

   </table>
   <c:set scope="request" var="navUrl" value="${website}admin/page/news/toNewsListPage.action" />
   <c:set scope="request" var="navUrlEnd" value=""/>
   <c:set scope="request" var="currentPage" value="pageNo"/>
   <%@ include file="../common/page.jsp" %>
</body>
</html>