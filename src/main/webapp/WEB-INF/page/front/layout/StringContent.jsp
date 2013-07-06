<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div id='pdv_4663' class='pdv_class'  title='${title}' style='width:754px;height:410px;top:7px;left:230px; z-index:2'>
    <div id='spdv_4663' class='pdv_content' style='overflow:visible;width:100%;'>

        <div class="pdv_border" style="border:1px #ffd2a3 solid;background:#fff;padding:0px;margin:0px;height:100%">
            <div style="background:#fff5dd;height:26px;border-bottom:1px #ffd2a3 solid">
                <div style="float:left;background:url(<c:url value='/base/border/509/images/li.gif'/>) 10px no-repeat;padding-left:28px;color:#555;text-align:left;font:12px/26px simsun;"></div>
                <div style="float:right;margin-right:8px">
                    <a href="#" style="font:12px/24px simsun;color:#555;display:none">&gt;&gt;</a>
                </div>
            </div>

            <div  style="padding:20px">
                <link href="<c:url value='/templates/css/pagecontent.css' />" rel="stylesheet" type="text/css" />
                <div id='pagecontent' class='page_content'><p>
                    ${content}
                </p></div>

                <script>

                    $(window).load(function(){
                        $("#pagecontent").find("img").hide();
                        var w=$("#pagecontent")[0].offsetWidth;
                        $("#pagecontent").find("img").each(function(){
                            $(this).show();
                            if(this.offsetWidth>w){
                                this.style.width=w + "px";
                            }
                        });

                    });
                </script>
            </div>
        </div>
    </div>
</div>