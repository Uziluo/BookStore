<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--顶部-->
	<div class="top">
    	<div class="top_center">
            <ul class="top_bars">
            	<c:if test="${not empty user.name }" >
            	<li ><a >  欢迎用户：  ${user.name }</a></li>
            		<li><a href="loginout">退出</a>|</li>
            	</c:if>
            	<%-- <c:if test="${empty user.name }" >
            		<li><a href="tologin">登陆</a>|</li>
            	</c:if> --%>
                <li><a href="toshopcart">我的订单<span class="jt_down"></span></a>|</li>
                <li><a href="#">关注杰普<span class="jt_down"></span></a>|</li>
                <li><a href="#">网站导航<span class="jt_down"></span></a></li>
            </ul>
        </div>
    </div>