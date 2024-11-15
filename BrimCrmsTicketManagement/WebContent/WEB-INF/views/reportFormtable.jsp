<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.org.brimcrmsticketmanagement.model.Tickets"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report</title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">       
<!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    
    <!-- <link href="resources/css/reportFormstyle.css" rel="stylesheet"> -->
<!--     <style>
        .sidebar {
            background: #343a40;
            color: #fff;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            z-index: 1000;
            padding-top: 20px;
        }
     
        .sidebar .sidebar-header {
            padding: 20px;
        }

        .sidebar .sidebar-brand {
            color: #fff;
            font-size: 1.5rem;
            font-weight: bold;
            text-decoration: none;
        }

        .sidebar .sidebar-item {
            color: #adb5bd;
            padding: 10px 10px;
            text-decoration: none;
            display: block;
        }

        .sidebar .sidebar-item:hover {
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
        }

        .main-content {
            margin-left: 100px;
            padding: 5px;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .sidebar .sidebar-header, .sidebar .sidebar-nav {
                text-align: center;
            }

            .main-content {
                margin-left: 0;
            }
        }
    </style> -->
</head>


<body class="sb-nav-fixed">
	<jsp:include page="upperNavbar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="sideNavbar.jsp" />
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4" style="font-size: 17px;">
					<h1 class="mt-4">Report</h1>
					
    <div class="row mt-5">
        
        <main class="col s12 m8 l9 main-content">
           
            <form action="${pageContext.request.contextPath}/report" method="post">
                <div class="row">
                
                 <div class="form-group col s12 m4"> <!-- Date input -->
        <label class="control-label" for="fromDate">From Date</label>
        <input class="form-control form-control-lg"" id="fromDate" name="fromDate"  type="date"/>
      </div>
                
               <!--      <div class="input-field col s12 m4">
                        <input type="date" id="fromDate" name="fromDate" class="form-control validate">
                        <label for="fromDate">From Date</label>
                    </div> -->
              <!--       <div class="input-field col s12 m4">
                        <input type="date" id="toDate" name="toDate" class="form-control validate">
                        <label for="toDate">To Date</label>
                    </div> -->
                     <div class="form-group col s12 m4"> <!-- Date input -->
        <label class="control-label" for="toDate">To Date</label>
        <input class="form-control form-control-lg"" id="toDate" name="toDate"  type="date" size="5"/>
      </div>
                    <div class="form-group col s12 m4">
                    <label class="control-label" for="status">Status</label>
                        <select id="status" name="status" class="form-control form-control-lg"">
                            <option value="" selected>Select</option>
                            
                            <option value="Pending">Pending</option>
                            <option value="Closed">Resolved</option>
                            <option value="Escalated">Escalated</option>
                        </select>
                        
                    </div>
                </div>
                <button type="submit" id="report-link" class="btn btn-primary btn-lg">Submit</button>
            </form>       
            <div class="card" id="ticketTable" style="display: none;">
                <div class="card-content">
                    <c:if test="${not empty tickets}">
                    <c:out value="expression" default="string" />
                    <div class="table-responsive">
                        <display:table name="${tickets}" requestURI="/report" pagesize="10" export="true" sort="list" class="table-striped table-bordered" id="ticket" excludedParams="exportFileName,exportFileName.*,exportFileName._.*" style="border: 1px solid gray;
   
  <%--   border-collapse: separate;
    border-spacing: 1em; --%>
    ">
                            <display:setProperty name="export.excel.filename" value="report.xls"/>
                            <display:setProperty name="export.csv.filename" value="report.csv"/>
                            <display:setProperty name="export.pdf.filename" value="report.pdf"/>
                            <display:setProperty name="export.xml.filename" value="report.xml"/>        
                            <display:column title="SL.No" sortable="true" headerClass="header">
                                <c:set var="rowNum" value="${rowNum + 1}" scope="page" />
                                ${rowNum}
                            </display:column>
                           
                            <display:column property="username" title="Username" sortable="true" headerClass="header"/>
                           <display:column property="ticketNo" title="Ticket Number" sortable="true" headerClass="header"/>
                            <display:column property="role" title="Role" sortable="true" headerClass="header"/>
                            <display:column property="lob" title="Line Of Business" sortable="true" headerClass="header"/>
                                 
                            <display:column property="bp" title="Business Partner" sortable="true" headerClass="header"/>
                           <display:column title="Login Time" sortable="true" headerClass="header">
                                <fmt:parseDate value="${ticket.loginTIme}" type="date" pattern="yyyy-MM-dd HH:mm:ss.S" var="formatedDate"/>
                                <fmt:formatDate pattern="dd-MM-yyyy" value="${formatedDate}" />
                            </display:column>  
                            <display:column property="probTypeName" title="Problem Type" sortable="true" headerClass="header"/>
                            <display:column property="subTypeName" title="Problem Subtype" sortable="true" headerClass="header"/>
                      
                            <display:column property="mac" title="Mac" sortable="true" headerClass="header"/>
                            <display:column property="description" title="Description" sortable="true" headerClass="header"/>
                            <display:column property="status" title="Ticket Status" sortable="true" headerClass="header"/>
                            <display:column title="Updated On" sortable="true" headerClass="header">
                                <fmt:parseDate value="${ticket.updatedOn}" type="date" pattern="yyyy-MM-dd HH:mm:ss.S" var="closedformatedDate"/>
                                <fmt:formatDate pattern="dd-MM-yyyy" value="${closedformatedDate}" />
                            </display:column> 
                            <display:column property="closedBy" title="Closed By" sortable="true" headerClass="header"/>
                            
                            <display:column property="closedOn" title="Closed On" sortable="true" headerClass="header"/>
                             
                            <display:column property="closedRemarks" title="Closed Remarks" sortable="true" headerClass="header"/>
                      
                      <display:column property="tat" title="TAT" sortable="true" headerClass="header"/>
                        </display:table>
                        </div>
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

	<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<script>

document.addEventListener('DOMContentLoaded', function() {
    var formSubmitted = "${not empty tickets}";

    if (formSubmitted) {
        document.getElementById("ticketTable").style.display = "block";
        
    } else {
        document.getElementById("ticketTable").style.display = "none";
        
        
    }   
    })

/* document.addEventListener('DOMContentLoaded', function() {
    var formSubmitted = "${not empty tickets}";

    if (formSubmitted) {
        document.getElementById("ticketTable").style.display = "block";
        
    } else {
        document.getElementById("ticketTable").style.display = "none";
        
        
    }   
    
    var elems = document.querySelectorAll('select');
   // M.FormSelect.init(elems);

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
 */</script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script> -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
    
</body>


</html>