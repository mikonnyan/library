<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mikon" uri="http://mikon.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName()
			+ ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>客户管理-BootCRM</title>
	<!-- 引入css样式文件 -->
	<%--&lt;%&ndash;tip&ndash;%&gt;--%>
	<%--<link herf="css/tip.css" rel="stylesheet"/>--%>
	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- Custom Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
	<%--提示语--%>
	<link href="<%=basePath%>css/tip.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%--顶部导航栏--%>
<nav class="navbar navbar-default " role="navigation" style="background-color:#fff">
	<div class="container-fluid">
		<div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
			<a class="navbar-brand " href=""><p class="text-primary">我的图书馆</p></a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav navbar-left">
				<li >
					<a href="${pageContext.request.contextPath }/toBookAdmin.action" >
						图书管理
					</a>
				</li>
				<%--<li>--%>
				<%--<a href="reader_info.html" >--%>
				<%--个人信息--%>
				<%--</a>--%>
				<%--</li>--%>
				<li >
					<a href="${pageContext.request.contextPath }/booklog.action" >
						借还记录
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/bookadministratorrepasswd.action" >
						密码修改
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/gettopbooks.action" >
						借阅排行
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/tobookadministrator_SetReaderNumber.action" >
						图书借阅
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/tobookadministrator_ReturnBook.action" >
						图书归还
					</a>
				</li>
			</ul>

			<%--<ul class="nav navbar-nav navbar-right">--%>
			<%--<li><a href="reader_info.html"><span class="glyphicon glyphicon-user"></span>&nbsp;${readercard.name}，已登录</a></li>--%>
			<%--<li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span>&nbsp;退出</a></li>--%>
			<%--</ul>--%>
			<ul class="nav navbar-top-links navbar-right">
				<!-- 用户信息和系统设置 start -->
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i>
							用户：${USER_SESSION.user_name}
						</a>
						</li>
						<li><a href="${pageContext.request.contextPath }/bookadministratorrepasswd.action"><i class="fa fa-gear fa-fw"></i> 密码更改</a></li>
						<li class="divider"></li>
						<li>
							<a href="${pageContext.request.contextPath }/logout.action">
								<i class="fa fa-sign-out fa-fw"></i>退出登录
							</a>
						</li>
					</ul>
				</li>
				<!-- 用户信息和系统设置结束 -->
			</ul>
		</div>
	</div>
</nav>
<div id="wrapper">
	<!-- 导航栏部分 -->
	<!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li>
					<a href="${pageContext.request.contextPath }/toBookAdmin.action" class="active">
						<i class="fa fa-edit fa-fw"></i> 图书管理
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/booklog.action">
						<i class="fa fa-dashboard fa-fw" ></i> 借还记录
						<%--<a href="${pageContext.request.contextPath }/borrowBook.action?reader=${USER_SESSION.user_name}">--%>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 左侧显示列表部分 end-->
	<%--</nav>--%>
	<!-- 客户列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">用户账号设置</h1>
			</div>
			<div style="width: 60%;margin-left: 20%;margin-top: 10%">
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/adminSetReaderNumber.action" >
					<div class="form-group">
						<label for="usercode" class="col-sm-2 control-label">读者卡号</label>
						<div class="col-sm-10">
							<input  maxlength="8" class="form-control" type="text" id="usercode" name="usercode1" placeholder="读者卡号">
						</div>
					</div>
					<p id="tishi" style="margin-left: 10%;position: absolute"></p><br/>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" value="提交" class="btn btn-default">
						</div>
					</div>
					<span class="msg" >${msg}</span>
				</form>


			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</div>

</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<!-- 编写js代码 -->
<script>
    // function mySubmit(flag){
    //     return flag;
    // }
	//
    // $(document).keyup(function () {
    //     if($("#newPasswd").val()!=$("#reNewPasswd").val()&&$("#newPasswd").val()!=""&&$("#reNewPasswd").val()!=""&&$("#newPasswd").val().length==$("#reNewPasswd").val().length){
    //         $("#tishi").text("提示:两次输入的新密码不同，请检查!");
    //     }
    //     else {
    //         $("#tishi").text("");
    //     }
    // })
	//
    // $("#repasswd").submit(function () {
    //     if($("#oldPasswd").val()==''||$("#newPasswd").val()==''||$("#reNewPasswd").val()==''){
    //         $("#tishi").text("提示:请填写完整!");
    //         return mySubmit(false);
    //     }
    //     else if($("#newPasswd").val()!=$("#reNewPasswd").val()){
    //         $("#tishi").text("提示:两次输入的新密码不同，请检查!");
    //         return mySubmit(false);
    //     }
    // })
    // $.submit(function () {
    //
    // })
</script>
</body>
</html>