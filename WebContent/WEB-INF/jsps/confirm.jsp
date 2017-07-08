<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
    <%@ taglib
    	uri="http://java.sun.com/jsp/jstl/core" prefix="c"
     %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html  >
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>结算页面</title>
<link rel="stylesheet" href="css/common.css"/>
<link rel="stylesheet" href="css/icons.css" />
<link rel="stylesheet" href="css/table.css" />
<link rel="stylesheet" href="css/orderSure.css" />
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript">
	$(function () {
		$(".submit a").click(function () {
			var pids ;  //拼接id
			var $input= $("input");
			var name  = $input.eq(0).val();  //获取姓名
			var address = $input.eq(1).val();	//获取地址
			var phone  = $input.eq(2).val();	//获取电话
			if (name!=""&&address!=""&&phone!="") {
				//正确提交方式
				alert("true");
				var $oen = $(".oneUL"); //在oneUL中保存了每个购物项的id
				for (var int = 0; int < $oen.length; int++) {
					if(int ==0){
						pids = $oen.eq(int).attr("pid");;
					}else{
					pids = pids+"-"+$oen.eq(int).attr("pid");
					}
				}
				location.href="doshop?name="+name+"&address="+address+"&phone="+phone+"&pids="+pids;
			} else {
				//错误提交方式
				alert("收货人信息不全");
			}
			console.log(pids);
		})
		
		
	})
	
</script>
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
	<p class="orderButtom">填写并核对订单信息</p>
    <!--中间复杂部分-->
    <div class="content">
    	<div class="contentCenter">
    		<div class="centerTop">
    			<b style="font-size:20px;">收货人信息</b>
    			<p style="font-size:15px;">
					收件人姓名：<input type="text" name="name"   > <img align="right" style="float：left" src="images/icons/sure.png"><br/><br/>
					收件人地址：<input type="text" name="address"  ><br/><br/>
					收件人电话：<input type="text" name="tel"    onkeyup="value=value.replace(/[^\d]/g,'')">
				</p>
    		</div>
    		<p class="singleP"><b>送货清单</b><span><a href="toshopcart">返回修改购物车</a></span></p>
    		<div class="bigDiv">
    			<div class="twoDiv">
    				<b>商家：briup自营</b>
    				<c:forEach items="${ConfirmOrderlines }" var="order">
					<ul class="oneUL" pid="${order.product.id }">
    					<li>
    						<img src="${order.product.images }" class="pic" title="${order.product.description }">
    						<p>${order.product.name }</p>
    						<p><font>${order.product.price }</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*${order.amount }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;有货</p>
    						<p><img src="images/sureLogo_14.png" alt=""><span>七天无理由退换货</span></p>
    					</li>
    					<li><pre>【赠品】  高级定制干花书签  随机 ×1</pre></li>
					</ul>
					</c:forEach>
					
    			</div>
    		</div>
	
    		<div class="money">
    			<span><font>${num }</font>件商品，总商品金额：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${TotalPrice }</span>
    			<span><img src="images/sureLogo_18.png" alt="">运费：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;¥0.00</span>
    			<span>应付总额：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${TotalPrice }</span>
    		</div>
    		<div class="submit">
    			<span>应付金额：<font>¥${TotalPrice }</font>
    				<a href="javascript:void(0)"><img src="images/21_03.png" alt=""></a>
    			</span>
    		</div>
    	</div>

    </div>
	  <!--脚部-->
    <div class="footer3">
    	<div class="f3_top">
        	<div class="f3_center">
                <div class="ts1">品目繁多 愉悦购物</div>
                <div class="ts2">正品保障 天天低价</div>
                <div class="ts3">极速物流 特色定制</div>
                <div class="ts4">优质服务 以客为尊</div>
            </div>
        </div>
        <div class="f3_middle">
        	<ul class="f3_center">
            	<li class="f3_mi_li01">
                	<h1>购物指南</h1>
                    <p>常见问题</p>
                    <p>找回密码</p>
                    <p>会员介绍</p>
                    <p>购物演示</p>
                </li>
                <li class="f3_mi_li01">
                	<h1>配送方式</h1>
                    <p>常见问题</p>
                    <p>找回密码</p>
                    <p>会员介绍</p>
                    <p>购物演示</p>
                </li>
                <li class="f3_mi_li01">
                	<h1>支付方式</h1>
                    <p>常见问题</p>
                    <p>找回密码</p>
                    <p>会员介绍</p>
                    <p>购物演示</p>
                </li>
                <li class="f3_mi_li01">
                	<h1>售后服务</h1>
                    <p>常见问题</p>
                    <p>找回密码</p>
                    <p>会员介绍</p>
                    <p>购物演示</p>
                </li>
                <li class="f3_mi_li01">
                	<h1>服务保障</h1>
                    <p>常见问题</p>
                    <p>找回密码</p>
                    <p>会员介绍</p>
                    <p>购物演示</p>
                </li>
                <li class="f3_mi_li06">
                	<h1>客服中心</h1>
                    <img src="images/qrcode_jprj.jpg" width="80px" height="80px">
                    <p>抢红包、疑问咨询、优惠活动</p>
                </li>
            </ul>
        </div>
         <div class="f3_bottom">
        	<p class="f3_links">
                <a href="#">关于我们</a>|
                <a href="#">联系我们</a>|
                <a href="#">友情链接</a>|
                <a href="#">供货商入驻</a> 
           	</p>
            <p>沪ICP备14033591号-8 杰普软件briup.com版权所有 杰普软件科技有限公司 </p>
          	<img src="images/police.png">
        </div>
    </div>
    <div id="note" style="display: none;"><span id="note1">修改成功!</span></div> 
</body>
</html>