$(document).ready(function(){
	
	$("#vehicleNo").inputmask({mask: 'AA-99-AA-9999'});
	
	 $('#toggle-trigger').bootstrapToggle('on');
	 
	// $('#mechanicId').chosen();
	 
	 $('.form-control-chosen').chosen({
	 });
	 
	 //<i id="toggleBtn" class="fa fa-plus-circle" aria-hidden="true"></i>
	/* 
	 $('#toggleBtn').on('click',function(){
		 $('#customerDetails').toggle('2000');
		 $("i", this).toggleClass("fa fa-plus-circle");
	 });*/
	 
	 var flag = false;
	 $('#toggleBtnS').on('click',function(){
	     if( flag == false){
	       $('#customerDetails').hide('2000');
	       flag = true;
	       $icon = $('#toggleBtnI');
	       $icon.removeClass("fa fa-minus-circle");
	       $icon.addClass("fa fa-plus-circle");    
	       $('#toggleBtnS').prop('title', 'Show Customer Details');
	     }
	     else{
	        $('#customerDetails').show('2000');
	        // Add more code
	        flag = false;
	        $icon = $('#toggleBtnI');
		    $icon.removeClass("fa fa-plus-circle");
		    $icon.addClass("fa fa-minus-circle");
		    $('#toggleBtnS').prop('title', 'Hide Customer Details');
	     }
	 });

	 
	//SUBMIT FORM
	$("#servicingForm").submit(function(event){
		//Prevent the form from Submitting via the browser
		event.preventDefault();
		ajaxPost();
		
	});
	
function ajaxPost(){
		
		var postUrl = window.contextRoot + '/servicing/save';
		
		//prepare form data
		var formData = {

				serviceType : $('#serviceType').val(),
				serviceDate : $('#serviceDate').val(),
				kmDriven : $('#kmDriven').val(),
				work : $('#work').val(),
				serviceCharge : $('#serviceCharge').val(),
				mechanicId : $('#employeeId').val(),
				customer : {
					id : $("#customerId").val(),
					fullName : $("#fullName").val(),
					mobNo : $("#mobNo").val(),
					address : $("#address").val(),
					email : $("#email").val(),
					vehicleNo : $("#vehicleNo").val(),
					vehicleModel : $("#vehicleModel").val(),
					engineNo : $("#engineNo").val(),
					chesisNo : $("#chesisNo").val(),
					jobCardNo : $("#jobCardNo").val(),
				},
				
		}
		
		//DO POST
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : postUrl,
			data : JSON.stringify(formData),
			dataType : 'json',
			success : function(data) {
				
				console.log("SUCCESS: ", data.message);
				if(data.code == "UPDATE"){
					toastr.success(data.message, 'Success Alert',{timeOut : 10000});
				//	clearFields();
				}
				else if(data.code == "SAVE"){
					toastr.success(data.message, 'Success Alert',{timeOut : 10000})
					//clearFields();
				}/*else if(data.code == "EXIST"){
					bootbox.alert({
					    message: data.message,
					    className: 'rubberBand animated'
					});
				}*/
			},
			error : function(e) {
				console.log("ERROR: ", e);
				var data = e.responseJSON;
				toastr.error("Failed to save Customer", 'Error Alert',{timeOut : 3000})
			},
			done : function(e) {
				console.log("DONE");
			}
		});
	}
	 
	 
	 $('#toggle-trigger').change(function(){
		//alert($(this).prop('checked'));
		 var value = $(this).prop('checked');
		if(value == true){
			$('#aa').html("Enabled All Fields");
			//$("#toggle-trigger").attr('title', 'Enabled All Fields');
			$(".customerInfo").attr("disabled", false);
		}else{
			$('#aa').html("Disabled All Fields");
			//$("#toggle-trigger").attr('title', 'Disabled All Fields');
			$(".customerInfo").attr("disabled", true);
		}
	 });

	 //search vehicles
	$("#vehicleNo").autocomplete(
			{
				source: function(request, response){
					$.ajax({
						url : window.contextRoot + '/servicing/vehicle/list',
						method : 'GET',
						dataType : 'json',
						data : {
							vehicleNo : request.term,
						},
						success : function(res){
							response($.map(res, function (item) {
					            return {
					                label: item.vehicleNo +" | "+item.fullName,
					                value: item.vehicleNo
					            };
					        }));
						}
					});
				},
				close: function( event, ui ) {
					
					var customerVehicleNo = $("#vehicleNo").val();
					var getUrl = window.contextRoot + '/servicing/vehicle?vehicleNo='+customerVehicleNo;
					
					var checkStr = customerVehicleNo.substring(customerVehicleNo.length - 4);
					
					//call getJSON if only full vehicleNo entered
					if(!isNaN(checkStr)){
						$.getJSON(getUrl, function(data) {
							$('#customerId').val(data.id);
							$('#fullName').val(data.fullName);
							$('#mobNo').val(data.mobNo);
							$('#address').val(data.address);
							$('#email').val(data.email);
							$('#vehicleModel').val(data.vehicleModel);
							$('#engineNo').val(data.engineNo);
							$('#chesisNo').val(data.chesisNo);
							$('#jobCardNo').val(data.jobCardNo);
							$(".customerInfo").attr("disabled", true);
							
							 $('#toggle-trigger').prop('checked', false).change()
	
							 $('#customerDetails').hide(2000);
							 $icon = $('#toggleBtnI');
							 $icon.addClass("fa fa-plus-circle");
							 $('#toggleBtnS').prop('title', 'Show Customer Details');
							 flag = true;
						});
					}
				},
				
				
		}
	);
	
	//search Labours
	$("#mechanicId").autocomplete(
			{
				source: function(request, response){
					$.ajax({
						url : window.contextRoot + '/servicing/labours',
						method : 'GET',
						dataType : 'json',
						data : {
							employeeName : request.term,
						},
						success : function(res){
							response($.map(res, function (employee) {
					            return {
					                label: employee.empName,
					                value: employee.empName,
					                id : employee.id
					            };
					        }));
						}
					});
				},
				select: function( event, ui ) {
					console.log(ui.item.id);
					$('#employeeId').val(ui.item.id);
				},
				close: function( event, ui ) {
					
					/*var customerVehicleNo = $("#vehicleNo").val();
					var getUrl = window.contextRoot + '/servicing/vehicle?vehicleNo='+customerVehicleNo;
					
					var checkStr = customerVehicleNo.substring(customerVehicleNo.length - 4);
					
					//call getJSON if only full vehicleNo entered
					if(!isNaN(checkStr)){
						$.getJSON(getUrl, function(data) {
							$('#customerId').val(data.id);
							$('#fullName').val(data.fullName);
							$('#mobNo').val(data.mobNo);
							$('#address').val(data.address);
							$('#email').val(data.email);
							$('#vehicleModel').val(data.vehicleModel);
							$('#engineNo').val(data.engineNo);
							$('#chesisNo').val(data.chesisNo);
							$('#jobCardNo').val(data.jobCardNo);
							$(".customerInfo").attr("disabled", true);
							
							 $('#toggle-trigger').prop('checked', false).change()
	
							 $('#customerDetails').hide(2000);
							 $icon = $('#toggleBtnI');
							 $icon.addClass("fa fa-plus-circle");
							 $('#toggleBtnS').prop('title', 'Show Customer Details');
							 flag = true;
						});
					}*/
				},
				
				
		}
	);
	
	

	
});



