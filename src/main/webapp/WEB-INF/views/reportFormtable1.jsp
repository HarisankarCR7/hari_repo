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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
    <link href="resources/css/reportFormstyle.css" rel="stylesheet">
    <style>
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
    </style>
</head>
<body>
<nav>
    <div class="nav-wrapper black">
        <a href="#" class="brand-logo" style="margin-left: 250px; padding-left: 20px;"></a>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col s12 m4 l3">
            <div class="sidebar">
                <div class="sidebar-header">
                    <a class="sidebar-brand">Report</a>
                </div>
                <ul class="sidebar-nav">
                    <li><a class="sidebar-item" href="homePage">
                        <i class="fa fa-th-large"></i> Dashboard</a>
                    </li>
                    <li><a class="sidebar-item" href="form">
                        <i class="fa fa-file-alt"></i> Report</a>
                    </li>
                </ul>
            </div>
        </div>
        <main class="col s12 m8 l9 main-content">
            <h4>Report</h4>
            <form action="${pageContext.request.contextPath}/report" method="post">
                <div class="row">
                    <div class="input-field col s12 m4">
                        <input type="date" id="fromDate" name="fromDate" class="validate">
                        <label for="fromDate">From Date</label>
                    </div>
                    <div class="input-field col s12 m4">
                        <input type="date" id="toDate" name="toDate" class="validate">
                        <label for="toDate">To Date</label>
                    </div>
                    <div class="input-field col s12 m4">
                        <select id="status" name="status">
                            <option value="" disabled selected>Select</option>
                            <option value="l1-pending">L1-Pending</option>
                            <option value="l2-pending">L2-Pending</option>
                            <option value="resolved">Resolved</option>
                        </select>
                        <label for="status">Status</label>
                    </div>
                </div>
                <button type="submit" id="report-link" class="btn waves-effect waves-light">Submit</button>
            </form>       
            <div class="card" id="ticketTable" style="display: none;">
                <div class="card-content">
                    <c:if test="${not empty tickets}">
                        <display:table name="${tickets}" requestURI="/report" pagesize="10" export="true" sort="list" class="striped" id="ticket" excludedParams="exportFileName,exportFileName.*,exportFileName._.*">
                            <display:setProperty name="export.excel.filename" value="report.xls"/>
                            <display:setProperty name="export.csv.filename" value="report.csv"/>
                            <display:setProperty name="export.pdf.filename" value="report.pdf"/>
                            <display:setProperty name="export.xml.filename" value="report.xml"/>        
                            <display:column title="SL.No" sortable="true" headerClass="header">
                                <c:set var="rowNum" value="${rowNum + 1}" scope="page" />
                                ${rowNum}
                            </display:column>
                            <display:column property="center" title="Center" sortable="true" headerClass="header"/>
                            <display:column property="module" title="Module" sortable="true" headerClass="header"/>
                            <display:column property="userName" title="User Name" sortable="true" headerClass="header"/>
                            <display:column title="Login Time" sortable="true" headerClass="header">
                                <fmt:formatDate pattern="dd-MM-yyyy" value="${ticket.loginTime}" />
                            </display:column>       
                            <display:column property="status" title="Status" sortable="true" headerClass="header"/>
                            <display:column property="ticketNo" title="Ticket Number" sortable="true" headerClass="header"/>
                            <display:column property="crmTicketNo" title="CRM Ticket No" sortable="true" headerClass="header"/>
                            <display:column title="Resolved Time" sortable="true" headerClass="header">
                                <fmt:formatDate pattern="dd-MM-yyyy" value="${ticket.resolvedTime}" />
                            </display:column>
                        </display:table>
                    </c:if>
                </div>
            </div>
        </main>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>