<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 文章正文 -->
<div id='pdv_4289' class='pdv_class' title='文章正文' style='width:743px;height:232px;top:51px;left:3px; z-index:7'>
    <div id='spdv_4289' class='pdv_content' style='overflow:visible;width:100%;'>
        <div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px #dddddd solid;background:#fff;">
            <div style="height:25px;margin:1px;display:none;background:#cccccc;">
                <div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:#fff">
                    文章正文
                </div>
                <div style="float:right;margin-right:10px;display:none">
                    <a href="#" style="line-height:25px;color:#fff">更多</a>
                </div>
            </div>
            <div style="padding:10px">

                <link href="<c:url value='/templates/css/newscontent.css' />" rel="stylesheet" type="text/css"/>
                <script type=text/javascript src="<c:url value='/js/newscontent.js' />"></script>
                <div id="newscontent">
                    <div class="newstitle">${news.title}</div>

                    <div class="info">作者：管理员 &nbsp;&nbsp; 发布于：<fmt:formatDate value="${news.updatetime}" pattern="yyyy/MM/dd:HH:mm:ss" /> &nbsp;&nbsp; 文字：【<a
                            href="javascript:fontZoom(16)">大</a>】【<a href="javascript:fontZoom(14)">中</a>】【<a
                            href="javascript:fontZoom(12)">小</a>】
                    </div>
                    <div id="memo" class="memo" style="display:none"><span style="color:#ff6600">摘要：</span></div>
                    <div id="con" class="con">${news.content}</div>
                    <div id="contentpages">
                    </div>
                    <div class="bzone">
                        <div class="down" style="display:none">附件下载：<span id="downlink"></span> (已下载0次) <span
                                id="downcentnotice"></span><input type="hidden" id="downcent" value=""></div>
                        <input type="hidden" id="newsid" value="324">

                        <div class="tags" style="display:none">标签：</div>
                        <div id="banzhu" class="banzhu"></div>
                    </div>
                </div>
                <script>
                    $(function () {
                        $().contentPages('324');
                    });

                </script>

            </div>
        </div>

    </div>
</div>