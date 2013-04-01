<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${product.name}</title>
</head>
<body>
   <p>
       ${product.name}
   </p>
    <p>
        ${product.function}
    </p>
    <p>
        ${product.include}
    </p>
    <p>
        ${product.volume}
    </p>
    <p>
        ${product.price}
    </p>
    <p>
        <img src="${product.picUrl}">
    </p>
</body>
</html>