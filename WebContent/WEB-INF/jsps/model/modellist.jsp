<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
				<c:if test="${empty cproducts }">
				 	<h1>没有商品</h1>
				</c:if>
		 <button onclick="au()" > This is BUtton</button> 
            	<c:forEach items="${cproducts }" var="products">
                	<li class="c4_b5_c_box">
                    	<!--图片-->
                    	<div class="c4_b5_c_box_pic">
                        	<div class="c4b5_pic_view">
                            	<a href="toviewbook?id=${products.id }"><img src="${products.images }"></a>
                            </div>
                        </div>
                        <!--价钱-->
                        <div class="c4_b5_c_box_txt">
                        	<h1>${products.price }</h1> 
                            <h2><a href="toviewbook?id=${products.id }">${products.name }</a></h2>
                        </div>
                        <!--购买等操作-->
                        <div class="c4b5_el">
                        	<div class="c4b5_el_x">
                            	<span class="wjx01"></span>
                            </div>
                        </div>
                        <ul class="c4b5_option">
                              <li class="shopcar_box"  pid="${products.id }" ><span class="shopcar01"></span>加入购物车</li>
                        </ul>
                    </li>
                    </c:forEach>
                   <script type="text/javascript"> 
               		$(".c4b5_option li.shopcar_box").click(function(){
               			alert("进入Jquery");
               		 	var pid=$(this).attr("pid");
               		 	console.log(pid);
	               			jQuery.ajax({
	                        type: "get",
	                        url: "doorder?pid=" +pid,//页面地址和传递的URL参数    
	                        async:true,
	                        success:function (o){ alert("加入购物车成功");},
	                        });  
               		});
                </script>
