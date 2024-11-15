


 let dt='';
 let dtCafDetails='';
  $(document).ready(function(){
 

    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    

    const datatablesSimple = document.getElementById('cafDetailsDisplayTable');

    if (datatablesSimple) {
const dataTable = new simpleDatatables.DataTable(datatablesSimple, {
	searchable: false,
	fixedHeight: true,
	perPage: 25,
	columns: [

     {
      select: 6,
      render: (data, td, dataIndex, cellIndex) => "<button data-row='" + dataIndex + "' class='btn btn-link' onclick='cafAcknowledge(\""+td+"\")'>Ackknowledge</button>"
    }  
    ]

})


//const convertedData = convertCSV({columnDelimiter: ';', data: ''})


        
         dt.on('datatable.init', function(args) {
	// Do something when datatable.XXXX fires

});
    }
   
   

  
   
  });
  function cafAcknowledge(td){
	  let parentRow=$('#cafDetailsDisplayTable td').closest('tr');
$("#cafVerifyNo").text($(parentRow).find("td").eq(1).html()); 
var scrt_var = "getCafDetails?cafNo="+$(parentRow).find("td").eq(1).html()
   document.getElementById("cafVerifyLink").setAttribute("href",scrt_var);
	  $('#cafAckModal').modal('toggle');
$('#cafAckModal').modal('show');
  }
  function closeCafAcknowledgeModal(){
	  console.log("modal is closing")
if($('#cafAckModal').is(':visible')){
$('#cafAckModal').modal('hide');
}
}
  
  