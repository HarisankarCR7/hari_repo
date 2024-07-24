<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
 
  
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard - SB Admin</title>
<!--  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css"> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<!--     <link rel="stylesheet" href="resources/css/home/bootstrap/styles.css"> -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="resources/js/home/paging/paging.css">
<!--  <link href="css/styles.css" rel="stylesheet" /> -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
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
					<div class="row">
						<!--                             <div class="col-xl-12 col-md-12">
                                     <div class="ticker"> 
         <div class="title">
             <h5>Breaking News</h5>
             </div> 
             <div class="news"> <marquee class="news-content"> <p>You have new cafs pending,Click <a href="#" onclick="viewcafCourier()">Here </a> to view the pending</p> 
             </marquee> 
             </div> 
             </div> 
                            </div> -->
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body">L1 Pending Tickets</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#"
										onclick="getPendingTickets()">View Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						
							<div class="col-xl-3 col-md-6">
							<div class="card bg-warning text-white mb-4">
								<div class="card-body">L2 Pending Tickets</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#" onclick="getL2PendingTickets()">View
										Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-success text-white mb-4">
								<div class="card-body">Closed Tickets</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#" onclick="getClosedTickets()">View
										Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						
						
						<c:if test="${not empty forwardList}">
	<div class="col-xl-3 col-md-6">
							<div class="card bg-danger text-white mb-4">
								<div class="card-body">Tickets Forwarded to you</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#" onclick="getReceiveTickets()">View
										Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
</c:if>
							
						
<!-- 						<div class="col-xl-3 col-md-6">
							<div class="card bg-danger text-white mb-4">
								<div class="card-body">Verified with Error Cafs</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#">View
										Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div> -->
					</div>
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
							<i class="fas fa-table me-1"></i> Courier Details
						</div>
						<div class="card-body">
							<table id="datatablesSimple" class="datatablesSimplecls">

							</table>
						</div>
					</div>
					<!-- <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Caf Details
                            </div>
                            <div class="card-body">
                                <table id="cafDetailsTable" class="cafDetailsTable">

                                </table>
                            </div>
                        </div> -->

					<div class="modal" id="acknowledgemodal" tabindex="-1"
						role="dialog">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Caf Acknowledgement</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close" style="float: right;">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="col-xl-12 col-md-12">
										<div class="row">
											<div class="col-xl-6 col-md-6 col-sm-6">
												<p>
													&#8226; Courier No:&nbsp;<span id="ackCorNo"
														style="font-weight: bold;"></span>
												</p>
											</div>
											<div class="col-xl-6 col-md-6 col-sm-6">
												<p>
													&#8226; Courier Name:&nbsp;<span id="ackCorName"
														style="font-weight: bold;"></span>
												</p>
											</div>
											<p>
												&#8226; Caff Dispatched:&nbsp;<span id="ackCafdis"
													style="font-weight: bold;"></span>
											</p>
											<p>
												&#8226; Caff Recieved:&nbsp;<span id="ackCafRec"
													style="font-weight: bold;"></span>
											</p>
											<p style="display: none;">
												&#8226; Caff Recieved:&nbsp;<span id="ackCafId"
													style="display: none;"></span>
											</p>
											<div class="form-group">
												<label for="exampleFormControlTextarea1">Comments</label>
												<textarea class="form-control" id="ackCafComments" rows="3"></textarea>
											</div>
										</div>
									</div>

								</div>
								<div class="modal-footer">
									<div id="courierAckStatusMessage" style="float: left;"></div>
									<button type="button" class="btn btn-success"
										onclick="CourierAcknowledge()">Acknowledge</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal" onclick=closeAcknowledgeModal()>Close</button>
								</div>
							</div>
						</div>
					</div>


				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2023</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
	<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<!--         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/js/home/bootstrap/datatables-simple-demo.js"></script>
	<script src="resources/js/home/bootstrap/scripts.js"></script>
	<script src="resources/js/home/paging/paging.js"></script>

	<!--        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script> -->

	<script src="resources/js/home/home.js"></script>
	
	<%  
     if (session.getAttribute("dashboard").toString().equals("yes")) { 
     System.out.println(session.getAttribute("dashboard"));
     %>
      
       <script type="text/javascript">
       getPendingTickets();
       </script> 
    <%} %> 
</body>
</html>