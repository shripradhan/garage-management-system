<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    
    
    <spring:url var="css" value="/resources/css"/>
    <spring:url var="js" value="/resources/js"/>
    <spring:url var="images" value="/resources/images"/>
    
    <c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  	<meta name="description" content="">
  	<meta name="author" content="">

  	<!-- 	<title>SB Admin 2 - Dashboard</title> -->
  	<title><tiles:insertAttribute name="title" ignore="true"/></title>
  	
  	<style type="text/css">
  		*{
  			font-size: 15px;
  		}
  		a{
  			font-size: 13px;
  		}
  	</style>

	<link href="${css}/bootstrap.min.css" rel="stylesheet">
  	<link rel="stylesheet" href="${css}/jquery-ui.css"/>
  	<link rel="stylesheet" href="${css}/jquery-ui.structure.css"/>
	<link rel="stylesheet" href="${css}/jquery-ui.theme.css"/>
	<link rel="stylesheet" href="${css}/component-chosen.css"/>
  	
  <%-- 	<link rel="stylesheet" href="${css}/all.min.css"/>
  	
  	<link rel="stylesheet" href="${css}/brands.css"/>
  	<link rel="stylesheet" href="${css}/fontawesome.css"/>
  	<link rel="stylesheet" href="${css}/regular.css"/> --%>
  	
  	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"/> -->
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />
  
  	<!-- Custom styles for this template-->
  	<link href="${css}/sb-admin-2.min.css" rel="stylesheet">
  	
  	<!-- for bootbox styling -->
  	<link href="${css}/animate.css" rel="stylesheet">
  	
  	<link href="${css}/toastr.css" rel="stylesheet">

  	<link href="${css}/bootstrap-toggle.css" rel="stylesheet">
  	
  	<link href="${css}/bootstrap.min.css.map" rel="stylesheet">
 
  	
  	<script type="text/javascript">
		window.contextRoot = '${contextRoot}';
	</script>
  
  	
</head>
<body id="page-top">

	<!-- Page Wrapper -->
  	<div id="wrapper">
  	
  		<!-- Sidebar -->
  		<tiles:insertAttribute name="sidebar"/>
  		
  		<!-- Content Wrapper -->
    	<div id="content-wrapper" class="d-flex flex-column">
			
      	<!-- Main Content -->
      	<div id="content">
      		<!-- topbar -->
      		<tiles:insertAttribute name="topbar"/>

				<!-- Bootstrap core JavaScript-->
				<script src="${js}/jquery.min.js"></script>
				<script src="${js}/jquery-ui.js"></script>
				<script src="${js}/bootstrap.bundle.min.js"></script>
				<script src="${js}/bootstrap.min.js"></script>
				<!-- CDN -->
				<script src="${js}/bootstrap-toggle.js"></script>
				<!-- CDN -->
				<%-- <script src="${js}/all.js"></script>
				
				<script src="${js}/brands.js"></script>
				<script src="${js}/fontawesome.js"></script>
				<script src="${js}/regular.js"></script> --%>
				<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script> -->
				
				<!-- Core plugin JavaScript-->
				<script src="${js}/jquery.easing.min.js"></script>

				<!-- Custom scripts for all pages-->
				<script src="${js}/sb-admin-2.min.js"></script>

				<!-- Page level plugins -->
				<script src="${js}/Chart.min.js"></script>

				<!-- Page level custom scripts -->
				<script src="${js}/chart-area-demo.js"></script>
				<script src="${js}/chart-pie-demo.js"></script>

				<script src="${js}/jquery.inputmask.bundle.js"></script>
				
				<script src="${js}/bootbox.min.js"></script>
				<script src="${js}/bootbox.locales.js"></script>
				<script src="${js}/bootbox.all.js"></script>
				
				<script type="text/javascript" src="${js}/toastr.min.js"></script>
			<%-- 	<script type="text/javascript" src="${js}/chosen.jquery.js"></script> --%>
				
				<script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.6/chosen.jquery.min.js"></script>
				
				
		
				<!-- main body -->
      		<tiles:insertAttribute name="body"/>
      		
      	</div>
      	<!-- End of Main Content -->
      		<tiles:insertAttribute name="footer"/>
      	</div>
    	<!-- End of Content Wrapper -->
  	
  	</div>
  <!-- End of Page Wrapper -->
	<!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  
  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>
 
  
</body>
</html>