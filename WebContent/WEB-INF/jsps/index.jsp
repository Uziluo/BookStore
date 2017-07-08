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
<link href="css/datouwang.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/koala.min.1.5.js"></script>
<script type="text/javascript">
	$(function () {
		
		
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
            	<input id="byname" type="text" name="name"/>
                 <span style="cursor:pointer" onclick="byname()">搜索</span>  
                <script type="text/javascript">
            	function byname() {
					var a = document.getElementById("byname").value;
					location.href="tolist?pname="+a;
				}
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
    
	<div class="container3">
    	<div class="c3_b1">
        	<div class="c3_b1_left">
            	<dl>
            	  <c:forEach items="${clist }" var="iteam"> 
               		<dd>
                    	<h1>${iteam.name}</h1>
                    	<p>
                            <c:forEach items="${iteam.cate_detail }" var="citeam" ><a href="tolist?did=${citeam.id }">${citeam.name }</a></c:forEach>
                      	</p>
                    </dd>
                    </c:forEach>
                </dl>
            </div>
            <div class="c3_b1_center">
            <!-- 轮播图 -->
            	<div id="fsD1" class="focus" >  
				    <div id="D1pic1" class="fPic">  
				        <div class="fcon" style="display: none;">
				            <a  href="tolist"><img src="images/ad1.png" style="opacity: 1; "></a>
				            <span class="shadow"><a  href="#">圆梦巨人再获新高</a></span>
				        </div>
				        
				        <div class="fcon" style="display: none;">
				            <a  href="tolist"><img src="images/02.jpg" style="opacity: 1; "></a>
				            <span class="shadow"><a  href="#">佟大为登封面表情搞怪 成熟男人也是天真男孩</a></span>
				        </div>
				        
				        <div class="fcon" style="display: none;">
				            <a  href="tolist"><img src="images/03.jpg" style="opacity: 1; "></a>
				            <span class="shadow"><a  href="#">21岁出柜超模巴厘自曝搞笑全裸照</a></span>
				        </div>
				        
				        <div class="fcon" style="display: none;">
				            <a  href="tolist"><img src="images/04.jpg" style="opacity: 1; "></a>
				            <span class="shadow"><a  href="#">金喜善出道21年 皮肤白皙越长越“嫩”！</a></span>
				        </div>    
				    </div>
				    <div class="fbg">  
				    <div class="D1fBt" id="D1fBt">  
				        <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>1</i></a>  
				        <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>2</i></a>  
				        <a href="javascript:void(0)" hidefocus="true" target="_self" class="current"><i>3</i></a>  
				        <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>4</i></a>  
				    </div>  
				    </div>  
				    <span class="prev"></span>   
				    <span class="next"></span>    
				</div>  
				<script type="text/javascript">
					Qfast.add('widgets', { path: "js/terminator2.2.min.js", type: "js", requires: ['fx'] });  
					Qfast(false, 'widgets', function () {
						K.tabs({
							id: 'fsD1',   //焦点图包裹id  
							conId: "D1pic1",  //** 大图域包裹id  
							tabId:"D1fBt",  
							tabTn:"a",
							conCn: '.fcon', //** 大图域配置class       
							auto: 1,   //自动播放 1或0
							effect: 'fade',   //效果配置
							eType: 'click', //** 鼠标事件
							pageBt:true,//是否有按钮切换页码
							bns: ['.prev', '.next'],//** 前后按钮配置class                          
							interval: 3000  //** 停顿时间  
						}) 
					})  
				</script>
 <!-- 轮播图 -->

                
                <div class="c3_b1_c_bottom">
                    <ul>
                        <li>
                           <a href="#"><img src="images/p01.png"/></a>
                           <a href="#">Java从入门到精通</a>  
                        </li>
                       <li>
                           <a href="#"><img src="images/p01.png"/></a> 
                           <a href="#">Java从入门到精通</a> 
                        </li>
                        <li>
                           <a href="#"><img src="images/p01.png"/></a> 
                           <a href="#">Java从入门到精通</a> 
                        </li>
                    </ul>
            	</div>
            </div>
            <div class="c3_b1_right">
            	<h1>杰普快报<a href="#">更多</a></h1>
            	<ul>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                	<li><a href="#">〈加措〉相信这一切都是对我们最好的安排  </a></li>
                </ul>
            </div>
            <div style="clear:both"></div>
        </div>
        <div class="c3_b2">
        	<ul>
            	<li>
                	<div class="c3_b2_txt">
                    	<h1>疯狂JAVA讲义</h1>
                        <p>Java经典</p>
                        <h2>畅销书籍</h2>
                        <h2>覆盖java基础及全新内容</h2>
                        <p><a href="#">更多精彩，点击进入</a></p>
                    </div>
                </li>
                <li>
                	<div class="c3_b2_txt">
                    	<h1>疯狂JAVA讲义</h1>
                        <p>Java经典</p>
                        <h2>畅销书籍</h2>
                        <h2>覆盖java基础及全新内容</h2>
                        <p><a href="#">更多精彩，点击进入</a></p>
                    </div>
                </li>
                <li>
                	<div class="c3_b2_txt">
                    	<h1>疯狂JAVA讲义</h1>
                        <p>Java经典</p>
                        <h2>畅销书籍</h2>
                        <h2>覆盖java基础及全新内容</h2>
                        <p><a href="#">更多精彩，点击进入</a></p>
                    </div>
                </li>
                <li class="no_mr">
                	<div class="c3_b2_txt">
                    	<h1>疯狂JAVA讲义</h1>
                        <p>Java经典</p>
                        <h2>畅销书籍</h2>
                        <h2>覆盖java基础及全新内容</h2>
                        <p><a href="#">更多精彩，点击进入</a></p>
                    </div>
                </li>
                <li>
                	<div class="c3_b2_txt">
                    	<h1>疯狂JAVA讲义</h1>
                        <p>Java经典</p>
                        <h2>畅销书籍</h2>
                        <h2>覆盖java基础及全新内容</h2>
                        <p><a href="#">更多精彩，点击进入</a></p>
                    </div>
                </li>
                <li>
                	<div class="c3_b2_txt">
                    	<h1>疯狂JAVA讲义</h1>
                        <p>Java经典</p>
                        <h2>畅销书籍</h2>
                        <h2>覆盖java基础及全新内容</h2>
                        <p><a href="#">更多精彩，点击进入</a></p>
                    </div>
                </li>
                <li>
                	<div class="c3_b2_txt">
                    	<h1>疯狂JAVA讲义</h1>
                        <p>Java经典</p>
                        <h2>畅销书籍</h2>
                        <h2>覆盖java基础及全新内容</h2>
                        <p><a href="#">更多精彩，点击进入</a></p>
                    </div>
                </li>
                <li class="no_mr">
                	<div class="c3_b2_txt">
                    	<h1>疯狂JAVA讲义</h1>
                        <p>Java经典</p>
                        <h2>畅销书籍</h2>
                        <h2>覆盖java基础及全新内容</h2>
                        <p><a href="#">更多精彩，点击进入</a></p>
                    </div>
                </li>

         
                 
            </ul>
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
