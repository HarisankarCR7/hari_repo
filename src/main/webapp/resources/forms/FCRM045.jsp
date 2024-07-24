
<%@ page import="java.sql.*" session="true"%><%@ page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	session.setAttribute("MODE", "NEW");
String userName = (String) session.getAttribute("userName");
System.out.println("pwdUser:" + userName);
if (userName != null && userName.length() > 0) {
	System.out.println("pwdUser11111:");
} else {
	response.sendRedirect("logout");
	return;
}
String frmcode = "FCRM045";

session.setAttribute("formcode", frmcode);
%>

<html>
<head>
<title>Softcode</title>
<link rel="shortcut icon" href="resources/images/image001.jpg">

<link href="resources/mat/buttons/buttons.dataTables.min.css"
	rel="stylesheet" type="text/css">






<!-- Datatable -->
<link href="resources/mat/dataTables/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="resources/code/jquery-ui.css">
<!-- Compiled and minified CSS -->
<link rel="stylesheet" href="resources/mat/css/materialize.min.css">





<!-- #Datatable -->

<!-- --------------------------------Modal-------------------------- -->
<script src="resources/mat/majax/jquery.min.js"></script>
<script src="resources/mat/majax/bootstrap.min.js"></script>
<!-- -------------------------Js References-------------------------------------- -->
<script src="resources/ajax/softcodeHdrJs.js"></script>
<script src="localResources/js/customProcedureJs.js"></script>

<!-- --------------------------------------------------------------------- -->



<!-- Autocomplete -->
<!-- <script src="resources/code/jquery.min.js"></script>   -->


<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->

<!--  <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">  -->

<link rel="stylesheet" href="resources/css/jquery-ui.css">




<!-- #Autocomplete -->



<!-- Bootstrap Core CSS -->
<link
	href="resources/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="resources/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">
<!-- DataTables CSS -->
<link
	href="resources/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="resources/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="resources/JSCalandar/DateTimePicker.css" />
<!-- jQuery -->
<script src="resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Material CSS -->
<link href="resources/css/mcss.css" rel="stylesheet" type="text/css">


<link href="resources/mat/font/material-design-icons/Mat-Icons.css"
	rel="stylesheet" type="text/css">



<!-- Import materialize.css -->
<link type="text/css" rel="stylesheet"
	href="resources/mat/css/materialize.min.css" media="screen,projection" />
<!-- Let browser know website is optimized for mobile -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>


<link href="resources/mat/css/dataTableCustom.css" rel="stylesheet">


</head>

<body class="white" onload="onLoadBody();"
	onpageshow="if (event.persisted) noBack();" onunload="">
	<%-- <!-- -----------------------Included Files---------------------------------- -->
	<jsp:include page="../preloader.jsp" />
	<jsp:include page="../mModalNew.jsp" />
	<jsp:include page="../mModal.jsp" />
	<jsp:include page="../mNavigation.jsp" /> --%>

	<style>

/* Button used to open the contact form - fixed at the bottom of the page */
/* .open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 280px;
} */

/* The popup form - hidden by default */
.form-popup {
	display: none;
	position: absolute;
	border: 3px solid #f1f1f1;
	z-index: 9;
}

/* Add styles to the form container */
.form-container {
	max-width: 300px;
	padding: 10px;
	background-color: white;
}

/* Full-width input fields */
/* .form-container input[type=text], .form-container input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
} */

/* table.splittert td {
  background-color: lime;
  margin: 12px 12px 12px 12px;
  padding: 12px 12px 12px 12px;
} */
/* .splitter  tbody, thead tr {
	display: block;
}

table.splitter tbody {
	height: 270px;
	overflow-y: auto;
	overflow-x: hidden;
} */
.splitterDiv {
	overflow: auto;
	height: 300px;
}

.legDiv {
	overflow: auto;
	height: 170px;
}

.splitterDiv thead th, .legDiv thead th {
	position: sticky;
	top: 0;
	z-index: 1;
}

table.splitter tbody td {
	padding-right: 27px;
}

table.splitter th {
	padding-right: 27px;
}

table.splitter  tbody input#splitterarea {
	font-family: 'Roboto', sans-serif;
	color: #333;
	font-size: 1.2rem;
	margin: 0 auto;
	padding: 1.5rem 2rem;
	border-radius: 0.2rem;
	background-color: rgb(171, 191, 192);
	border: none;
	width: 48%;
	height: 1rem;
	display: block;
	text-align: center;
}

table.splitter  tbody input[type="text"] {
	font-size: 18px !important;
}

table.leg td {
	overflow: visible !important;
}

table.leg tbody input#legArea {
	text-align: center;
}

#subcontainer>div {
	display: inline-flex;
}

table#dtl-datatableEdit   thead tr {
	display: contents;
}

.ui-dialog>.ui-widget-header {
	background: #00acc1;
}
</style>

	<!-- -----------------------Container---------------------------------- -->
	<div class="container" id="content">
		<!-- -----------------------Form---------------------------------- -->
		<form method="POST" action="ServletController" id="form1" role="form">
			<!-- -----------------------Panel---------------------------------- -->
			<div id="mar" style="margin-top: 160px">
				<div class="panel panel-blue f4f8f9 z-depth-1">
					<!-- -----------------------Panel Heading---------------------------------- -->

					<div class="panel-heading bg-grey">
						<h6 style="font-weight: 900"
							class="green-text text-light-green accent-3">
							<i class="fa fa-search fa-fw"></i>FibreNodeMaster
						</h6>
					</div>



					<div class="panel-body bg-grey" id="border-bot">
						<div class=" col s12 m12 l12 f4f8f9 z-depth-1 white">
							<div class="row">
								<div class="col s12 m12 l3 ">
									<div class="valign-wrapper " style="height: 100px">
										<h6 style="font-weight: 900" class="center-align indigo-text">
											<marquee> For Support , Please Contact Erp:
												0471-3071237.</marquee>
										</h6>
									</div>
								</div>
								<div class="col s12 m12 l5">
									<div class="col s11 m6  l6 input-field">
										<select id="SearchSelFld" name="SearchSelFld">
											<option value="id">Id</option>
											<option value="fibreNode">FibreNode</option>
											<option value="teamLeaderName">Team Leader Name</option>
										</select>
									</div>
									<div class="col s11 m6  l6 input-field ">
										<input type="text" data-toggle="tooltip" data-placement="top"
											title="Search" class="form-control bg-grey"
											id="SearchTypeFld" name="SearchTypeFld"
											onfocus="searchClick(this)" onkeyup="searchClick(this)"
											placeholder="Search">
									</div>
								</div>
								<div class="col s12 m12 l4 pull-right">
									<div class="col s12 m6 l5 pull-right">
										<div class="input-field">
											<input type="hidden" class="form-control col-lg-2" value=""
												id="HdrMandatoryFlds" name="HdrMandatoryFlds"> <input
												type="hidden" class="form-control col-lg-2" value=""
												id="HdrLockFlds" name="HdrLockFlds"> <input
												type="hidden" class="form-control col-lg-2" value=""
												id="HdrHideFlds" name="HdrHideFlds"> <input
												type="hidden" class="form-control col-lg-2" value=""
												id="Autocomplete" name="Autocomplete"> <input
												type="hidden" class="form-control" id="HdrFieldNames"
												name="HdrFieldNames" readonly> <input type="hidden"
												id="formCode" name="formCode" value="FCRM045"> <a
												style="width: 100%;" class="btn  light-blue darken-4"
												id="SAVE" onclick="SaveFibrenode()">SAVE</a>
										</div>
									</div>
									<div class="col s12 m6 l5 pull-right">
										<div class="input-field">
											<a href="FCRM045" style="width: 100%;"
												class="btn  cyan darken-1" type="submit" id="clear">CLEAR</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col s12 m12 l12 white  z-depth-1">
							<div id="subcontainer">

								<div class="col s12 m12 l12  z-depth-1 ">
									<ul class="nav nav-tabs" role="tablist">
										<li role="presentation" class="active"><a href="#home"
											aria-controls="home" role="tab" data-toggle="tab"
											id="homeBtn" onclick="openHome();"><span class="bold">FibreNodeMaster</span></a></li>
									</ul>
								</div>

								<div class="col s12 m12 l12  z-depth-1 ">
									<ul class="nav nav-tabs" role="tablist">
										<li role="presentation" class="active"><a href="#edit"
											aria-controls="home" role="tab" id="editBtn"
											onclick="openEdit();"><span class="bold">Edit</span></a></li>
									</ul>
								</div>
							</div>


							<div class="tab-content white">
								<div role="tabpanel" class="tab-pane active" id="home">
									<div class="row">
										<div class="section">
											<div class="input-field col s12 m4 l3" id='idDiv'>
												<input id='id' name='id' type="text"
													onfocus="HelpGridAuto(this)"
													onkeypress="HelpGridAuto(this)"><span
													class="searchIc glyphicon glyphicon-search form-control-feedback"></span>
												<label class="active light-blue-text text-darken-4" for='id'>ID</label>
											</div>
											<div class="input-field col s12 m4 l3" id='userNameDiv'>
												<input id='userName' name='userName' type="text"> <label
													class="active light-blue-text text-darken-4" for='userName'>UserName</label>
											</div>
											<div class="input-field col s12 m4 l3" id='logDateDiv'>
												<input id='logDate' name='logDate' type="text"> <label
													class="active light-blue-text text-darken-4" for='logDate'>Date</label>
											</div>
											<div class="input-field col s12 m4 l3" id='modifiedByDiv'>
												<input id='modifiedBy' name='modifiedBy' type="text">
												<label class="active light-blue-text text-darken-4"
													for='modifiedBy'>ModifiedBy</label>
											</div>
											<div class="input-field col s12 m4 l3" id='modifiedDateDiv'>
												<input id='modifiedDate' name='modifiedDate' type="text">
												<label class="active light-blue-text text-darken-4"
													for='modifiedDate'>modified Date</label>
											</div>
											<div class="input-field col s12 m4 l3" id='accPeriodDiv'>
												<input id='accPeriod' name='accPeriod' type="text">
												<label class="active light-blue-text text-darken-4"
													for='accPeriod'>ACCPERIOD</label>
											</div>
											<div class="input-field col s12 m4 l3" id='companyCodeDiv'>
												<input id='companyCode' name='companyCode' type="text">
												<label class="active light-blue-text text-darken-4"
													for='companyCode'>CompanyCode</label>
											</div>
											<div class="input-field col s12 m4 l3" id='userEmpIdDiv'>
												<input id='userEmpId' name='userEmpId' type="text">
												<label class="active light-blue-text text-darken-4"
													for='userEmpId'>User Emp Id</label>
											</div>
											<div class="input-field col s12 m4 l3" id='regionDiv'>
												<label class="active light-blue-text text-darken-4"
													for='region'>Region</label> <select id='region'
													name='region' data-beloworigin="true">
													<option value="" selected>Select</option>
												</Select>
											</div>
											<div class="input-field col s12 m4 l3"
												id='serviceAmoMasterDiv'>
												<input id='serviceAmoMaster' name='serviceAmoMaster'
													type="text" onfocus="HelpGridAuto(this)"
													onkeypress="HelpGridAuto(this)"><span
													class="searchIc glyphicon glyphicon-search form-control-feedback"></span>
												<label class="active light-blue-text text-darken-4"
													for='serviceAmoMaster'>Area</label>
											</div>
											<div class="input-field col s12 m4 l3" id='centerInchNameDiv'>
												<input id='centerInchName' name='centerInchName' type="text"
													onChange="fibreNodeChange()" onfocus="HelpGridAuto(this)"
													onkeypress="HelpGridAuto(this)"><span
													class="searchIc glyphicon glyphicon-search form-control-feedback"></span>
												<label class="active light-blue-text text-darken-4"
													for='centerInchName'>Center Name</label>
											</div>
											<div class="input-field col s12 m4 l3"
												id='centerInchMobNoDiv'>
												<input id='centerInchMobNo' name='centerInchMobNo'
													onChange="fibreNodeChange()" type="text"> <label
													class="active light-blue-text text-darken-4"
													for='centerInchMobNo'>ACSO Mob No</label>
											</div>
											<div class="input-field col s12 m4 l3" id='nodeTypeDiv'>
												<label class="active light-blue-text text-darken-4"
													for='nodeType'>Node Type</label> <select id='nodeType'
													name='nodeType' data-beloworigin="true">
													<option value="" selected>Select</option>
												</Select>
											</div>
											<div class="input-field col s12 m4 l3" id='nodeLocDiv'>
												<input id='nodeLoc' name='nodeLoc' type="text"
													onkeyup="fibreNodeChange()" maxlength="25"> <label
													class="active light-blue-text text-darken-4" for='nodeLoc'>Node
													Location</label>
											</div>

											<div class="input-field col s12 m4 l3" id='fibreNodeDiv'>
												<input id='fibreNode' name='fibreNode' type="text"
													maxlength="40"> <label
													class="active light-blue-text text-darken-4"
													for='fibreNode'>FibreNode</label>
											</div>

											<div class="input-field col s12 m4 l3" id='teamLeaderNameDiv'>
												<input id='teamLeaderName' name='teamLeaderName' type="text"
													onfocus="HelpGridAuto(this)"
													onkeypress="HelpGridAuto(this)"><span
													class="searchIc glyphicon glyphicon-search form-control-feedback"></span>
												<label class="active light-blue-text text-darken-4"
													for='teamLeaderName'>TeamLeader Name</label>
											</div>

											<div class="input-field col s12 m4 l3"
												id='teamLeaderMobNoDiv'>
												<input id='teamLeaderMobNo' name='teamLeaderMobNo'
													onkeyup="isNumber(teamLeaderMobNo,15)" type="text">
												<label class="active light-blue-text text-darken-4"
													for='teamLeaderMobNo'>TeamLeader Mob No</label>
											</div>
											<div class="input-field col s12 m4 l3"
												id='teamLeaderECodeDiv'>
												<input id='teamLeaderECode' name='teamLeaderECode'
													type="text"> <label
													class="active light-blue-text text-darken-4"
													for='teamLeaderECode'>TeamLeader ECode</label>
											</div>


											<div class="input-field col s12 m4 l3" id='urbanAreaDiv'>
												<input id='urbanArea' name='urbanArea' type="text"
													onfocus="HelpGridAuto(this)"
													onkeypress="HelpGridAuto(this)"><span
													class="searchIc glyphicon glyphicon-search form-control-feedback"></span>
												<label class="active light-blue-text text-darken-4"
													for='urbanArea'>TRAI_Area</label>
											</div>

											<div class="input-field col s12 m4 l3" id='districtDiv'>
												<input id='district' name='district' type="text"> <label
													class="active light-blue-text text-darken-4" for='district'>District</label>
											</div>

											<div class="input-field col s12 m4 l3" id='reverseStatusDiv'>
												<label class="active light-blue-text text-darken-4"
													for='reverseStatus'>Path Status</label> <select
													id='reverseStatus' name='reverseStatus'
													data-beloworigin="true">
													<option value="" selected>Select</option>
												</Select>
											</div>

											<!-- <div class="input-field col s12 m4 l3" id='statusDiv'> 
<label class="active light-blue-text text-darken-4" for='status'>Status</label> 
<select id='status' name='status' data-beloworigin="true"> 
<option value="" selected>Select</option> 
</Select> 
</div> 
 -->
											<div class="input-field col s12 m4 l3" id='statusDiv'>
												<input id='status' name='status' type="text"
													onfocus="HelpGridAuto(this)"
													onkeypress="HelpGridAuto(this)"><span
													class="searchIc glyphicon glyphicon-search form-control-feedback"></span>
												<label class="active light-blue-text text-darken-4"
													for='status'>Status</label>
											</div>



											<div class="input-field col s12 m4 l3" id='codeDiv'>
												<input id='code' name='code' type="text"> <label
													class="active light-blue-text text-darken-4" for='code'>Code</label>
											</div>
											<div class="input-field col s12 m4 l3" id='codeNoDiv'>
												<input id='codeNo' name='codeNo'
													onkeyup="isNumber(codeNo,15)" type="text"> <label
													class="active light-blue-text text-darken-4" for='codeNo'>CodeNo</label>
											</div>

											<div class="input-field col s12 m4 l3" id='autoCodeDiv'>
												<input id='autoCode' name='autoCode' type="text"> <label
													class="active light-blue-text text-darken-4" for='autoCode'>AutoCode</label>
											</div>




											<div class="input-field col s12 m4 l3" id='legdiv'
												style="display: none;">
												<input id='leg' name='leg' type="text"> <label
													class="active light-blue-text text-darken-4" for='leg'>AutoCode</label>
											</div>

											<div class="input-field col s12 m4 l3" id='noOfPortDiv'>
												<label class="active light-blue-text text-darken-4"
													for='noOfPort'>No Of Port</label> <select id='noOfPort'
													name='noOfPort' data-beloworigin="true">
													<option value="" selected>Select</option>
												</Select>
											</div>





											<div class="input-field col s12 m4 l3" id='phaseDiv'>
												<input id='phase' name='phase' type="text"> <label
													class="active light-blue-text text-darken-4" for='phase'>Phase</label>
											</div>

											<div class="input-field col s12 m4 l3" id='deviceTypeDiv'>
												<input id='deviceType' name='deviceType' type="text">
												<label class="active light-blue-text text-darken-4"
													for='deviceType'>Terminal Device Type</label>
											</div>
											<div class="input-field col s12 m4 l3" id='deviceIpDiv'>
												<input id='deviceIp' name='deviceIp' type="text"> <label
													class="active light-blue-text text-darken-4" for='deviceIp'>Terminal
													Device Ip</label>
											</div>
											<div class="input-field col s12 m6 l6" id='noteDiv'>
												<textarea id="note" name='note' class="materialize-textarea"></textarea>
												<label for="note">Note</label>
											</div>
											<div class="input-field col s12 m4 l3" id='deviceIpDiv'
												style="display: flex;">

												<input id='splitter' name='splitter' type="hidden"
													style="flex: 1;" /> <a href="#" class="button"
													onclick="openForm()"
													style="height: 28px; display: inline-block; padding: 2px 15px; background-color: #00acc1 !important;; color: white; border: 0; line-height: inherit; text-decoration: none; cursor: pointer;">Add
													Splitter</a>
												<!-- <label for="note">No.Of.Splitter</label> -->

												<div class="form-popup" id="myForm"
													style='display: none; z-index: 10'>
													<span id='displayError'></span>
													<div class="splitterDiv">
														<table class="splitter"
															style='background: azure; border-collapse: separate; border-spacing: 10px; *border-collapse: expression('
															separate', cellSpacing='10px');'>
															<thead>
																<tr>
																	<th>Port</th>&nbsp;
																	<th>Splitter</th>
																	<th>Leg</th>
																</tr>

															</thead>
															<tbody>
																<!--     <tr>
    <td><input type="checkbox" id="myCheckbox" class="filled-in" />
<label for="myCheckbox"></label></td>
      <td>January</td><td> <input type="text" id="Name" name="Name"/></td>
    </tr>
    <tr>
     <td><input type="checkbox" id="myCheckbox" class="filled-in" />
<label for="myCheckbox"></label></td>
      <td>January</td><td> <input type="text" id="Name" name="Name"/></td>
    </tr> -->
															</tbody>
														</table>
													</div>



												</div>

												<!-- leg adding area -->
												<div class="form-popup" id="legForm"
													style='display: none; z-index: 10'>
													<span id='displayError'></span>
													<div class="legDiv">
														<table class="leg"
															style='background: azure; border-collapse: separate; border-spacing: 10px; *border-collapse: expression('
															separate', cellSpacing='10px');'>
															<thead>
																<tr>
																	<th>Splitter</th>&nbsp;
																	<th>Leg</th>

																</tr>

															</thead>
															<tbody class="container">
																<!--     <tr>
    <td><input type="checkbox" id="myCheckbox" class="filled-in" />
<label for="myCheckbox"></label></td>
      <td>January</td><td> <input type="text" id="Name" name="Name"/></td>
    </tr>
    <tr>
     <td><input type="checkbox" id="myCheckbox" class="filled-in" />
<label for="myCheckbox"></label></td>
      <td>January</td><td> <input type="text" id="Name" name="Name"/></td>
    </tr> -->
															</tbody>
														</table>
													</div>



												</div>


											</div>

											<!------------------------ Hdr Ending --------------------->
										</div>
									</div>
								</div>


								<div id="editpanel">
									<!-- <div class="col s12 m12 l5">
<div class="col s11 m6  l6 input-field">
<select id="SearchSelFld" name="SearchSelFld">
<option value="id">Id</option>
<option value="fibreNode">FibreNode</option>
<option value="teamLeaderName">Team Leader Name</option>
</select></div>
<div class="col s11 m6  l6 input-field ">
<input  type="text" data-toggle="tooltip" data-placement="top" title="Search" class="form-control bg-grey" id = "SearchTypeFld" name = "SearchTypeFld" onfocus="searchClick(this)" onkeyup="searchClick(this)"  placeholder="Search">
</div>
</div>  -->
									<div class="row">

										<div class="input-field col s12 m4 l3" id='regionDivEdit'>
											<select id='regionEdit' name='regionEdit'
												data-beloworigin="true">
												<option value="" selected>Select</option>
											</select> <label for="region">Region</label>
										</div>
										<!-- <input type="hidden" value='[{"title":"ticketSearchLink"},{"title":"subReference"},{"title":"ticketNo"},{"title":"customerName"},{"title":"loginTime"},
 							{"title":"daysElapsed"},{"title":"noOfCalls"},{"title":"resolvedTime"},{"title":"tat"},{"title":"complaintType"},{"title":"ticketType"},{"title":"problemType"},
 							{"title":"problemDescription"},{"title":"problemRaisedBy"},{"title":"ticketStatus"},{"title":"outageID"},{"title":"resPersonName"},{"title":"resolutionType"},
 							{"title":"resolutionDescription"},{"title":"resolvedBy"},{"title":"mobileNo"},{"title":"mac"},{"title":"address"},{"title":"fibreNode"},{"title":"area"},
 							{"title":"serviceAmo"},{"title":"sourceOfComplaint"},{"title":"problemSubType"},{"title":"incomingNo"},{"title":"incomingEmail"},{"title":"SELECT"},{"title":"EDIT"}]' name="dtlCols" id="dtlCols">  -->


										<input type="hidden"
											value='[{"title":"Id"},{"title":"Fibrenode"},{"title":"Status"},{"title":""}]'
											name="editDtCol" id="editDtCol">
										<div class="input-field col s12 m4 l3"
											id='centerInchNameDivEdit'>
											<input id='centerInchNameEdit' name='centerInchNameEdit'
												type="text" onfocus="HelpGridAutoEdit(this)"
												onkeypress="HelpGridAutoEdit(this)"><span
												class="searchIc glyphicon glyphicon-search form-control-feedback"></span>
											<label class="active light-blue-text text-darken-4"
												for='centerInchName'>Center Name</label>
										</div>

										<div class="input-field col s12 m4 l3"
											id='centerInchNameDivEdit'>
											<a style="width: 100%;" class="btn  light-blue darken-4"
												id="SAVE" onclick="getFibrenodeList()">Get Fibrenode</a>
										</div>






									</div>
									<div id="dialogBox" style="display: none;">



										<ul id="sublist">

										</ul>

									</div>
									<!-- 												<div class="form-popup" id="editForm"
													style='display: none;  z-index: 10'>
													 <span id='displayError' ></span>
													<table class="editSplitter"
														style='background: azure; border-collapse: separate; border-spacing: 10px; *border-collapse: expression('
														separate', cellSpacing='10px');'>
														<thead>
															<tr>
															<th>Fibrenode</th>
																<th>Port</th>&nbsp;
																<th>Splitter</th>
																<th>Leg</th>
															</tr>

														</thead>
														<tbody>

														</tbody>
													</table>


													

												</div> -->
									<div style="height: 300px; overflow-y: scroll;"
										class="dataTable_wrapper">
										<table id="dtl-datatableEdit" class="display"
											style="word-wrap: break-word; width: 100% !important;"></table>
									</div>




								</div>


							</div>





						</div>
					</div>
				</div>
			</div>
		</form>





	</div>



	</div>


	<!-- Autocomplete -->
	<script src="resources/code/jquery-1.10.2.js"></script>
	<script src="resources/css/jquery-ui.js"></script>


	<!--# Autocomplete -->

	<script src="resources/code/jquery-1.12.4.js"></script>
	<script src="resources/mat/dataTables/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="resources/mat/js/materialize.min.js"></script>
	<script src="resources/code/jquery-ui.js"></script>
	<script>
		$(document).ready(function() {

			var arr = new Array();
			;
			window.localStorage.setItem('Node', JSON.stringify(arr));
			document.getElementById("myForm").style.display = "none";
			$("#editpanel").hide();

			$('.modal-trigger').leanModal();
			$(document).on("keypress", "input", function(e) {
				var code = e.keyCode;
				if (code == 13) {
					$("#SEARCH").click();
					e.preventDefault();
					return true;
				}
			});
			$('.datepicker').pickadate({
				selectMonths : true, // Creates a dropdown to control month
				selectYears : 15
			// Creates a dropdown of 15 years to control year
			});
			$('select').material_select();

			$("#noOfPort").change(function() {

				var port = $('#noOfPort').find(":selected").text();

			});

			$("#myForm").dialog({
				autoOpen : false,
				modal : true,
				show : "blind",
				hide : "blind"
			});
			//$("#splitter").prop('disabled', true);
			$("#dialogBox").dialog({
				autoOpen : false,
				modal : true,
				show : "blind",
				hide : "blind"
			});
			/* $("#editForm").dialog({
			    autoOpen : false, modal : true, show : "blind", hide : "blind"
			  }); */
			$("#legForm").dialog({
				autoOpen : false,
				modal : true,
				show : "blind",
				hide : "blind"
			});

		});

		function openEdit() {
			$("#region").attr('name', 'test');
			$("#regionEdit").attr('name', 'region');
			$("#centerInchName").attr('name', 'centerInchNametest');
			$("#centerInchName").attr('id', 'centerInchNametest');
			$("#centerInchNameEdit").attr('name', 'centerInchName');
			$("#centerInchNameEdit").attr('id', 'centerInchName');

			$("#home").hide();
			//var options = $('select#region option').sort().clone();
			$('select').material_select();

			var options = $("#region").html();
			/* $("#regionDivEdit").append("<select id='region' name='region' data-beloworigin='true'>" + options + "</select");
			//$("#regionDivEdit").dropdown();
			 $('#region').formSelect() */
			$('#regionEdit').empty();
			$('#regionEdit').append(options);
			$("#regionEdit").material_select()
			// $('#editBtn').prop('disabled', true);
			// $('').attr('disabled','disabled');
			$("#editBtn").removeAttr("onclick");

			$("#editpanel").show();

		}
		function openHome() {
			$("#region").attr('name', 'region');
			$("#regionEdit").attr('name', 'regionEdit');
			$("#centerInchName").attr('id', 'centerInchNameEdit');
			$("#centerInchNameEditt").attr('name', 'centerInchNameEdit');
			$("#centerInchNametest").attr('id', 'centerInchName');
			$("#centerInchName").attr('name', 'centerInchName');
			$("#editpanel").hide();
			$("#editBtn").attr("onclick", "openEdit()");
			$("#home").show();
		}
		function searchClick(obj) {
			//$("#splitter").prop('disabled', false);
			AutoSearechDt(obj)

		}

		function getDetails() {

		}
		function openForm() {

			// document.getElementById("myForm").style.display = "block";
			var $alertDiv = $('#myForm .splitter #alertDiv');
			if ($alertDiv.length > 0) {
				$('#myForm .splitter #alertDiv').remove();
			}

			var port = $('#noOfPort').find(":selected").text();
			
			var error = document.getElementById("displayError")
			error.textContent = "";
			if (port == 0) {
				/* var error = document.getElementById("displayError")
				error.textContent = "Please choose atleast 1 Splitter";
				error.style.color = "red";
				error.style.position = "absolute"; */

				document.getElementById("typeMsg").innerHTML = "ALERT";
				document.getElementById("dataMsg").innerHTML = "Please choose port";
				//$('#progressBar').closeModal();
				$('#message').openModal({
					dismissible : false
				});
			} else {
				document.getElementById('myForm').style.display = 'block' ? 'block'
						: 'none';
				if ($(".splitter > thead > tr").find("th:eq(0)").text() === 'Fibrenode') {
					
					$(".splitter > thead > tr").find("th:eq(0)").remove();
					//$(this).remove()
				}
				$(".splitter > tbody").html("");
				var bodyContent = '';
				for (var i = 1; i <= port; i++) {
					//bodyContent=bodyContent+ "<tr><td><input type=\"checkbox\" id=\"pcheck" + i + "\" name=\"splittercheck\" class=\"filled-in\" ><label for=\"pcheck" + i + "\"></label></td><td> P" + i + "</td><td><input type=\"text\"  id=\"splitterarea\" name=\"chkAllPrimaryAttrs\"></td></tr>";

					bodyContent = bodyContent
							+ "<tr><td> P"
							+ i
							/* 		+ "</td><td><input type=\"text\"  id=\"splitterarea\" name=\"chkAllPrimaryAttrs\"></td><td><input type=\"text\"  id=\"splitterleg\" name=\"splitterleg\"></td></tr>"; */
							+ "</td><td><input type=\"text\"  id=\"splitterarea\" name=\"chkAllPrimaryAttrs\"></td><td><a class=\"btn-floating disabled\" style=\"background-color: #34ccd2 !important;\" onclick=\"addLeg($(this).closest('tr').find('#splitterarea').val(),$(this).closest('tr').find('td:first-child').text())\"><i class=\"material-icons\">add</i> </a>   </td><td style=\"display:none;\"><input type=\"text\"  id=\"splitterleg\" name=\"splitterleg\" value=\"\"></td></tr>";
				}
				$(".splitter tbody").append(bodyContent);

				$("#myForm").dialog({
					autoOpen : false,
					modal : true,
					buttons : {
						Save : function() {
							saveSplitter();

						},
						Cancel : function() {
							closeForm();
							$(this).dialog('close');
						}
					},
					width : "46%",
					height : "auto",
				//maxWidth: "768px"
				});

				$("#myForm").dialog("open")
			}

		}
		function closeForm() {
			$(".splitter > tbody").html("");
			document.getElementById('myForm').style.display = 'none';
		}

		function HelpGridAutoEdit(obj) {
			//alert("inside function")

			var fldName = obj.name;

			var $form = $("form#form1");

			$("#" + fldName + "").autocomplete({
				source : function(request, response) {
					$.ajax({
						type : "GET",
						url : "helpGridAuto?FldName=" + fldName,
						data : $form.serialize(),
						success : function(data) {
							data = data.trim();
							if (data) {
								var projects = JSON.parse(data);
								response(projects);

							} else {

								var projects = [ {
									"value" : "",
									"Id" : [],
									"Show" : []
								} ]
								response(projects);

							}
						}
					});
				},
				minLength : 0,
				select : function(event, ui) {

					$("#" + fldName + "").val(ui.item.value);
					RuntimeHide(fldName);
					RuntimeLock(fldName);
					for (j = 0; j < ui.item.Id.length; j++) {

						$("#" + ui.item.Id[j].FN).val(ui.item.Id[j].Fv);
						clientCustomProcedure(ui.item.Id[j].FN);
						RuntimeHide(ui.item.Id[j].FN);
						RuntimeLock(ui.item.Id[j].FN);
						Materialize.updateTextFields();
						Chk_FetchCommandButtonDataJson(ui.item.Id[j].FN)
					}

					return true;
				},

				change : function(event, ui) {
					if (ui.item == null || ui.item == undefined) {
						$(this).val("");

					}
					Materialize.updateTextFields();
				}
			}).bind('focus', function() {
				$(this).autocomplete("search");
			}).autocomplete("instance")._renderItem = function(ul, item) {
				var show1 = "";
				for (i = 1; i < item.Show.length; i++) {

					var show = "-(" + item.Show[i].Fv + ")  "
					show1 = show1 + show;
				}
				if (item.Id.length == 0) {
					return $("<li>")
							.append(
									"<div><span style=\"color:black; \">No Results Found...</sapn> </div>")
							.appendTo(ul);
				} else {
					return $("<li>")
							.append(
									"<div><span style=\"color:black; \">"
											+ item.value
											+ "</sapn>   <span style=\"color:#1ABC9C    ; \">"
											+ show1 + "</span></div>")
							.appendTo(ul);
				}
			};

		}

		function saveSplitter() {

			//alert("saving...")

			var values = new Array();
			$(".splitter tbody tr").each(
					function() {
						var obj = {};
						var obj2={
								S1:'2',
								S2:'3'
								
						}
						// Within tr we find the last td child element and get content
						//alert($(this).find("td:first-child").text());
						//alert($(this).find("td:last-child").find("input[name='chkAllPrimaryAttrs']").val());
						
						var subs=$(this).find("td:eq(3)").find(
						"input[name='splitterleg']").val();
						
						obj = {
							port : $(this).find("td:first-child").text(),
							splitter : $(this).find("td:eq(1)").find(
									"input[name='chkAllPrimaryAttrs']").val(),
									
							leg : subs
						}// main object
						values.push(obj);

					});
			

			window.localStorage.setItem('Node', JSON.stringify(values));
			/* var error = document.getElementById("displayError")
			error.textContent = "Splitter added sucessfully";
			error.style.color = "green";
			error.style.position = "absolute"; */
			if ($("#myForm").dialog("isOpen")) {

				$("#myForm").dialog("close")

			}
			document.getElementById("typeMsg").innerHTML = "ALERT";
			document.getElementById("dataMsg").innerHTML = "Splitter added successfully";
			//$('#progressBar').closeModal();
			$('#message').openModal({
				dismissible : false
			});
		}
		function SaveFibrenode() {
			var portwithsplitter = window.localStorage.getItem('Node');
		alert(portwithsplitter);
			var mode = $('#SAVE').data("value");
			$('#progressBar').openModal({
				dismissible : false
			});
			var validation = checkValidation();
			//alert("inside save method");

			// --------Modified By Murali Dated 30-09-2016 Runtime
			// Mandatory-------------
			var $form = $("form#form1");
			$
					.ajax({
						type : "GET",
						url : "RuntimeMandatory",
						data : $form.serialize(),
						success : function(jsonText) {

							// alert("myArr:"+jsonText);
							var myArr = JSON.parse(jsonText);
							for (var i = 0; i < myArr.length; i++) {
								// alert(myArr[i].MandatoryFld);
								var fldVal = document
										.getElementById(myArr[i].MandatoryFld).value;
								var node = document
										.getElementById(myArr[i].MandatoryFld);
								var mandFld = node.labels[0].innerHTML;
								if (fldVal.length == 0
										&& myArr[i].Status == "YES") {
									document.getElementById("typeMsg").innerHTML = "ALERT";
									document.getElementById("dataMsg").innerHTML = "Mandatory Validation: <span style='color:teal' >("
											+ mandFld + ")</span>";
									$('#progressBar').closeModal();
									$('#message').openModal({
										dismissible : false
									});
									return false;
								}

							}

							// -----------trying to Save
							if (validation == true) {
								var HdrFldNames = document
										.getElementById("HdrFieldNames").value;
								var formCode = document
										.getElementById("formCode").value;

								HdrFldNamesArr = HdrFldNames.split("$");
								HdrJson = '';

								for (i = 0; i < HdrFldNamesArr.length; i++) {
									try {
										HdrJson = HdrJson
												+ '"'
												+ HdrFldNamesArr[i]
												+ '" : "'
												+ document
														.getElementById(HdrFldNamesArr[i]).value
														.replace(
																/\n|'|"|\r|\s|\\/g,
																" ") + '",';
									} catch (err) {
										alert("Invalid/mismatch Name: "
												+ HdrFldNamesArr[i] + ": "
												+ err);
										break;
									}
								}

								HdrJson = HdrJson.substring(0,
										HdrJson.length - 1);

								var table = $('#dtl-datatable').DataTable();

								var dtlRows = table.rows('.selected').data();
								var dtlRowLen = table.rows('.selected').data().length;
								// alert(dtlRows);

								dtlMandatoryFld = document
										.getElementById("dtlMandatory");
								if (dtlMandatoryFld != null) {

									dtlMandatory = document
											.getElementById("dtlMandatory").value;

									if (dtlMandatory != null
											&& dtlMandatory.length > 0
											&& dtlRowLen == 0) {

										document.getElementById("typeMsg").innerHTML = "ALERT";
										document.getElementById("dataMsg").innerHTML = "Pelase Select / Add One Row";

										$('#progressBar').closeModal();
										$('#message').openModal({
											dismissible : false
										});

										return false;
									}

								}

								// ..........................Detail 2
								// save....................................
								var table2 = $('#dtl-datatableEdit2')
										.DataTable();

								var dtlRows2 = table2.rows('.selected').data();
								var dtlRowLen2 = table2.rows('.selected')
										.data().length;
								dtlMandatoryFld2 = document
										.getElementById("dtlMandatory2");
								if (dtlMandatoryFld2 != null) {
									dtlMandatory2 = document
											.getElementById("dtlMandatory2").value;
									if (dtlMandatory2 != null
											&& dtlMandatory2.length > 0
											&& dtlRowLen2 == 0) {

										document.getElementById("typeMsg").innerHTML = "ALERT";
										document.getElementById("dataMsg").innerHTML = "Pelase Select / Add One Row";

										$('#progressBar').closeModal();
										$('#message').openModal({
											dismissible : false
										});

										return false;
									}

								}
								// ...........................................................................
								var customDataJsonObject = "";
								var customVar = "";
								var customTable = $('#customDataTable')
										.DataTable();
								var customRows = customTable.rows('.selected')
										.data();
								var customRowLen = customTable
										.rows('.selected').data().length;
								if (customRowLen > 0) {
									for (i = 0; i < customRowLen; i++) {
										customVar = customVar
												+ JSON.stringify(customRows[i])
												+ ",";
									}
									customVar = customVar.substring(0,
											customVar.length - 1);
									customDataJsonObject = '[ ' + customVar
											+ ' ]';

								} else {
									customDataJsonObject = null;

								}

								if (dtlRowLen > 0) {

									var dtlVar = "";
									for (i = 0; i < dtlRowLen; i++) {

										dtlVar = dtlVar
												+ JSON.stringify(dtlRows[i])
												+ ",";

									}
									dtlVar = dtlVar.substring(0,
											dtlVar.length - 1);
									// ..................Detail2.....................................................
									if (dtlRowLen2 > 0) {
										var dtlVar2 = "";
										for (i = 0; i < dtlRowLen2; i++) {

											dtlVar2 = dtlVar2
													+ JSON
															.stringify(dtlRows2[i])
													+ ",";

										}
										dtlVar2 = dtlVar2.substring(0,
												dtlVar2.length - 1);
										HdrJson = '[{"Hdr":[{' + HdrJson
												+ ',"formCode":"' + formCode
												+ '","MODE":"' + mode
												+ '"}]},{"Dtl":[ ' + dtlVar
												+ ' ]},{"Dtl1":[ ' + dtlVar2
												+ ' ]}]';
									} else {
										HdrJson = '[{"Hdr":[{' + HdrJson
												+ ',"formCode":"' + formCode

												+ '","portwithsplitter":"'
												+ portwithsplitter
												+ '"}]},{"Dtl":[ ' + dtlVar
												+ ' ]}]';
									}
									// ..............................................................................

									// alert(dtlVar);
								} else {
									var portsplitter = JSON
											.stringify(portwithsplitter);
									HdrJson = '[{"Hdr":[{' + HdrJson
											+ ',"formCode":"' + formCode
											+ '","portwithsplitter":'

											+ portwithsplitter + ',"MODE":"'
											+ mode + '"}]}]';
								}

								// var HdrJsonArr = JSON.parse(HdrJson);

								if (HdrJson.length > 0) {
									$
											.ajax({
												type : 'post', // it's easier to read
												// GET request
												// parameters
												url : 'BaseSave',
												dataType : 'JSON',
												data : {
													loadProds : 1,
													jsonArray : HdrJson,
													customDataJson : customDataJsonObject

												// look here!

												},
												success : function(data) {
													if (data.Id != undefined) {
														var id = data.Id;
														document
																.getElementById("id").value = id;
													} else {
														var id = document
																.getElementById("id").value;
													}

													document
															.getElementById("typeMsg").innerHTML = data.Type;
													document
															.getElementById("dataMsg").innerHTML = data.SaveMsg;
													document
															.getElementById("autoClose").innerHTML = data.AutoClose;
													if (data.reportCode != "NIL"
															&& data.reportCode != undefined) {
														$('#pdfClick').show();
														document
																.getElementById("pdfClick").value = '["'
																+ data.reportCode
																+ '","'
																+ data.DirectReportField
																+ '"]';
													}
													$('#message').openModal({
														dismissible : false
													});

												},
												error : function(data) {
													document
															.getElementById("typeMsg").innerHTML = "ALERT";
													document
															.getElementById("dataMsg").innerHTML = "Load JSON FAIL";

													$('#message').openModal({
														dismissible : false
													});

													$('#message').openModal({
														dismissible : false
													});

													$('#message').openModal({
														dismissible : false
													});

													$('#progressBar')
															.closeModal();

												}
											});

								}

							} else {

								return false;
							}

						}
					}); // End .ajax function

			// --------Modified By Murali Dated 30-09-2016-------------

		}

		function getFibrenodes() {
			var formcode = document.getElementById('formCode').value;
			var subcode = document.getElementById('subCode').value;
			/*
			 * var element = document.getElementById('addressMergedDiv').children[1];
			 * alert(element.tagName); element.innerHTML = '<i id="subcodeSpinner"
	 * class="fa fa-spinner fa-spin fa-1x fa-fw"></i>';
			 */

			var title = document.getElementById('archiveTicketsTitle').value;
			if ($.fn.DataTable.isDataTable('#archiveTicketsTable')) {
				var tab = $('#archiveTicketsTable').DataTable();
				tab.clear().draw();
				$('#archiveTicketsTableDiv').hide();
			}
			if (subcode.length > 0) {
				$('#ticketProgress').show();

				var $form = $("form#form1");
				$
						.ajax({
							type : "GET",
							url : "getArchiveTickets?formcode=" + formcode
									+ "&subcode=" + subcode,
							data : $form.serialize(),
							success : function(data) {
								var myArr = JSON.parse(data);
								var titleArr = JSON.parse(title);
								if (myArr.column != undefined) {
									$('#ticketProgress').hide();
									if (!$.fn.DataTable
											.isDataTable('#archiveTicketsTable')) {
										var table = " <div id='archiveTicketsTableDiv' style='height: 400px;overflow-y:scroll;'   class='dataTable_wrapper'> "
										var table = table
												+ "<table id='archiveTicketsTable' class='display' cellspacing='0' width='100%'>";
										table = table + "<thead><tr>";
										var col = '';
										var columnName = titleArr;
										for (i = 0; i < columnName.length; i++) {
											col = col + '{"data":"'
													+ columnName[i] + '"},';
											table = table + "<th>"
													+ columnName[i] + "</th>";
										}
										col = col.substring(0, col.length - 1);
										col = col + '';
										var array = JSON.parse("[" + col + "]");
										table = table
												+ "</tr></thead></table></div>";
										$('#ArcTicDiv').append(table);
										$.fn.dataTable.ext.buttons.selectAllOpt = {
											className : 'buttons-selectAllOpt',

											action : function(e, dt, node,
													config) {
												var table = $(
														'#archiveTicketsTable')
														.DataTable();
												var rowcount = table.rows()
														.count();

												if (this.text() == "Select All") {

													this.text('UnSelect All');
													table.rows().select();
													$(
															"table tr  td:nth-child("
																	+ indx
																	+ ")")
															.find($(".fa"))
															.removeClass(
																	'fa-square-o')
															.addClass(
																	'fa-check-square-o');

												} else {

													this.text('Select All');
													table.rows().deselect();

												}
											}
										}
										$('#archiveTicketsTable')
												.DataTable(
														{
															"columns" : array,
															dom : 'Bfrtip',
															'processing' : true,
															'language' : {
																'loadingRecords' : '&nbsp;',
																'processing' : '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading..n.</span>'
															},
															buttons : [
																	{
																		extend : 'excelHtml5',
																		title : 'Archive Tickets',
																		text : 'Excel',
																		footer : true,
																		exportOptions : {
																			modifier : {
																				selected : true
																			}
																		}
																	},
																	{
																		extend : 'csvHtml5',
																		title : 'Archive Tickets',
																		text : 'CSV',
																		footer : true,
																		exportOptions : {
																			modifier : {
																				selected : true
																			}
																		}
																	},
																	{

																		extend : 'selectAllOpt',
																		text : 'Select All',

																	},
																	{
																		extend : 'copyHtml5',
																		text : 'Copy',
																		exportOptions : {
																			modifier : {
																				selected : true
																			}
																		}
																	}

															]

														});

									}
									$('#archiveTicketsTableDiv').show();
									var dt = $('#archiveTicketsTable')
											.DataTable();
									dt.clear().draw();
									dt.rows.add(myArr.data).draw();
								} else {
									$('#archiveTicketsTableDiv').hide();
									$('#ticketProgress').hide();
									document.getElementById("typeMsg").innerHTML = "ALERT";
									document.getElementById("dataMsg").innerHTML = "No Data Found....!!";
									$('#message').openModal();
								}
							}
						});

			} else {
				document.getElementById("typeMsg").innerHTML = "ALERT";
				document.getElementById("dataMsg").innerHTML = "please select subscriber code....!!";
				$('#message').openModal();

			}

		}

		function getFibrenodeList() {
			alert("inside edit")
			var fldVal = document.getElementById("centerInchName").value;
			alert(fldVal)
			var $form = $("form#form1");

			$
					.ajax({
						type : "GET",
						url : "getFibrenodeforEdit?FldVal=" + fldVal,
						data : $form.serialize(),
						success : function(data) {
							data = data.trim();
							//alert(data);

							if (data) {

								var editDtCol = document
										.getElementById("editDtCol").value;
								var dtlColJson = JSON.parse(editDtCol);
								var projects = JSON.parse(data);

								loadDataTableEdit(projects)

							} else {

								var projects = [ {

									"value" : "",
									"id" : "",
									"Show" : [],
									"Filter" : []
								} ]
								response(projects);
							}
						}
					});

		}

		function loadDataTableEdit(dataSet) {
			//var nodes = JSON.parse(dataSet)
			initDt();
			// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered

			//--------Modified By Murali Dated 12-09-2016-----------
			var formCode = document.getElementById("formCode").value;
			if (formCode == "FCRM001") {
				if (dataSet.length > 0) {
					document.getElementById("typeMsg").innerHTML = "ALERT";
					document.getElementById("dataMsg").innerHTML = "Pending Tickets Available For This Subscriber";
					$('#message').openModal({
						dismissible : false
					});
					document.getElementById("PendingTicketsLink").click();
				}

			}

			//--------#Modified By Murali Dated 12-09-2016-----------

			var table = $('#dtl-datatableEdit').DataTable();
			table.clear().draw();
			$.each(dataSet, function(i, item) {
				// alert(dataSet[0].Fibrenode + "," +dataSet[0].Status + "," + dataSet[0].Id +","+ dataSet[0].editLink )
				table.row.add([ dataSet[i].Id, dataSet[i].Fibrenode,
						dataSet[i].Status, dataSet[i].editLink ])
			});
			table.draw(true);
			//$("tr td:nth-child("+selectcolindex+")").find($(".fa")).removeClass('fa-check-square-o').addClass('fa-square-o')
			/* if(this.text()=="Select All")
			{
				this.text('UnSelect All');
				table.rows().select();
				$("tr td:nth-child("+selectcolindex+")").find($(".fa")).removeClass('fa-square-o').addClass('fa-check-square-o');		
				$('.image1').hide();
				$('.image2').show();
				 DetailSum();
			}
			else
			{
				this.text('Select All');
				table.rows().deselect();
				$("tr td:nth-child("+selectcolindex+")").find($(".fa")).removeClass('fa-check-square-o').addClass('fa-square-o');
				$('.image2').hide();
				$('.image1').show();
				 DetailSum();
			}*/
			//table.rows().select();
			/*  $('#dtl-datatableEdit tbody').off('click', 'tr').on( 'click', 'tr', function () {
			
			  //$(this).toggleClass('selected');
			  var selected = $(this).hasClass("selected");
			  if(!selected)
			  {
			   $(this).addClass('selected');
			   table.row(this).select();
			  }
			  else
			  {
			   $(this).removeClass('selected');
			   table.row(this).deselect();
			  }
			 
			  console.log( table.row( this ).data() );
			  
			  } );*/

			/*  HARI
			 if(dtlColJson2!=null)
			 {
			
			

			 var table = $('#dtl-datatableEdit2').DataTable();
			 table.clear().draw();
			 table.rows.add( dataSet[1].DtlOne ).draw(true);
			 $('#dtl-datatableEdit2 tbody').off('click', 'tr').on( 'click', 'tr', function () {
			
			 //$(this).toggleClass('selected');
			 var selected = $(this).hasClass("selected");
			 if(!selected)
			 {
			 $(this).addClass('selected');
			 table.row(this).select();
			 }
			 else
			 {
			 $(this).removeClass('selected');
			 table.row(this).deselect();
			 }
			 } );
			 }
			
			 //-----Modified By Murali Dated 29-09-2016----------
			 if(dtlColJson3!=null)
			 {
			
			

			 var table = $('#dtl-datatableEdit3').DataTable();
			 table.clear().draw();
			 table.rows.add( dataSet[2].DtlTwo ).draw(true);
			 $('#dtl-datatableEdit3 tbody').off('click', 'tr').on( 'click', 'tr', function () {
			
			 //$(this).toggleClass('selected');
			 var selected = $(this).hasClass("selected");
			 if(!selected)
			 {
			 $(this).addClass('selected');
			 table.row(this).select();
			 }
			 else
			 {
			 $(this).removeClass('selected');
			 table.row(this).deselect();
			 }
			 } );
			 } */
			//-----#Modified By Murali Dated 29-09-2016----------
		}

		function initDt() {
			if ($.fn.DataTable.isDataTable('#dtl-datatableEdit')) {
				return true;
			}

			var dtlTbl = document.getElementById("editDtCol");

			if (dtlTbl != null) {

				var editDtCol = document.getElementById("editDtCol").value;
				var dtlColJson = JSON.parse(editDtCol);
				dtlColJsonlen = dtlColJson.length;
				alert(dtlColJsonlen)
				var selectcolindex = dtlColJsonlen - 1;
				var indx = DtlHideIndexEdit();

				$.fn.dataTable.ext.buttons.selectAllOpt = {
					className : 'buttons-selectAllOpt',

					action : function(e, dt, node, config) {
						var table = $('#dtl-datatableEdit').DataTable();
						var rowcount = table.rows().count();

						/*     				if(this.text()=="Select All")
						 {
						
						 this.text('UnSelect All');
						 table.rows().select();
						 $("tr  td:nth-child("+indx+")").find($(".fa")).removeClass('fa-square-o').addClass('fa-check-square-o');
						 $('.image1').hide();
						 $('.image2').show();

						 // DetailSum();
						 }
						 else
						 {
						
						 this.text('Select All');
						 table.rows().deselect();
						
						 $("tr td:nth-child("+indx+")").find($(".fa")).removeClass('fa-check-square-o').addClass('fa-square-o');
						 $('.image2').hide();
						 $('.image1').show();
						
						 } */
					}
				}

				//var edit = dtlColJson[dtlColJson.length-1].title;

				var table = $('#dtl-datatableEdit')
						.DataTable(
								{
									"ordering" : false,
									"scrollCollapse" : true,
									"bLengthChange" : false,
									"paging" : true,
									'processing' : true,
									'language' : {
										'loadingRecords' : '&nbsp;',
										'processing' : '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading..n.</span>'
									},

									"autoWidth" : true,

									//columns: myArr[0].Dtl,

									columns : dtlColJson

									/* columns: [
									    { "searchable": false },
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null,
									    null
									  ] */,
									columnDefs : [ {
										"defaultContent" : "-",
										"targets" : "_all"
									} ],

									dom : 'Bfrtip',
									buttons : [ {

										extend : 'selectAllOpt',
										text : 'Select/UnSelect'

									}, {
										extend : 'copyHtml5',
										text : 'Copy',
										exportOptions : {
											modifier : {
												selected : true
											}
										}
									}

									]

								});
			}
		}

		function DtlHideIndexEdit() {
			//var dtlhide = document.getElementById("dtlHide").value;
			var dtlCols = document.getElementById("editDtCol").value;
			var dtlColJson = JSON.parse(dtlCols);
			dtlColJsonlen = dtlColJson.length;
			var selectcolindex = dtlColJsonlen - 1;
			/* 	if (dtlhide.length > 0) {
			 var res = "";
			 res = dtlhide.split("$");
			 if (res.includes("EDIT")) {
			 var indx = dtlColJsonlen - res.length;
			 } else {
			 var indx = dtlColJsonlen - res.length - 1;
			 }

			 } */
			var indx = selectcolindex;

			return indx;
		}
		function editFibrenode(page, id, fibreNode) {
			/* $("#centerInchNametest").attr('name','centerInchName');
			$("#centerInchNametest").attr('id','centerInchName'); */
			var $alertDiv = $('#myForm .splitter #alertDiv');
			if ($alertDiv.length > 0) {
				$('#myForm .splitter #alertDiv').remove();
			}
			$('#myForm .splitter #alertDiv')
			var str = " and id='" + id + "'";
			var SearchType = "OPEN";
			$('#progressBar').openModal({
				dismissible : false
			});
			var Condition = str.replace(/:/g, "'");

			var iVal = 0;
			var $form = $("form#form1");
			var formcode = document.getElementById("formCode").value;
			var accessPeriod = '';

			$
					.ajax({
						type : "POST",
						url : "HelpGridData?WhrCondition=" + Condition
								+ "&ACTION=" + SearchType,
						data : $form.serialize(),
						async : false,
						success : function(jsonText) {

							//sessionStorage.setItem("type",SearchType );
							//sessionStorage.setItem("editArray", jsonText);

							var myArr = JSON.parse(jsonText);
							var splitterValue = 0;

							myJsonPopulateFunction(myArr[0].Hdr);
							if (myArr[0].Dtl != null && myArr[0].Dtl.length > 0) {
								initDtl0(myArr[0].Dtl[1].DtlLabels);
							}

							if (myArr[0].DtlOne != null
									&& myArr[0].DtlOne.length > 0) {
								var dtlCols2 = document
										.getElementById("dtlCols2").value;
								dtlColJson2 = JSON.parse(dtlCols2);
								initDtl1(myArr[0].DtlOne[1].DtlOneLabels);
							}
							if (myArr[0].Dtl != null && myArr[0].Dtl.length > 0) {
								loadDataTableOpen(myArr[0], dtlColJson,
										dtlColJson2, dtlColJson3);
							}
							$('#progressBar').closeModal();
							$('#modal1').closeModal();
							//return true;

							for (i = 0; i < myArr[0].Hdr.length; i++) {
								if (myArr[0].Hdr[i].FieldName === "accPeriod") {
									accessPeriod = myArr[0].Hdr[i].FieldVal
								}

								/* 								if (myArr[0].Hdr[i].FieldName === "fibreNode") {
								 alert("inside")

								 var fNode = myArr[0].Hdr[i].FieldVal;

								 var arr = fNode.split('/');
								 alert(arr.length)
								 if (arr.length > 3) {

								 if (arr[3] != null && arr[4] != null) {

								 alert(arr[3] + " " + arr[4])
								 alert(arr[3].substring(arr[3]
								 .indexOf('P') + 1))
								 }

								 }

								 } */

								if (myArr[0].Hdr[i].FieldName === "noOfPort") {
									if (myArr[0].Hdr[i].FieldVal != null) {

										$(".splitter > tbody").html("");
										//$(".splitter > tbody").html("");
										if ($(".splitter > thead > tr").find(
												"th:eq(0)").text() === 'Fibrenode') {

											$(".splitter > thead > tr").find(
													"th:eq(0)").remove()
										}
										var bodyContent = '';
										if (splitterValue != 0) {
											$(".splitter > thead > tr").find(
													"th:eq(0)").before(
													'<th>Fibrenode</th>');
											var leg = 0;
											myArr[0].Hdr.forEach(function(e) {

												if (e.FieldName === "leg") {
													console.log(splitterValue
															+ "," + leg)
													leg = e.FieldVal;
												}

											});
											bodyContent = bodyContent
													+ "<tr><td>"
													+ fibreNode
													+ "</td><td> P"
													+ myArr[0].Hdr[i].FieldVal
													+ "</td><td><input type=\"text\"  id=\"splitterarea\" name=\"chkAllPrimaryAttrs\" value='"+ splitterValue+"'></td><td><input type=\"text\"  id=\"splitterleg\" name=\"splitterleg\" value='"+leg+"''></td></tr>";
										} else {
											bodyContent = bodyContent
													+ "<tr><td>"
													+ fibreNode
													+ "</td><td> P"
													+ myArr[0].Hdr[i].FieldVal
													+ "</td><td><input type=\"text\"  id=\"splitterarea\" name=\"chkAllPrimaryAttrs\"></td><td><input type=\"text\"  id=\"splitterleg\" name=\"splitterleg\"></td></tr>";

										}
										$(".splitter tbody")
												.append(bodyContent);
									}
									$('#myForm .splitter')
											.append(
													'<div class="alert card red lighten-4 red-text text-darken-4" id="alertDiv">'
															+ '<div class="card-content">'
															+ '<p><i class="material-icons">report</i> You have to delete the nodes under the assigned port prior to update the splitter</p></div></div>');

									if ($("#myForm").dialog("isOpen") == false) {

										$("#myForm").dialog("close")
										$("#myForm")
												.dialog(
														{
															autoOpen : false,
															modal : true,
															buttons : {
																Update : function() {

																	saveAfterEditSplitter(
																			fibreNode,
																			$(
																					".splitter tbody tr")
																					.find(
																							"td:eq(1)")
																					.text(),
																			$(
																					".splitter tbody tr")
																					.find(
																							"td:eq(2)")
																					.find(
																							"input[name='chkAllPrimaryAttrs']")
																					.val(),
																			$(
																					".splitter tbody tr")
																					.find(
																							"td:eq(3)")
																					.find(
																							"input[name='splitterleg']")
																					.val(),
																			accessPeriod);

																},
																Cancel : function() {
																	closeForm();
																	$(this)
																			.dialog(
																					'close');
																}
															},
															width : "46%",
														//maxWidth: "768px"
														});

										$("#myForm").dialog("open")

									}
								}

								if (myArr[0].Hdr[i].FieldName === "splitter") {
									if (myArr[0].Hdr[i].FieldVal != null) {
										console.log("splitter is not null");
										splitterValue = myArr[0].Hdr[i].FieldVal;
										console.log("assigned splittr value"
												+ splitterValue)
									}
								}
								var fldName = myArr[0].Hdr[i].FieldName;
								var fldValue = myArr[0].Hdr[i].FieldValue;

								//			        		 if(myArr[0].Hdr[i].FieldType=="Text")
								//		        			 {
								if (fldValue != null && fldValue != "null"
										&& fldValue.trim().length > 0) {
									//document.getElementById(fldName).value=fldValue;
									$('#' + fldName).val(fldValue);
									Materialize.updateTextFields();
								}

								//		        			 }
								//			        	         
								if (myArr[0].Hdr.RuntimeHideFields == "Y") {
									RuntimeHide(fldName);
								}
								if (myArr[0].Hdr.RuntimeLockFields == "Y") {
									RuntimeLock(fldName);
								}

								$('select').material_select();

							}
							;

							if (SearchType.toUpperCase() == "SEARCH") {
								FetchCommandButtonDataJson();
							} else {
								if (document.getElementById("dtlCols") == null
										|| document.getElementById("dtlCols").value == null) {
									$('#progressBar').closeModal();
								} else {
									var dtlCols = document
											.getElementById("dtlCols").value;
									var dtlColJson = JSON.parse(dtlCols);
									var dtlColJson2 = null;
									var dtlColJson3 = null;
									//------Modified By Murali Dated 29-09-2016----------
									if (myArr.length > 3) {
										var dtlCols3 = document
												.getElementById("dtlCols3").value;
										dtlColJson3 = JSON.parse(dtlCols2);
										var dtlCols2 = document
												.getElementById("dtlCols2").value;
										dtlColJson2 = JSON.parse(dtlCols2);
									} else if (myArr.length == 3) {
										var dtlCols2 = document
												.getElementById("dtlCols2").value;
										dtlColJson2 = JSON.parse(dtlCols2);
									}

									//------#Modified By Murali Dated 29-09-2016----------
									if (SearchType.toUpperCase() == "OPEN") {

										loadDataTableOpen(myArr, dtlColJson,
												dtlColJson2, dtlColJson3);
									} else {
										loadDataTable(myArr, dtlColJson,
												dtlColJson2, dtlColJson3);
									}
								}

							}

							$('#progressBar').closeModal();
							$('#modal1').closeModal();

						}

					}); // End .ajax function    editpanel

			//window.open(page, '_blank');

			//removePreLoader();

		}

		function viewAllotedUsers(page, id, fibreNode) {
			console.log("inside allote users fcn" + fibreNode)
			$.ajax({
				type : "GET",
				url : "getAllotedUsers?Flbrenode=" + fibreNode,
				data : {
					"Fibrenode" : fibreNode
				},
				success : function(data) {
					data = data.trim();
					//alert(data);

					if (data) {

						var subscribers = JSON.parse(data);
						console.log(subscribers)
						console.log($('#dialogBox').attr('id'))

						subscribers.forEach(function(e) {

							if (e.subcode != null) {
								console.log(e.name)
								$("#dialogBox #sublist").append(
										'<li>' + e.name + '</li>');
							}

						});

						$("#dialogBox").dialog({
							modal : true,
							draggable : false,
							resizable : false,
							show : 'fade',
							hide : 'fade',
							title : 'Subsribers',
							minWidth : 246,
							Height : 271
						});
						$("#dialogBox").dialog("open")

					} else {

						var projects = [ {

							"value" : "",
							"id" : "",
							"Show" : [],
							"Filter" : []
						} ]
						response(projects);
					}
				}
			});

		}

		function saveAfterEditSplitter(fNode, port, splitter, leg, accessPeriod) {

			$
					.ajax({
						type : "POST",
						url : "saveFnodeAfterEdit?fNode=" + fNode + "&port="
								+ port + "&splitter=" + splitter + "&leg="
								+ leg + "&accessPeriod=" + accessPeriod,

						success : function(data) {
							console.log(data)
							var updateNodeResponse = JSON.parse(data);

							document.getElementById("typeMsg").innerHTML = "ALERT";
							document.getElementById("dataMsg").innerHTML = updateNodeResponse[0].message;
							$('#message').openModal({
								dismissible : false
							});
						}
					});
		}
		function onLoadBody() {

			/* if(sessionStorage.getItem("editArray") === null)
				
			{
				alert("no data")
			}
			else if(sessionStorage.getItem("editArray") != null){
				alert("data is there")
				
				
				var SearchType=sessionStorage.getItem("type");
				
					var myArr = JSON.parse(sessionStorage.getItem("editArray"));
			
				alert(myArr[0].Hdr.length)
				
				//myJsonPopulateFunction(myArr[0].Hdr);
				if(myArr[0].Dtl!=null && myArr[0].Dtl.length>0)
				{
					alert("array have values")
					initDtl0(myArr[0].Dtl[1].DtlLabels);
				}
				
				if(myArr[0].DtlOne != null && myArr[0].DtlOne.length>0)
				{
					var dtlCols2 = document.getElementById("dtlCols2").value;
					dtlColJson2 = JSON.parse(dtlCols2);
					initDtl1(myArr[0].DtlOne[1].DtlOneLabels);
				}
				if(myArr[0].Dtl !=null && myArr[0].Dtl.length>0)
				{
					loadDataTableOpen(myArr[0],dtlColJson,dtlColJson2,dtlColJson3);
				}
				
				
				
				 for(i = 0; i < myArr[0].Hdr.length; i++) {
					 var fldName=myArr[0].Hdr[i].FieldName;
					 var fldValue=myArr[0].Hdr[i].FieldVal
			;
					 
			//    		 if(myArr[0].Hdr[i].FieldType=="Text")
			
			
			//			 {
						 if(fldValue!=null && fldValue!="null")
						 {
							 //document.getElementById(fldName).value=fldValue;
							 $('#'+fldName).val(fldValue);
			    			 Materialize.updateTextFields();
						 }
						 
			//			 }
			//    	         
			
						
						 
						 
					 $('select').material_select();
					
				 };
				 

			}
			 */
			LoadData();
			noBack();

		}
		function setAllotedUsers(fibreNode) {
			var table = $('#dtl-datatableEdit').DataTable();
			table.search(fibreNode).draw();
			if ($('#message').hasClass('show'))
				;
			{
				console.log("modal open")
				$('#message').closeModal({
					dismissible : true
				});
			}
			if ($("#myForm").dialog("isOpen")) {

				$("#myForm").dialog("close")

			}
		}
		function addLeg(legVal,portVal) {
		if(legVal.trim() == "" || legVal.trim() == 0){
			return false
		}
		else{
			$(".leg > tbody").html("");
			var bodyContent='';
			for (var i = 1; i <= legVal; i++) {
				//bodyContent=bodyContent+ "<tr><td><input type=\"checkbox\" id=\"pcheck" + i + "\" name=\"splittercheck\" class=\"filled-in\" ><label for=\"pcheck" + i + "\"></label></td><td> P" + i + "</td><td><input type=\"text\"  id=\"splitterarea\" name=\"chkAllPrimaryAttrs\"></td></tr>";

				bodyContent = bodyContent
						+ "<tr><td> S"
						+ i
						/* 		+ "</td><td><input type=\"text\"  id=\"splitterarea\" name=\"chkAllPrimaryAttrs\"></td><td><input type=\"text\"  id=\"splitterleg\" name=\"splitterleg\"></td></tr>"; */
						+ "</td><td><select><option value=\"2\">2</option><option value=\"4\">4</option><option value=\"8\">8</option><option value=\"16\">16</option></select></td></tr>";
			}
			$(".leg tbody").append(bodyContent);
			
					
		$(".leg tbody tr").each(
				
				function() {
					
				var legSelect=$(this).find("td:eq(1)").find("select");
					legSelect.material_select();
					 
				});
			
			$("#legForm").dialog({
				autoOpen : false,
				modal : true,
				buttons : {
					Save : function() {
						saveLeg(portVal);

					},
					Cancel : function() {
						closeLegForm();
						$(this).dialog('close');
					}
				},
				width : "20%",
				height : "auto",
			//maxWidth: "768px"
			});

			$("#legForm").dialog("open")
			}

		}
		function saveLeg(portVal) {

			//alert("saving...")

			var values = new Array();
			$(".leg tbody tr").each(
					function() {
						var obj = {};
						var key =$(this).find("td:first-child").text().trim();
					   
						// Within tr we find the last td child element and get content
						//alert($(this).find("td:first-child").text());
						//alert($(this).find("td:last-child").find("input[name='chkAllPrimaryAttrs']").val());
						//$('#aioConceptName').find(":selected").text();
						
						obj = {
								
								[key]:$(this).find('td:last-child').find(":selected").text()
							
						}// main object
						values.push(obj);

					});

			//window.localStorage.setItem('leg', JSON.stringify(values));
			
$(".splitter tbody tr").each(
		function() {
			
			if($(this).find("td:first-child").text().trim() === portVal.trim() ){
				$(this).find("td:eq(3)").find(
				"input[name='splitterleg']").val("");
				alert($(this).find("td:eq(3)").find(
				"input[name='splitterleg']").val())
				$(this).find("td:eq(3)").find(
				"input[name='splitterleg']").val(JSON.stringify(values))
				alert($(this).find("td:eq(3)").find(
				"input[name='splitterleg']").val())
			}
		})
		
			/* var error = document.getElementById("displayError")
			error.textContent = "Splitter added sucessfully";
			error.style.color = "green";
			error.style.position = "absolute"; */
			

		}
		function closeLegForm(){
			$(".leg > tbody").html("");
			document.getElementById('legForm').style.display = 'none';
		}
	</script>

	<div id="onLoadData"></div>
	<!-- jQuery -->
	<!-- DataTables JavaScript -->
	<script
		src="resources/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="resources/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
	<!-- Custom Theme JavaScript -->


	<!-- Buttons-->
	<script
		src="resources/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script src="resources/mat/buttons/dataTables.buttons.min.js"></script>
	<script src="resources/mat/buttons/jszip.min.js"></script>

	<script src="resources/code/vfs_fonts.js"></script>

	<script src="resources/mat/buttons/buttons.html5.min.js"></script>
	<script src="resources/mat/buttons/dataTables.select.min.js"></script>

	<%-- <!-- #Buttons-->
	<jsp:include page="../mFooter.jsp" /> --%>
</body>
</html>
