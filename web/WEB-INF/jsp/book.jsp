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
				<li>
				    <a href="<%=basePath%>toBook.action" class="active">
				      <i class="fa fa-edit fa-fw"></i> 图书查询
				    </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/myBorrowBook.action?reader=${USER_SESSION.user_code}">
				      <i class="fa fa-dashboard fa-fw" ></i> 个人借阅
						<%--<a href="${pageContext.request.contextPath }/borrowBook.action?reader=${USER_SESSION.user_name}">--%>
				    </a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 左侧显示列表部分 end-->
  </nav>
	<!-- 图书列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">读者图书查询</h1>
				<%--&lt;%&ndash; 提示信息&ndash;%&gt;--%>
				<span class="msg" >${msg}</span>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get"
					  action="${pageContext.request.contextPath }/bookadmin.action">
					<div class="form-group">
						<label for="customerName">图书名称</label>
						<input type="text" class="form-control" id="customerName"
							   value="${title}" name="title" />
					</div>
					<%--<div class="form-group">--%>
					<%--<label for="customerFrom">客户来源</label>--%>
					<%--<select	class="form-control" id="customerFrom" name="custSource">--%>
					<%--<option value="">--请选择--</option>--%>
					<%--<c:forEach items="${fromType}" var="item">--%>
					<%--<option value="${item.dict_id}"--%>
					<%--<c:if test="${item.dict_id == custSource}">selected</c:if>>--%>
					<%--${item.dict_item_name }--%>
					<%--</option>--%>
					<%--</c:forEach>--%>
					<%--</select>--%>
					<%--</div>--%>
					<%--<div class="form-group">--%>
					<%--<label for="custIndustry">所属行业</label>--%>
					<%--<select	class="form-control" id="custIndustry"  name="custIndustry">--%>
					<%--<option value="">--请选择--</option>--%>
					<%--<c:forEach items="${industryType}" var="item">--%>
					<%--<option value="${item.dict_id}"--%>
					<%--<c:if test="${item.dict_id == custIndustry}"> selected</c:if>>--%>
					<%--${item.dict_item_name }--%>
					<%--</option>--%>
					<%--</c:forEach>--%>
					<%--</select>--%>
					<%--</div>--%>
					<%--<div class="form-group">--%>
					<%--<label for="custLevel">客户级别</label>--%>
					<%--<select	class="form-control" id="custLevel" name="custLevel">--%>
					<%--<option value="">--请选择--</option>--%>
					<%--<c:forEach items="${levelType}" var="item">--%>
					<%--<option value="${item.dict_id}"--%>
					<%--<c:if test="${item.dict_id == custLevel}"> selected</c:if>>--%>
					<%--${item.dict_item_name }--%>
					<%--</option>--%>
					<%--</c:forEach>--%>
					<%--</select>--%>
					<%--</div>--%>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
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
							<th>isbn</th>
							<th>图书名称</th>
							<th>图书大类</th>
							<th>图书小类</th>
							<th>图书位置</th>
							<th>书架号</th>
							<th>可借数量</th>
							<%--<th>预约人ID</th>--%>
							<th>操作</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${page.rows}" var="row">
						<tr>
							<td>${row.isbn}</td>
							<td>${row.title}</td>
							<td>${row.categories}</td>
							<td>${row.genre}</td>
							<td>${row.room}</td>
							<td>${row.bookrack}</td>
							<td>${row.nownumber}</td>
								<%--<td></td>--%>
							<td>
								<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick= "editCustomer(${row.isbn})">查看</a>
									<%--<a href="${pageContext.request.contextPath}/borrowBook.action?bookId=${row.id}" class="btn btn-primary btn-xs">借阅</a>--%>
									<%--<a href="#" class="btn btn-primary btn-xs" onclick= "borrowBook(${row.id})">借阅</a>--%>
									<%--<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick= "editCustomer(${row.id})">借阅</a>--%>
								<%--<a href="#" class="btn btn-danger btn-xs" onclick="deleteCustomer(${row.isbn})">删除</a>--%>
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
						<label for="new_linkMan" class="col-sm-2 control-label">图书id</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_linkMan" placeholder="联系人" name="id" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_phone" class="col-sm-2 control-label">图书分类</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_phone" placeholder="固定电话" name="flname" />
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
				<h4 class="modal-title" id="myModalLabel">查看图书信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_customer_form">
					<input type="hidden" id="edit_id" name="id"/>
					<%--图书图片--%>
					<div class="form-group">
						<label for="pic" class="col-sm-2 control-label">图书图片</label>
						<div class="col-sm-10">
							<%--<input type="text" class="form-control" id="pic" placeholder="" name="pic" />--%>
							<img src="" id="pic" height="200" width="200"/>
						</div>
					</div>
					<%--图书名称--%>
					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">图书名称</label>
						<div class="col-sm-10">
							<%--<input type="text" class="form-control" id="title" placeholder="图书名称" name="title" />--%>
							<input readonly="value"  type="text" class="form-control" id="title" placeholder="图书名称" name="title" />
						</div>
					</div>
					<%--副标题--%>
					<div class="form-group">
						<label for="subtitle" class="col-sm-2 control-label">副标题</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="subtitle" placeholder="" name="subtitle" />
						</div>
					</div>
					<%--图书大类--%>
					<div class="form-group">
						<label readonly="value" for="categories" class="col-sm-2 control-label">图书大类</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="categories" placeholder="" name="categories" />
						</div>
					</div>
					<%--图书小类--%>
					<div class="form-group">
						<label readonly="value" for="genre" class="col-sm-2 control-label">图书小类</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="genre" placeholder="" name="genre" />
						</div>
					</div>
					<%--图书数量--%>
					<div class="form-group">
						<label for="booknumber" class="col-sm-2 control-label">图书数量</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="booknumber" placeholder="" name="number" />
						</div>
					</div>
					<%--图书室--%>
					<div class="form-group">
						<label  for="room" class="col-sm-2 control-label">图书室</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="room" placeholder="" name="room" />
						</div>
					</div>
					<%--书架号--%>
					<div class="form-group">
						<label for="bookrack" class="col-sm-2 control-label">书架号</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="bookrack" placeholder="" name="bookrack" />
						</div>
					</div>
					<%--书籍描述--%>
					<div class="form-group">
						<label for="summary" class="col-sm-2 control-label">书籍简介</label>
						<div class="col-sm-10">
							<textarea readonly="value" id="summary" name="summary" cols="63" rows="6"></textarea>
							<%--<input readonly="value" type="text" class="form-control" id="summary" placeholder="" name="summary" />--%>
						</div>
					</div>
					<%--作者--%>
					<div class="form-group">
						<label readonly="value" for="author" class="col-sm-2 control-label">作者</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="author" placeholder="" name="author" />
						</div>
					</div>
					<%--出版社--%>
					<div class="form-group">
						<label readonly="value" for="publisher" class="col-sm-2 control-label">出版社</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="publisher" placeholder="" name="publisher" />
						</div>
					</div>
					<%--出版地--%>
					<div class="form-group">
						<label readonly="value" for="pubplace" class="col-sm-2 control-label">出版地</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="pubplace" placeholder="" name="pubplace" />
						</div>
					</div>
					<%--出版时间--%>
					<div class="form-group">
						<label readonly="value" for="pubdate" class="col-sm-2 control-label">出版时间</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="pubdate" placeholder="" name="pubdate" />
						</div>
					</div>
					<%--页数--%>
					<div class="form-group">
						<label readonly="value" for="page" class="col-sm-2 control-label">页数</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="page" placeholder="" name="page" />
						</div>
					</div>
					<%--价格--%>
					<div class="form-group">
						<label readonly="value" for="price" class="col-sm-2 control-label">价格</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="price" placeholder="" name="price" />
						</div>
					</div>
					<%--装帧方式--%>
					<div class="form-group">
						<label readonly="value" for="binding" class="col-sm-2 control-label">装帧方式</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="binding" placeholder="" name="binding" />
						</div>
					</div>
					<%--ISBN--%>
					<div class="form-group">
						<label readonly="value" for="isbn" class="col-sm-2 control-label">ISBN</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="isbn" placeholder="" name="isbn" />
						</div>
					</div>
					<%--ISBN 10--%>
					<div class="form-group">
						<label readonly="value" for="isbn10" class="col-sm-2 control-label">ISBN 10</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="isbn10" placeholder="" name="isbn10" />
						</div>
					</div>
					<%--主题词--%>
					<div class="form-group">
						<label readonly="value" for="keyword" class="col-sm-2 control-label">主题词</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="keyword" placeholder="" name="keyword" />
						</div>
					</div>
					<%--版次--%>
					<div class="form-group">
						<label readonly="value" for="edition" class="col-sm-2 control-label">版次</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="edition" placeholder="" name="edition" />
						</div>
					</div>
					<%--印次--%>
					<div class="form-group">
						<label readonly="value" for="impression" class="col-sm-2 control-label">主题词</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="impression" placeholder="" name="impression" />
						</div>
					</div>
					<%--正文语种--%>
					<div class="form-group">
						<label readonly="value" for="language" class="col-sm-2 control-label">正文语种</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="language" placeholder="" name="language" />
						</div>
					</div>
					<%--开本--%>
					<div class="form-group">
						<label readonly="value" for="format" class="col-sm-2 control-label">开本</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="format" placeholder="" name="format" />
						</div>
					</div>
					<%--CIP核准号--%>
					<div class="form-group">
						<label readonly="value" for="cip" class="col-sm-2 control-label">CIP核准号</label>
						<div class="col-sm-10">
							<input readonly="value" type="text" class="form-control" id="cip" placeholder="" name="cip" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<%--<button type="button" class="btn btn-primary" onclick="updateCustomer()">保存修改</button>--%>
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
	function  b() {
		var con = confirm("确认借阅")
		if (con == true) {
		    return rue
		}
    }
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
    function editCustomer(isbn) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>/getBookByIsbn.action",
            data:{"isbn":isbn},
            success:function(data) {
                $("#title").val(data.title);
                $("#subtitle").val(data.subtitle);
                $("#pic").attr("src",data.pic);
                $("#categories").val(data.categories)
                $("#booknumber").val(data.number)
                $("#room").val(data.room)
                $("#genre").val(data.genre)
                $("#bookrack").val(data.bookrack)
                $("#summary").val(data.summary);
                $("#author").val(data.author)
                $("#publisher").val(data.publisher)
                $("#pubplace").val(data.pubplace)
                $("#pubdate").val(data.pubdate)
                $("#page").val(data.page)
                $("#price").val(data.price)
                $("#binding").val(data.binding)
                $("#isbn").val(data.isbn)
                $("#isbn10").val(data.isbn10)
                $("#keyword").val(data.keyword)
                $("#edition").val(data.edition)
                $("#impression").val(data.impression)
                $("#language").val(data.language);
                $("#format").val(data.format);
                $("#cip").val(data.cip);
                // $("#edit_zipcode").val(data.cust_zipcode);
                // $("#edit_address").val(data.cust_address);
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