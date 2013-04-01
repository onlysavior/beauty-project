<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Product List</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(".del").click(function(){
                if(confirm("Detele it ?")){
                    $.ajax({
                        url:"/delProduct",
                        type:"post",
                        data:{
                            id:$(this).attribute("data")
                        },
                        success:function(){
                            $(this).parent().parent().remove();
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
<p>
    <a href="/toAddProduct"><input type="button" value="add Product" id="addNews"></a>
</p>
<form id="form" method="post">
    <p>
        name:<input type="text" name="keyWord" id="title"/>
        <input type="submit" value="go" id="go">
    </p>
</form>
<c:choose>
    <c:when test="${productList != null}">
        <table>
            <c:forEach items="${productList}" var="i">
                <tr>
                    <td>${i.id}</td>
                    <td>
                        <a href="/showProduct/${i.id}">
                            ${i.name}
                        </a>
                    </td>
                    <td>
                        ${i.price}
                    </td>
                    <td>
                        <a href="/editProduct/${i.id}"><input type="button" value="edit" class="edit" /></a>
                        <input type="button" value="del" class="del" data="${i.id}"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <h3>No Product</h3>
    </c:otherwise>
</c:choose>
<c:set scope="request" var="navUrl" value="/productList" />
<c:set scope="request" var="navUrlEnd" value="${query}"/>
<c:set scope="request" var="currentPage" value="pageNo"/>
<%@ include file="../common/page.jsp" %>
</body>
</html>