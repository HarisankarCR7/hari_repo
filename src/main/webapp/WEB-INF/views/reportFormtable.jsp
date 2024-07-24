<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.org.brimcrmsticketmanagement.model.Tickets"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
    <!-- <link href="resources/css/reportFormstyle.css" rel="stylesheet"> -->
</head>
<body class="sb-nav-fixed">
	<jsp:include page="upperNavbar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="sideNavbar.jsp" />
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">

					<div class="row">
				<main class="col s12 m8 l9 main-content" style="margin-bottom: 10px;">
            <h4>Report</h4><br><br>
             <form action="${pageContext.request.contextPath}/report" method="post">
                <div class="row">
                    <div class="input-field col s12 m3">
                        <input type="date" id="fromDate" name="fromDate" class="validate">
                        <label for="fromDate">From Date</label>
                    </div>
                    <div class="input-field col s12 m3">
                        <input type="date" id="toDate" name="toDate" class="validate">
                        <label for="toDate">To Date</label>
                    </div>
                    <div class="input-field col s12 m3">
                        <select id="status" name="status">
                            <option value="" disabled selected>Select</option>
                            <option value="l1-pending">L1-Pending</option>
                            <option value="l2-pending">L2-Pending</option>
                            <option value="resolved">Resolved</option>
                        </select>
                        <label for="status">Status</label>
                    </div>
                     <div class="input-field col s12 m3">
        <select id="center" name="center">
            <option value="" disabled selected>Select</option> 
            <c:forEach var="center" items="${centers}">  
                <option value="${center}">${center}</option>
            </c:forEach>
        </select>
        <label for="center">Center</label>
    </div>
                </div>
                <button type="submit" id="report-link" class="btn waves-effect waves-light">Submit</button>
            </form> 
            
            
            
        <form method="get" action="${pageContext.request.contextPath}/search">
             <div class="row">
            <div class="input-field col s12 m3">
            <input type="text" name="searchQuery" placeholder="Search for tickets..">
             </div>
            <div class="input-field col s12 m3">
            <button type="submit"class="btn waves-effect waves-light">Search</button>
            </div>
            </div>
        </form>   
        
           
            <div class="card" id="ticketTable" style="display: none;">
    <div class="card-content">
        <c:if test="${not empty tickets}">
            <display:table name="tickets" requestURI="" pagesize="5" export="true" sort="list" class="striped" id="ticket" excludedParams="exportFileName,exportFileName.*,exportFileName._.*">
                <display:setProperty name="export.excel.filename" value="reports.xls"/>
                <display:setProperty name="export.csv.filename" value="reports.csv"/>
                <display:setProperty name="export.pdf.filename" value="reports.pdf"/>
                <display:setProperty name="export.xml.filename" value="reports.xml"/>
                <display:setProperty name="export.decorated" value="true"/>
                <display:setProperty name="basic.msg.empty_list" value="No records found"/>
                <display:column title="SL.No" sortable="true" headerClass="header">
                    <c:set var="rowNum" value="${rowNum + 1}" scope="page" />
                    ${rowNum}
                </display:column>
                <display:column property="center" title="Center" sortable="true" headerClass="header"/>
                <display:column property="module" title="Module" sortable="true" headerClass="header"/>
                <display:column property="userName" title="User Name" sortable="true" headerClass="header"/>
                <display:column property="loginTime" title="Login Time" sortable="true" format="{0,date,dd-MM-yyyy}" headerClass="header"/>      
                <display:column property="status" title="Status" sortable="true" headerClass="header"/>
                <display:column property="ticketNo" title="Ticket Number" sortable="true" headerClass="header"/>
                <display:column property="crmTicketNo" title="CRM Ticket No" sortable="true" headerClass="header"/>
                <display:column property="resolvedTime" title="Resolved Time" sortable="true" format="{0,date,dd-MM-yyyy}" headerClass="header"/> 
            </display:table>
        </c:if>
    </div>
</div>
        </main>
				
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
	<script>

document.addEventListener('DOMContentLoaded', function() {
    var formSubmitted = "${not empty tickets}";

    if (formSubmitted) {
        document.getElementById("ticketTable").style.display = "block";
        
    } else {
        document.getElementById("ticketTable").style.display = "none";
        
        
    }   
    
    var elems = document.querySelectorAll('select');
    M.FormSelect.init(elems);

    validateForm();
});
	

    function validateForm() {
        var fromDate = document.getElementById("fromDate").value;
        var toDate = document.getElementById("toDate").value;
        var status = document.getElementById("status").value;

        if (fromDate && toDate && status) {
            document.getElementById("report-link").disabled = false;
        } else {
            document.getElementById("report-link").disabled = true;
        }
    }

    // Add event listeners to input fields
    document.getElementById("fromDate").addEventListener("input", validateForm);
    document.getElementById("toDate").addEventListener("input", validateForm);
    document.getElementById("status").addEventListener("change", validateForm);
</script>
<script src="resources/js/home/bootstrap/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>	
	

</body>
</html>