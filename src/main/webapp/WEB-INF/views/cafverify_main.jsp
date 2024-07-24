<%@page import="java.util.ArrayList"%>
<%-- <%@page import="com.org.caftracking.model.CafDetails"%> --%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--  <%@page isELIgnored="false" % --%>
>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



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

.status {
	display: flex;
	justify-content: flex-start;
	margin-left: 17px;
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
					<%
						System.out.println("printing on jsp" + session.getAttribute("CourierName") + "," + session.getAttribute("cafStatus"));
					%>

					<div class="row d-flex justify-content-center">
						<div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center"
							style="width: 100% !important;">
							<div class="divs">
								<div class="cls" id="first">


									<c:if test="${ticketDetails != null}">
										<h6>list is not empty</h6>
									</c:if>
									<strong>Connection Details</strong>
									<p class="blue-text">Please verify the Ticket</p>
									<c:forEach var="data" items="${ticketDetails}">
										<c:out value="${data.center}">
										</c:out>


										<form:form class="form-inline" action="process" method="post"
											modelAttribute="ticket"
											style=" padding: 40px 40px 30px !important;
            background: #ebeff2;">

											<form:hidden path="id" value="${data.id}" />
<form:label path="ticketNo">Center</form:label>
											<form:input path="ticketNo" value="${data.ticketNo}" />

											<div class="form-group">

												<form:label path="center">Center</form:label>
												<form:input type="text" class="form-control" id="center"
													path="center" value="${data.center}" />

												<form:label path="module">module</form:label>
												<form:input type="text" class="form-control" id="module"
													path="module" value="${data.module}" />

												<form:label path="problemDescription">problemDescription</form:label>
												<form:input type="text" class="form-control" id="probDesc"
													path="problemDescription"
													value="${data.problemDescription}" />
											</div>
											<br>
											<br>
											<div class="form-group">
												<form:label path="userName">userName</form:label>
												<form:input type="text" class="form-control" id="username"
													path="userName" value="${data.userName}" />
												<form:label path="userId">userId</form:label>
												<form:input type="text" class="form-control" id="userid"
													path="userId" value="${data.userId}" />
												<form:label path="loginTime">Login Time</form:label>
												<form:input type="text" class="form-control" id="logintime"
													path="loginTime" value="${data.loginTime}" />

											</div>
											<br>
											<br>
											<div class="form-group">
												<form:label path="crmTicketNo">crmTicketNo</form:label>
												<form:input type="text" class="form-control"
													id="crmTicketNo" path="crmTicketNo"
													value="${data.crmTicketNo}" />
												<form:label path="lob">Lob</form:label>
												<form:input type="text" class="form-control"
													path="resolvedTime" value="${data.crmTicketNo}" />
												<form:label path="resolvedTime">resolvedTime</form:label>
												<form:input type="resolveTime" class="form-control"
													id="resolveTime" path="resolvedTime"
													value="${data.resolvedTime}" />

											</div>
											<br>
											<br>
											<div class="form-group">
												<form:label path="sap_bp_id">Bp Id</form:label>
												<form:input type="text" class="form-control" id="bpID"
													path="sap_bp_id" value="${data.sap_bp_id}" />
												<form:label path="status">Status</form:label>
												<form:input type="text" class="form-control" id="status"
													path="status" value="${data.sap_bp_id}" />

												<a
													href="<%=request.getContextPath()%>/download/pdf/Apricomm.png"><h4
														style="color: red;">View Screenshot</h4></a>
											</div>
											<div class="status">
												<form:label path="statusUpdate">Update Ticket Status</form:label>
												<form:select class="form-select form-select-lg mb-3"
													path="statusUpdate" aria-label="Large select example"
													style="width:200px;height:35px;margin-left:5px;">
													<form:option value="Pending">Pending</form:option>
													<form:option value="Resolved">Resolved</form:option>
													<form:option value="L1-Pending">Forward</form:option>

												</form:select>

											</div>



											<div class="Button">
												<button type="submit" class="btn btn-primary">Submit</button>
											</div>
										</form:form>
									</c:forEach>
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
								<div class="cls" id="second">
									<div class="card" style="height: 100% !important;]">
										<h5 class="text-center mb-4">Proof Verification</h5>

										<form class="form-card" onsubmit="event.preventDefault()">


											<div class="row">
												<label for="pIdentity"
													class="col-sm-4 col-md-4 control-label">Proof of
													Address</label>
												<div class="col-sm-7 col-md-7">
													<div class="input-group">
														<div id="radioBtn" class="btn-group">
															<a
																class="cafvalidationcheck btn btn-primary btn-sm active"
																data-toggle="pIdentity" data-title="Y">YES</a> <a
																class="cafvalidationcheck btn btn-primary btn-sm notActive"
																data-toggle="pIdentity" data-title="N">NO</a>
														</div>
														<input type="hidden" name="pIdentity" id="pIdentity">
													</div>
												</div>
											</div>
											<br />
											<br />
											<br />
											<div class="row">
												<label for="pAddress"
													class="col-sm-4 col-md-4 control-label">Proof of
													Identity</label>
												<div class="col-sm-7 col-md-7">
													<div class="input-group">
														<div id="radioBtn" class="btn-group">
															<a
																class="cafvalidationcheck btn btn-primary btn-sm active"
																data-toggle="pAddress" data-title="Y">YES</a> <a
																class="cafvalidationcheck btn btn-primary btn-sm notActive"
																data-toggle="pAddress" data-title="N">NO</a>
														</div>
														<input type="hidden" name="pAddress" id="pAddress">
													</div>
												</div>
											</div>
											<br />
											<br />
											<br />
											<div class="row">
												<label for="cafVerificationStatus"
													class="col-sm-4 col-md-4 control-label">Is the Caf
													verified successfully or not</label>
												<div class="col-sm-7 col-md-7">
													<div class="input-group">
														<div id="cafVerifyradioBtn" class="btn-group">
															<a
																class="cafvalidationcheck btn btn-primary btn-sm active"
																data-toggle="cafVerificationStatus" data-title="yes">YES</a>

															<a
																class="cafvalidationcheck btn btn-primary btn-sm notActive"
																data-toggle="cafVerificationStatus" data-title="no">NO</a>
														</div>
														<input type="hidden" name="cafVerificationStatus"
															id="cafVerificationStatus">
													</div>
												</div>
											</div>
											<br />
											<br />
											<br />
											<div class="row form-group" id="cafVerifyFailRemarksArea">
												<label for="pAddress"
													class="col-sm-4 col-md-4 control-label"
													style="float: left;">Remarks</label>
												<div class="col-sm-7 col-md-7">
													<select class="form-select form-select-sm"
														aria-label=".form-select-sm example"
														id="verificationStatus" style="width: auto">
													</select>
												</div>
											</div>
											<br />
											<br /></br>
											<div class="row form-group justify-content-end">
												<div class="form-group col-sm-6">
													<button id="verify" class="btn-block btn btn-success">Verify</button>
												</div>
											</div>

										</form>





									</div>
								</div>
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
			<div class="modal modal-lg" id="cafVerifyModal" tabindex="-1"
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


							<p class="modal-comments row" id="verifyCafFilled">&#8226;
								CAF is filled in all respect :</p>
							<br>
							<p class="modal-comments row mt-2" id="verifyCustomerPhoto">&#8226;
								Customer photo status :</p>
							<br>
							<p class="modal-comments row mt-2" id="verifyProofId">&#8226;
								Proof of identity :</p>
							<p class="modal-comments row mt-2" id="verifyProofAddress">&#8226;
								Proof of Address :</p>
							<p class="modal-comments row mt-2" id="verifySignature">&#8226;
								Customer signature status</p>
							<!--          <div class="row">
         <div class="col-xl-8 col-md-8 col-sm-8">
         <p>&#8226; Customer photo status :</p>
         </div>
         <div class="col-xl-2 col-md-2 col-sm-2">
          <div class='error-circle'>
    <div>X</div>
</div>
  </div>

                  
         
         </div> -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success"
								onclick="CourierAcknowledge()">OK</button>
							<button type="button" class="btn btn-secondary"
								id="cafVerifyCloseBtn" onclick="closeCafVerifyModal()">Close</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="resources/js/CafDetaila/jquery-validation/dist/jquery.validate.min.js"></script>
	<script
		src="resources/js/CafDetaila/jquery-validation/dist/additional-methods.min.js"></script>
	<script src="resources/js/CafDetaila/jquery-steps/jquery.steps.min.js"></script>
	<script src="resources/js/home/bootstrap/scripts.js"></script>
	<script src="resources/js/CafDetaila/nouislider/nouislider.min.js"></script>
	<script src="resources/js/CafDetaila/wnumb/wNumb.js"></script>
	<!--   <script src="resources/js/CafDetaila/main.js"></script> -->

	<script src="resources/js/CafVerify/CafDetails.js"></script>


</body>
</html>