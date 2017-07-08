<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<button id="btn" onclick="func()">btn</button>
<script>
var layer=document.createElement("div");
	layer.id="layer";
function func()
{
    var style=
    {
        background:"#f00",
        position:"absolute",
        zIndex:10,
        width:"200px",
        height:"200px",
        left:"200px",
        top:"200px"
    }
    for(var i in style)
        layer.style[i]=style[i];   
    if(document.getElementById("layer")==null)
    {
        document.body.appendChild(layer);
        setTimeout("document.body.removeChild(layer)",2000)
    }
}
 
</script>
</body>
</html>