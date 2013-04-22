<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!-- 产品详情 -->

<div id='pdv_4323' class='pdv_class'  title='产品详情' style='width:746px;height:457px;top:47px;left:235px; z-index:5'>
    <div id='spdv_4323' class='pdv_content' style='overflow:visible;width:100%;'>
        <div class="pdv_border" style="margin:0;padding:0;height:100%;border:1px #e6e6fa solid;background:;">
            <div style="height:25px;margin:1px;display:none;background:;">
                <div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">
                    产品详情
                </div>
                <div style="float:right;margin-right:10px;display:none">
                    <a href="#" style="line-height:25px;color:">更多</a>
                </div>
            </div>
            <div style="padding:12px">

                <link href="<c:url value='/templates/css/productcontent.css' />" rel="stylesheet" type="text/css" />
                <script type=text/javascript src="<c:url value='/js/productcontent.js' />"></script>

                <div id="productcontent">
                    <div class="productpics">
                        <div class="piczone">
                            <table align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="center">
                                        <div id="productview">
                                            <img src="<c:url value='${product.picUrl}'/>" border="0" id="productloading" class="productloading">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="contentpages"></div>
                    </div>

                    <div class="introzone">
                        <div id="prodtitle">${product.name}</div>
                        <div id="prop">
                            适合：${product.include}<br>
                            功效：${product.function}<br>
							价格：${product.price}<br>
							容量：${product.volume}<br>
                        </div>
                        <div id="memo" class="memo" style="display:none"></div>
                    </div>

                    <div class="bodyzone"></div>

                    <div class="bzone">
                        <input type="hidden" id="productid" value="59">
                        <div id="banzhu" class="banzhu"></div>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>