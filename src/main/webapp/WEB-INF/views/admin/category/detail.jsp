<%@page import="com.koreait.funfume.domain.Category"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<% Category category = (Category)request.getAttribute("category"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard</title>
	
	<%@ include file="../../admin_inc/top_link.jsp" %>
	
  <!-- CodeMirror -->
  <link rel="stylesheet" href="/resources/admin/plugins/codemirror/codemirror.css">
  <link rel="stylesheet" href="/resources/admin/plugins/codemirror/theme/monokai.css">	
  
  <!-- summernote -->
  <link rel="stylesheet" href="/resources/admin/plugins/summernote/summernote-bs4.min.css">

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="/resources/admin/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- Navbar -->
  <%@ include file="../../admin_inc/navbar.jsp" %>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <%@ include file="../../admin_inc/sidebar.jsp" %>  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">상세보기</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">상세내용</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form name ="form1">
               <input type="hidden" name ="category_id" value="<%=category.getCategory_id() %>">
               <input type="hidden" name ="team" value="<%=category.getTeam() %>">
               <input type="hidden" name ="step" value="<%=category.getStep() %>">
               <input type="hidden" name ="depth" value="<%=category.getDepth() %>">
                <div class="card-body">
                
                  
                  <div class="form-group">
                    <input type="text" class="form-control"  value="<%= category.getCategory_name() %>" name="category_name">
                  </div>
                  
                 </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="button" class="btn btn-info" id="bt_update">수정</button>
                  <button type="button" class="btn btn-info" id="bt_delete">삭제</button>
                  <button type="button" class="btn btn-info" id="bt_sub">하위 카테고리 생성</button>
                  <button type="button" class="btn btn-info">목록</button>
                </div>
              </form>
            </div>
            <!-- /.card -->
          	</div>
          </div>
          <div class="row" style="display:none" id="subForm">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">하위 카테고리</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form name ="form2">
               <input type="hidden" name ="team" value="<%=category.getTeam() %>">
               <input type="hidden" name ="step" value="<%=category.getStep() %>">
               <input type="hidden" name ="depth" value="<%=category.getDepth() %>">
                <div class="card-body">
                
                  
                  <div class="form-group">
                    <input type="text" class="form-control"  placeholder="카테고리 입력.." name="category_name">
                  </div>
                  
                 </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="button" class="btn btn-info" onClick="registSub()">등록</button>
                </div>
              </form>
            </div>
            <!-- /.card -->
          </div>
          </div>
        
        
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  <%@ include file="../../admin_inc/footer.jsp" %>  
  

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<%@ include file="../../admin_inc/bottom_link.jsp" %>

<script src="/resources/admin/plugins/summernote/summernote-bs4.min.js"></script>

<script src="/resources/admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>

<script>
$(function () {
  bsCustomFileInput.init();
});
</script>
<script>
  $(function () {
	  
    $("#bt_regist").click(function(){
    	regist();
    });
    $("#bt_sub").click(function(){
    	$("#subForm").show();
    	form2.category_name.focus();
    });
  })

  
function edit(){
	 $("form[name='form1']").attr({
		action: "/admin/category/regist",
		method: "post",
		
	 });
	 $("form[name='form1']").submit();
  }
 
//서브카테고리 등록요청
function registSub(){
	$("form[name='form2']").attr({
			action: "/admin/category/registSub",
			method: "post",
		 });
	$("form[name='form2']").submit();
}
  
 
</script>

</body>
</html>
