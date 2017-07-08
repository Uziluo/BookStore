<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>briup电子商务-注册页</title>
<link rel="stylesheet" href="css/common.css"/>
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript">
$(function () {
	$("input").blur(function () {
		if ($(this).attr("id")!="username") {
			var message = $(this).val();
			if (message.length==0) {
				//长度为0
				var $span = $(this).next();
				$span.children().attr("src","images/icons/nosure.png");
				$span.next().html("长度为0")
			} else {
				//长度不为0
				var $span = $(this).next()
				$span.children().attr("src","images/icons/sure.png");
				$span.next().html("")
			}
		}
	})
})
</script>

</head>
<body>
	<div class="container2">
    	<div class="header2">
        	<div>
            	<a href="index"><img class="logo" src="images/logon_register.png"></a>
            </div>
            <div>
            	<ul class="tabs">
                	<li class="phone current"><a href="#">用手机登陆</a></li>
                </ul>
            </div>
            <div class="tlg">
            	已有账号 <a href="tologin">登陆</a>
            </div>
        </div>
        <form action="doregister"  method="post">
        <div class="content2">
			<ul class="reg_box">
            	<li>
                	<span><b>*</b>用户名：</span>
                    <input id="username" type="text" name="name"  onblur="yy(this)" id="gress2"/> 
                    <span style="width: 30px"><img style="margin-top: 9px;padding-left: 10px" id="gress1"> </span> 
              		<span id="gress" style="color: #000000; font-size:12px;width: 60px"> </span>
                </li>
                <script type="text/javascript">
                function yy(username) {
                var username = username.value; //获取username的值
                var a = document.getElementById("gress");
				var img = document.getElementById("gress1");  //图片显示
                if (username.length==0) {
                	img.src="images/icons/nosure.png";
                	a.innerHTML="&nbsp;长度为0";
				} else {
					 //1.创建 
	                var ajax = new XMLHttpRequest();
	                //2.准备请求
	                ajax.open("get", "ajaxusername?username="+username, true);
	                //3.准备响应
	                ajax.onreadystatechange=function (){
	                	if (ajax.readyState == 4 && ajax.status==200) {
	        				//数据写回ajax对象
	        				var data = ajax.responseText;
							
	        				if (data=="true") {
	        					//用户存在
								a.innerHTML="&nbsp;*用户存在";
								img.src="images/icons/nosure.png";
							}else{
								//存户不存在
								a.innerHTML="&nbsp";
								img.src="images/icons/sure.png";
							}
	        			}
	                }
	                //4.发送
	                ajax.send();
				}
               
				}
					
				</script>
                
               <li>
                	<span><b>*</b>密码：</span>
                    <input type="password" name="password"/>
                  	<span style="width: 30px"><img style="margin-top: 9px;padding-left: 10px" > </span> 
                   	<div style="border:0px;background-color:#FFFFFF;padding-left: 0px; "></div>
                </li>
                <li>
                	<span><b>*</b>邮编：</span>
                    <input type="text" name="zip" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="6"/>
                    <span style="width: 30px"><img style="margin-top: 9px;padding-left: 10px" > </span> 
                   	<div style="border:0px;background-color:#FFFFFF;padding-left: 0px; "></div>
                </li>
                <li>
                	<span><b>*</b>地址：</span>
                    <input type="text" name="address"/>
                   <span style="width: 30px"><img style="margin-top: 9px;padding-left: 10px" > </span> 
                   	<div style="border:0px;background-color:#FFFFFF;padding-left: 0px; "></div>
                </li>
                <li>
                	<span><b>*</b>电话：</span>
                    <input type="text" name="telephone" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="11"/>
                    <span style="width: 30px"><img style="margin-top: 9px;padding-left: 10px" > </span> 
                   	<div style="border:0px;background-color:#FFFFFF;padding-left: 0px; "></div>
                </li>
                <li>
                	<span><b>*</b>电子邮箱：</span>
                    <input type="text" name="email"/>
                   <span style="width: 30px"><img style="margin-top: 9px;padding-left: 10px" > </span> 
                   	<div style="border:0px;background-color:#FFFFFF;padding-left: 0px; "></div>
                </li>
            </ul>
			<p>
            	<input type="checkbox" checked name="check" value="1"/>
                我已阅读并同意
                <a href="#">用户注册协议</a>
            </p>
            <input class="btn_submit" type="submit" value="立即注册"/>
        </div>
        </form>
   	</div>
   	
   	<jsp:include page="model/foot.jsp"></jsp:include>
   	
</body>
</html>
