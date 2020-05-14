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
            <h1 class="h3 mb-0 text-gray-800">Customer</h1>
            <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
          </div>

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-11 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">New Customer</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  	<!-- Customer Form -->
                  	<form:form id="customerForm" modelAttribute="customerModel">
					
						<div class="form-group row">
						
							<label for="vehicleNo" class="col-sm-2 col-form-label">Vehicle Number : </label>
							<div class="col-sm-4">
								<!-- hidden input element for customer id -->
								<form:hidden path="id" id="customerId"/>
								<form:input  path="vehicleNo" class="form-control" id="vehicleNo"
									placeholder="Enter vehicle number"/>
							</div>
							
						</div>
						
						<div class="form-group row">
						
							<label for="fullName" class="col-sm-2 col-form-label">Full Name : </label>
							<div class="col-sm-4">
								<form:input  path="fullName" class="form-control" id="fullName"
									placeholder="Enter full name"/>
							</div>
							
							<label for="mobNo" class="col-sm-2 col-form-label">Mobile Number : </label>
							<div class="col-sm-4">
								<form:input  path="mobNo" class="form-control" id="mobNo"
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
						
							<label for="vehicleModel" class="col-sm-2 col-form-label">Vehicle Model : </label>
							<div class="col-sm-4">
								<form:input  path="vehicleModel" class="form-control" id="vehicleModel"
									placeholder="Enter vehicle model"/>
							</div>
							
							<label for="engineNo" class="col-sm-2 col-form-label">Engine Number : </label>
							<div class="col-sm-4">
								<form:input  path="engineNo" class="form-control" id="engineNo"
									placeholder="Enter engine number"/>
							</div>
						</div>
						
						<div class="form-group row">
						
							<label for="chesisNo" class="col-sm-2 col-form-label">Chesis Number : </label>
							<div class="col-sm-4">
								<form:input  path="chesisNo" class="form-control" id="chesisNo"
									placeholder="Enter chesis number"/>
							</div>
							
							<label for="jobCardNo" class="col-sm-2 col-form-label">Job Card Number : </label>
							<div class="col-sm-4">
								<form:input  path="jobCardNo" class="form-control" id="jobCardNo"
									placeholder="Enter job card number"/>
							</div>
						</div>
						<div class="form-group row"></div>
						<div class="form-group row">
							<div class="col-sm-4"></div>
							<button type="submit" class="btn btn-success" id="addCustomer">${oprText}</button>&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-danger" id="cancelId">Cancel</button>&nbsp;&nbsp;&nbsp;
							<div class="col-sm-4"></div>
						</div>
					</form:form>
				</div>
              </div>
            </div>
   </div>
   
	<!-- Jquery Datatable -->   
   	<table id="customerTable" class="display" style="width: 100%">
		<thead>
			<tr>
				<th>Sr. No.</th>
				<th>Full Name</th>
				<th>Mobile No.</th>
				<th>Address</th>
				<th>Email</th>
				<th>View</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
	</table>
	
	</div>
	
	<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
     <div class="modal-header">
     	<div><img class="card-img-top" src="${images}/logo.jpg" alt="Card image" style="width: 50px; height: 40px">&nbsp;&nbsp;&nbsp;<label id="custName"></label></div>
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
    <div class="modal-body" style="width: 100%; height: 100%">
		<div style="margin: 10px;padding-top: 8px;padding-left: 100px">
		
				<label for="vehModel" >Model Name : </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label id="vehModel" > </label><br><br>
		
				<label for="vehNo" >Vehicle No. : </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label id="vehNo" ></label><br><br>

				<label for="engNo" >Engine No. : </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label id="engNo" > </label><br><br>
		
				<label for="cheNo" >Chesis No. : </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label id="cheNo"></label><br><br>

				<label for="jobCrdNo" >Job Card No. : </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label id="jobCrdNo" > </label>
		
    	</div>
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
   
	<script type="text/javascript" src="${js}/jquery.dataTables.js"></script>
	<script type="text/javascript" src="${js}/dataTables.jqueryui.js"></script>
	<link rel="stylesheet" href="${css}/dataTables.jqueryui.css">
	  
   	<script src="${js}/customerVal2.js"></script>   
