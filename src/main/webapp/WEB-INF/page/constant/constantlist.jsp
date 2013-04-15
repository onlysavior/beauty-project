<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>News List</title>
    <script type="text/javascript" src="<c:url value='/My97DatePicker/WdatePicker.js'/>"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(".del").click(function(){
                if(confirm("Detele it ?")){
                    $.ajax({
                        url:"/backend/delConstant",
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
    <a href="/backend/toAddConstant"><input type="button" value="add Constant" id="addConstant"></a>
</p>
<c:choose>
    <c:when test="${constantList != null}">
        <table>
            <c:forEach items="${constantList}" var="i">
                <tr>
                    <td>${i.id}</td>
                    <td>
                        <a href="#">
                                ${i.title}
                        </a>
                    </td>
                    <td>
                        <a href="/backend/editConstant/${i.id}"><input type="button" value="edit" class="edit" /></a>
                        <input type="button" value="del" class="del" data="${i.id}"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <h3>No Constant</h3>
    </c:otherwise>
</c:choose>
</body>
</html>