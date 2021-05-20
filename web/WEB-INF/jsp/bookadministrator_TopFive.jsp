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
	<div id="container" style="height: 100% ;margin-left: 90px"></div>

	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5/dist/echarts.min.js"></script>

	<script type="text/javascript">
        var dom = document.getElementById("container");
        var myChart = echarts.init(dom);
        var app = {};
        var book1 ="${book1}" ;
        var book2 ="${book2}" ;
        var book3 ="${book3}" ;
        var book4 ="${book4}" ;
        var book5 ="${book5}" ;
        var number1 =${number1};
        var number2 =${number2};
        var number3 =${number3};
        var number4 =${number4};
        var number5 =${number5};
        var option;



        option = {
            xAxis: {
                type: 'category',
                data: [book1, book2, book3,book4,book5]
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                data: [ number1,number2, number3, number4, number5],
                type: 'bar'
            }]
        };

        if (option && typeof option === 'object') {
            myChart.setOption(option);
        }

	</script>

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
    function mySubmit(flag){
        return flag;
    }

    $(document).keyup(function () {
        if($("#newPasswd").val()!=$("#reNewPasswd").val()&&$("#newPasswd").val()!=""&&$("#reNewPasswd").val()!=""&&$("#newPasswd").val().length==$("#reNewPasswd").val().length){
            $("#tishi").text("提示:两次输入的新密码不同，请检查!");
        }
        else {
            $("#tishi").text("");
        }
    })

    $("#repasswd").submit(function () {
        if($("#oldPasswd").val()==''||$("#newPasswd").val()==''||$("#reNewPasswd").val()==''){
            $("#tishi").text("提示:请填写完整!");
            return mySubmit(false);
        }
        else if($("#newPasswd").val()!=$("#reNewPasswd").val()){
            $("#tishi").text("提示:两次输入的新密码不同，请检查!");
            return mySubmit(false);
        }
    })
    $.submit(function () {
        
    })
</script>
</body>
</html>