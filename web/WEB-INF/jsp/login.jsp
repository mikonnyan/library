<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<!-- 引入样式 -->
	<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
<title>登录页面</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/css/style.css"
	   type=text/css rel=stylesheet>
<link href="${pageContext.request.contextPath}/css/boot-crm.css"
	   type=text/css rel=stylesheet>
<script src=
       "${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
</script>
<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
<script>
// 判断是登录账号和密码是否为空
function check(){
    var usercode = $("#usercode").val();
    var password = $("#password").val();
    if(usercode=="" || password==""){
    	$("#message").text("账号或密码不能为空！");
        return false;
    }  
    return true;
}
//临时 注册按钮
function  a() {
    document.login.action="${pageContext.request.contextPath}/register.action";
    document.login.submit();
}
</script>
</head>
<body leftMargin=0 topMargin=0 marginwidth="0" marginheight="0"
	background="${pageContext.request.contextPath}/images/rightbg.jpg">


<div ALIGN="center">
<table border="0" width="1140px" cellspacing="0" cellpadding="0"
                                                           id="table1">
	<tr>
		<td height="93"></td>
		<td></td>
	</tr>
	<tr>
   <td background="${pageContext.request.contextPath}/images/login4.png "
		width="580" height="330">
   </td>
   <td class="login_msg" width="400" align="center">
	 <!-- margin:0px auto; 控制当前标签居中 -->
	 <fieldset style="width: auto; margin: 0px auto;">
		  <legend>
		     <font style="font-size:15px" face="宋体">
		          图书管理系统
		     </font>
		  </legend>
		<font color="red">
			 <%-- 提示信息--%>
			 <span id="message">${msg}</span>
		</font>
		 <%--//////////////////////////////--%>
		 <form action="${pageContext.request.contextPath}/login.action" method="post" name="login">
			 <div class="panel panel-default" id="login">
				 <div class="panel-heading" style="background-color: #fff">
					 <h3 class="panel-title">请登录</h3>
				 </div>
				 <div class="panel-body">
					 <div class="form-group">
						 <label for="usercode">用户名</label>
						 <input type="number" class="form-control" id="usercode" name="usercode" placeholder="请输入用户名">
					 </div>
					 <div class="form-group">
						 <label for="password">密码</label>
						 <input type="password" class="form-control" id="password" name="password"  placeholder="请输入密码">
					 </div>
					 <div class="checkbox text-left">
						 <%--<label>--%>
							 <%--<input type="checkbox" id="remember">记住密码--%>
						 <%--</label>--%>
						 <%--<a style="margin-left: 100px" href="#">忘记密码?</a>--%>
					 </div>

					 <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
					 <div style="display: flex; justify-content: space-around; align-items: center">
						 <button id="loginButton"  class="btn btn-primary  btn-block" style="height: 40px">登陆</button>
						 <button id="loginButton"  class="btn btn-primary  btn-block" onclick="a()" style="height: 40px; margin-top: 0px">注册</button>
					 </div>
					 <%--<el-button type="primary" plain>主要按钮</el-button>--%>
					 <%--<el-button class="registerbutton" onclick="a()" >注册</el-button>--%>
				 </div>
			 </div>
		 </form>
		 <%--//////////////////////////////////--%>
		<%-- 提交后的位置：/WEB-INF/jsp/customer.jsp--%>
		<%--<form action="${pageContext.request.contextPath}/login.action"--%>
			                       <%--method="post" name="login">--%>
                      <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /><br />--%>
          <%--账&nbsp;号：<input id="usercode" type="text" name="usercode" />--%>
          <%--<br /><br />--%>
          <%--密&nbsp;码：<input id="password" type="password" name="password" />--%>
          <%--<br /><br />--%>
          <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
          <%--<center><input type="submit" value="登录" onclick="check()"/>--%>
              <%--<button class="registerbutton" onclick="a()" >注册</button>--%>
		 <%--</form>--%>
		 <%--<el-input v-model="input" placeholder="请输入内容"></el-input>--%>



         <%--<form action="${pageContext.request.contextPath}/register.action"--%>
               <%--method="post" onsubmit="return check()">--%>
                 <%--<input type="submit" value="注册" /></center>--%>
         <%--</form>--%>
	 </fieldset>
	</td>
	</tr>
</table>
</div>
</body>
<!-- import Vue before Element -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<%--<script src="https://unpkg.com/vue/dist/vue.js"></script>--%>
<!-- 引入组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script>
    new Vue({
        el: '#app',
        data: function() {
            return { visible: false }
        }
    })
</script>
</html>
