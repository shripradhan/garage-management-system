<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>

    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    
    <spring:url var="css" value="/resources/css"/>
    <spring:url var="js" value="/resources/js"/>
    <spring:url var="images" value="/resources/images"/>
    
    <c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fa fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">SHREE AUTOMOBILE<!-- <sup>2</sup> --></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="${contextRoot}/home/">
          <i class="fa fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Garage Services
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item" >
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-user-cog" ></i>
          <span>Customer Management</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Customer:</h6>
            <a class="collapse-item" href="${contextRoot}/customer/new" >New Customer</a>
            <a class="collapse-item" href="${contextRoot}/servicing/new">Vehicle Servicing</a>
            <a class="collapse-item" href="${contextRoot}/customer/edit_customer">Edit Customer</a>
            <a class="collapse-item" href="${contextRoot}/home/404">Servicing History</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-users"></i>
          <span>Labour Management</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Labour:</h6>
            <a class="collapse-item" href="${contextRoot}/employee/new">New Labour</a>
            <a class="collapse-item" href="${contextRoot}/home/404">Labour Payment</a>
            <a class="collapse-item" href="${contextRoot}/home/404">Payment History</a>
          </div>
        </div>
      </li>
      
        <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#insurance" aria-expanded="true" aria-controls="insurance">
          <i class="fa fa-address-card"></i>
          <span>&nbsp;Insurance</span>
        </a>
        <div id="insurance" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Insurance:</h6>
            <a class="collapse-item" href="${contextRoot}/insurance/new">New Insurance Company</a>
            <a class="collapse-item" href="${contextRoot}/home/404">Company Details</a>
            <a class="collapse-item" href="${contextRoot}/home/404">Term And Condition</a>
          </div>
        </div>
      </li>
      
      
        <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#mechanicManagement" aria-expanded="true" aria-controls="mechanicManagement">
          <i class="fa fa-fw fa-wrench"></i>
          <span>Mechanic Management</span>
        </a>
        <div id="mechanicManagement" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Labour:</h6>
            <a class="collapse-item" href="utilities-color.html">New Labour</a>
            <a class="collapse-item" href="utilities-border.html">Labour Payment</a>
            <a class="collapse-item" href="utilities-animation.html">Payment History</a>
          </div>
        </div>
      </li>
      
       

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Reports
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fa fa-fw fa-folder"></i>
          <span>Reports</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Login Screens:</h6>
            <a class="collapse-item" href="login.html">Login</a>
            <a class="collapse-item" href="register.html">Register</a>
            <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">Other Pages:</h6>
            <a class="collapse-item" href="404.html">404 Page</a>
            <a class="collapse-item" href="blank.html">Blank Page</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Charts -->
    <!--   <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fa fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li> -->

      <!-- Nav Item - Tables -->
  <!--     <li class="nav-item">
        <a class="nav-link" href="tables.html">
          <i class="fa fa-fw fa-table"></i>
          <span>Tables</span></a>
      </li>
 -->
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->