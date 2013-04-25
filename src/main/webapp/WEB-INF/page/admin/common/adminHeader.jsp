<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
	$(function(){
		var page = $("#pageType").val();
		if(page == null || page == ""){
		    $(".gzm_index").addClass("active");
		}else if(page == 6){
			$(".gzm_news").addClass("active");
		}else if(page == 1){
			$(".gzm_reply").addClass("active");
		}else if(page == 2){
			$(".gzm_certificate").addClass("active");
		}else if(page == 3){
			$(".gzm_product").addClass("active");
		}else if(page == 4){
			$(".gzm_project").addClass("active");
		}else if(page == 5){
			$(".gzm_type").addClass("active");
		}else if(page == 7){
			$(".gzm_constant").addClass("active");
		}else{
			$(".gzm_about").addClass("active");
			
		}
		
	})
</script>
 <!-- Navbar
    ================================================== -->
    <div class="navbar navbar-inverse ">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">古之美后台</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="gzm_index">
                <a href="#">首页</a>
              </li>
              <li class="gzm_type" >
                <a href="#" class="bootstro" data-bootstro-title=""
           data-bootstro-placement="bottom"  data-bootstro-step="0">类型管理</a>
              </li>
              <li class="gzm_constant">
                <a href="${website }backend/constantList" class="bootstro" data-bootstro-title=""
           data-bootstro-placement="bottom"  data-bootstro-step="1">静态文件管理</a>
              </li>
              <li class="gzm_certificate">
                <a href="${website }backend/certificateList" class="bootstro" data-bootstro-title=""
           data-bootstro-placement="bottom"  data-bootstro-step="2">证书管理</a>
              </li>
              <li class="gzm_news">
                <a href="${website }backend/newsList" class="bootstro" data-bootstro-title=""
           data-bootstro-placement="bottom"  data-bootstro-step="3">新闻管理</a>
              </li>
              <li class="gzm_project">
                <a href="${website }backend/projectList" class="bootstro" data-bootstro-title=""
           data-bootstro-placement="bottom"  data-bootstro-step="4">项目管理</a>
              </li>
              <li class=" gzm_product">
                <a href="${website }backend/productList" class="bootstro" data-bootstro-title=""
           data-bootstro-placement="bottom"  data-bootstro-step="5">产品管理</a>
              </li>
              <li class="gzm_reply">
                <a href="${website}backend/reply/admin" class="bootstro" data-bootstro-title=""
           data-bootstro-placement="bottom"  data-bootstro-step="6">评论管理</a>
              </li>
              <li class="gzm_about">
                <a href="#">关于</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <input type="hidden" id="pageType" value="${pageType}" />
