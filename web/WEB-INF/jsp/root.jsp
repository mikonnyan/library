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
	<title>图书管理系统</title>
	<!-- 引入css样式文件 -->
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
					<a href="${pageContext.request.contextPath }/toRoot.action" >
						用户管理
					</a>
				</li>
				<%--<li>--%>
					<%--<a href="reader_info.html" >--%>
						<%--个人信息--%>
					<%--</a>--%>
				<%--</li>--%>
				<%--<li >--%>
					<%--<a href="${pageContext.request.contextPath }/booklog.action" >--%>
						<%--借还记录--%>
					<%--</a>--%>
				<%--</li>--%>
				<%--<li>--%>
					<%--<a href="${pageContext.request.contextPath }/bookadministratorrepasswd.action" >--%>
						<%--密码修改--%>
					<%--</a>--%>
				<%--</li>--%>
				<%--<li>--%>
					<%--<a href="${pageContext.request.contextPath }/gettopbooks.action" >--%>
						<%--借阅排行--%>
					<%--</a>--%>
				<%--</li>--%>
				<%--<li>--%>
					<%--<a href="${pageContext.request.contextPath }/tobookadministrator_SetReaderNumber.action" >--%>
						<%--图书借阅--%>
					<%--</a>--%>
				<%--</li>--%>
				<%--<li>--%>
					<%--<a href="${pageContext.request.contextPath }/tobookadministrator_ReturnBook.action" >--%>
						<%--图书归还--%>
					<%--</a>--%>
				<%--</li>--%>
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
					<a href="${pageContext.request.contextPath }/toRoot.action" class="active">
						<i class="fa fa-edit fa-fw"></i> 用户管理
					</a>
				</li>
				<%--<li>--%>
					<%--<a href="${pageContext.request.contextPath }/booklog.action">--%>
						<%--<i class="fa fa-dashboard fa-fw" ></i> 借还记录--%>
						<%--&lt;%&ndash;<a href="${pageContext.request.contextPath }/borrowBook.action?reader=${USER_SESSION.user_name}">&ndash;%&gt;--%>
					<%--</a>--%>
				<%--</li>--%>
			</ul>
		</div>
	</div>
	<!-- 左侧显示列表部分 end-->
	<!-- 图书列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">用户管理</h1>
				<%--&lt;%&ndash; 提示信息&ndash;%&gt;--%>
				<%--<span class="msg" >${msg}</span>--%>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get"
					  action="${pageContext.request.contextPath }/findUserList.action">
					<div class="form-group">
						<label for="customerName">用户卡号</label>
						<input type="text" class="form-control" id="customerName" name="usercode" />
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<%--<a href="#" class="btn btn-primary" data-toggle="modal"--%>
		   <%--data-target="#newCustomerDialog" onclick="clearCustomer()">新建</a>--%>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">用户信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
						<tr>
							<th>用户身份</th>
							<th>用户卡号</th>
							<th>用户名</th>
							<th>用户密码</th>

							<%--<th>图书位置</th>--%>
							<%--<th>书架号</th>--%>
                            <%--<th>图书数量</th>--%>
							<%--<th>在馆数量</th>--%>
							<%--<th>租借人ID</th>--%>
							<%--<th>预约人ID</th>--%>
							<th>操作</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${page.rows}" var="row">
						<tr>
							<c:if test="${row.user_level==1}">
							<td>图书管理员</td>
							</c:if>
							<c:if test="${row.user_level==0}">
							<td>读者</td>
							</c:if>
							<c:if test="${row.user_level==2}">
							<td>用户管理员</td>
							</c:if>

							<td>${row.user_code}</td>
							<td>${row.user_name}</td>
							<td>${row.user_password}</td>

							<%--<td>${row.genre}</td>--%>
							<%--<td>${row.room}</td>--%>
							<%--<td>${row.bookrack}</td>--%>
                            <%--<td>${row.number}</td>--%>
							<%--<td>${row.nownumber}</td>--%>
							<%--<td></td>--%>
							<td>
								<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick= "editCustomer(${row.user_code})">修改</a>
									<%--<a href="${pageContext.request.contextPath}/borrowBook.action?bookId=${row.id}" class="btn btn-primary btn-xs">借阅</a>--%>
									<%--<a href="#" class="btn btn-primary btn-xs" onclick= "borrowBook(${row.id})">借阅</a>--%>
									<%--<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick= "editCustomer(${row.id})">借阅</a>--%>
									<a href="#" class="btn btn-danger btn-xs" onclick="deleteCustomer(${row.user_code})">删除</a>
							</td>
						</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<mikon:page url="${pageContext.request.contextPath }/bookadmin.action" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 图书列表查询部分  end-->
</div>
<!-- 创建客户模态框 -->
<div class="modal fade" id="newCustomerDialog" tabindex="-1" role="dialog"
	 aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建图书信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_book_form">
					<div class="form-group">
						<label for="isbn" class="col-sm-2 control-label">
							ISBN:
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="isbn" placeholder="此项必填" name="isbn" />
						</div>
					</div>
					<div class="form-group">
						<label for=" categories" class="col-sm-2 control-label">图书大类</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id=" categories" placeholder="例:文学" name="categories" />
						</div>
					</div>
					<div class="form-group">
						<label for="class" class="col-sm-2 control-label">图书类型</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="class" placeholder="例:小说" name="genre" />
						</div>
					</div>
					<div class="form-group">
						<label for=" room" class="col-sm-2 control-label">图书室</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id=" room" placeholder="例:社会科学图书室1" name="room" />
						</div>
					</div>
					<div class="form-group">
						<label for=" bookrack" class="col-sm-2 control-label">书架号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id=" bookrack" placeholder="例:35架A面3列" name="bookrack" />
						</div>
					</div>
                    <div class="form-group">
                        <label for="number" class="col-sm-2 control-label">图书数量</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="number" placeholder="默认为1" name="number" />
                        </div>
                    </div>
					<%--<div class="form-group">--%>
						<%--<label for="book_press" class="col-sm-2 control-label">出版社</label>--%>
						<%--<div class="col-sm-10">--%>
							<%--<input type="text" class="form-control" id="book_press" placeholder="出版社" name="press" />--%>
						<%--</div>--%>
					<%--</div>--%>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createBook()">创建图书</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改客户模态框 -->
<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
	 aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_book_form">
					<input type="hidden" id="edit_id" name="id"/>
					<%--用户账号--%>
					<div class="form-group">
						<label for="user_code" class="col-sm-2 control-label">用户账号</label>
						<div class="col-sm-10">
							<%--<input type="text" class="form-control" id="title" placeholder="图书名称" name="title" />--%>
							<input readonly="value" type="text" class="form-control" id="user_code" placeholder="图书名称" name="user_code" />
						</div>
					</div>
					<%--用户名--%>
					<div class="form-group">
						<label for="user_name" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input  type="text" class="form-control" id="user_name" placeholder="" name="user_name" />
						</div>
					</div>
					<%--密码--%>
					<div class="form-group">
						<label for="user_password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input  type="text" class="form-control" id="user_password" placeholder="" name="user_password" />
						</div>
					</div>
					<%--用户权限--%>
					<div class="form-group">
						<label for="user_level" class="col-sm-2 control-label">更改权限</label>
						<div class="col-sm-10">
							<input  type="text" class="form-control" id="user_level" placeholder="0为读者，1为图书管理员，2为用户管理员" name="user_level" />
						</div>
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateCustomer()">保存修改</button>
			</div>
		</div>
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
<script type="text/javascript">
    //清空新建客户窗口中的数据
    function clearCustomer() {
        $("#new_customerName").val("");
        $("#new_customerFrom").val("")
        $("#new_custIndustry").val("")
        $("#new_custLevel").val("")
        $("#new_linkMan").val("");
        $("#new_phone").val("");
        $("#new_mobile").val("");
        $("#new_zipcode").val("");
        $("#new_address").val("");
    }
    // 创建图书
    function createBook() {
        $.post("<%=basePath%>/createbook.action",
            $("#new_book_form").serialize(),function(data){
                if(data =="OK"){
                    alert("创建图书成功！");
                    window.location.reload();
                }else if(data =="FALL"){
                    alert("创建图书失败！");
                    window.location.reload();
                }else if(data =="HAVE"){
                    alert("创建图书失败！图书已存在！");
                    window.location.reload();
                }
            });
    }
    // 通过id获取修改的客户信息
    function editCustomer(user_code) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>/findUserByUsercode.action",
            data:{"user_code":user_code},
            success:function(data) {
                $("#user_code").val(data.user_code);
                $("#user_name").val(data.user_name);
                $("#user_password").val(data.user_password)
                // $("#user_level").val(data.user_level)
                // $("#room").val(data.room)
                // $("#genre").val(data.genre)
                // $("#bookrack").val(data.bookrack)
                // $("#summary").val(data.summary);
                // $("#author").val(data.author)
                // $("#publisher").val(data.publisher)
                // $("#pubplace").val(data.pubplace)
                // $("#pubdate").val(data.pubdate)
                // $("#page").val(data.page)
                // $("#price").val(data.price)
                // $("#binding").val(data.binding)
                // $("#bookisbn").val(data.isbn)
                // $("#isbn10").val(data.isbn10)
                // $("#keyword").val(data.keyword)
                // $("#edition").val(data.edition)
                // $("#impression").val(data.impression)
                // $("#booklanguage").val(data.language);
                // $("#format").val(data.format);
                // $("#cip").val(data.cip);
                // $("#edit_phone").val(data.cust_phone);
                // $("#edit_mobile").val(data.cust_mobile);
                // $("#edit_zipcode").val(data.cust_zipcode);
                // $("#edit_address").val(data.cust_address);
            }
        });
    }
    // 执行修改客户操作
    function updateCustomer() {
        $.post("<%=basePath%>/userupdate.action",$("#edit_book_form").serialize(),
			function(data){
            if(data =="OK"){
                alert("用户信息更新成功！");
                window.location.reload();
            }else{
                alert("用户信息更新失败！");
                window.location.reload();
            }
        });
    }
    // 删除客户

    function deleteCustomer(user_code) {
        if (confirm('确实要删除该图书吗?')) {
            $.post("<%=basePath%>/userdelete.action", {"user_code": user_code},
                function (data) {
                    if (data == "OK") {
                        alert("用户删除成功！");
                        window.location.reload();
                    } else {
                        alert("用户删除失败！");
                        window.location.reload();
                    }
                });
        }
    }
</script>
</body>
</html>