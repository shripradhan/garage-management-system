<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>

	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	
	<spring:url var="css" value="/resources/css" />
	<spring:url var="js" value="/resources/js" />
	<spring:url var="images" value="/resources/images" />
	
	<!-- <style>
		.mechanicSelect{
			 height:  calc(1.5em + 0.75rem + 2px);
		}
	</style> -->

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Vehicle Servicing</h1>
            <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
          </div>

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-11 col-lg-7">
            	
              <div class="card shadow mb-4">
              	<form:form id="servicingForm" modelAttribute="vehicleServiceModel">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Customer Details</h6>
                  <span id="toggleBtnS" title="Hide Customer Details"><i id="toggleBtnI"  class="fa fa-minus-circle" aria-hidden="true"></i></span>
                </div>
                <!-- Card Body -->
                <div id="customerDetails" class="card-body">
                  	<!-- Customer Form -->
					<!-- Customer Form -->
                  
					
						<div class="form-group row">
						
							<label for="vehicleNo" class="col-sm-2 col-form-label">Vehicle Number : </label>
							<div class="col-sm-4">
								<!-- hidden input element for customer id -->
								<form:hidden path="customer.id" id="customerId"/>
								<form:input  path="customer.vehicleNo" class="form-control customerInfo" id="vehicleNo"
									placeholder="Enter vehicle number" title="Vehicle Number"/>
							</div>
							<div class="col-sm-4">
								<input type="checkbox" id="toggle-trigger" data-original-title="My Popup text" checked data-toggle="tooltip" data-size="mini" data-onstyle="success">
								<span id="aa"></span>
							</div>
							
						</div>
						
						<div class="form-group row">
						
							<label for="fullName" class="col-sm-2 col-form-label">Full Name : </label>
							<div class="col-sm-4">
								<form:input  path="customer.fullName" class="form-control customerInfo" id="fullName"
									placeholder="Enter full name"/>
							</div>
							
							<label for="mobNo" class="col-sm-2 col-form-label">Mobile Number : </label>
							<div class="col-sm-4">
								<form:input  path="customer.mobNo" class="form-control customerInfo" id="mobNo"
									placeholder="Enter mobile number"/>
							</div>
						</div>
						
						<div class="form-group row">
						
							<label for="address" class="col-sm-2 col-form-label">Address : </label>
							<div class="col-sm-4">
									<form:textarea path="customer.address" class="form-control customerInfo" id="address"
									placeholder="Enter address"/>
							</div>
							
							<label for="email" class="col-sm-2 col-form-label">Email : </label>
							<div class="col-sm-4">
								<form:input  path="customer.email" class="form-control customerInfo" id="email"
									placeholder="Enter email"/>
							</div>
						</div>
						
						<div class="form-group row">
						
							<label for="vehicleModel" class="col-sm-2 col-form-label">Vehicle Model : </label>
							<div class="col-sm-4">
								<form:input  path="customer.vehicleModel" class="form-control customerInfo" id="vehicleModel"
									placeholder="Enter vehicle model"/>
							</div>
							
							<label for="engineNo" class="col-sm-2 col-form-label">Engine Number : </label>
							<div class="col-sm-4">
								<form:input  path="customer.engineNo" class="form-control customerInfo" id="engineNo"
									placeholder="Enter engine number"/>
							</div>
						</div>
						
						<div class="form-group row">
						
							<label for="chesisNo" class="col-sm-2 col-form-label">Chesis Number : </label>
							<div class="col-sm-4">
								<form:input  path="customer.chesisNo" class="form-control customerInfo" id="chesisNo"
									placeholder="Enter chesis number"/>
							</div>
							
							<label for="jobCardNo" class="col-sm-2 col-form-label">Job Card Number : </label>
							<div class="col-sm-4">
								<form:input  path="customer.jobCardNo" class="form-control customerInfo" id="jobCardNo"
									placeholder="Enter job card number"/>
							</div>
						</div>
						<%-- <div class="form-group row"></div>
						<div class="form-group row">
							<div class="col-sm-4"></div>
							<button type="submit" class="btn btn-success" id="addCustomer">${oprText}</button>&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-danger" id="cancelId">Cancel</button>&nbsp;&nbsp;&nbsp;
							<div class="col-sm-4"></div>
						</div> --%>
				<%-- 	</form:form> --%>
				</div>
				
				 <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Servicing Details</h6>
                </div>
                
                <!-- Card Body -->
                <div class="card-body">
                  	<!-- Customer Form -->.
					<!-- Customer Form -->
                  	<%-- <form:form id="customerForm" modelAttribute="customerModel"> --%>
					
						<div class="form-group row">
						
							<label for="serviceType" class="col-sm-2 col-form-label">Service Type : </label>
							<div class="col-sm-4">
								<!-- hidden input element for customer id -->
							<%-- 	<form:hidden path="id" id="customerId"/> --%>
								<form:input  path="serviceType" class="form-control" id="serviceType"
									placeholder="Enter Service Type"/>
							</div>
							
							<label for="serviceDate" class="col-sm-2 col-form-label">Date : </label>
							<div class="col-sm-4">
								<form:input  path="serviceDate" class="form-control" id="serviceDate"
									placeholder="Enter Service Date"/>
							</div>
							
						</div>
						
						<div class="form-group row">
						
							<label for="mechanicId" class="col-sm-2 col-form-label">Mechanic Assign : </label>
							<div class="col-sm-4">
								<!-- hidden input element for customer id -->
								<form:hidden path="employee.id" id="employeeId"/>
								<input class="form-control" id="mechanicId"
									placeholder="Enter Labour Name"/>
									
								<%-- <form:select path="employee.id" class="form-control form-control-chosen" data-placeholder="Please select..." id="mechanicId">
                					<form:options class="form-control" items="${employeesList}" itemLabel="empName" itemValue="id" />
								</form:select> --%>
							</div>
							
							<label for="work" class="col-sm-2 col-form-label">KM(Driven) : </label>
							<div class="col-sm-4">
									<form:input  path="kmDriven" class="form-control" id="kmDriven"
									placeholder="Enter Kilo Meter Driver"/>
							</div>
						</div>
						
						<div class="form-group row">
						
							<label for="work" class="col-sm-2 col-form-label">Work : </label>
							<div class="col-sm-4">
									<form:textarea path="work" class="form-control" id="work"
									placeholder="Enter work"/>
							</div>
							
							<label for="serviceCharge" class="col-sm-2 col-form-label">Service Charge : </label>
							<div class="col-sm-4">
								<form:input  path="serviceCharge" class="form-control" id="serviceCharge"
									placeholder="Enter service Charge"/>
							</div>
							
						</div>
					
				</div>
				
					 <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Insurance Company Details</h6>
                </div>
                
                <!-- Card Body -->
                <div class="card-body">
                  	<!-- Customer Form -->.
					<!-- Customer Form -->
                  	<%-- <form:form id="customerForm" modelAttribute="customerModel"> --%>
					
						<div class="form-group row">
						
							<label for="serviceType" class="col-sm-2 col-form-label">Company Name : </label>
							<div class="col-sm-4">
								<!-- hidden input element for customer id -->
							<%-- 	<form:hidden path="id" id="customerId"/> --%>
								<form:input  path="insurance.insCompanyName" class="form-control" id="serviceType"
									placeholder="Enter Company Name"/>
							</div>
							
							<label for="serviceDate" class="col-sm-2 col-form-label">Mobile Number : </label>
							<div class="col-sm-4">
								<form:input  path="insurance.mno" class="form-control" id="serviceDate"
									placeholder="Enter Mobile Number"/>
							</div>
							
						</div>
						
						<div class="form-group row">
						
							<label for="serviceDate" class="col-sm-2 col-form-label">Address : </label>
							<div class="col-sm-4">
								<form:input  path="insurance.address" class="form-control" id="serviceDate"
									placeholder="Enter Address"/>
							</div>
							
							<label for="work" class="col-sm-2 col-form-label">Email : </label>
							<div class="col-sm-4">
									<form:input  path="insurance.email" class="form-control" id="kmDriven"
									placeholder="Enter Email"/>
							</div>
						</div>
						
						<div class="form-group row">
						
							<label for="work" class="col-sm-2 col-form-label">GSTIN : </label>
							<div class="col-sm-4">
									<form:input  path="insurance.gstin" class="form-control" id="kmDriven"
									placeholder="Enter Email"/>
							</div>
							
							<label for="serviceCharge" class="col-sm-2 col-form-label">Pan Number : </label>
							<div class="col-sm-4">
								<form:input  path="insurance.panNo" class="form-control" id="serviceCharge"
									placeholder="Enter PAN Number"/>
							</div>
							
						</div>
					
				</div>
				
				
				
				 <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Products Details</h6>
               	</div>
               	
               	<div class="card-body">
                  	<!-- Customer Form -->.
					<%-- <form>
						<div class="form-group row">
						
							<label for="colFormLabel" class="col-sm-2 col-form-label">Email</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" id="colFormLabel"
									placeholder="">
							</div>
							
							<label for="colFormLabel" class="col-sm-2 col-form-label">Customer Address</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" id="colFormLabel"
									placeholder="">
							</div>
						</div>
						
						<div class="form-group row">
						
							<label for="colFormLabel" class="col-sm-2 col-form-label">Email</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" id="colFormLabel"
									placeholder="">
							</div>
							
							<label for="colFormLabel" class="col-sm-2 col-form-label">Customer Address</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" id="colFormLabel"
									placeholder="">
							</div>
						</div>
						
						
					</form> --%>
				</div>
				
				
				 <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Labour Details</h6>
               	</div>
               	
               	<div class="card-body">
                  	<!-- Customer Form -->.
					<%-- <form>
						<div class="form-group row">
						
							<label for="colFormLabel" class="col-sm-2 col-form-label">Email</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" id="colFormLabel"
									placeholder="">
							</div>
							
							<label for="colFormLabel" class="col-sm-2 col-form-label">Customer Address</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" id="colFormLabel"
									placeholder="">
							</div>
						</div>
						
						<div class="form-group row">
						
							<label for="colFormLabel" class="col-sm-2 col-form-label">Email</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" id="colFormLabel"
									placeholder="">
							</div>
							
							<label for="colFormLabel" class="col-sm-2 col-form-label">Customer Address</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" id="colFormLabel"
									placeholder="">
							</div>
						</div>
						
						
						
					</form> --%>
					
					<div class="form-group row"></div>
						<div class="form-group row">
							<div class="col-sm-4"></div>
							<button type="submit" class="btn btn-success" id="addVehicleServicing">Save</button>&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-secondary">Update</button>&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-success">Cancel</button>&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-danger">Reset</button>&nbsp;&nbsp;&nbsp;
							<div class="col-sm-4"></div>
						</div>
				</div>
				
				</form:form>
              </div>
              <!-- End of row -->
              
                
               </div>
               
               </div>
              </div>
         
        <!-- /.container-fluid -->
        	
        
        	<script src="${js}/servicing.js"></script>  