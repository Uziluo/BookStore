<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>购物车页面</title>
<link rel="stylesheet" href="css/fullCar.css" />
<link rel="stylesheet" href="css/common.css"/>
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/icons.css" />
<link rel="stylesheet" href="css/table.css" />
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
 <style> 
        #note{position:absolute;width:150px;padding:8px;background:#eee;border:1px solid #ccc;left:40%;z-index:9999;display:none;} 
 </style>  
 
</head>
<body>
	<!--顶部-->
	<jsp:include page="model/top.jsp"></jsp:include>
    <!--头部-->
    <div class="header3">
    	<a href="index"><img src="images/logo.png"  class="oneImg"></a>
        <div class="h3_right">
        	<img src="images/play_03.png" alt="">
        </div>
    </div>
<!--中间部分div-->
<div class="empty">
	<div class="peisong"><pre>全部商品  2 </pre></div>
	<div class="mainCenter">
		<div class="allCheck">
			<input name="checkbox" type="checkbox" onclick="check()"><p>全选</p>
			<p class="leftM">商品</p>
			<p class="rightM">单价(元)</p>
			<p class="leftM">数量</p>
			<p class="leftM">小计(元)</p>
			<p class="leftM">操作</p>
		</div>
		<div class="mainPro" style="overflow:auto">
			<div class="aa">
				<input  type="checkbox" onclick="check()"  ><span id="but">自营</span>
			</div>
			
			<c:forEach items="${orders }" var="orders" varStatus="i"  begin="0">
				<div class="bb"> 
					<input name="checkbox"  type="checkbox"   onclick="singlecheck()" >
					<a href="toviewbook?id=${orders.product.id }"><img src="${orders.product.images }"  > </a>
					 <span >
	                   	${orders.product.name }
	                    <br>
	                </span>
	                <div class="mm">
	                	<span name="${i.count }"  >${orders.product.price }</span>
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
		</div>
		<div class="allButtom">
			<a href="javascript:void(0);" onclick="toconfirm()"><p class="caozuo" > 去结算</p></a>
			<span>已选择<font name="account">0</font>件商品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总价(不含运费)：<font>¥<font name="account">0</font>.00元</font></span>
		</div>
	</div>
</div>
 <div id="note" style="display: none;"><span id="note1">修改成功!</span> </div> 
<script type="text/javascript">
			var pids   = null;
				/*点击数量增
				价格变动  由name =orders.product.id 属性取标签 单价，数量，总价 */
			function upnum(e,stock) {
				//alert(stock);  库存
				var a =document.getElementsByName(e)[1];
				var b = a.value;
				var c = parseInt(b)+1;//数量
				var note = document.getElementById("note1"); //弹出框
				if (parseInt(stock)>=parseInt(c)) {
					a.value = c; 
					var d = document.getElementsByName(e)[0].innerHTML; //单价
					var e = document.getElementsByName(e)[2]; //总价
					e.innerHTML= parseInt(d)*parseInt(c);
					doajax(c,e.lang);
				} else {
					note.innerHTML = "库存不足!";
				}
				ready(); //实现弹框
				singlecheck(); 
				
			}
			//点击数量减少，价格变动				
			 function downnum(e,stock) {
				var a =document.getElementsByName(e)[1];;
				var b = a.value;
				var note = document.getElementById("note1"); //弹出框
				note.innerHTML="修改成功！"; 
				if( parseInt(b)>1){
					var c = parseInt(b)-1;//数量
					a.value = c; 
					var d = document.getElementsByName(e)[0].innerHTML; //单价
					var e = document.getElementsByName(e)[2]; //总价
					e.innerHTML= parseInt(d)*parseInt(c);
					ready();
					singlecheck(); 
					doajax(c,e.lang)
				}
			} 
			/*实现全选 ,全不选
			由name= checkbox 来选择所有的单选框，并且 【0】代表全选。【1】代表自营*/
			function check() {
				pids = "";
				var checks = document.getElementsByName("checkbox");  //选择框
				var account = document.getElementsByName("account");  // 总数 总价
				if (!checks[0].checked) {
					//全部不选
					for(var i = 1;i<checks.length;i++){
						checks[i].checked="";
					}
					account[0].innerHTML = 0; //设置数量
					account[1].innerHTML = 0; // 设置总价
					pids = "pids=";
				} else{
					//全部选择
					var a = 0;   //接收数量
					var b = 0;	  //接收总价
					for(var i = 1;i<checks.length;i++){
						checks[i].checked="checked";
						var param = document.getElementsByName(i);  //0 单价，1 数量，2单个选项的总价
						a = parseInt(a)+parseInt(param[1].value);
						b = parseInt(b)+parseInt(param[2].innerHTML);
						/*  */
						var id = param[2].lang;
						pids = pids+"-"+id;
					}
						console.log(pids);
						singlecheck();
					/* account[0].innerHTML = a; //设置数量
					account[1].innerHTML = b; // 设置总价 */
				}
			}
			//没点击一下订单项 都遍历所有的订单项
			function singlecheck() {
				pids = "";
				var checks = document.getElementsByName("checkbox");  //选择框
				var account = document.getElementsByName("account");	// 总数 总价
				var a = 0;   //接收数量
				var b = 0;	  //接收总价
				for(var i = 1;i<checks.length;i++){
					if (checks[i].checked) {
						var param = document.getElementsByName(i);  //0 单价，1 数量，2单个选项的总价
						a = parseInt(a)+parseInt(param[1].value);
						b = parseInt(b)+parseInt(param[2].innerHTML);
						var id = param[2].lang;
						pids = pids+"-"+id;
						
					}
				}
				console.log(pids);
				account[0].innerHTML = a; //设置数量
				account[1].innerHTML = b; // 设置总价
			}
			
			function change(e,stock) {
				var a =document.getElementsByName(e)[1];
				var b = a.value;
				var c = parseInt(b);//数量
				var d = document.getElementsByName(e)[0].innerHTML; //单价
				var e = document.getElementsByName(e)[2]; //总价
				   if (parseInt(c)<=parseInt(stock)) {
					e.innerHTML= parseInt(d)*parseInt(c); 
				}else   {
					a.value = 1;
					 c = 1;//数量
					e.innerHTML= parseInt(d)*parseInt(c);
				}  
			   ready(); //实现弹框
			   singlecheck(); 
			   doajax(c,e.lang);
			}
			function doajax(c,id) {
				//console.log(id);
				   jQuery.ajax({
                type: "get",
                url: "doorder?pid="+id+"&num="+c, //页面地址和传递的URL参数    
                async:true,
                success:function (a){ 
      				
      			},
    			 });    
			}
			function ready() {
				if(!$('#note').is(':visible')){ 
                    $('#note').css({display:'block', top:'-100px'}).animate({top: '+100'}, 500, function(){ 
                        setTimeout(out, 1000); 
                    }); 
                }
			}
		  function out(){ 
	            $('#note').animate({top:'0'}, 500, function(){ 
	                $(this).css({display:'none', top:'-100px'}); 
	            });  
	        } 
		  function toconfirm() {
			if (pids==null) {
				alert("请选择产品!!!");
			} else {

			location.href="toconfirm?pids="+pids;
			}
		  }
		</script>
		
		
<!-- 尾部 -->
 <jsp:include page="model/foot.jsp"></jsp:include>
</body>
</html>