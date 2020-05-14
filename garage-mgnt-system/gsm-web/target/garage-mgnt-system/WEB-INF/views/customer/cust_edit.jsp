<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	
	<spring:url var="css" value="/resources/css" />
	<spring:url var="js" value="/resources/js" />
	<spring:url var="images" value="/resources/images" />


<div ng-app="app" ng-controller="Ctrl" style="width: 1000px;padding-left: 200px">
   <table class="table table-bordered table-hover table-condensed">
    <tr style="font-weight: bold">
      <td style="width:20%">Labour Name</td>
      <td style="width:35%">Charge Description</td>
      <td style="width:20%">Amount</td>
      <td style="width:25%">Edit</td>
    </tr>
    <tr ng-repeat="charge in labourCharge">
      <td>
        <!-- editable username (text with validation) -->
        <span editable-text="charge.labourName" e-name="labourName" e-form="rowform" onbeforesave="checkName($data, user.id)" e-required>
          {{ charge.labourName || 'empty' }}
        </span>
      </td>
      <td>
        <!-- editable status (select-local) -->
        <span editable-text="charge.chargeDesc" e-name="chargeDesc" e-form="rowform" onbeforesave="checkName($data, user.id)" e-required>
          {{ charge.chargeDesc || 'empty' }}
        </span>
      </td>
      <td>
        <!-- editable group (select-remote) -->
        <span editable-text="charge.amount" e-name="amount"  e-form="rowform" >
          {{ charge.amount  || 'empty' }}
        </span>
      </td>
      <td style="white-space: nowrap">
        <!-- form -->
        <form editable-form name="rowform" onbeforesave="saveUser($data, user.id)" ng-show="rowform.$visible" class="form-buttons form-inline" shown="inserted == charge">
          <button type="submit" ng-disabled="rowform.$waiting" class="btn btn-primary">
            save
          </button>&nbsp;&nbsp;
          <button type="button" ng-disabled="rowform.$waiting" ng-click="rowform.$cancel()" class="btn btn-secondary">
            cancel
          </button>
        </form>
        <div class="buttons" ng-show="!rowform.$visible">
          <button class="btn btn-primary" ng-click="rowform.$show()">edit</button>
          <button class="btn btn-danger" ng-click="removeUser($index)">del</button>
        </div>  
      </td>
    </tr>
  </table>

  <button class="btn btn-primary" ng-click="addUser()">Add row</button>
   <button class="btn btn-primary" ng-click="showData()">Show Data</button>
</div>

 <!-- anuglar js cdn -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular.min.js" integrity="sha256-6Sr0HqNgUf/p88g6vsl87CrAnNqiOWhjlY6LS8jeWHA=" crossorigin="anonymous"></script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular-sanitize.min.js" integrity="sha256-ofQzChnxWn2oMUL1tJeGxH4WabrFcHbgIecUgUpTI48=" crossorigin="anonymous"></script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-xeditable/0.10.1/js/xeditable.js" integrity="sha256-0rDhPW/6jXOVhZNFcvEJs51J2h1DLjP8ATRjEeJpb9M=" crossorigin="anonymous"></script>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/angular-xeditable/0.10.1/css/xeditable.css" integrity="sha256-6XutsLHThe0cWIoQIzefOIzfBezGg4K9C8OA48EZUD8=" crossorigin="anonymous" />
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-mocks/1.5.8/angular-mocks.js" integrity="sha256-WJmOK13ofb/tpGhU/GSXnu8LPv5Qq/i+UKiq8Zj0jJQ=" crossorigin="anonymous"></script>

<script src="${js}/customerVal.js"></script>
    