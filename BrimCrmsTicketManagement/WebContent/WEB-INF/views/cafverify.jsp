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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


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
<link
	href="http://code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css"
	rel="stylesheet" />

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

#msgArea {
	font-size: 2rem;
}

.ui-datepicker.ui-datepicker-inline {
	width: 100% !important;
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
								<div class="cls" id="first">

									<strong style="font-size: large;">Complaint Details</strong>
									<p class="blue-text" style="font-size: medium;">Please
										verify the Complaint</p>
									<c:forEach var="data" items="${complaintDetails}">




										<form:form class="form-inline" action="closeTicket"
											modelAttribute="complaint" id="closeForm"
											style="padding: 40px 40px 30px 40px!important; background: #ebeff2;">
											<div class="row" style="width: 100%;">
												<div class="col-md-6 col-sm-6 col-lg-6">
													<div class="row mb-3">


														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:hidden path="id" value="${data.id}" />

															<form:hidden path="ticketNo" value="${data.ticketNo}" />

															<form:hidden path="image" />

															<form:label path="username">Username</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:input type="text" class="form-control" id="center"
																path="username" value="${data.username}" />
														</div>
													</div>
													<div class="row mb-3">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:label path="role">Role</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:input type="text" class="form-control" id="role"
																path="role" value="${data.role}" style="height:90px;" />
														</div>
													</div>
													<div class="row mb-3">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:label path="lob">Line Of Business</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:input type="text" class="form-control" id="lob"
																path="lob" value="${data.lob}" />
														</div>
													</div>
													<div class="row mb-3">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:label path="bp">BP Code</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:input type="text" class="form-control" id="bp"
																path="bp" value="${data.bp}" />
														</div>
													</div>
													<div class="row mb-3">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:label path="loginTIme">Login Time</form:label>
														</div>
														<div class="col-md-8 col-sm-8-col-lg-8">
															<form:input type="text" class="form-control"
																id="loginTIme" path="loginTIme"
																value="${data.loginTIme}" />
														</div>
													</div>
													<div class="row mb-3">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:label path="probTypeName">Problem Type</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:input type="text" class="form-control"
																id="probTypeName" path="probTypeName"
																value="${data.probTypeName}" />
														</div>
													</div>
													<div class="row mb-3">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:label path="subTypeName">Problem Subtype</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:input type="text" class="form-control"
																id="subTypeName" path="subTypeName"
																value="${data.subTypeName}" />
														</div>
													</div>

												</div>

												<div class="col-md-6 col-sm-6 col-lg-6">

													<div class="row mb-3">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:label path="mac">Mac Id</form:label>
														</div>
														<div class="col-md-8 col-lg-8 col-sm-8">
															<form:input type="text" class="form-control" id="mac"
																path="mac" value="${data.mac}" />
														</div>
													</div>
													<div class="row mb-3">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:label path="description">Description</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:textarea type="text" class="form-control"
																id="description" path="description" style="width:100%;" />
														</div>
													</div>
													<div class="row mb-3">
														<div class="col-md-4 col-sm-4 col-lg-4">
															<form:label path="updatedOn">Updated On</form:label>
														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:input type="text" class="form-control"
																path="updatedOn" value="${updatedOn}" />
														</div>
													</div>
													<div class="row mb-3">
														<div class="col-md-4 col-lg-4 col-sm-4">
															<form:label for="status" path="status">Select Status</form:label>



														</div>
														<div class="col-md-8 col-sm-8 col-lg-8">
															<form:select class="form-select" path="status"
																id="statusSelect" style="font-size: 1.5rem !important;">
																<form:option value="" label="Select" selected="true" />
																<form:option value="Pending" label="Pending" />
																<form:option value="Closed" label="Resolved" />
																<form:option value="Escalated" label="Escalated" />

															</form:select>
														</div>

														<div class="row mb-3">
															<div class="col-md-4 col-lg-4 col-sm-4">
																<form:label path="closedBy">Closed By</form:label>
															</div>
															<div class="col-md-8 col-sm-8 col-lg-8">
																<form:input type="text" class="form-control"
																	path="closedBy" value="${data.closedBy}"
																	readonly="true" />
															</div>
														</div>
														<div class="row mb-3">
															<div class="col-md-4 col-lg-4 col-sm-4">
																<form:label path="closedOn">Closed On</form:label>
															</div>
															<div class="col-md-8 col-sm-8 col-lg-8">

																<form:input path="closedOn" cssClass="datepicker-1" />
															</div>
														</div>
														<div class="row mb-3" id="closedRemarksDiv">
															<div class="col-md-4 col-lg-4 col-sm-4">
																<form:label path="closedRemarks">Closed Remarks</form:label>
															</div>
															<div class="col-md-8 col-sm-8 col-lg-8">
																<form:textarea type="text" class="form-control"
																	path="closedRemarks" style="width:100%;" />
															</div>
														</div>
														<div class="row mb-3">
															<div class="col-md-4 col-lg-4 col-sm-4">
																<form:label path="ticketNo">Ticket No</form:label>
															</div>
															<div class="col-md-8 col-sm-8 col-lg-8">
																<form:input type="text" class="form-control"
																	path="ticketNo" value="BR${data.id}" />
															</div>
														</div>
														<c:if test="${not empty data.image}">
															<div class="row mb-3">
															<div class="col-md-4 col-lg-4 col-sm-4">
																<form:label path="image">Image</form:label>
															</div>
															<div class="col-md-8 col-sm-8 col-lg-8">
																<img id="profileImg" alt="MISSING GIF" src="viewFile?id=${data.id}"  style="width: -webkit-fill-available;"/>
															</div>
														</div>
														</c:if>

															<c:if test="${activity =='pending' || activity =='escalated'}">
														<div class="row">
															<div class="col-md-12 d-flex justify-content-end">
																<button type="submit" class="btn btn-success">Close
																	Ticket</button>
															</div>
														</div>

													</c:if>


												</div>
										</form:form>
										<c:set var="closeRemarks" value="${data.closedRemarks}" />
										<c:set var="description" value="${data.description}" />
										<c:set var="status" value="${data.status}" />
										<c:set var="logintime" value="${data.loginTIme}" />
										<c:set var="closedon" value="${data.closedOn}" />
										<c:set var="image" value="${data.image}" />

									</c:forEach>


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
				role="dialog"
				style="left: 50%; top: 50%; transform: translate(-50%, -50%);">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Message</h5>
							<button type="button" class="close" data-bs-dismiss="modal"
								aria-label="Close" style="float: right;">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<strong id="msgArea"></strong>

						</div>
						<div class="modal-footer"></div>
					</div>

				</div>
			</div>
		</div>
	</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.min.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
	<script src="resources/js/CafDetaila/jquery-steps/jquery.steps.min.js"></script>
	<script src="resources/js/home/bootstrap/scripts.js"></script>
	<script src="resources/js/CafDetaila/nouislider/nouislider.min.js"></script>
	<script src="resources/js/CafDetaila/wnumb/wNumb.js"></script>
	<!--   <script src="resources/js/CafDetaila/main.js"></script> -->

	<!--  <script src="resources/js/CafVerify/CafDetails.js"></script> -->

	<script type="text/javascript">
		$(document).ready(function() {
			//document.getElementById("profileImg").src = "data:image/png;base64," + "${image}";
			
			$('#statusSelect').val("${status}")

			$('#closedRemarks').val("${closeRemarks}")
			$('#description').text("${fn:trim(description)}")
			
			if ("${activity}" === 'pending' || "${activity}" === 'escalated') {
				
				$(".datepicker-1").datepicker({
					dateFormat : 'yy-mm-dd',
					beforeShow : function(input, inst) {
						setTimeout(function() {
							inst.dpDiv.outerWidth($(input).outerWidth());
						}, 0);
					},
					minDate : new Date("${logintime}")
				});
				
			} else if ("${activity}" === 'closed') {
				
				$(".datepicker-1").val("${closedon}")

			}
			<c:if test="${not empty closeStatus}">

			$('#msgArea').html("${closeStatus}")

			$('#cafVerifyModal').modal('show');
			</c:if>

			if ($('#statusSelect').val() === 'Pending') {

				$('#closedRemarksDiv').hide();
			}
			else if ($('#statusSelect').val() === 'Escalated') {

				$('#closedRemarksDiv').hide();
			}
			else if ($('statusSelect').val() === 'Pending' === 'Closed') {

				$('#closedRemarksDiv').show();
			} else if ($('statusSelect').val() === 'Pending' === 'Escalated') {
				$('#closedRemarksDiv').show();
			}
		})
		$('#statusSelect').change(function() {
			if ($(this).val() === 'Closed') {
				$('#closedRemarksDiv').show()
			} else if ($(this).val() !== 'Closed') {
				$('#closedRemarksDiv').hide()
			}
		})

		$('.close').click(
				function() {
					window.location.href = "${pageContext.request.contextPath}"
							+ "/homePage";
					;

				})
				
				
			$.validator.setDefaults({
			  errorClass: 'invalid',
			  validClass: "valid",
			  errorPlacement: function(error, element) {
				  
			    $(element)
			      .closest("form")
			      .find("label[for='" + element.attr("id") + "']")
			      .attr('data-error', error.text());
			  },
			  submitHandler: function(form) {
			    form.submit();
			  }
			});
		
		$("#closeForm").validate({
			
		
			
			rules: {
	         
				closedOn: {
	            	required: true
	            	
	         	},
	      	},
	      	messages: {
			
	      		closedOn: {
			   		required : 'This field is required'
			   		
			   	}
			},
			

	       });
	
				
	</script>
</body>
</html>