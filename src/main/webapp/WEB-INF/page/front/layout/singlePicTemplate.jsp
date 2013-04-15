<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="piccontent">
    <div class="fcenter">
        <table align="center" cellpadding="10" cellspacing="0">
            <tr>
                <td>
                    <div id="contentpages"></div>
                </td></tr></table>
    </div>
    <div class="photozone">
        <table align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center">
                    <div id="photoview">
                        <img src="<c:url value='#{picUrl}' />" border="0" id="photoloading" class="photoloading">
                    </div>
                </td>
            </tr>
        </table>


    </div>
    <div class="introzone">
        <div class="title">企业风貌</div>
        <div id="memo" class="memo" style="display:none"><strong>图片说明：</strong></div>
        <div class="bzone">
            <input type="hidden" id="photoid" value="9">
            <div class="tags" style="display:none">标签：</div>
            <div id="banzhu" class="banzhu"></div>
        </div>
    </div>

</div>