<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <head> 
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
    <title>jquery div提示框渐隐弹出与隐藏</title> 
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script> 
    <style> 
        *{margin:0;padding:0;font-size:12px;} 
        input{width:120px;height:30px;cursor:pointer;} 
        #note{position:absolute;width:150px;padding:8px;background:#eee;border:1px solid #ccc;left:40%;z-index:9999;display:none;} 
    </style> 
 <script type="text/javascript" src="js/jquery-1.4.2.js"></script>
    <script> 
        $(function(){ 
            $('input').click(function(){ 
                if(!$('#note').is(':visible')){ 
                    $('#note').css({display:'block', top:'-100px'}).animate({top: '+100'}, 500, function(){ 
                        setTimeout(out, 2000); 
                    }); 
                }
            }); 
        }); 
 
        function out(){ 
            $('#note').animate({top:'0'}, 300, function(){ 
                $(this).css({display:'none', top:'-100px'}); 
            }); 
        } 
    </script> 
    </head> 
 
    <body> 
        <div id="note">修改成功!</div> 
        <input type="button" value="点我，3s后消失" /> 
    </body> 
</html>