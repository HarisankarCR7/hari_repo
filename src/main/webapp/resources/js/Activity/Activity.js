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

function getTicketsForwarded(userId){
console.log("getting forwarded tickets" + userId)
						$.ajax({
						type : "GET",
						url : "getTicketsForwarded?user="+userId,
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
