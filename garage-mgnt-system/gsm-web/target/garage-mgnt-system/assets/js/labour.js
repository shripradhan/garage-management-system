$(document).ready(function(){
	
	
	var $labourTable = $('#labourTable');
	
	//SUBMIT FORM
	$("#labourForm").submit(function(event){
		//Prevent the form from Submitting via the browser
		event.preventDefault();
		ajaxPost();
		
	});

	function ajaxPost(){
		
		var postUrl = window.contextRoot + '/employee/save';
		
		//prepare form data
		var formData = {
				
				id : $("#employeeId").val(),
				empName : $("#empName").val(),
				empMobNo : $("#empMobNo").val(),
				empAddress : $("#empAddress").val(),
				empEmail : $("#empEmail").val(),
				empDesignation : $('#empDesignation').val(),
				
		}
		
		//DO POST
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : postUrl,
			data : JSON.stringify(formData),
			dataType : 'json',
			success : function(data) {
				
				if(data.code == "UPDATE"){
					toastr.success(data.message, 'Success Alert',{timeOut : 10000});
					$('#addLabour').text('Save');
					$labourTable.DataTable().ajax.reload();
					clearFields();
				}
				else if(data.code == "SAVE"){
					toastr.success(data.message, 'Success Alert',{timeOut : 10000})
					$labourTable.DataTable().ajax.reload();
					clearFields();
				}
				
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
	
	
	
	if($labourTable.length){
		var jsonUrl = window.contextRoot + '/employee/list';
		$labourTable.DataTable({
		
			lengthMenu : [[10, 30, 50, -1],['10 Records','30 Records', '50 Records', "All Record"]],
			pageLength : 10,
			ajax : {
				'url' : jsonUrl,
				'dataSrc' : '', 
			},
			columns : [
				{'data' : 'serialNo',},
				{'data' : 'empName',},
				{'data' : 'empMobNo'},
				{'data' : 'empAddress'},
				{'data' : 'empEmail'},
				{'data' : 'empDesignation'},
				{
					data : 'id',
					bSortable : false,
					className: "center",
					mRender : function(data, type, row){
						var strButtons = '';
					
						strButtons = '<center><a href="#page-top" class="btn btn-primary updateEmployee" id='+data+' data-toggle="tooltip" title="Edit Customer"> <i class="fa fa-edit"></i></a></center>';
						
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
						strButtons = '<center><button class="btn btn-danger deleteEmployee" name="deleteEmployee" id='+data+' data-toggle="tooltip" title="Delete Customer"><span class="fa fa-trash"></span></button></center>';
						
						return strButtons;
					}
				}
				
			],
		});
	}
	
	 $(document).on('click','.updateEmployee',function(){
		 var id = this.id;
		
			
		var getUrl = window.contextRoot + '/employee/update?id='+id;
		
		$.getJSON(getUrl, function(data) {
			$('#employeeId').val(data.id);
			$('#empName').val(data.empName);
			$('#empMobNo').val(data.empMobNo);
			$('#empAddress').val(data.empAddress);
			$('#empEmail').val(data.empEmail);
			$('#empDesignation').val(data.empDesignation);
			$('#addLabour').text('Update');
		});
			
			
     });
	 
	 $('#cancelId').click(function(){
			$('#addLabour').text('Save');
			clearFields();
	});
	 
	//deleting the customer
	$(document).on('click','.deleteEmployee',function(){
		
		 var employeeId = $(this).attr('id');
         var employeeName = $labourTable.DataTable().row($(this).closest('tr')).data().empName;
        
		bootbox.confirm({
		    message: "Are you sure you want to delete "+employeeName+" ?",
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
		        	//$('#data'+employeeId).closest('tr').remove();
		        	
		        	console.log("Delete Request of id :"+ employeeId);
		        	var deleteUrl = window.contextRoot + "/employee/"+employeeId+"/delete";
		        	$.ajax({
		        		type : "GET",
		        		url : deleteUrl,
		        		success : function(data){
		        			if(data.code == "OK"){
		        				toastr.success(data.message, 'Delete Alert',{timeOut : 3000})
		        				$labourTable.DataTable().ajax.reload();
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
		 $("#employeeId").val("");
		 $("#empName").val("");
		 $("#empMobNo").val("");
		 $("#empAddress").val("");
		 $("#empEmail").val("");
		 $("#empDesignation").val("");
	}
	
});