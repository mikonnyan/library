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
	<!-- 客户列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">借还记录</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<%--<div class="panel panel-default">--%>
			<%--<div class="panel-body">--%>
				<%--<form class="form-inline" method="get"--%>
					  <%--action="${pageContext.request.contextPath }/booklog.action">--%>
					<%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
						<%--&lt;%&ndash;<label for="customerName">客户名称</label>&ndash;%&gt;--%>
						<%--&lt;%&ndash;<input type="text" class="form-control" id="customerName"&ndash;%&gt;--%>
							   <%--&lt;%&ndash;value="${custName }" name="custName" />&ndash;%&gt;--%>
					<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
					<%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
						<%--&lt;%&ndash;<label for="customerFrom">客户来源</label>&ndash;%&gt;--%>
						<%--&lt;%&ndash;<select	class="form-control" id="customerFrom" name="custSource">&ndash;%&gt;--%>
							<%--&lt;%&ndash;<option value="">--请选择--</option>&ndash;%&gt;--%>
							<%--&lt;%&ndash;<c:forEach items="${fromType}" var="item">&ndash;%&gt;--%>
								<%--&lt;%&ndash;<option value="${item.dict_id}"&ndash;%&gt;--%>
										<%--&lt;%&ndash;<c:if test="${item.dict_id == custSource}">selected</c:if>>&ndash;%&gt;--%>
										<%--&lt;%&ndash;${item.dict_item_name }&ndash;%&gt;--%>
								<%--&lt;%&ndash;</option>&ndash;%&gt;--%>
							<%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
						<%--&lt;%&ndash;</select>&ndash;%&gt;--%>
					<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
					<%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
						<%--&lt;%&ndash;<label for="custIndustry">所属行业</label>&ndash;%&gt;--%>
						<%--&lt;%&ndash;<select	class="form-control" id="custIndustry"  name="custIndustry">&ndash;%&gt;--%>
							<%--&lt;%&ndash;<option value="">--请选择--</option>&ndash;%&gt;--%>
							<%--&lt;%&ndash;<c:forEach items="${industryType}" var="item">&ndash;%&gt;--%>
								<%--&lt;%&ndash;<option value="${item.dict_id}"&ndash;%&gt;--%>
										<%--&lt;%&ndash;<c:if test="${item.dict_id == custIndustry}"> selected</c:if>>&ndash;%&gt;--%>
										<%--&lt;%&ndash;${item.dict_item_name }&ndash;%&gt;--%>
								<%--&lt;%&ndash;</option>&ndash;%&gt;--%>
							<%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
						<%--&lt;%&ndash;</select>&ndash;%&gt;--%>
					<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
					<%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
						<%--&lt;%&ndash;<label for="custLevel">客户级别</label>&ndash;%&gt;--%>
						<%--&lt;%&ndash;<select	class="form-control" id="custLevel" name="custLevel">&ndash;%&gt;--%>
							<%--&lt;%&ndash;<option value="">--请选择--</option>&ndash;%&gt;--%>
							<%--&lt;%&ndash;<c:forEach items="${levelType}" var="item">&ndash;%&gt;--%>
								<%--&lt;%&ndash;<option value="${item.dict_id}"&ndash;%&gt;--%>
										<%--&lt;%&ndash;<c:if test="${item.dict_id == custLevel}"> selected</c:if>>&ndash;%&gt;--%>
										<%--&lt;%&ndash;${item.dict_item_name }&ndash;%&gt;--%>
								<%--&lt;%&ndash;</option>&ndash;%&gt;--%>
							<%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
						<%--&lt;%&ndash;</select>&ndash;%&gt;--%>
					<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
					<%--<button type="submit" class="btn btn-primary">查询</button>--%>
				<%--</form>--%>
			<%--</div>--%>
		<%--</div>--%>
		<%--<a href="#" class="btn btn-primary" data-toggle="modal"--%>
		   <%--data-target="#newCustomerDialog" onclick="clearCustomer()">新建</a>--%>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">图书信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
						<tr>
							<th>编号</th>
							<th>书籍isbn</th>
							<th>图书名称</th>
							<th>用户卡号</th>
							<th>借阅时间</th>
							<th>归还时间</th>
							<th>逾期情况</th>
							<th>操作</th>
							<th>编辑</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${page.rows}" var="row">
							<tr>
								<td>${row.id}</td>
								<td>${row.isbn}</td>
								<td>${row.title}</td>
								<td>${row.user_code}</td>
								<td>${row.borrowtime}</td>
								<td>${row.returntime}</td>
								<td>${row.state}</td>
								<td>${row.operation}</td>
								<td>
									<%--<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick= "editCustomer(${row.cust_id})">修改</a>--%>
                                        <a href="#" class="btn btn-danger btn-xs" onclick="booklogdelete(${row.id})">删除</a>
                                        <%--<a href="#" class="btn btn-danger btn-xs" onclick="deleteCustomer(${row.id})">删除</a>--%>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<mikon:page url="${pageContext.request.contextPath }/booklog.action" />
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
<!-- 创建客户模态框 -->
<div class="modal fade" id="newCustomerDialog" tabindex="-1" role="dialog"
	 aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建客户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_customer_form">
					<div class="form-group">
						<label for="new_customerName" class="col-sm-2 control-label">
							客户名称
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_customerName" placeholder="客户名称" name="cust_name" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户来源</label>
						<div class="col-sm-10">
							<select	class="form-control" id="new_customerFrom" name="cust_source">
								<option value="">--请选择--</option>
								<c:forEach items="${fromType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custSource}">selected</c:if>>
											${item.dict_item_name }
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属行业</label>
						<div class="col-sm-10">
							<select	class="form-control" id="new_custIndustry"  name="cust_industry">
								<option value="">--请选择--</option>
								<c:forEach items="${industryType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custIndustry}"> selected</c:if>>
											${item.dict_item_name }
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
						<div class="col-sm-10">
							<select	class="form-control" id="new_custLevel" name="cust_level">
								<option value="">--请选择--</option>
								<c:forEach items="${levelType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_linkMan" class="col-sm-2 control-label">联系人</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_linkMan" placeholder="联系人" name="cust_linkman" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_phone" class="col-sm-2 control-label">固定电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_phone" placeholder="固定电话" name="cust_phone" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_mobile" class="col-sm-2 control-label">移动电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_mobile" placeholder="移动电话" name="cust_mobile" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_zipcode" class="col-sm-2 control-label">邮政编码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_zipcode" placeholder="邮政编码" name="cust_zipcode" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_address" class="col-sm-2 control-label">联系地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_address" placeholder="联系地址" name="cust_address" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createCustomer()">创建客户</button>
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
				<h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_customer_form">
					<input type="hidden" id="edit_cust_id" name="cust_id"/>
					<div class="form-group">
						<label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_customerName" placeholder="客户名称" name="cust_name" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户来源</label>
						<div class="col-sm-10">
							<select	class="form-control" id="edit_customerFrom" name="cust_source">
								<option value="">--请选择--</option>
								<c:forEach items="${fromType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custSource}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属行业</label>
						<div class="col-sm-10">
							<select	class="form-control" id="edit_custIndustry"  name="cust_industry">
								<option value="">--请选择--</option>
								<c:forEach items="${industryType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custIndustry}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
						<div class="col-sm-10">
							<select	class="form-control" id="edit_custLevel" name="cust_level">
								<option value="">--请选择--</option>
								<c:forEach items="${levelType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_linkMan" class="col-sm-2 control-label">联系人</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_linkMan" placeholder="联系人" name="cust_linkman" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_phone" class="col-sm-2 control-label">固定电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_phone" placeholder="固定电话" name="cust_phone" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_mobile" class="col-sm-2 control-label">移动电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_mobile" placeholder="移动电话" name="cust_mobile" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_zipcode" class="col-sm-2 control-label">邮政编码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_zipcode" placeholder="邮政编码" name="cust_zipcode" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_address" class="col-sm-2 control-label">联系地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_address" placeholder="联系地址" name="cust_address" />
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
    // 创建客户
    function createCustomer() {
        $.post("<%=basePath%>customer/create.action",
            $("#new_customer_form").serialize(),function(data){
                if(data =="OK"){
                    alert("客户创建成功！");
                    window.location.reload();
                }else{
                    alert("客户创建失败！");
                    window.location.reload();
                }
            });
    }
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
    // 删除图书记录
    function booklogdelete(id) {
        if(confirm('确实要删除该图书记录吗?')) {
            $.post("<%=basePath%>/booklogdelete.action",{"id":id},
                function(data){
                    if(data =="OK"){
                        alert("图书记录删除成功！");
                        window.location.reload();
                    }else{
                        alert("图书记录删除失败！");
                        window.location.reload();
                    }
                });
        }
    }

</script>
</body>
</html>