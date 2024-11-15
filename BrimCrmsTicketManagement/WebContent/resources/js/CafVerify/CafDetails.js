 $(document).ready(function(){
$('#cafVerifyFailRemarksArea').hide();
$('#idMatching').hide();
$('#addressMatch').hide();
      $(".divs div.cls").each(function(e) {
      console.log(e)
        if (e != 0)
            $(this).hide();
    });
  
    $("#next").click(function(){
        if ($(".divs div.cls:visible").next().length != 0)
            $(".divs div.cls:visible").next().show().prev().hide();
        else {
            $(".divs div.cls:visible").hide();
            $(".divs div.cls:first").show();
        }
        return false;
    });

    $("#prev").click(function(){
        if ($(".divs div.cls:visible").prev().length != 0)
            $(".divs div.cls:visible").prev().show().next().hide();
        else {
            $(".divs div.cls:visible").hide();
            $(".divs div.cls:last").show();
        }
        return false;
    });
    //Getting cafverification status
     $.ajax({
						type : "GET",
						url : "getCafVerificationStatus",
						async : true,
						cache : false,
						
						success : function(data) {
						if (data != '') {
						$('#verificationStatus').html('');
						 var finaldropdown = $('#verificationStatus').append('<option value="select" disabled selected> Select an option </option>');
						
			$.each(data,
					function(k, v) {
					finaldropdown
						.append('<option value="' + v.status + '">' + v.status
								+ '</option>');
					});

		}
													},
					complete: function(){
				        $('#overlay').hide();
				        $('#content').show();
				      }
					});
					$('input[name=isPoi]').click(function(){
						if($('input[name=isPoi]:checked').val()=="yes"){
							
							$('#idMatching').show();
						}
						if($('input[name=isPoi]:checked').val()=="no"){
							
							$('#idMatching').hide();
						}
						
					})
					$('input[name=isPoa]').click(function(){
						if($('input[name=isPoa]:checked').val()=="yes"){
							
							$('#addressMatch').show();
						}
						if($('input[name=isPoa]:checked').val()=="no"){
							
							$('#addressMatch').hide();
						}
						
					})
					 $("#cafVerifyBtn").click(function() { 
						 const verifyFields = ["isFilled", "isPhoto", "isPoi","isPoa","isSignature"];    
      let flag=true;
      const node = document.querySelector('#verifyAlertMsg');
      verifyFields.forEach(function(item) {
    if($('input[type=radio][name="'+item+'"]:checked').length == 0)
      {
		flag=false;  

      }
      
});
if(flag == false){
node.innerHTML = "<strong>Please check all conditions</strong>";
         return false;	
}
else if(flag == true){
	var content='';
	if($('input[name=isFilled]:checked').val()=="yes"){
	if ($('#verifyCafFilled').find('#verifyCafFilledChild').length > 0) {
    $('#verifyCafFilled').find('#verifyCafFilledChild').remove()
}
 content='<div class="modal-comments" id="verifyCafFilledChild"><i class="fa fa-check fa-2x" aria-hidden="true"></i></div>';
$("#verifyCafFilled").removeAttr("style")
		$('#verifyCafFilled').html();
		
	//document.getElementById("verifyCafFilled").innerHTML()
	$('#verifyCafFilled').append(content)
	//$('#verifyCafFilled').css({"display":"flex !important"});
	$("#verifyCafFilled, #verifyCafFilledChild").attr("style", "display:inline !important");

	}
	else if($('input[name=isFilled]:checked').val()=="no"){
	if ($('#verifyCafFilled').find('#verifyCafFilledChild').length > 0) {
    $('#verifyCafFilled').find('#verifyCafFilledChild').remove()
}
		content='<div class="modal-comments" id="verifyCafFilledChild"><i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i></div>';
		$("#verifyCafFilled").removeAttr("style")
		
	//document.getElementById("verifyCafFilled").innerHTML()
	$('#verifyCafFilled').append(content)
	//$('#verifyCafFilled').css({"display":"flex !important"});
	$("#verifyCafFilled, #verifyCafFilledChild").attr("style", "display:inline !important");

	}
		if($('input[name=isPhoto]:checked').val()=="yes"){
		if ($('#verifyCustomerPhoto').find('#verifyCafPhotoChild').length > 0) {
    $('#verifyCustomerPhoto').find('#verifyCafPhotoChild').remove()
}
		content='<div class="modal-comments" id="verifyCafPhotoChild"><i class="fa fa-check fa-2x" aria-hidden="true"></i></div>';
	
$("#verifyCustomerPhoto").removeAttr("style")
		$('#verifyCustomerPhoto').html();
	//document.getElementById("verifyCafFilled").innerHTML()
	$('#verifyCustomerPhoto').append(content)
	//$('#verifyCafFilled').css({"display":"flex !important"});
	$("#verifyCustomerPhoto, #verifyCafPhotoChild").attr("style", "display:inline !important");

	}
	else if($('input[name=isPhoto]:checked').val()=="no"){
	if ($('#verifyCustomerPhoto').find('#verifyCafPhotoChild').length > 0) {
    $('#verifyCustomerPhoto').find('#verifyCafPhotoChild').remove()
}
		content='<div class="modal-comments" id="verifyCafPhotoChild"><i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i></div>';
		$("#verifyCustomerPhoto").removeAttr("style")
		$('#verifyCustomerPhoto').html();
	//document.getElementById("verifyCafFilled").innerHTML()
	$('#verifyCustomerPhoto').append(content)
	//$('#verifyCustomerPhoto').css({"display":"flex !important"});
	$("#verifyCustomerPhoto, #verifyCafPhotoChild").attr("style", "display:inline !important");

	}
		if($('input[name=isPoi]:checked').val()=="yes"){
		if ($('#verifyProofId').find('#verifyProofIdChild').length > 0) {
    $('#verifyProofId').find('#verifyProofIdChild').remove()
}
		content='<div class="modal-comments" id="verifyProofIdChild"><i class="fa fa-check fa-2x" aria-hidden="true"></i></div>';

$("#verifyProofId").removeAttr("style")
		// $('#verifyProofId').html();
	//document.getElementById("verifyCafFilled").innerHTML()
	$('#verifyProofId').append(content)
	//$('#verifyCafFilled').css({"display":"flex !important"});
	$("#verifyProofId, #verifyProofIdChild").attr("style", "display:inline !important");

	}
	else if($('input[name=isPoi]:checked').val()=="no"){
			
	if ($('#verifyProofId').find('#verifyProofIdChild').length > 0) {
    $('#verifyProofId').find('#verifyProofIdChild').remove()
}
		content='<div class="modal-comments" id="verifyProofIdChild"><i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i></div>';
		$("#verifyProofId").removeAttr("style")
		//$('#verifyCustomerPhoto').html();
	//document.getElementById("verifyCafFilled").innerHTML()
	$('#verifyProofId').append(content)
	//$('#verifyCustomerPhoto').css({"display":"flex !important"});
	$("#verifyProofId, #verifyProofIdChild").attr("style", "display:inline !important");
	
	
	

	}
		if($('input[name=isPoa]:checked').val()=="yes"){
 
if ($('#verifyProofAddress').find('#verifyProofAddressChild').length > 0) {
    $('#verifyProofAddress').find('#verifyProofAddressChild').remove()
}
		content='<div class="modal-comments" id="verifyProofAddressChild"><i class="fa fa-check fa-2x" aria-hidden="true"></i></div>';

$("#verifyProofAddress").removeAttr("style")
		// $('#verifyProofId').html();
	//document.getElementById("verifyCafFilled").innerHTML()
	$('#verifyProofAddress').append(content)
	//$('#verifyProofAddress').css({"display":"flex !important"});
	$("#verifyProofAddress, #verifyProofAddressChild").attr("style", "display:inline !important");



	}
	else if($('input[name=isPoa]:checked').val()=="no"){
		
if ($('#verifyProofAddress').find('#verifyProofAddressChild').length > 0) {
    $('#verifyProofAddress').find('#verifyProofAddressChild').remove()
}
		content='<div class="modal-comments" id="verifyProofAddressChild"><i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i></div>';
		$("#verifyProofAddress").removeAttr("style")
		//$('#verifyCustomerPhoto').html();
	//document.getElementById("verifyCafFilled").innerHTML()
	$('#verifyProofAddress').append(content)
	//$('#verifyProofAddress').css({"display":"flex !important"});
	$("#verifyProofAddress, #verifyProofAddressChild").attr("style", "display:inline !important");


	}
		if($('input[name=isSignature]:checked').val()=="yes"){
 
if ($('#verifySignature').find('#verifySignatureChild').length > 0) {
    $('#verifySignature').find('#verifySignatureChild').remove()
}
		content='<div class="modal-comments" id="verifySignatureChild"><i class="fa fa-check fa-2x" aria-hidden="true"></i></div>';

$("#verifySignature").removeAttr("style")
		// $('#verifyProofId').html();
	//document.getElementById("verifyCafFilled").innerHTML()
	$('#verifySignature').append(content)
	//$('#verifyProofAddress').css({"display":"flex !important"});
	$("#verifySignature, #verifySignatureChild").attr("style", "display:inline !important");




	}
	else if($('input[name=isSignature]:checked').val()=="no"){
			
	if ($('#verifySignature').find('#verifySignatureChild').length > 0) {
    $('#verifySignature').find('#verifySignatureChild').remove()
}
		content='<div class="modal-comments" id="verifySignatureChild"><i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i></div>';
		$("#verifySignature").removeAttr("style")
		//$('#verifyCustomerPhoto').html();
	//document.getElementById("verifyCafFilled").innerHTML()
	$('#verifySignature').append(content)
	//$('#verifyProofAddress').css({"display":"flex !important"});
	$("#verifySignature, #verifySignatureChild").attr("style", "display:inline !important");
	
	
	
	}


	$('#cafVerifyModal').modal('toggle');
$('#cafVerifyModal').modal('show');
}

    });
});
$('#radioBtn a').on('click', function(){
    var sel = $(this).data('title');
    var tog = $(this).data('toggle');
    $('#'+tog).prop('value', sel);
    
    $('a[data-toggle="'+tog+'"]').not('[data-title="'+sel+'"]').removeClass('active').addClass('notActive');
    $('a[data-toggle="'+tog+'"][data-title="'+sel+'"]').removeClass('notActive').addClass('active');
})
$('#cafVerifyradioBtn a').on('click', function(){
    var sel = $(this).data('title');
    var tog = $(this).data('toggle');
    $('#'+tog).prop('value', sel);
    
    $('a[data-toggle="'+tog+'"]').not('[data-title="'+sel+'"]').removeClass('active').addClass('notActive');
    $('a[data-toggle="'+tog+'"][data-title="'+sel+'"]').removeClass('notActive').addClass('active');
    if($('#cafVerificationStatus').val() == 'no'){
  $('#cafVerifyFailRemarksArea').show();
    }
    else if($('#cafVerificationStatus').val() == 'yes'){
    $('#cafVerifyFailRemarksArea').hide();
    }
})

function closeCafVerifyModal(){
	console.log("caf closing")
	var fields=["verifyCafFilled","verifyCustomerPhoto","verifyProofId","verifyProofAddress","verifySignature"]
fields.forEach(function(item) {
    $('#'+item).remove("'#'+item+'Child'")
      $('#cafVerifyModal').modal('hide');
      
});
}
