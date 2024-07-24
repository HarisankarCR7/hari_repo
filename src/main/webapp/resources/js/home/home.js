


 let dt='';
 let dtCafDetails='';
  $(document).ready(function(){

   $('#selectionArea').hide();
   $('.select2').select2({
    closeOnSelect: false
   
});
 $('#FromDate').datepicker();
  $('#ToDate').datepicker();
window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    
    let myData = {
	"headings": [
		"id",
		"center",
		"module",
		"problemDescription",
		"userName",
		"userId",
		"loginTime",
		"status",
		"crmTicketNo",
		"lob",
		"resolvedTime",
		"ticketNumber",
		"select"
		
	]
       
	};
    if (datatablesSimple) {
        dt=new simpleDatatables.DataTable(datatablesSimple, {
	data: myData,
	columns: [
      

        // Hide the sixth column
       
         {
      select: 12,
     // render: (data, td, dataIndex, cellIndex) => "<button data-row='" + dataIndex + "' onclick='openCafDetails(\""+data[0].data+"\",\""+td+"\")'>Caf Details</button>"
    render: (data, td, dataIndex, cellIndex) => "<a href='ticketdetails?ticktDtls="+encodeURIComponent(data[0].data)+"' class='btn btn-primary' role='button'>Ticket Details</a>"
    }/*,
     {
      select: 13,
      render: (data, td, dataIndex, cellIndex) => "<button data-row='" + dataIndex + "' class='btn btn-success' onclick='acknowledge(\""+td+"\")'>Acknowledge</button>"
    }  */
    ]
});

//const convertedData = convertCSV({columnDelimiter: ';', data: ''})


        
         dt.on('datatable.init', function(args) {
	// Do something when datatable.XXXX fires

});
dt.on('datatable.search', function(query, matched) {
   
});
    }
   
   
});
  
   
  });
  

  
  function buildDropdown(result, dropdown, emptyMessage) {
		//dropdown.siblings('#ms-list-1.ms-options-wrap').find('> .ms-options > ul').find('> li').remove();
		
		//dropdown.destroy();

 dropdown.html('') 
 var finaldropdown = dropdown.append('<option value="select" disabled selected> Select an option </option>');
		if (result != '') {
			$.each(result,
					function(k, v) {
					finaldropdown
						.append('<option value="' + v + '">' + v
								+ '</option>');
					});
			
			//dropdown.material_select();

			
		}
	}
	function openDetailsArea(cafNo){
	$.ajax({
		type : "GET",
		url : "getCafDetails",
		async : true,
		data : {
			'data' : JSON.stringify(cafNo)
		},
		success : function(data) {
			var response = JSON.parse(data);
			
			
		}
	});
	 $('.modal').openModal();
	}
	$('#rdropdown')
.on(
		'change',
		function() {
			regionArr = [];
			var selectedOptions = $('#rdropdown option:selected');
			if (selectedOptions.length > 0) {
				$('#rdropdown option:selected')
						.map(
								function(a, item) {
								regionArr
											.push(item.value);
									
								});
								makeAjaxCall($('#cdropdown'), regionArr, "getCenter")
			}
		});
		function makeAjaxCall(div, params, url) {
	$.ajax({
		type : "GET",
		url : url,
		async : true,
		data : {
			'data' : JSON.stringify(params)
		},
		success : function(data) {
			var response = JSON.parse(data);
			
			buildDropdown(response, div, 'Select an option');
		}
	});
}
function getCafCouriers(){
//$('#selectionArea,#selectionAreaSecond').css("display", "flex");
//$('#selectionArea').show();
getRegion();
var selectedOptions = $('#cdropdown option:selected');
			if (selectedOptions.length > 0) {
				$('#cdropdown option:selected')
						.map(
								function(a, item) {
								centerArr
											.push(item.value);
									
								});
						$.ajax({
						type : "GET",
						url : "getdispatchedCafs",
						async : true,
						
						cache : false,
						
						success : function(data) {
							var bodyContent='';
						var response = JSON.parse(data)
						$("#cafDetailsTab > tbody").html("");
						$('.ajax-table-utilities').html("");
						

response.forEach(function(e) {
bodyContent = bodyContent
													+ "<tr><td>"
													+ e.cafNo
													+ "</td><td>"  
													+ e.subCode
													+ "</td><td>"
													+e.name
													+"</td><td><a href='#'  onclick=openDetailsArea($(this).closest('tr').find('td:eq(0)').text())>View Caf Details</a></td></tr>";

})
$("#cafDetailsTab tbody")
												.append(bodyContent);
												  $('table').ajaxTable({
    source: false,            // URL used to fetch the data. Set to false to disable AJAX loading
  sourceContext: {},        // Optional object to pass to the server while fetching the data
  printButtons: true,       // Should the print buttons be displayed?
  orderBy: 0,               // Index of the column used to order the table
  orderSort: 'desc',        // Order direction
  logging: false,           // Should ajaxTable use the developper console?
  contentType: null,        // Use this to manually set the content type of the requests
 searchPlaceholders: null, // Default search placeholders (Example: ['search1', 'search2'])
  onStructureReady: function (table, data) { 
 
   }, // Runs when the ajaxTable structure is ready
  onReady: function (table, data) { },          // Runs when the ajaxTable is ready
  beforeAjax: function (table, data) { },       // Runs before every AJAX call
  onUpdate: function (table, data) { }    
});


						},
					complete: function(){
				        $('#overlay').hide();
				        $('#content').show();
				      }
					});
								
			}
}
function getPendingTickets(){
console.log("into penfing tickets method")
						$.ajax({
						type : "GET",
						url : "getPendingTickets",
						async : true,
						cache : false,
						
						success : function(response) {
							
							var bodyContent='';
						//var response = JSON.parse(data)
						//console.log(response)
						
						
			
			if(response.length != 0){
				var cafArray = [];
				console.log("array is empty")
			
						

response.forEach(function(e) {
	console.log("array iterate");




cafArray.push({"id": e.id,
"center":e.center,
"module": e.module,
"problemDescription" : e.problemDescription,
"userName": e.userName,
"userId":e.userId,
"loginTime" : e.loginTime,
"status" : e.status,
"crmTicketNo": e.crmTicketNo,
"lob" : e.lob,
"resolvedTime": e.resolvedTime,
"ticketNumber":e.ticketNo,
"select" : e.ticketNo


});

})



let obj = {
    // Quickly get the headings
    headings: Object.keys(cafArray[0]),

    // data array
    data: []
};

// Loop over the objects to get the values
for ( let i = 0; i < cafArray.length; i++ ) {

    obj.data[i] = [];

    for (let p in cafArray[i]) {
        if( cafArray[i].hasOwnProperty(p) ) {
            obj.data[i].push(cafArray[i][p]);
        }
    }
}

/*if(dt.hasRows){
let rows = dt.rows;
$("#datatablesSimple tbody tr").each(function() {
rows.remove(parseInt($(this).attr("data-index")));

})


}*/
			dt.destroy();
			dt.init();
		   dt.insert(cafArray);
		  // $('#datatablesSimple th:nth-child(1), tr td:nth-child(1)').hide();
		   //$('#datatablesSimple th:nth-child(2), tr td:nth-child(2)').hide();
		  
		   let columns = dt.columns;
}
else{
	dt.destroy();
			dt.init();
	
}
		   
	},
					complete: function(){
				        $('#overlay').hide();
				        $('#content').show();
				      }
					});
								
			}
			
			function getClosedTickets(){
console.log("into penfing tickets method")
						$.ajax({
						type : "GET",
						url : "getClosedTickets",
						async : true,
						cache : false,
						
						success : function(response) {
							console.log(response)
							var bodyContent='';
						//var response = JSON.parse(data)
						//console.log(response)
						
						
			var cafArray = [];			

response.forEach(function(e) {
	console.log("array iterate");




cafArray.push({"id": e.id,
"center":e.center,
"module": e.module,
"problemDescription" : e.problemDescription,
"userName": e.userName,
"userId":e.userId,
"loginTime" : e.loginTime,
"status" : e.status,
"crmTicketNo": e.crmTicketNo,
"lob" : e.lob,
"resolvedTime": e.resolvedTime,
"ticketNumber":e.ticketNo,
"select" : e.ticketNo


});

})



let obj = {
    // Quickly get the headings
    headings: Object.keys(cafArray[0]),

    // data array
    data: []
};

// Loop over the objects to get the values
for ( let i = 0; i < cafArray.length; i++ ) {

    obj.data[i] = [];

    for (let p in cafArray[i]) {
        if( cafArray[i].hasOwnProperty(p) ) {
            obj.data[i].push(cafArray[i][p]);
        }
    }
}

/*if(dt.hasRows){
let rows = dt.rows;
$("#datatablesSimple tbody tr").each(function() {
rows.remove(parseInt($(this).attr("data-index")));

})


}*/
			dt.destroy();
			dt.init();
		   dt.insert(cafArray);
		  // $('#datatablesSimple th:nth-child(1), tr td:nth-child(1)').hide();
		   //$('#datatablesSimple th:nth-child(2), tr td:nth-child(2)').hide();
		  
		   let columns = dt.columns;
		   
	},
					complete: function(){
				        $('#overlay').hide();
				        $('#content').show();
				      }
					});
								
			}


function getPendingCouriers(){
var centerArr =[];
var selectedOptions = $('#cdropdown option:selected');
			if (selectedOptions.length > 0) {
				$('#cdropdown option:selected')
						.map(
								function(a, item) {
								centerArr
											.push(item.value);
									
								});
						$.ajax({
						type : "GET",
						url : "getnewlyDispatchedCouriers",
						async : true,
						data : {
			'data' : JSON.stringify(centerArr)
		},
						cache : false,
						
						success : function(data) {
							var bodyContent='';
						var response = JSON.parse(data)

			var cafArray = [];			

response.forEach(function(e) {
/*bodyContent = bodyContent
													+ "<tr><td style='display:none'>"
													+ e.id
													+ "</td><td>"  
													+ e.CourierNo
													+ "</td><td>"
													+ e.CourierName
													+ "</td><td>"
													+ e.NoofCafDispatched
													+ "</td><td>"
													+ e.FromPerson
													+ "</td><td>"
													+ e.ToPerson
													+ "</td><td>"
													+ e.region
													+ "</td><td>"
													+ e.center
													+ "</td><td>"
													+ e.status
													+"</td><td><a href='#'  onclick=openDetailsArea($(this).closest('tr').find('td:eq(0)').text())>View Caf Details</a></td></tr>";

*/

cafArray.push({"Id": e.id,
"cafrecieved":"",
"CourierNo": e.CourierNo,
"CourierName" : e.CourierName,
"NoofCafDispatched": e.NoofCafDispatched,
"FromPerson" : e.FromPerson,
"ToPerson" : e.ToPerson,
"region": e.region,
"center" : e.center,
"status": e.status,
"select" : e.id,
"Acknowledge" : e.id

});

})



let obj = {
    // Quickly get the headings
    headings: Object.keys(cafArray[0]),

    // data array
    data: []
};

// Loop over the objects to get the values
for ( let i = 0; i < cafArray.length; i++ ) {

    obj.data[i] = [];

    for (let p in cafArray[i]) {
        if( cafArray[i].hasOwnProperty(p) ) {
            obj.data[i].push(cafArray[i][p]);
        }
    }
}

if(dt.hasRows){
let rows = dt.rows;
$("#datatablesSimple tbody tr").each(function() {
rows.remove(parseInt($(this).attr("data-index")));

})


}
			
		   dt.insert(cafArray);
		   $('#datatablesSimple th:nth-child(1), tr td:nth-child(1)').hide();
		   $('#datatablesSimple th:nth-child(2), tr td:nth-child(2)').hide();
		  
		   let columns = dt.columns;
		   
	},
					complete: function(){
				        $('#overlay').hide();
				        $('#content').show();
				      }
					});
								
			}
}
function openCafDetails(crrId){

$.ajax({
		type : "GET",
		url : "getDispatchedCafs/"+crrId,
		async : true,
		success : function(data) {
			var cafDetailsArray = [];			

data.forEach(function(e) {

													
cafDetailsArray.push({"Caf recieved or not" : "","Caf Number": e.caf_NO,
"Subscriber Code": e.subCode,
"Address" : e.addressMerged,
"Activated On": e.activatedOn,
"Email" : e.email,
"Phone Number" : e.currentContactNo,
"Region": e.region,
"Center" : e.area,
"Caf Status" : e.cafStatus,
"Details" : e.caf_NO
});


});
let cafDetailsHeading = {
	"headings": [
	"Caf recieved or not",
		"Caf Number",
		"Subscriber Code",
		"Address",
		"Activated On",
		"Email",
		"Phone Number",
		"Region",
		"Center",
		"Caf Status",
		"Details"
		
	]
       
	};
	if(dtCafDetails.initialized){
	dtCafDetails.destroy()
	}
	const cafDetailsTable = document.getElementById('cafDetailsTable');	
    if (cafDetailsTable) {
        dtCafDetails=new simpleDatatables.DataTable(cafDetailsTable, {
	data: cafDetailsHeading,
	clasees :  {
        active: "active" ,// will be "datatable-active" in version 7
        bottom: "datatable-bottom",
        container: "datatable-container",
        cursor: "datatable-cursor",
        dropdown: "datatable-dropdown",
        ellipsis: "ellipsis", // will be "datatable-ellipsis" in version 7
        empty: "datatable-empty",
        headercontainer: "datatable-headercontainer",
        info: "datatable-info",
        input: "datatable-input",
        loading: "datatable-loading",
        pagination: "datatable-pagination",
        paginationList: "datatable-pagination-list",
        search: "datatable-search",
        selector: "datatable-selector",
        sorter: "datatable-sorter",
        table: "datatable-table",
        top: "datatable-top",
        wrapper: "datatable-wrapper"
},
	columns: [
     {
      select: 9,
      render: (data, td, dataIndex, cellIndex) => {
      console.log(data)
      if(data.length > 0){
      
      if(data[0].data == 'CAF Not Received' || data[0].data == 'Without CAF') {
      return "<h6><span class='badge rounded-pill bg-info text-dark'>WITHOUT CAF</span></h6>"
      }
      else if(data[0].data == 'INVALID'){
       return "<h6><span class='badge rounded-pill bg-danger'>INVALID</span></h6>"
      }
      }
 
      }
    },
    {
      select: 0,
      render: function(data, td, rowIndex, cellIndex)  { 
      return `<div><input type='checkbox' class= '${rowIndex}' onchange='acknowledgeCafCheckChange(event,\"${td}\")'>   </div>`;
      }
 
 

    } ,
    {
            select: 10,
      render: (data, td, dataIndex, cellIndex) => "<a href='getCafDetails?cafNo=\""+encodeURIComponent(td)+"\"' class='btn btn-primary' role='button'>Details</a>" 
 

    }  
    
    

       
    ],
    paging:false,
    truncatePager:false
	})
	dtCafDetails.on('datatable.init', function(args) {
	$('#cafDetailsTable').paging({limit:10,rowDisplayStyle: 'block',
activePage: 0,
rows: []});
	

});
	 dtCafDetails.on("datatable.selectrow", (rowIndex, event) => {
	 
	 
  var $row = $('#cafDetailsTable tbody tr[data-index="' + rowIndex + '"]');

  var cafNo=$($row).find("td").eq(1).html()  
  $.ajax({
		type : "GET",
		url : "getCafDetails/"+ "?cafNo=" + cafNo,
		async : true,
		success : function(data) {
			var cafDetailsArray = [];			

}
})

  

   
});
if(dtCafDetails.hasRows){
let rows = dtCafDetails.rows;
$("#cafDetailsTable tbody tr").each(function() {
rows.remove(parseInt($(this).attr("data-index")));

})


}

	dtCafDetails.insert(cafDetailsArray)
	
	}
	
	
	

	}
	});


}

function acknowledge(td){
let parentRow=$('#datatablesSimple td').closest('tr');


$("#ackCorNo").text($(parentRow).find("td").eq(2).html()); 
$("#ackCorName").text($(parentRow).find("td").eq(3).html());  
$("#ackCafdis").text($(parentRow).find("td").eq(4).html());
$("#ackCafRec").text($(parentRow).find("td").eq(1).html());

$("#ackCafId").text($(parentRow).find("td").eq(0).html());
$('#acknowledgemodal').modal('toggle');
$('#acknowledgemodal').modal('show');
/*if( $(parentRow).find("td").eq(1).html() > 0) {
}*/

}
function closeAcknowledgeModal(){
if($('#acknowledgemodal').is(':visible')){
$('#acknowledgemodal').modal('hide');
}
}
function acknowledgeCafCheckChange(event,td){     
    let parentRow=$('#datatablesSimple td').closest('tr');
 var checkbox = event.target;
 var count=0;
    if (checkbox.checked) {
       $('#cafDetailsTable > tbody  > tr').each(function(index, tr) { 
 if($(tr).find('input[type=checkbox]').is(":checked")){
 count=count+1;
 }
 });

    } else {
         
       $('#cafDetailsTable > tbody  > tr').each(function(index, tr) { 
 if($(tr).find('input[type=checkbox]').is(":checked")){
 count=count+1;
 }
    });
    }
    
    $(parentRow).find("td").eq(1).html(count) 
}
function CourierAcknowledge(){
var corId=$("#ackCafId").html()
var corAckParams = {
    "courierId" : corId,
    "comments" :$('#ackCafComments').val()
    }
$.ajax({
		type : "POST",
		url : "courierAcknowledgement",

		data: corAckParams,
		async : true,
		success : function(data) {		
			$('#courierAckStatusMessage').html(data);
			//document.getElementById("courierAckStatusMessage").innerHTML

}
})
}

function getL2PendingTickets(){
console.log("into penfing tickets method")
						$.ajax({
						type : "GET",
						url : "getL2PendingTickets",
						async : true,
						cache : false,
						
						success : function(response) {
							console.log(response)
							var bodyContent='';
						//var response = JSON.parse(data)
						//console.log(response)
						
				if(response.length != 0)	{	
			var cafArray = [];			

response.forEach(function(e) {
	console.log("array iterate");




cafArray.push({"id": e.id,
"center":e.center,
"module": e.module,
"problemDescription" : e.problemDescription,
"userName": e.userName,
"userId":e.userId,
"loginTime" : e.loginTime,
"status" : e.status,
"crmTicketNo": e.crmTicketNo,
"lob" : e.lob,
"resolvedTime": e.resolvedTime,
"ticketNumber":e.ticketNo,
"select" : e.ticketNo


});

})



let obj = {
    // Quickly get the headings
    headings: Object.keys(cafArray[0]),

    // data array
    data: []
};

// Loop over the objects to get the values
for ( let i = 0; i < cafArray.length; i++ ) {

    obj.data[i] = [];

    for (let p in cafArray[i]) {
        if( cafArray[i].hasOwnProperty(p) ) {
            obj.data[i].push(cafArray[i][p]);
        }
    }
}

/*if(dt.hasRows){
let rows = dt.rows;
$("#datatablesSimple tbody tr").each(function() {
rows.remove(parseInt($(this).attr("data-index")));

})


}*/
			dt.destroy();
			dt.init();
		   dt.insert(cafArray);
		  // $('#datatablesSimple th:nth-child(1), tr td:nth-child(1)').hide();
		   //$('#datatablesSimple th:nth-child(2), tr td:nth-child(2)').hide();
		  
		   let columns = dt.columns;

		}
		else{
			dt.destroy();
			dt.init();
			
		}   
	},
					complete: function(){
				        $('#overlay').hide();
				        $('#content').show();
				      }
					});
								
			}
			
			function getReceiveTickets(){
console.log("into received tickets method")
						$.ajax({
						type : "GET",
						url : "getReceiveTickets",
						async : true,
						cache : false,
						
						success : function(response) {
							console.log(response)
							var bodyContent='';
						//var response = JSON.parse(data)
						//console.log(response)
						
				if(response.length !=0)
				{		
			var cafArray = [];			

response.forEach(function(e) {
	console.log("array iterate");




cafArray.push({"id": e.id,
"center":e.center,
"module": e.module,
"problemDescription" : e.problemDescription,
"userName": e.userName,
"userId":e.userId,
"loginTime" : e.loginTime,
"status" : e.status,
"crmTicketNo": e.crmTicketNo,
"lob" : e.lob,
"resolvedTime": e.resolvedTime,
"ticketNumber":e.ticketNo,
"select" : e.ticketNo


});

})



let obj = {
    // Quickly get the headings
    headings: Object.keys(cafArray[0]),

    // data array
    data: []
};

// Loop over the objects to get the values
for ( let i = 0; i < cafArray.length; i++ ) {

    obj.data[i] = [];

    for (let p in cafArray[i]) {
        if( cafArray[i].hasOwnProperty(p) ) {
            obj.data[i].push(cafArray[i][p]);
        }
    }
}

/*if(dt.hasRows){
let rows = dt.rows;
$("#datatablesSimple tbody tr").each(function() {
rows.remove(parseInt($(this).attr("data-index")));

})


}*/
			dt.destroy();
			dt.init();
		   dt.insert(cafArray);
		  // $('#datatablesSimple th:nth-child(1), tr td:nth-child(1)').hide();
		   //$('#datatablesSimple th:nth-child(2), tr td:nth-child(2)').hide();
		  
		   let columns = dt.columns;
		   }
else{
	dt.destroy();
			dt.init();
}
	},
					complete: function(){
				        $('#overlay').hide();
				        $('#content').show();
				      }
					});
								
			}	
