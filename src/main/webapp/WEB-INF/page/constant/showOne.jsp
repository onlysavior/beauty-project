<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>${news.title}</title>
</head>
<body>
<p>${news.title}</p>
    <p>
        ${news.picUrl}
    </p>
     <span>
         ${news.content}
     </span>
</body>
</html>