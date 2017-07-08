<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>briup电子商务-首页</title>
<link rel="stylesheet" href="css/common.css"/>
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/icons.css" />
<link rel="stylesheet" href="css/table.css" />
<!-- 划过  -->
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript">
	window.onload = function () {}
</script>
</head>
<body>

	<script type="text/javascript">
		function byname() {
			var a = document.getElementById("byname").value;
			location.href = "tolist?pname=" + a;
		}
	</script>
	<!--顶部-->
	<div class="top">
    	<div class="top_center">
            <ul class="top_bars">
            	<c:if test="${not empty user.name }" >
            	<li ><a >  欢迎用户：  ${user.name }</a></li>
            		<li><a href="loginout"  id="tuichu">退出</a>|</li>
            	</c:if>
            	<c:if test="${ empty user.name }" >
            		<li><a href="tologin">登陆</a>|</li>
            	</c:if>
                <li><a href="toshopcart">我的订单<span class="jt_down"></span></a>|</li>
                <li><a href="#">关注杰普<span class="jt_down"></span></a>|</li>
                <li><a href="#">网站导航<span class="jt_down"></span></a></li>
            </ul>
        </div>
    </div>
    <!--头部-->
    <div class="header3">
    	<a href="index"><img src="images/logo.png"></a>
    	<div class="h3_center">
        	<div class="search_box">
            	<input type="text" id = "byname"/>
               <span style="cursor:pointer" onclick="byname()">搜索</span>  
            </div>
            <p>
                <c:forEach items="${clist }" var="iteam"> <a href="tolist?cid=${iteam.id }">${iteam.name}</a>|</c:forEach> 
            </p>
        </div>
        <div class="h3_right">
        	<div class="myyy">
            	<a href="touserinfo">个人信息</a>
                <span class="sj_down"></span>
             </div>
            <div class="tsc">
            	<a href="toconfirm">去购物车结算</a>
                <span class="sj_right"></span>
            </div>
        </div>
    </div>
    <!--头部导航-->
    <div class="nav_top">
    	<div class="nav_top_center">
            <div>
                全部图书分类
            </div>
            <ul>
                <c:forEach items="${clist }" var="iteam"> <li><a href="tolist?cid=${iteam.id }">${iteam.name}</a></li></c:forEach> 
            </ul>
        </div>
    </div>
    
    <!--内容-->
    <div class="container4">
    	<!--热卖-->
    	<div class="c4_b1">
        	<ul class="c4_b1_boxes">
        	<c:forEach begin="0" end="3">
                <li>
                	<img src="images/hot_1.png">
                    <div class="c4_b1_box_txt">
                    	<p>Java疯狂讲义 </p>
                        <h1>活动价：<b>￥69</b></h1>
                        <h2>立即抢购</h2>
                    </div>
				</li>
				</c:forEach>
            </ul>
        </div>
        <div class="c4_b2">
            <h1 class="c4_b2_x">
            	<a href="#">计算机类&nbsp;&nbsp;></a>
                <span><a href="#">计算机类</a></span>
            </h1> 
                
            <ul class="c4_b2_y">
            	<li>
                	<span class="search_key">价格：</span>
                    <span class="search_val" id="price"></span>
                    <span class="search_del"></span>
                </li>
                <li>
                	<span class="search_key">出版社：</span>
                    <span class="search_val" id="publish" lang=""  ></span>
                    <span class="search_del"></span>
                </li>
            </ul>
        </div>
        <div class="c4_b3">
        	<h1></h1>
        	<div>
            	<ul class="c4_b3_search">
                	<li class="c4_b3_name">价格：</li>
                    <li class="c4_b3_vals">
                    <c:forEach items="${crank }" var="crank">
                       <%--   <a href="filterlist?minprice=${crank.min_price }&maxprice=${crank.max_price }">${crank.min_price }-${crank.max_price } </a>--%> 
                        <a  onclick="crank(${crank.min_price },${crank.max_price },this)" style="cursor:pointer" >${crank.min_price }-${crank.max_price } </a>
                     </c:forEach>
					</li>
                </ul><ul class="c4_b3_search">
                	<li class="c4_b3_name">出版社：</li>
                    <li class="c4_b3_vals">
					 	<c:forEach items="${cpublish }" var="iteam">
					 		<a onclick="publish(this,${iteam.id })" style="cursor:pointer" >${iteam.name }</a>
					 	</c:forEach> 
					</li>
                </ul>
            </div>
        </div>
    	<div class="c4_b4">
        	<div class="c4_b4_x">
            	<ul class="c4_b4_nav">
                	<li class="current"   orderby="id"><a style="cursor:pointer">默认</a></li>
                    <li  orderby="sale_num"><a style="cursor:pointer">销量</a></li>
                    <li   orderby="price"><a style="cursor:pointer">价格</a></li>
                    <li   orderby="start_date"><a style="cursor:pointer">新品</a></li>
                </ul>
                	<script type="text/javascript">
                		//定义全局的orderby
                		var orderby = "id";
                		var id =null;
					 	//1.出版社
					 		function publish(o,sid) {
					 			var a = o.innerHTML;
					 			//1.变颜色
					 			var nodes = o.parentNode.childNodes;
					 			for(var i = 0 ; i<nodes.length;i++){
					 				nodes[i].style="cursor:pointer;";
					 			}
					 			o.style="cursor:pointer;color:red;";
					 			//2.变数值
					 			var publish = document.getElementById("publish"); //获取标签对象
					 			publish.innerHTML = a; 
					 			///publish.lang =id; 	//lang属性保存id值
					 			id = sid;
					 			chaangList(id);
							}
					 	//2.价格变动
					 		function crank(min,max,o) {
					 			//1.变颜色
					 			var nodes = o.parentNode.childNodes;
					 			for(var i = 0 ; i<nodes.length;i++){
					 				nodes[i].style="cursor:pointer;";
					 			}
					 			o.style="cursor:pointer;color:red;";
					 			//2.变数值
					 			var price = document.getElementById("price");
					 			price.innerHTML = min+"-"+max;
					 			chaangList(id);
							}
					 	//3.局部刷新ajax
					 	function chaangList(id) {
					 		console.log(orderby+"---");
					 		//获取价格
					 		var price  = document.getElementById("price").innerHTML;
					 		//得到id
					 		if (id==null) {
								id = "";
							}
							  jQuery.ajax({
		                        type: "get",
		                        url: "filterlist?price="+price+"&publishid="+id+"&orderby="+orderby, //页面地址和传递的URL参数    
		                        async:true,
	                  			success:function (a){ 
	                  				console.log(a);
	                  				 var list = document.getElementById("filterlist");
	                      				$(list).html(a); 
	                  			},
	                        });      
						}
					 	//默认，销量，价格，新品
					 	$(".c4_b4_nav li").click(function () {
					 		//点击变色
					 		var nodes = $(this).siblings().attr('class','');
				 			$(this).attr('class',"current");
					 		 orderby = $(this).attr("orderby");
					 		console.log(orderby);
					 		chaangList(id);
						}) ;
					 	
					 	</script>
                <div class="c4_b4_search">
                	<input type="text"/><span>确认</span>
                </div>
                <div class="c4_b4_pages">
                	
                </div>
				<div class="clear"></div>
            </div>
             <div class="c4_b4_y">
            	<ul>
                    <li><input type="checkbox"> 仅显示有货</li>
                </ul>               
            </div>
       	</div>
    	<!--商品列表-->
        <div class="c4_b5">	
        	<div class="c4_b5_content">
            	<ul class="c4_b5_c_boxes" id="filterlist">
            	<c:forEach items="${cproducts }" var="products">
                	<li class="c4_b5_c_box">
                    	<!--图片-->
                    	<div class="c4_b5_c_box_pic">
                        	<div class="c4b5_pic_view">
				<a href="toviewbook?id=${products.id }">
					  <img class="media__image" src="${products.images }" alt="" />
                           </a> 	
                            	
                        	
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
                </ul>
				<script type="text/javascript"> 
               		$(".c4b5_option  li").click(function(){
               		 	var pid=$(this).attr("pid");
               		 	/* var img = $("#img"+pid); //获取图片
	               		
               		 	var cart = $(".c4b5_option");
	         			var ch = cart.height();
	         			var cw = cart.width();
	         			var cl = cart.offset().left;
	         			img.animate({
	        				left:cl,
	        				top:-192,
	        				height:ch,
	        				width:cw,
	        				opacity:0.0,
	        			},1000); */
               		 	
               		 	console.log(pid);
	               			jQuery.ajax({
	                        type: "get",
	                        url: "doorder?pid=" +pid,//页面地址和传递的URL参数    
	                        async:true,
	                        success:function (o){ 
	                        	alert("加入购物车成功");
	                        },
	                        });  
               		});
                </script>
			</div>
        </div> 
    </div>
  <jsp:include page="model/foot.jsp"></jsp:include>
</body>
</html>