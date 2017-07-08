<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>briup电子商务-首页</title>
<link rel="stylesheet" href="css/common.css"/>
<link rel="stylesheet" href="css/stylecopy.css"/>
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/icons.css" />
<link rel="stylesheet" href="css/table.css" />
<link href="css/cloud-zoom.css" type="text/css" rel="stylesheet" /> 
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
   <script src="js/cloud-zoom.1.0.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function () {
		//根据书名查询
		$("#search").click(function(){
   			console.log("s")
   		var a=	$("#searchName").val();
   			location.href= "tolist?pname=" + a;
   		});
		//前台进行数字加减的操作
    	$(".pro_buy_nums dl dd").eq(0).click(function(){
    		var v = $(".pro_buy_nums input").val();  //取input中的值
    		if (parseInt(v)>=1) {
    		$(".pro_buy_nums input").val(parseInt(v)+1);
			}
    	});
    	$(".pro_buy_nums dl dd").eq(1).click(function(){
    		var v = $(".pro_buy_nums input").val();  //取input中的值
    		if (parseInt(v)>1) {
    		$(".pro_buy_nums input").val(parseInt(v)-1);
    		}
    	});
    	//点击加入购物车的监听，并获取加入的数量和产品的ID
    	$(".pro_addshop").click(function(){
    		var num = $(".pro_buy_nums input").val();  //取input中的值
    		var pid = $(this).attr("pid");
    		alert(num+pid);
    		   jQuery.ajax({
                type: "get",
                url: "doorder?pid=" +pid+"&num="+num,     //页面地址和传递的URL参数    
                async:true,
                success:function (o){ alert(o+"加入购物车成功");},
                });    
    	});
    	
    	//商品介绍 规格参数包 装清单 商品评价替换
    	$(".c5_b2_tabs li").click(function(){
    		var $this  =$(this);
    		//变色
    		$this.addClass("current");
    		$this.siblings().removeClass("current");
    		//替换
    		var html = $this.attr("NB")
    		var $div = $(".intro_pics>div").eq(html);
    		$div.css("display","block");
    		$div.siblings().css("display","none");
    	})
    	
    	
    	
	})
</script>

</head>
<body>
	<!--顶部-->
	<div class="top">
    	<div class="top_center">
            <ul class="top_bars">
            	<c:if test="${not empty user.name }" >
            	<li ><a >  欢迎用户：  ${user.name }</a></li>
            		<li><a href="loginout">退出</a>|</li>
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
            	<input id="searchName" type="text" name="name"/>
             	 <a href="javascript:void(0)"><span id="search">搜索</span>  </a>
                <script type="text/javascript"> 
               		
                </script>
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
            	<a href="toshopcart">去购物车结算</a>
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
    
	<div class="container5">
    	<div class="cn5_top">
            <div class="cn5_top_x center01">
            	<a class="font20" href="tolist">书籍</a> >
                <a href="tolist?did=${DETAIL.id }" >${DETAIL.name }</a> 
            </div>
            <div class="cn5_top_y center01">
            	<div class="cn5topy_1">
            		<!-- 小图 -->
                	<div class="cn5topy_imgview">
	                	<span class="mark"></span>
	       				<span class="float_layer"></span>
	       				<!-- 添加放大镜 -->
                    	 <img src="${product.images }" longdesc="#"/> 
				        	
                      	<ul class="cn5topy_imglist">
                        	<li><a href="#"><img src="${product.images }"></a></li>
                            <li class="current"><a href="#"><img src="${product.images }"></a></li>
                            <li><a href="#"><img src="${product.images }"></a></li>
                            <li><a href="#"><img src="${product.images }"></a></li>
                            <li><a href="#"><img src="${product.images }"></a></li>
                        </ul>  
                    </div>
                    
                    <!-- 大图 -->
                    <div class="big_pic">
						<img src="${product.feature_images }" longdesc="#" />
					</div>
                </div>
                
                <div class="cn5topy_2">
                	<h1 class="pro_title font15">${product.name }</h1>
                    <div class="pro_price">
                            <div class="pro_price_x">
                                <p> briup价：<b>${product.price }</b> <a href="#">(降价通知)</a></p>
                            </div>
                            
                    </div>
                    <div class="pro_ship">
                        <div>
                        	<div class="pro_key fl">服&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务：</div>
                            <ul class="pro_service f1">
                                <li class="service_fq">${product.service_fg }</li>
                                <li class="service_myf">${product.service_myf }</li>
                                <li class="service_zt">${product.service_zt }</li>
                                <li class="service_th">${product.service_th }</li>
                            </ul>
                        </div>
                    </div>
                    <div class="pro_selects">
                    	<div class="pro_select">
                        	<div class="pro_key pro_key_vertical fl">选择版本： </div>
                            <ul class="pro_select_vals">
                            <c:choose >
                           		 <c:when test="${product.version=='1'}">
                                	<li>精装版</li>
                            	 </c:when>
                            	  <c:when test="${product.version=='2' }">
                               		 <li>简装版</li>
                               		</c:when>
                                  <c:when test="${product.version=='3' }">
                               	 	<li>收藏版</li>
                               	 </c:when>
                             </c:choose>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="pro_buy">
                    	<div class="pro_buy_nums">
                        	<input type="text" value="1"  onkeyup="value=value.replace(/[^\d]/g,'')" />
                            <dl>
                            	<dd >+</dd>
                                <dd >-</dd>
                            </dl>
                        </div>
                        <div class="pro_addshop"  pid =${product.id }>加入购物车</div>
                    </div>
                </div>
            </div>
        </div>
    	<div class="c5_b2">
            <div class="c5_b2_right">
            	<!--选项卡-->
            	<ul class="c5_b2_tabs">
                	<li  class="current"  NB="0">商品介绍</li>
                    <li NB="1">规格参数</li>
                    <li NB="2">包装清单</li>
                    <li NB="3"> 商品评价</li>
                </ul>
                <!--内容-->
              	<div class="c5_b2_right_1 box" >
                        <div class="introduce_item">
                          <ul>
                        	<li>商品名称：${product.name }</li>
                            <li>商品编号：${product.ISBN }</li>
                            <li class="fr"><a class="color_link1" href="#">更多参数>></a></li>
                          </ul>
                        </div>
           		</div>
                <div class="intro_pics">
                	<!-- 商品介绍 -->
                	<div>
                		
                		<br><br>
                		<img class="intro_pic" src="${product.feature_images }">
                	</div>
                	<!-- 商品参数 -->
                	<div style="display: none">
                		<div  class="c5_b2_right_2"><h1>产品的描述信息:</h1><br></div>
                		<div class="ts3">${product.description } </div>
		                 	<br>
		                 	<div  class="c5_b2_right_2"><h1>目录:</h1><br></div>
	                 	<span>${product.bill }</span>
                	</div>
                	<!-- 包装清单 -->
                	<div style="display: none">
                		<div  class="c5_b2_right_2"><h1>包装清单:</h1><br></div> 
                	 </div>
                	<!-- 评论-->
                	<div style="display: none">  
                			<div  class="c5_b2_right_2"><h1>评论:</h1><br></div> 
                			<img alt="" src="images/pinglun.png">
                	</div>
                </div>
           </div>
                
            <div class="c5_b2_right">
              	<div class="c5_b2_right_2">
                    	<h1>正品行货</h1>
                        <p>briup网上商城向您保证所售商品均为正品，briup自营商品开具机打发票或电子发票。</p>
                        
                        <h1>全国联保</h1>
                        <p>凭质保证书及briup网上商城发票，可享受全国联保服务，与您亲临商场选购的商品享受相同的质量保证。briup网上商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！</p>
                        
                        <h1>正品行货</h1>
                        <p>briup网上商城向您保证所售商品均为正品，briup自营商品开具机打发票或电子发票。</p>
                        
                        <h1>全国联保</h1>
                        <p>凭质保证书及briup网上商城发票，可享受全国联保服务，与您亲临商场选购的商品享受相同的质量保证。briup网上商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！</p>
                        
            		</div> 
            </div>
            
            <!--左侧栏-->
            <div class="c5_b2_left_container">
                <div class="c5_b2_left box">
                    <h1>服务时间 早9：00~凌晨1：00</h1>
                    <p>
                    <a href="#">
                        <img class="callmebyqq" src="images/icon_qq_03.png"/>
                    </a>
                    </p>
                </div>
                
                <div class="c5_b2_left box">
                    <h1>其他种类</h1>
                    <dl>
                    <c:forEach items="${clist }" var="clist2">
                        <dd>${clist2.name }</dd>
                     </c:forEach>
                    </dl>
                </div>
            </div> 
        </div>
    </div>
    	
    <div class="c20"></div>
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
            <p>沪ICP备14033591号-8 杰普briup.com版权所有 杰普软件科技有限公司 </p>
          	<img src="images/police.png">
        </div>
    </div>

</body>
</html>
