<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	
	<spring:url var="css" value="/resources/css" />
	<spring:url var="js" value="/resources/js" />
	<spring:url var="images" value="/resources/images" />
	
	<%--  <c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set> --%>

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Insurance</h1>
            <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
          </div>

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-11 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">New Insurance Company</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  	<!-- Customer Form -->
                  	<form:form id="insCompanyForm" modelAttribute="insuranceModel">
					
						<div class="form-group row">
						
							<label for="fullName" class="col-sm-2 col-form-label">Company Name : </label>
							<div class="col-sm-4">
								<form:hidden path="id" id="insCompanyId"/>
								<form:input  path="insCompanyName" class="form-control" id="insCompanyName"
									placeholder="Enter full name"/>
							</div>
							
							<label for="mobNo" class="col-sm-2 col-form-label">Mobile Number : </label>
							<div class="col-sm-4">
								<form:input  path="mno" class="form-control" id="mno"
									placeholder="Enter mobile number"/>
							</div>
						</div>
						
						<div class="form-group row">
						
							<label for="address" class="col-sm-2 col-form-label">Address : </label>
							<div class="col-sm-4">
									<form:textarea path="address" class="form-control" id="address"
									placeholder="Enter address"/>
							</div>
							
							<label for="email" class="col-sm-2 col-form-label">Email : </label>
							<div class="col-sm-4">
								<form:input  path="email" class="form-control" id="email"
									placeholder="Enter email"/>
							</div>
						</div>
						
						<div class="form-group row">
						
							<label for="vehicleModel" class="col-sm-2 col-form-label">GST No. : </label>
							<div class="col-sm-4">
								<form:input  path="gstin" class="form-control" id="gstin"
									placeholder="Enter GST Number"/>
							</div>
							
							<label for="vehicleModel" class="col-sm-2 col-form-label">PAN No. : </label>
							<div class="col-sm-4">
								<form:input  path="panNo" class="form-control" id="panNo"
									placeholder="Enter PAN Number"/>
							</div>
							
						</div>
						
						
						<div class="form-group row"></div>
						<div class="form-group row">
							<div class="col-sm-4"></div>
							<button type="submit" class="btn btn-success" id="addInsCompany">Save</button>&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-danger" id="cancelId">Cancel</button>&nbsp;&nbsp;&nbsp;
							<div class="col-sm-4"></div>
						</div>
					</form:form>
				</div>
              </div>
            </div>
   </div>
   
	<!-- Jquery Datatable -->   
   	<table id="insuranceTable" class="display" style="width: 100%">
		<thead>
			<tr>
				<th>Sr. No.</th>
				<th>Company Name</th>
				<th>Mobile No.</th>
				<th>Address</th>
				<th>Email</th>
				<th>GST No.</th>
				<th>PAN No.</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
	</table>
	
	</div>
   
	<script type="text/javascript" src="${js}/jquery.dataTables.js"></script>
	<script type="text/javascript" src="${js}/dataTables.jqueryui.js"></script>
	<link rel="stylesheet" href="${css}/dataTables.jqueryui.css">
	  
   	<script src="${js}/insurance.js"></script>   
