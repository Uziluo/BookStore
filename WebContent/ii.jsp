<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${orders }" var="orders" varStatus="i"  begin="0">
				<div class="bb"> 
					<input name="checkbox"  type="checkbox"   onclick="singlecheck()" >
					<a href="toviewbook?id=${orders.product.id }"><img src="${orders.product.images }"  > </a>
					 <span >
	                   	${orders.product.name }
	                    <br>
	                </span>
	                <div class="mm">
	                	<span name="${i.count }" >${orders.product.price }</span>
	                	<span style="color:red"> 库存：${orders.product.stock }</span>
	                </div>
	                
	               		<input type="submit" value=" + "  onclick="upnum(${i.count },${orders.product.stock })">
	               		<input name="${i.count }"  style="width: 60px;"  value="${orders.amount}" onchange="change(${i.count},${orders.product.stock})" onkeyup="value=value.replace(/[^\d]/g,'')" >
	               		<input type="submit" value=" -  "  onclick="downnum(${i.count },${orders.product.stock })">
	               		
	                <div  class="ri"  name="${i.count }" lang="${orders.product.id }" >${orders.amount*orders.product.price }</div>
	               	<div class="righ">
	               		 <div class="rig"><a href="deleteorder?id=${orders.product.id }">删除</a></div>
	               	</div>
				</div>
		</c:forEach>
</body>
</html>