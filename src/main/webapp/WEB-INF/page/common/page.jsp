<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
.fenye{
	font-size:12px;
	text-align:right;
	margin-top:20px;
}
.fenye a{
	color:#000;
	text-decoration:none;
}
.fenye a:hover{
	text-decoration:underline;
}
.hb{
	margin-right:10px;
}
.pb{
	margin-left:10px;
	margin-right:10px;
}
.pages_position,
.curPage{
	color:#F00 !important;
	font-weight:bold;
}
#pagenumber{
	width:30px;
	height:25px;
	text-align:center;
	margin-left:10px;
	margin-right:10px;
}
#pagebutton{
	border:0;
	border-radius:5px;
	width:30px;
	height:20px;
	line-height:20px;
	box-shadow:1px 3px 6px;
	cursor:pointer;
	background:#0096CB;	
}
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
var endUrl = "${navUrlEnd}";
var url = "${navUrl}";
var currentPage = "${currentPage}";

$(document).ready(function() {
	$("#pagebutton").click(letsGo);
});

function letsGo() {
	var pageNo = $("#pagenumber").val();
	var url1 = url+ "?" + currentPage + "=" + pageNo + endUrl;
	location.href=url1;
}
</script>
<div class="fenye pagesNav">
<div class="pages">
<c:if test="${page.recordCount > page.pageSize}">
	<c:choose>
	<c:when test="${page.pageCount > 7}">
	
		<c:if test="${page.currentPage > 4}">
			<span class="hb"><a href="${navUrl}?${currentPage}=${page.firstPage}${navUrlEnd}">
				首页
			</a></span>
		</c:if>
		
		<c:if test="${page.currentPage > 1}">
			<span class="pb"><a href="${navUrl}?${currentPage}=${page.prevPage}${navUrlEnd}">
				上一页
			</a></span>
		</c:if>
		
		<c:forEach items="${page.pageList}" var="pageNum">
			<c:choose>
			<c:when test="${pageNum == page.currentPage}">
			   <span><a class="curPage link">${pageNum}</a> </span>
			</c:when>
			<c:otherwise>
			   	<span class="link"><a href="${navUrl}?${currentPage}=${pageNum}${navUrlEnd}">
			   		${pageNum}
			   	</a></span>
			</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${page.currentPage < page.pageCount}">
			<span class="pb"><a href="${navUrl}?${currentPage}=${page.nextPage}${navUrlEnd}">
				下一页
			</a></span>
		</c:if>
		
		<c:if test="${page.currentPage < page.pageCount - 3}">
			<span class="hb"><a href="${navUrl}?${currentPage}=${page.pageCount}${navUrlEnd}">
				尾页
			</a></span>
		</c:if>
		
	</c:when>
	<c:otherwise>
		
		<c:if test="${page.currentPage > 1}">
			<span class="pb"><a href="${navUrl}?${currentPage}=${page.prevPage}${navUrlEnd}">
				上一页
			</a></span>
		</c:if>
		
		<c:forEach items="${page.pageList}" var="pageNum">
			<c:choose>
			<c:when test="${pageNum == page.currentPage}">
			    <span class="link"><a class="curPage">${pageNum}</a></span>
			</c:when>
			<c:otherwise>
			   	<span class="link"><a href="${navUrl}?${currentPage}=${pageNum}${navUrlEnd}">
			   		${pageNum}
			   	</a></span>
			</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${page.currentPage < page.pageCount}">
			<span class="pb"><a href="${navUrl}?${currentPage}=${page.nextPage}${navUrlEnd}">
				下一页
			</a></span>
		</c:if>
		
	</c:otherwise>
	</c:choose>
	
	<span>当前第</span>
	<span class="pages_position">${page.currentPage}/${page.pageCount}</span>
	<span>页</span>
	<input id="pagenumber" type="text" value="${page.currentPage}" size="3" />
	<input id="pagebutton" type="button" value="go" />
</c:if>
</div>
</div>
<!--分页结束-->
