$(document).ready(function(){
	
	
	var $insuranceTable = $('#insuranceTable');
	
	//SUBMIT FORM
	$("#insCompanyForm").submit(function(event){
		//Prevent the form from Submitting via the browser
		event.preventDefault();
		ajaxPost();
		
	});

	function ajaxPost(){
		
		var postUrl = window.contextRoot + '/insurance/save';
		
		//prepare form data    
		var formData = {
				
				id : $("#insCompanyId").val(),
				insCompanyName : $("#insCompanyName").val(),
				mno : $("#mno").val(),
				address : $("#address").val(),
				email : $("#email").val(),
				gstin : $('#gstin').val(),
				panNo : $('#panNo').val(),
				
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
					$('#addInsCompany').text('Save');
					$insuranceTable.DataTable().ajax.reload();
					clearFields();
				}
				else if(data.code == "SAVE"){
					toastr.success(data.message, 'Success Alert',{timeOut : 10000})
					$insuranceTable.DataTable().ajax.reload();
					clearFields();
				}
				
			},
			error : function(e) {
				console.log("ERROR: ", e);
				var data = e.responseJSON;
				toastr.error("Failed to save Insurance Compnay", 'Error Alert',{timeOut : 3000})
			},
			done : function(e) {
				console.log("DONE");
			}
		});
	}
	
	
	
	if($insuranceTable.length){
		var jsonUrl = window.contextRoot + '/insurance/list';
		$insuranceTable.DataTable({
		
			lengthMenu : [[10, 30, 50, -1],['10 Records','30 Records', '50 Records', "All Record"]],
			pageLength : 10,
			ajax : {
				'url' : jsonUrl,
				'dataSrc' : '', 
			},
			columns : [
				{'data' : 'serialNo',},
				{'data' : 'insCompanyName',},
				{'data' : 'mno'},
				{'data' : 'address'},
				{'data' : 'email'},
				{'data' : 'gstin'},
				{'data' : 'panNo'},
				{
					data : 'id',
					bSortable : false,
					className: "center",
					mRender : function(data, type, row){
						var strButtons = '';
					
						strButtons = '<center><a href="#page-top" class="btn btn-primary updateInsCompany" id='+data+' data-toggle="tooltip" title="Edit Insurance Company"> <i class="fa fa-edit"></i></a></center>';
						
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
						strButtons = '<center><button class="btn btn-danger deleteInsCompany" name="deleteInsCompany" id='+data+' data-toggle="tooltip" title="Delete Insurance Company"><span class="fa fa-trash"></span></button></center>';
						
						return strButtons;
					}
				}
				
			],
		});
	}
	
	 $(document).on('click','.updateInsCompany',function(){
		 var id = this.id;
		
			
		var getUrl = window.contextRoot + '/insurance/update?id='+id;
		
		$.getJSON(getUrl, function(data) {
			$("#insCompanyId").val(data.id);
			$("#insCompanyName").val(data.insCompanyName);
			$("#mno").val(data.mno);
			$("#address").val(data.address);
			$("#email").val(data.email);
			$('#gstin').val(data.gstin);
			$('#panNo').val(data.panNo);
			$('#addInsCompany').text('Update');
		});
			
			
     });
	 
	 $('#cancelId').click(function(){
			$('#addInsCompany').text('Save');
			clearFields();
	});
	 
	//deleting the customer
	$(document).on('click','.deleteInsCompany',function(){
		
		 var insCompanyId = $(this).attr('id');
         var insCompanyName = $insuranceTable.DataTable().row($(this).closest('tr')).data().insCompanyName;
        
		bootbox.confirm({
		    message: "Are you sure you want to delete "+insCompanyName+" ?",
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
		        	
		        	console.log("Delete Request of id :"+ insCompanyId);
		        	var deleteUrl = window.contextRoot + "/insurance/"+insCompanyId+"/delete";
		        	$.ajax({
		        		type : "GET",
		        		url : deleteUrl,
		        		success : function(data){
		        			if(data.code == "OK"){
		        				toastr.success(data.message, 'Delete Alert',{timeOut : 3000})
		        				$insuranceTable.DataTable().ajax.reload();
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
		$("#insCompanyId").val("");
		$("#insCompanyName").val("");
		$("#mno").val("");
		$("#address").val("");
		$("#email").val("");
		$('#gstin').val("");
		$('#panNo').val("");
	}
	
});