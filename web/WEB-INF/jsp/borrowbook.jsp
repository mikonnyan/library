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
	<%--引入提示文件--%>
	<link href="<%=basePath%>css/tip.css" rel="stylesheet" />
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

<div id="wrapper">
  <!-- 导航栏部分 -->
  <nav class="navbar navbar-default navbar-static-top" role="navigation"
		 style="margin-bottom: 0">
	<div class="navbar-header">
		<a class="navbar-brand" href="<%=basePath%>toBook.action">图书管理系统</a>
	</div>
	<!-- 导航栏右侧图标部分 -->
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
				<li><a href="<%=basePath%>repasswd.action"><i class="fa fa-gear fa-fw"></i> 密码更改</a></li>
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
	<!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<%--<li class="sidebar-search">--%>
					<%--<div class="input-group custom-search-form">--%>
						<%--<input type="text" class="form-control" placeholder="查询内容...">--%>
						<%--<span class="input-group-btn">--%>
							<%--<button class="btn btn-default" type="button">--%>
								<%--<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>--%>
							<%--</button>--%>
						<%--</span>--%>
					<%--</div>--%>
				<%--</li>--%>
				<li>
				    <a href="<%=basePath%>toBook.action" class="active">
				      <i class="fa fa-edit fa-fw"></i> 图书查询
				    </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/myBorrowBook.action?reader=${USER_SESSION.user_code}">
						<i class="fa fa-dashboard fa-fw" ></i> 个人借阅
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 左侧显示列表部分 end-->
  </nav>
    <!-- 客户列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">个人借阅</h1>
				<%-- 提示信息--%>
				<span class="msg" >${msg}</span>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">个人借阅图书列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>图书名称</th>
								<th>用户卡号</th>
								<th>租借状态</th>
								<th>借阅时间</th>
								<th>到期时间</th>
								<%--<th>操作</th>--%>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.id}</td>
									<td>${row.title}</td>
									<td>${row.usercode}</td>
									<td>${row.state}</td>
									<td>${row.start_time}</td>
									<td>${row.returntime}</td>

									<%--<td>--%>
										<%--<a href="${pageContext.request.contextPath}/returnBook.action?bookId=${row.id}" class="btn btn-primary btn-xs">归还</a>--%>
										<%--&lt;%&ndash;<a href="#" class="btn btn-primary btn-xs" onclick= "borrowBook(${row.id})">借阅</a>&ndash;%&gt;--%>
										<%--&lt;%&ndash;<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick= "editCustomer(${row.id})">借阅</a>&ndash;%&gt;--%>
										<%--&lt;%&ndash;<a href="#" class="btn btn-danger btn-xs" onclick="deleteCustomer(${row.id})">删除</a>&ndash;%&gt;--%>
									<%--</td>--%>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<mikon:page url="${pageContext.request.contextPath }/myBorrowBook.action" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 客户列表查询部分  end-->
</div>
<!-- 引入js文件 -->
<%--&lt;%&ndash;引入tip.js&ndash;%&gt;--%>
<%--<script src="js/tip.js"></script>--%>
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
<script type="text/javascript">


	// 通过id获取修改的客户信息
	function editCustomer(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>customer/getCustomerById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_cust_id").val(data.cust_id);
	            $("#edit_customerName").val(data.cust_name);
	            $("#edit_customerFrom").val(data.cust_source)
	            $("#edit_custIndustry").val(data.cust_industry)
	            $("#edit_custLevel").val(data.cust_level)
	            $("#edit_linkMan").val(data.cust_linkman);
	            $("#edit_phone").val(data.cust_phone);
	            $("#edit_mobile").val(data.cust_mobile);
	            $("#edit_zipcode").val(data.cust_zipcode);
	            $("#edit_address").val(data.cust_address);
	            
	        }
	    });
	}
    // 执行修改客户操作
	function updateCustomer() {
		$.post("<%=basePath%>customer/update.action",$("#edit_customer_form").serialize(),function(data){
			if(data =="OK"){
				alert("客户信息更新成功！");
				window.location.reload();
			}else{
				alert("客户信息更新失败！");
				window.location.reload();
			}
		});
	}
	//借阅书籍
	function borrowBook() {
        $.post("<%=basePath%>book/borrow.action",{"id":id});
	}
	// 删除客户
	function deleteCustomer(id) {
	    if(confirm('确实要删除该客户吗?')) {
	$.post("<%=basePath%>customer/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("客户删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除客户失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>