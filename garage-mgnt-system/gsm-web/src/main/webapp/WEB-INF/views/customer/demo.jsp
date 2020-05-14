<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	
	<spring:url var="css" value="/resources/css" />
	<spring:url var="js" value="/resources/js" />
	<spring:url var="images" value="/resources/images" />
	
	<style>
    form{
        margin: 20px 0;
    }
    form input, button{
        padding: 5px;
    }
    table{
        width: 100%;
        margin-bottom: 20px;
		border-collapse: collapse;
    }
    table, th, td{
        border: 1px solid #cdcdcd;
    }
    table th, table td{
        padding: 10px;
        text-align: left;
    }
</style>


<form class="needs-validation" style="padding-left: 20px" novalidate>
  <div class="form-row">
    <div class="col-md-3 mb-3">
      <label for="validationCustom01">name</label>
      <input type="text" class="form-control" id="name" placeholder="First name" value="Mark" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationCustom02">email</label>
      <input type="text" class="form-control" id="email" placeholder="Last name" value="Otto" required>
    </div>
     <div class="col-md-1 mb-3">
      <label for="validationCustom02" style="visibility: hidden;">username</label>
      <input type="button" class="form-control btn btn-info add-row" value="Add">
    </div>
     <div class="col-md-1 mb-3">
      <label for="validationCustom02" style="visibility: hidden;">username</label>
      <input type="button" class="form-control btn btn-success update-row"  value="Update">
    </div>
  </div>

</form>



   <!--  <table>
        <thead>
            <tr>
                <th>Select</th>
                <th>Name</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="checkbox" name="record"></td>
                <td>Peter Parker</td>
                <td>peterparker@mail.com</td>
            </tr>
        </tbody>
    </table> -->
    
    <div id="rowContainer" style="padding-left: 20px">
	    <!-- <div class="form-row">
			<div class="col-md-6 mb-3">
				<div class="form-row">
					<label class="form-control bg-gradient-light text-dark col-md-6"></label>
					<label class="form-control bg-gradient-light text-dark col-md-6"></label>
				</div>
			</div>
			<div class="col-md-1 mb-3">
      			<input type="button" class="form-control btn btn-primary btn-edit" id="validationCustom02" placeholder="Last name" value="Edit" required>
    		</div>
    		<div class="col-md-1 mb-3">
      			<input type="button" class="form-control btn btn-danger add-row" id="validationCustom02" placeholder="Last name" value="Delete" required>
    		</div>
		</div>
		 -->
	</div>
    
    <button type="button" class="delete-row">Delete Row</button>

    
<script>
    $(document).ready(function(){
        $(".add-row").click(function(){
            var name = $("#name").val();
            var email = $("#email").val();
            var markup = "<a href='#' class='list-group-item list-group-item-action list-group-item-primary'>"+name+"   "+email+"</a>";
           
            var markup2 = "<div class='form-row'><div class='col-md-6 mb-3'><div class='form-row'><label class='form-control bg-gradient-light text-dark col-md-6'>"+name+"</label><label class='form-control bg-gradient-light text-dark col-md-6'>"+email+"</label></div></div><div class='col-md-1 mb-3'><input type='button' class='form-control btn btn-primary btn-edit' value='Edit' ></div><div class='col-md-1 mb-3'><input type='button' class='form-control btn btn-danger btn-delete'   value='Delete' ></div><div>";
            
            $("#rowContainer").append(markup2);
        });
        
        var _div1Edit = null;
        $(document).on('click','.btn-edit',function(){
        	//alert("In Edit Mode");
        	_div1Edit = $(this).closest("div .form-row");
        	var _div2 = $(_div1Edit).find('div:eq(0)');
        	var _div3 = $(_div1Edit).find('div:eq(0)');
        	
        	var _name = $(_div3).find('label:eq(0)').text();
        	var _email = $(_div3).find('label:eq(1)').text();
        	
        	$("input[id='name']").val(_name);
        	$("input[id='email']").val(_email);
        	console.log(_name + " "+ _email)
        	console.log(_div3);
        	console.log(_div2);
        	console.log(_div1Edit);
        });
        
        $(document).on('click','.btn-delete',function(){
        	$(this).closest("div .form-row").remove();
        });
        
        $(".update-row").click(function(){
			if(_div1Edit){
				
				var name = $("#name").val();
		        var email = $("#email").val();
		            
				var _div2 = $(_div1Edit).find('div:eq(0)');
	        	var _div3 = $(_div1Edit).find('div:eq(0)');
	        	
	        	$(_div3).find('label:eq(0)').text(name);
	        	$(_div3).find('label:eq(1)').text(email);
        	}
        });
        
        
        // Find and remove selected table rows
        $(".delete-row").click(function(){
            $("table tbody").find('input[name="record"]').each(function(){
            	if($(this).is(":checked")){
                    $(this).parents("tr").remove();
                }
            });
        });
    });    
</script>