<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">



    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
       <!--  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">  
    <!--     <link rel="stylesheet" href="resources/css/home/bootstrap/styles.css"> -->
       <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="resources/js/home/paging/paging.css">
       <!--  <link href="css/styles.css" rel="stylesheet" /> -->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
       <!--  <style type="text/css">
        .ticker{display: flex;flex-wrap: wrap;width: 80%;height: 50px;margin: 0 auto}
.news{width: 76%;background: #cc4444;padding: 0 2%}.title{width: 20%;text-align: center;background: #c81c1c;position: relative}
.title:after{position: absolute;content: "";right: -22%;border-left: 20px solid #c81c1c;border-top: 28px solid transparent;border-right: 20px solid transparent;border-bottom: 21px solid transparent;top: 0px}
.title h5{font-size: 18px;margin: 8% 0}
.news marquee{font-size: 18px;margin-top: 12px}
.news-content p{margin-right: 41px;display: inline}
        </style> -->
        
    </head>
    <body class="sb-nav-fixed">
       <jsp:include page="upperNavbar.jsp" />
        <div id="layoutSidenav">
 <jsp:include page="sideNavbar.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
    
<!--                         <div class="row" id="selectionArea" style="display: none;">
                            <div class="col-xl-4">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Region
                                    </div>
                                    <div class="card-body">
                                              <div class="form-group"> <label>Select Region</label> <select class="form-control select2 select2-hidden-accessible" id="rdropdown" multiple="" data-placeholder="Select a State" style="width: 100%;" tabindex="-1" aria-hidden="true">
                
            </select> </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Center
                                    </div>
                                    <div class="card-body"> <div class="form-group"> <label>Select Center</label> <select class="form-control select2 select2-hidden-accessible" id="cdropdown" multiple="" data-placeholder="Select a State" style="width: 100%;" tabindex="-1" aria-hidden="true">
                
            </select> </div></div>
                                </div>
                            </div>
                             <div class="col-xl-4">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Courier Status
                                    </div>
                                    <div class="card-body">
                                              <div class="form-group"> <label>Select Status</label> <select class="form-control select2 select2-hidden-accessible" id="crStatusdropdown" multiple="" data-placeholder="Select a State" style="width: 100%;" tabindex="-1" aria-hidden="true">
                
            </select> </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <div class="row" id="selectionAreaSecond" style="display: none;">
                                      <div class="col-xl-4">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        From Date
                                    </div>
                                    <div class="card-body">
                                              <div class="form-group"> <label>From Date</label> <div class='input-group date' id='FromDate'>
               <input type='text' class="form-control" />
               <span class="input-group-addon">
               <span class="glyphicon glyphicon-calendar"></span>
               </span>
            </div> </div>
                                    </div>
                                </div>
                            </div>
         
                                      <div class="col-xl-4">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        To Date
                                    </div>
                                    <div class="card-body">
                                              <div class="form-group"> <label>To Date</label> <div class='input-group date' id='ToDate'>
               <input type='text' class="form-control" />
               <span class="input-group-addon">
               <span class="glyphicon glyphicon-calendar"></span>
               </span>
            </div> </div>
                                    </div>
                                </div>
                            </div>
                           
                             <div class="col-xl-4">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        To Date
                                    </div>
                                    <div class="card-body">
                                              <div class="form-group"> <label>Select Status</label> <select class="form-control select2 select2-hidden-accessible" id="crStatusdropdown" multiple="" data-placeholder="Select a State" style="width: 100%;" tabindex="-1" aria-hidden="true">
                
            </select> </div>
                                    </div>
                                </div>
                            </div>
                             <div class="col-xl-4">
                                <button type="button" class="btn btn-primary btn-lg" onclick="getPendingCouriers()">Submit</button>
                            </div>
                        </div> -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Courier Details
                            </div>
                            <div class="card-body">
                            
                            <table class="table table-striped" id="cafDetailsDisplayTable">
            <caption><h3>Result (People):</h3></caption>

                <thead class="tr tr-success">
                    <th>Subcode</th>
                    <th>Caf Number</th>
                    <th>Region</th>
                    <th>Center</th>
                    <th>Activation Date</th>
                     <th></th>
                      <th></th>
                    
                </thead>   
      
            
                <c:forEach items="${lists}" var="temp">
                    <tr>
                        <td>${temp.subCode}</td>
                        <td>${temp.CAF_NO}</td>
                        <td>${temp.region}</td>
                        <td>${temp.landmark}</td>
                        <td>${temp.activatedOn}</td>
                         <td>${temp.subCode}</td>
                          <td>${temp.subCode}</td>
                       <!--  <td> -->
                            <%-- <a class="btn btn-info" href="/update-person?id=${temp.CAF_NO}">Update</a>
                            <a class="btn btn-danger" onclick="return confirm('Are you sure you want to delete?')" href="/delete-person?id=${temp.CAF_NO}">Delete</a>
 --%>                       <!--  </td> -->
                    </tr>
                </c:forEach>
          
        </table>
        
                               
                            </div>
                        </div>
                        
                        
                        <div class="modal" id="cafAckModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
         <div class="col-xl-12 col-md-12">
         <div class="row">
         <p class="text-center text-success"><strong>Caf Acknowledged Successfully</strong></p>
         <p id="cafVerifyNo" style="display: none;"></p>
         <div style="display: flex; justify-content: space-between;">
         <p>Do you want to proceed the verification</p><a id="cafVerifyLink" class="btn btn-link" style="font-size: inherit;">Yes</a><a  class="btn btn-link" onclick="closeCafAcknowledgeModal()" style="font-size: inherit;">No</a>
         </div>
         </div>
         </div>
        
      </div>
      <div class="modal-footer">
     
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeCafAcknowledgeModal()">Close</button>
      </div>
    </div>
  </div>
</div>
                        
                        
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
       <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<!--         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
                 <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="resources/js/home/bootstrap/datatables-simple-demo.js"></script>
        <script src="resources/js/home/bootstrap/scripts.js"></script>
         <script src="resources/js/home/paging/paging.js"></script>

         <script src="resources/js/CafDetails/CafDetails.js"></script>
    </body>
</html>