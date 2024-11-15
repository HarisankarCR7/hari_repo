function getUserDetails()
{ 
var columns = $('#dtlCols').val();
var colObj = JSON.parse(columns);
for (let key in colObj){
$('#'+colObj[key].title).val("");
}
	var assId = $("#associateId").val(); 
	if(assId.length>0){
			$.ajax({
	        type: 'GET', // it's easier to read GET request parameters
	        url: "SubmitAssociateId?associateId="+assId,
	        
	        success: function(jsonString) {
	      
	          if($('#notchecked').is(':checked')) { 
	          
	          $('#notchecked').prop("checked", false);
	           $('#checked').prop("checked", true);
	           }
	        
	        	var data = JSON.parse(jsonString)
	        	var detailsData= JSON.parse(data[0].data);
	        	$("#GstNumberDiv").show();
	        	if(data[0].status == "not found"){
	        	var data="<h3 class='red-text'>Alert</h3><p>"+data[0].message+"</p>";
				$("#modal1 .modal-content").html(data);
				var modal = $('#modal1').openModal({
				});
	        	}
	        	else if(data[0].status == "success"){
	        	for (let key in detailsData){
    $("#" + key).val(detailsData[key]);
				Materialize.updateTextFields();
  
}
}
	        	
	        	
	        	
	        },
		error: function(jqXHR, textStatus, errorThrown) {
		console.log(errorThrown)
			
		}
		
		});
	}
	else{
				var data="<h3 class='red-text'>Alert</h3><p>Please provide an Associate Id</p>";
				$("#modal1 .modal-content").html(data);
				var modal = $('#modal1').openModal({
				        
				    });
				    }
	//var chkValidation = ChangePwdValidation()
	

		
	
}

function ChangePwdValidation()
{
	var newPwd = document.getElementById("newPwd").value;
	var oldPwd = document.getElementById("oldPwd").value;
	var cnfPwd = document.getElementById("Pwd").value;
	if(newPwd.trim().length>0 && oldPwd.trim().length>0 && cnfPwd.trim().length>0)
	{
		if(newPwd.trim()==oldPwd.trim())
		{
			document.getElementById("typeMsg").innerHTML="ALERT";
			document.getElementById("dataMsg").innerHTML="New and Old Pwd are same";
			$('#message').openModal({dismissible: false});
			
			
			return false;
		}
		if(newPwd.trim()!=cnfPwd.trim())
		{
			document.getElementById("typeMsg").innerHTML="ALERT";
			document.getElementById("dataMsg").innerHTML="New and Confirm Pwd Should be same";
			$('#message').openModal({dismissible: false});
			
			
			return false;
		}
		else
		{
			return true;
		}
	}
	else
	{
		document.getElementById("typeMsg").innerHTML="ALERT";
		document.getElementById("dataMsg").innerHTML="All Fields are Mandatory";
		$('#message').openModal({dismissible: false});
		
		
		return false;
	}
	
}
function getAddress(){
	
	var pinCode = $('#Pincode').val();
	if(pinCode.length>6 || pinCode.length<6){
	$('#pinAlert').show();
	}
	else{
	 if ($('#pinAlert').is(':visible')) {
	 $('#pinAlert').hide();
	 }
			$.ajax({
	        type: 'GET', // it's easier to read GET request parameters
	        url: "GetAddress?pinCode="+pinCode,
	        
	        success: function(jsonString) {
	      
	        var addressArray=JSON.parse(jsonString)
	       
	       

	        	document.getElementById('showAddress').style.display = 'block' ? 'block': 'none';
	        	$('#addressTable> tbody').html("");
				var bodyContent = '';
				
					//bodyContent=bodyContent+ "<tr><td><input type=\"checkbox\" id=\"pcheck" + i + "\" name=\"splittercheck\" class=\"filled-in\" ><label for=\"pcheck" + i + "\"></label></td><td> P" + i + "</td><td><input type=\"text\"  id=\"splitterarea\" name=\"chkAllPrimaryAttrs\"></td></tr>";
addressArray.forEach(function (arrayItem) {
    
					bodyContent = bodyContent
							+ "<tr><td><input type=\"checkbox\"  id='"+ arrayItem.location+"' name=\"chkAllPrimaryAttrs\"><label for='"+ arrayItem.location+"'></label>"
							
							
							+ "</td><td>"+ arrayItem.location + "</td><td>"+ arrayItem.district+ "</td><</tr>";
			});
				$("#addressTable tbody").append(bodyContent);
				
				
	        	$("#showAddress").dialog({
					autoOpen : false,
					modal : true,
					buttons : {
						Save : function() {
							setAddressFields();

						},
					},
					width : "auto",
					height : "auto",
				//maxWidth: "768px"
				});

				$("#showAddress").dialog("open")
	        	
	        },
		error: function(jqXHR, textStatus, errorThrown) {
		console.log(errorThrown)
			
		}
		
		});
	}
	}
	function setAddressFields(){
	
	$("#addressTable > tbody > tr").each(function () {
  if ($(this).find('input[type=checkbox]').is(":checked")) {
  
    $('#Postoffice').val($(this).find('td').eq(1).text())
    $('#District').val($(this).find('td').eq(2).text())
    $('#Postoffice').css("color","black");
     $('#District').css("color","black");
  }
});
if ($("#showAddress").dialog("isOpen")) {

				$("#showAddress").dialog("close")

			}
	}
	
	function isEmail(email) {
  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return regex.test(email);
}
	 
	
	