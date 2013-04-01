<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>gzm</title>   <!--TODO simple description show-->
</head>
<body>
    <p>
        ${project.description}
    </p>
    <p>
        <img src="${project.picUrl}">
    </p>
</body>
</html>