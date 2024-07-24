<%@page import="java.net.FileNameMap"%>
<%@page import="java.util.ArrayList"%>
<%-- <%@page import="com.org.caftracking.model.CafDetails"%> --%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--  <%@page isELIgnored="false" % --%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/CafVerify/nouislider.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/CafVerify/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style type="text/css">
@media only screen and (min-width: 1370px) and (max-width: 1605px) {
	.suscriber, .contact, .place, .remarks {
		margin-top: 50px;
	}
}

@media only screen and (min-device-width : 768px) and (max-device-width
	: 1024px) {
	.suscriber, .contact, .place, .remarks {
		margin-top: 50px;
	}
}

.cafvalidationcheck {
	margin-left: 15px !important;
}

.Button {
	text-decoration: none;
	display: inline-block;
	padding: 10px 16px;
	font-size: 15px;
}

#prev {
	background-color: cyan;
	color: blue;
}

#next {
	background-color: cyan;
	color: blue;
}

@media ( max-width : 830px) {
	.form-inline {
		flex-direction: column;
		align-items: stretch;
	}
}

.form-inline .form-control {
	margin-right: 17px;
}

.form-check .form-check-input {
	float: none !important;
}

.verify {
	display: inline !important;
}

.verifyComments {
	float: left;
}
/* success symbol */
.checkmark {
	display: inline-block;
	width: 22px;
	height: 22px;
	-ms-transform: rotate(45deg); /* IE 9 */
	-webkit-transform: rotate(45deg); /* Chrome, Safari, Opera */
	transform: rotate(45deg);
}

.checkmark_circle {
	position: absolute;
	width: 22px;
	height: 22px;
	background-color: green;
	border-radius: 11px;
	left: 0;
	top: 0;
}

.checkmark_stem {
	position: absolute;
	width: 3px;
	height: 9px;
	background-color: #fff;
	left: 11px;
	top: 6px;
}

.checkmark_kick {
	position: absolute;
	width: 3px;
	height: 3px;
	background-color: #fff;
	left: 8px;
	top: 12px;
}
/* Error symbol */
.error-circle {
	position: relative;
	width: 31px;
	height: 32px;
	border-radius: 40px;
	background-color: #990000;
	border: 5px solid #fff;
}

.error-circle>div {
	position: absolute;
	top: 101%;
	left: 68%;
	margin-left: -11px;
	margin-top: -23px;
	text-align: center;
	width: -20px;
	font-size: 17px;
	font-weight: bold;
	color: #fff;
	font-family: Arial;
}

input[type="text"] {
	font-family: "serif !important";
}

label {
	font-size: 15px;
	left: 10px;
}

.detailsrow {
margin-bottom: 4rem !important;
}
</style>

</head>
<body class="sb-nav-fixed" style="background-color: rgb(0 0 0/ 3%);">

	<jsp:include page="upperNavbar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="sideNavbar.jsp" />
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-1 py-5 mx-auto"
					style="padding-top: 0rem !important; padding-bottom: 0rem !important;">

					<%-- <c:forEach var="cafListt" items="${cafList}" varStatus="status">
<p>welcomeee : ${cafListt.CAF_NO}</p>
</c:forEach> --%>

					<div class="row d-flex justify-content-center">
						<div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center"
							style="width: 100% !important;">
							<div class="divs">
								<div class="panel panel-primary cls" id="first">

									<strong style="font-size: large;">Ticket Details</strong>
									<p class="blue-text" style="font-size: medium;">Please
										verify the Ticket</p>
										
								
										
									<%-- <c:forEach var="data" items="${ticketDetails}"> --%>




										<form:form class="form-inline"  id="mainform" action="process"
											modelAttribute="ticket"
											style="padding: 40px 40px 30px 40px!important; background: #ebeff2;">
											<div class="row" style="width: 100%;">
												<div class="col-md-6 col-sm-6 col-lg-6">
													<div class="detailsrow row">


														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:hidden path="id" value="${ticket.id}" />

															<form:hidden path="ticketNo" value="${ticket.ticketNo}" />

<form:hidden path="fileName" value="${ticket.fileName}" />
															<form:label path="center">Center</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:input type="text" class="form-control" id="center"
																path="center" value="${ticket.center}" />
														</div>
													</div>
													<div class="detailsrow row">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:label path="problemDescription">Problem Description</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:input type="text" class="form-control"
																id="probDesc" path="problemDescription"
																value="${ticket.problemDescription}" style="height:90px;" />
														</div>
													</div>
													<div class="row  detailsrow">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:label path="module">Module</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:input type="text" class="form-control" id="module"
																path="module" value="${ticket.module}" />
														</div>
													</div>
													<div class="detailsrow row">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:label path="crmTicketNo">CRM Ticket No</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:input type="text" class="form-control"
																id="crmTicketNo" path="crmTicketNo"
																value="${ticket.crmTicketNo}" />
														</div>
													</div>
													<div class="row  detailsrow">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:label path="resolvedTime">Resolved Time</form:label>
														</div>
														<div class="col-md-8 col-sm-8-col-lg-8">
															<form:input type="text" class="form-control"
																id="resolveTime" path="resolvedTime"
																value="${ticket.resolvedTime}" />
														</div>
													</div>
													<div class="detailsrow row">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:label path="status">Status</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:input type="text" class="form-control" id="status"
																path="status" value="${ticket.status}" />
														</div>
													</div>
												</div>

												<div class="col-md-6 col-sm-6 col-lg-6">




													<div class="detailsrow row">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:label path="userId">User ID</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:input type="text" class="form-control" id="userid"
																path="userId" value="${ticket.userId}" />
														</div>
													</div>
													<div class="detailsrow row">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:label path="loginTime">Login Time</form:label>
														</div>
														<div class="col-md-8 col-lg-8 col-sm-8">
															<form:input type="text" class="form-control"
																id="logintime" path="loginTime"
																value="${ticket.loginTime}" />
														</div>
													</div>
													<%--             <div class="row mb-3">
                <div class="col-md-4 col-sm-4 col-lg-4" >
                    <form:label path="lob">LOB</form:label>
                </div>
                <div class="col-md-8 col-sm-8 col-lg-8">
                    <form:input type="text" class="form-control" id="lob" path="lob" value="${ticket.lob}" />
                </div>
            </div> --%>
													<div class="detailsrow row">
														<div class="col-md-4 col-lg-4 col-sm-4">
															<form:label path="sap_bp_id">BP ID</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:input type="text" class="form-control" id="bpID"
																path="sap_bp_id" value="${ticket.sap_bp_id}" />
														</div>
													</div>

													<div class="detailsrow row">
														<div class="col-md-4 col-lg-4 col-sm-4">
															<form:label path="problemType">Problem Type</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:input type="text" class="form-control"
																path="problemType" value="${ticket.problemType}" />
														</div>
													</div>


													<div class="detailsrow row">
														<div class="row" style="margin-inline: auto;">
															<div class="col-md-4 col-sm-4 col-lg-4">
																<form:label path="statusUpdate">Status</form:label>
															</div>
															<div class="col-md-8 col-sm-8 col-lg-8">
																<form:select class="form-control form-select-lg mb-3"
																	id="status-select" path="statusUpdate"
																	aria-label="Large select example"
																	onchange="showMantis()"
																	style="width:215px; font-size: 16px;">
																	<form:option value="select" selected="true">Select</form:option>
																	<form:option value="L2-Pending">L2-Pending</form:option>
																	<form:option value="Resolved">Resolved</form:option>
																	<form:option value="Forward">Forward</form:option>

																</form:select>



															</div>
														</div>
														<div class="row" style="margin-inline: auto;">
															<div class="col-md-4 col-lg-4 col-sm-4">
																<form:label path="resolvedRemarks">Resolved Remarks</form:label>

															</div>
															<div class="col-md-8 col-sm-8 col-lg-8">
																<form:textarea type="text" class="form-control"
																	path="resolvedRemarks" value="${ticket.resolvedRemarks}"
																	style="width:245px;" />
															</div>
														</div>

														<div class="row" id="mantisDiv"
															style="margin-inline: auto; margin-top: 10px;">
															<div class="col-md-4 col-lg-4 col-sm-4">
																<form:label path="mantisTicketNo">Mantis Ticket Numebr</form:label>

															</div>
															<div class="col-md-8 col-sm-8 col-lg-8" style="display: flex;">
																<form:input type="text" class="form-control"
																	path="mantisTicketNo" value= "${ticket.mantisTicketNo}" />
																<form:errors path="*" cssClass="error"  style="color:red;font-size: 12px;"/>
															</div>
														</div>
													</div>
												</div>
												<c:if test="${ticket.fileName != 'No-Attachment'}">
													<c:set var="file" value="${ticket.fileName}" />
													<div class="row">
														<div class="col-md-5 ">
															<strong>Download File</strong>
															<div>
																<%
																	String filename = (String) pageContext.getAttribute("file");
																filename = filename.substring(filename.lastIndexOf("/") + 1);
																%>
																<a
																	href="<%=request.getContextPath()%>/download/<%=filename%>"
																	style="color: red; float: left; text-decoration: none; font-size: 14px;"><%=filename%>
																</a>
															</div>
														</div>

														<%-- <form:input type="text" class="form-control"
															path="fileName" value="${ticket.fileName}"
															style="display:none;" /> --%>

													</div>
												</c:if>
												<div class="row">
													<div class="col-md-6 d-flex justify-content-end">
																											
													</div>
													
													
													<div class="col-md-6 d-flex justify-content-end">
														<input  class="btn btn-primary" id="formsubmit"  value="View Ticket History" onclick="processForm()"/>
													<input  class="col-xs-offset-2 btn btn-primary" id="formsubmit"  value="submit" onclick="processForm()"/>
													
													</div>
														
												</div>
											</div>

										</form:form>


									<%-- </c:forEach> --%>
									<!--             <div class="panel panel-default">
    <div class="panel-heading">Caf Details</div>
    <div class="panel-body">
    <form class="form-inline" action="/action_page.php">
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
    </div>
    <div class="checkbox">
      <label><input type="checkbox" name="remember"> Remember me</label>
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
    </div>
  </div> -->

								</div>
								<c:if test="${ticket.forwardedBy != NULL}">
							<div class="panel panel-primary">
								<div class="row" style="width: 100%;">
												<div class="col-md-6 col-sm-6 col-lg-6">
												<c:if test="${ticket.forwardedBy != NULL}">
													
																	<div class="detailsrow row">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<label style="color: red;">Forwarded By</label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<input type="text" class="form-control" id="status"
																 value="${ticket.forwardedBy}" style="color:red;" />
														</div>
													</div>
													</c:if>
													<c:if test="${ticket.forwardedComments != NULL}">
																	<div class="detailsrow row">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<label style="color:red;">Comments</label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<input type="text" class="form-control" id="status"
																 value="${ticket.forwardedComments}" style="color:red;" />
														</div>
													</div>
													
													</c:if>
												</div>
												<div class="col-md-6 col-sm-6 col-lg-6">
												<c:if test="${ticket.forwardedTime != NULL}">
																	<div class="detailsrow row">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<label  style="color:red;">Forwarded Time</label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<input type="text" class="form-control" id="status"
															 value="${ticket.forwardedTime}" style="color:red;" />
														</div>
													</div>
													
													</c:if>
												
												</div>
												</div>
								
								</div>
</c:if>
							</div>
							<!--  <div class="row form-group justify-content-end">
                        <div class="form-group col-sm-6"> <button  id="prev" class="navButton btn-block btn-primary">&laquo; Previous</button><button id="next" class="navButton btn-block btn-primary">Next &raquo;</button> </div>
                    </div> -->
						</div>
					</div>
					<%--  <%} %> --%>
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
			
			<div class="modal" id="ticketForwardModal" tabindex="-1" aria-labelledby="ticketForwardModalLabel" aria-hidden="true">

  <div class="modal-dialog modal-lg" role="document">

    <div class="modal-content">

      <div class="modal-header">

        <h5 class="modal-title" id="ticketForwardModalLabel">Forward the ticket</h5>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">

          <span aria-hidden="true">&times;</span>

        </button>

      </div>

      <div class="modal-body">

        <form class="form-inline"  id="mainform" action="forwardTicket" method="post"
											
											style="padding: 40px 40px 30px 40px!important; background: #ebeff2;">

          <div class="row" style="width: 100%;">

            <div class="col-md-12 col-sm-12 col-lg-12">

              <div class="row mb-3">

                <div class="col-md-4 col-sm-4 col-lg-4">

                  <label for="center">Select user</label>

                </div>
<input type="hidden" value="${ticket.id}" name="ticketId">
                <div class="col-md-8 col-sm-8 col-lg-8">

                  <select class="form-control form-select-lg mb-3"
																	id="select-user" name="userselected"
																	aria-label="Large select example"
																	
																	style="width:215px; font-size: 16px;">
																	<option value="select" selected="true">Select</option>
																	<option value="1">test</option>
																	<option value="2">Rakhul</option>
																	<option value="3">neeha</option>
																	<option value="4">hari</option>

																</select>

                </div>

              </div>

              <div class="row mb-3">

                <div class="col-md-4 col-sm-4 col-lg-4">

                  <label for="comments">Comments</label>

                </div>

                <div class="col-md-8 col-sm-8 col-lg-8">

                  <textarea class="form-control" id="comments" name="comments"></textarea>

                </div>

              </div>



            </div>

          </div>
<input type="submit" class="btn btn-primary" value="Forward" style="margin-left: 50%;margin-right: 50%;"/>

        </form>

      </div>

      <div class="modal-footer">

        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

        
      </div>

    </div>

  </div>

</div>


			
			
<%-- 			<div class="modal modal-lg" id="ticketForwardModal" tabindex="-1"
				role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Caf Verification</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close" style="float: right;">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
										<form:form class="form-inline"  id="mainform" action="process"
											modelAttribute="ticket"
											style="padding: 40px 40px 30px 40px!important; background: #ebeff2;">
											<div class="row" style="width: 100%;">
												<div class="col-md-12 col-sm-12 col-lg-12">
													<div class="row mb-3">


														<div class="col-md-4 col-sm-4 col-lg-4">



															<form:label path="center">Center</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:input type="text" class="form-control" id="center"
																path="center" value="${ticket.center}" />
														</div>
													</div>
													
																				<div class="row mb-3">


														<div class="col-md-4 col-sm-4 col-lg-4">



															<form:label path="center">Comments</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:textarea type="text" class="form-control" id="center"
																path="center" value="${ticket.center}" />
														</div>
													</div>
													
													</div>
													</form:form>
													

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success"
								onclick="CourierAcknowledge()">OK</button>
							<button type="button" class="btn btn-secondary"
								id="cafVerifyCloseBtn" onclick="closeCafVerifyModal()">Close</button>
						</div>
					</div>

				</div>
			</div> --%>
		</div>
	</div>
	</div>
 <!-- jQuery -->

  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

  <!-- Bootstrap JS -->

  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 	<script
		src="resources/js/CafDetaila/jquery-validation/dist/jquery.validate.min.js"></script>
	<script
		src="resources/js/CafDetaila/jquery-validation/dist/additional-methods.min.js"></script>
	<script src="resources/js/CafDetaila/jquery-steps/jquery.steps.min.js"></script>
	<script src="resources/js/home/bootstrap/scripts.js"></script>
	<script src="resources/js/CafDetaila/nouislider/nouislider.min.js"></script>
	<script src="resources/js/CafDetaila/wnumb/wNumb.js"></script> -->
	<!--   <script src="resources/js/CafDetaila/main.js"></script> -->

	<!-- <script src="resources/js/CafVerify/CafDetails.js"></script> -->
	<script>
	$(document).ready(function() { 
		var selectedValue = $('#status').val();
		if(selectedValue === 'L1-Pending' || selectedValue === 'Resolved'){
			var selectedStatusValue = $("#status-select").val();
			if (selectedStatusValue === 'L2-Pending') {
				$('#mantisDiv').show();	
			}
			else{
			$('#mantisDiv').hide();	
			}
		}
		else if(selectedValue === 'L2-Pending'){
			$('#mantisDiv').show();	
		}
		
	})
	
		function showMantis() {
			var selectedValue = $("#status-select").val();
			if (selectedValue === 'L2-Pending') {
				$('#mantisDiv').show();
			} else if (selectedValue === 'Resolved') {
				$('#mantisDiv').hide();
			}
		}
	
	
	function processForm(){
		var selectedValue = $("#status-select").val();
		if (selectedValue === 'Forward') {
			//$('#ticketForwardModal').modal('toggle');
			$('#ticketForwardModal').modal('show');
		} else  {
			$('#mainform').submit();
		}	
	}
	
	$('#ticketForwardModal').on('shown.bs.modal', function() { 
	    
	    //Getting cafverification status
	    /*  $.ajax({
							type : "GET",
							url : "getUsers?id=3",
							async : true,
							cache : false,
							
							success : function(data) {
							if (data != '') {
							$('#verificationStatus').html('');
							 var finaldropdown = $('#select-user').append('<option value="select" disabled selected> Select User </option>');
							
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
 */	    
 console.log("modal open")
	});
	
	
	</script>

</body>
</html>