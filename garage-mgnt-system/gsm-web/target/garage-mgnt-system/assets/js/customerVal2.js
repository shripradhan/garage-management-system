$(document).ready(function(){
	
	$("#vehicleNo").inputmask({mask: 'AA-99-AA-9999'});;
	
	var $customerTable = $('#customerTable');
	
	//SUBMIT FORM
	$("#customerForm").submit(function(event){
		//Prevent the form from Submitting via the browser
		event.preventDefault();
		ajaxPost();
		
	});

	function ajaxPost(){
		
		var postUrl = window.contextRoot + '/customer/save';
		
		//prepare form data
		var formData = {
				
				id : $("#customerId").val(),
				fullName : $("#fullName").val(),
				mobNo : $("#mobNo").val(),
				address : $("#address").val(),
				email : $("#email").val(),
				vehicleNo : $("#vehicleNo").val(),
				vehicleModel : $("#vehicleModel").val(),
				engineNo : $("#engineNo").val(),
				chesisNo : $("#chesisNo").val(),
				jobCardNo : $("#jobCardNo").val()
				
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
					window.location.href = window.location.href.replace("?id="+$('#customerId').val(),"/");
					$('#addCustomer').text('Save');
					$customerTable.DataTable().ajax.reload();
					clearFields();
				}
				else if(data.code == "SAVE"){
					toastr.success(data.message, 'Success Alert',{timeOut : 10000})
					$customerTable.DataTable().ajax.reload();
					clearFields();
				}else if(data.code == "EXIST"){
					bootbox.alert({
					    message: data.message,
					    className: 'rubberBand animated'
					});
				}
			},
			error : function(e) {
				console.log("ERROR: ", e);
				var data = e.responseJSON;
				toastr.error("Failed to save Customer", 'Error Alert',{timeOut : 3000})
			},
			done : function(e) {
				console.log("DONE");
				//enableSearchButton(true);
			}
		});
	}
	
	
	//Jquery Data Table for Customer
	//-----------------------------------------------------------
	
	
	
	//execute the below code only where we have this table
	

	if($customerTable.length){
		//console.log('Inside the Table');
		
		var jsonUrl = window.contextRoot + '/customer/list';
		
		
		$customerTable.DataTable({
		
			lengthMenu : [[10, 30, 50, -1],['10 Records','30 Records', '50 Records', "All Record"]],
			pageLength : 10,
			ajax : {
				'url' : jsonUrl,
				'dataSrc' : '', 
			},
			columns : [
				{
					'data' : 'serialNo',
				},
				{
					'data' : 'fullName',
				},
				{
					'data' : 'mobNo.'
				},
				{'data' : 'address'},
				{'data' : 'email'},
				{
					data : 'id',
					bSortable : false,
					className: "center",
					mRender : function(data, type, row){
						var strButtons = '';
					
						strButtons = '<center><button class="btn btn-primary viewCustomer" name="viewCustomer" id='+data+' data-toggle="tooltip" title="Show Customer Vehicle Info"><span class="fa fa-eye"></span></button></center>';
						
						return strButtons;
					}
				},
				{
					data : 'id',
					bSortable : false,
					className: "center",
					mRender : function(data, type, row){
						var strButtons = '';
					
						strButtons = '<center><a href="' + window.contextRoot + '/customer/new_customer?id='+data+'" class="btn btn-primary" data-toggle="tooltip" title="Edit Customer"> <i class="fa fa-edit"></i></a></center>';
						
						return strButtons;
					}
				},
				{
					data : 'id',
					bSortable : false,
					className: "center",
					mRender : function(data, type, row){
						var strButtons = '';
					
						/*strButtons = '<center><a href="javascript:void(0)" id="data'+data+'" onclick="deleteCustomer('+data+')" class="btn btn-primary" data-toggle="tooltip" title="Delete Customer"><span class="fa fa-trash"></span></a></center>';*/
						strButtons = '<center><button class="btn btn-primary deleteCustomer" name="deleteCustomer" id='+data+' data-toggle="tooltip" title="Delete Customer"><span class="fa fa-trash"></span></button></center>';
						
						return strButtons;
					}
				}
				
			],
		});
	}
	
	//------------------------------------------------------------
	
	$('#cancelId').click(function(){
		$('#addCustomer').text('Save');
		window.location.href = window.location.href.replace("?id="+$('#customerId').val(),"/");
		clearFields();
	})
	
	
	//load data for updating the customer
	$(document).on('click','.viewCustomer',function(){
		//alert("success ya... ha...");
		
		var customerId = $(this).attr('id');
		var getUrl = window.contextRoot + '/customer/'+customerId;

		$.getJSON(getUrl, function(data) {
			$('#exampleModalCenter').modal('show');
			$('#custName').text(data.fullName);
			$('#vehModel').text(data.vehicleModel);
			$('#vehNo').text(data.vehicleNo);
			$('#engNo').text(data.engineNo);
			$('#cheNo').text(data.chesisNo);
			$('#jobCrdNo').text(data.jobCardNo);
		});
	});
	
	//deleting the customer
	$(document).on('click','.deleteCustomer',function(){
		
		 var customerId = $(this).attr('id');
         var customerName = $customerTable.DataTable().row($(this).closest('tr')).data().fullName;
        
		bootbox.confirm({
		    message: "Are you sure you want to delete "+customerName+" ?",
		    className: 'rubberBand animated',
		    buttons: {
		        confirm: {
		            label: 'Yes',
		            className: 'btn-success'
		        },
		        cancel: {
		            label: 'No',
		            className: 'btn-danger'
		        }
		    },
		    callback: function (result) {
		        console.log('This was logged in the callback: ' + result);
		        if(result){
		        	$('#data'+customerId).closest('tr').remove();
		        	
		        	console.log("Delete Request of id :"+ customerId);
		        	var deleteUrl = window.contextRoot + "/customer/"+customerId+"/delete";
		        	$.ajax({
		        		type : "GET",
		        		url : deleteUrl,
		        		success : function(data){
		        			if(data.code == "OK"){
		        				toastr.success(data.message, 'Delete Alert',{timeOut : 3000})
		        				$customerTable.DataTable().ajax.reload();
		        			}else if(data.code = "ERROR"){
		        				toastr.error(data.message, 'Delete Alert',{timeOut : 3000})
		        			}
		        		},
		        		error : function(e){
		        			
		        		}
		        	})
		        }else{
		        	bootbox.alert({
		        	    message: "You cancel the delete action!",
		        	    size: 'small'
		        	});
		        }
		    }
		});
		
	});
	
	
	
	
	function clearFields(){
		 $("#customerId").val("");
		 $("#fullName").val("");
		 $("#mobNo").val("");
		 $("#address").val("");
		 $("#email").val("");
		 $("#vehicleNo").val("");
		 $("#vehicleModel").val("");
		 $("#engineNo").val("");
		 $("#chesisNo").val("");
		 $("#jobCardNo").val("");
	}
	
	
	
	
});
