<%@page import="java.util.ArrayList"%>
<%@page import="com.org.brimcrmsticketmanagement.model.CafDetails"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%--  <%@page isELIgnored="false" % --%>>
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
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">         <link rel="stylesheet" href="resources/css/CafVerify/nouislider.min.css">
<!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/css/CafVerify/style.css">
<style type="text/css">
@media only screen   
and (min-width: 1370px)  
and (max-width: 1605px)  
{
.suscriber, .contact, .place, .remarks{

margin-top: 50px;
}
} 
@media only screen   
and (min-device-width : 768px)   
and (max-device-width : 1024px)  
{ .suscriber, .contact, .place, .remarks{

margin-top: 50px;
}}  
.cafvalidationcheck{
 margin-left: 15px !important;
}
.navButton{

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
	@media (max-width: 830px) {
  .form-inline {
    flex-direction: column;
    align-items: stretch;
  }
  
}
.form-inline .form-control{
margin-right: 17px;
}
.form-check .form-check-input{
float: none !important ;
}
.verify{
display: inline !important ;
}
.verifyComments{
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
.error-circle{
    position: relative;
    width: 31px;
    height: 32px;
    border-radius: 40px;
    background-color: #990000;
    border: 5px solid #fff;
}

.error-circle > div {
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

</style>
       
    </head>
    <body class="sb-nav-fixed" style="background-color: rgb(0 0 0 / 3%);">
       <jsp:include page="upperNavbar.jsp" />
        <div id="layoutSidenav">
 <jsp:include page="sideNavbar.jsp" />
            <div id="layoutSidenav_content">
                <main>
<div class="container-fluid px-1 py-5 mx-auto" style="padding-top: 0rem !important;padding-bottom: 0rem !important;">

<%-- <c:forEach var="cafListt" items="${cafList}" varStatus="status">
<p>welcomeee : ${cafListt.CAF_NO}</p>
</c:forEach> --%>
<%System.out.println("printing on jsp" + session.getAttribute("CourierName")+","+ session.getAttribute("cafStatus")); %>

    <div class="row d-flex justify-content-center">
        <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center" style="width: 100% !important;">
            <div class="divs">
            <div class="cls" id="first">
             <strong>Connection Details</strong>
            <p class="blue-text">Please verify the Cafs</p>
            
<form class="form-inline" action="#" style=" padding: 40px 40px 30px !important;
            background: #ebeff2;"> 
      <div>   
    <label for="email">Region</label> 
    <input type="email" class="form-control" id="email" value="<%= session.getAttribute("region") %>">  
    <label for="password">Center</label> 
    <input type="text" class="form-control" id="password" value="<%= session.getAttribute("center") %>">  
    <label for="password">Center Id</label> 
    <input type="text" class="form-control" id="password" value="<%= session.getAttribute("centerId") %>">  
    
    <label for="password">Subcode</label> 
    <input type="text" class="form-control" id="password" value="<%= session.getAttribute("subCode") %>">  
   </div> <br><br>
   <div>   
    <label for="email">Caf Number</label> 
    <input type="email" class="form-control" id="email" value="<%= session.getAttribute("CafNo") %>">  
    <label for="password">Caf Status</label> 
    
    <%if(session.getAttribute("cafStatus").toString().equals("CAF Not Received") ||session.getAttribute("cafStatus").toString().equals("INVALID")||session.getAttribute("cafStatus").toString().equals("Without CAF")||session.getAttribute("cafStatus").toString().equals("Not received")){ %>

         <span class="form-control badge bg-danger rounded-pill"><%= session.getAttribute("cafStatus") %></span>
          
              <%} %>
              <%if(session.getAttribute("cafStatus").toString().equals("OK")){ %>
               
                <span class="form-control badge bg-success rounded-pill"><%= session.getAttribute("cafStatus") %></span>
             
              <%} %>
        <label for="password">Activation Date</label> 
    <input type="text" class="form-control" id="password" value="<%= session.getAttribute("cafActDate") %>">  
       </div>
    
</form>
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
            <div class="card" style="margin-top: auto;">
               
              <div class="row">
               <div class="col-xl-6 col-lg-6 col-md-6">
          <table class="table table-borderless">
            <tbody>
             <strong class="fw-bold text-center">Subscriber Details</strong>
             <br>
             <tr>
                <td colspan="2">Subscriber Name</td>
                <td class="text-danger text-end"><%= session.getAttribute("subName") %></td>
              </tr>
             </tbody>
            
          </table>
                    <table class="table table-borderless">
            <tbody>
             <h5 class="text-danger text-center mb-4">Address</h5>
             <tr>
                <td colspan="2">House Number</td>
                <td class="text-danger text-end"><%= session.getAttribute("houseNo") %></td>
              </tr>
              
              <tr>
                <td colspan="2">Street</td>
                <td class="text-danger text-end"><%= session.getAttribute("street") %></td>
              </tr>
              <tr>
                <td colspan="2">State</td>
                <td class="text-danger text-end"><%= session.getAttribute("state") %></td>
              </tr>
              <tr>
                <td colspan="2">Country</td>
                <td class="text-danger text-end"><%= session.getAttribute("country") %></td>
              </tr>
              <tr>
                <td colspan="2">Pincode</td>
                <td class="text-danger text-end"><%= session.getAttribute("pincode") %></td>
              </tr>
                           
            </tbody>
            
          </table>
                </div>
<%--                                <div class="col-xl-6 col-lg-6 col-md-6">
                               <h5 class="text-center mb-4">Courier Information</h5>
                <div class="card mb-4">
        <!-- Shipping information -->
        <div class="card-body">
        <%if(session.getAttribute("courierDetails").equals(true)) { %>
          
          <strong><%=session.getAttribute("CourierName") %> </strong>
          <span><a href="#" class="text-decoration-underline" target="_blank"><%=session.getAttribute("CourierNo") %></a> <i class="bi bi-box-arrow-up-right"></i> </span>
          <hr>
          <h3 class="h6">Sent by</h3>
          <address>
            <strong><%=session.getAttribute("FromPerson") %></strong><br>
            <abbr>Region</abbr>   &nbsp  &nbsp<%=session.getAttribute("center") %>
           <br>
             <abbr>Center</abbr>   &nbsp  &nbsp<%=session.getAttribute("center") %>
          </address>
          <%} else { %>
          <marquee><p style="font-family: Impact; font-size: 18pt">No Courier Information avaiable!</p></marquee>
       
       <%} %> </div>
      </div>
                </div> --%>
                <div class="col-xl-6 col-lg-6 col-md-6 col-offset-2">
  <strong class="fw-bold text-center">Caf Verification Details</strong>
  <br>
  <form class="row bg-white  px-4" action="">
  <div class="col-md-12">
    <p class="verifyComments fw-bold col-6 text-left"> Whether CAF is filled in all respect (Y/N)</p>
    <div class="verify form-check col-3 ">
      <input class="form-check-input" type="radio" name="isFilled" id="isFilledYes" value="yes" />
      <label class="form-check-label" for="isFilledYes">
        Yes
      </label>
    </div>
    <div class="verify form-check col-3 ml-2">
      <input class="form-check-input" type="radio" name="isFilled" id="isFilledNo" value="no"/>
      <label class="form-check-label" for="isFilledNo">
        No
      </label>
    </div>
    </div>
    <div class="col-md-12">
    <p class="verifyComments fw-bold col-6 text-left">Customer Photo Status (Y/N)</p>
    <div class="verify form-check col-3">
      <input class="form-check-input" type="radio" name="isPhoto" id="isPhotoYes" value="yes"/>
      <label class="form-check-label" for="isPhotoYes">
        Yes
      </label>
    </div>
    <div class="verify form-check col-3 ml-2">
      <input class="form-check-input" type="radio" name="isPhoto" id="isPhotoNo" value="no" />
      <label class="form-check-label" for="isPhotoNo">
        No
      </label>
    </div>
    </div>
    <div class="col-md-12">
    <p class="verifyComments fw-bold col-6 text-left"> Proof of Identity (POI):  (Y/N)</p>
    <div class="verify form-check mb-2 col-3">
      <input class="form-check-input" type="radio" name="isPoi" id="isPoiYes" value="yes" />
      <label class="form-check-label" for="isPoiYes">
        Yes
      </label>
    </div>
    <div class="verify form-check mb-2 col-3 ml-2">
      <input class="form-check-input" type="radio" name="isPoi" id="isPoiNo" value="no" />
      <label class="form-check-label" for="isPoiNo">
        No
      </label>
    </div>
    </div>
    <div class="col-md-12" id="idMatching">
    <p class="verifyComments fw-bold col-6 text-left">Identity Status (ID Status): Matching/Not Matching</p>
    <div class="verify form-check mb-2 col-3">
      <input class="form-check-input" type="radio" name="isIdMatching" id="isIdMatchingYes" value="yes" />
      <label class="form-check-label" for="radioExample1">
        Yes
      </label>
    </div>
    <div class="verify form-check mb-2 col-3 ml-2">
      <input class="form-check-input" type="radio" name="isIdMatching" id="isIdMatchingNo" value="no" />
      <label class="form-check-label" for="radioExample2">
        No
      </label>
    </div>
    </div>
    <div class="col-md-12">
    <p class="verifyComments fw-bold col-6 text-left">Proof of Address (POA): (Y/N)</p>
    <div class="verify form-check mb-2 col-3">
      <input class="form-check-input" type="radio" name="isPoa" id="isPoaYes" value="yes" />
      <label class="form-check-label" for="radioExample1">
        Yes
      </label>
    </div>
    <div class="verify form-check mb-2 col-3 ml-2">
      <input class="form-check-input" type="radio" name="isPoa" id="isPoaNo" value="no"/>
      <label class="form-check-label" for="radioExample2">
        No
      </label>
    </div>
    </div>
    <div class="col-md-12" id="addressMatch">
    <p class="verifyComments fw-bold col-6 text-left">Address Status: Matching/Not Matching</p>
    <div class="verify form-check mb-2 col-3">
      <input class="form-check-input" type="radio" name="isPoaMatching" id="isPoaMatchingYes" value="yes" />
      <label class="form-check-label" for="radioExample1">
        Yes
      </label>
    </div>
    <div class="verify form-check mb-2 col-3 ml-2">
      <input class="form-check-input" type="radio" name="isPoaMatching" id="isPoaMatchingNo" value="no" />
      <label class="form-check-label" for="radioExample2">
        No
      </label>
    </div>
    </div>
    <div class="col-md-12">
    <p class="verifyComments fw-bold col-6 text-left">Customer Signature Status (Y/N)</p>
    <div class="verify form-check mb-2 col-3">
      <input class="form-check-input" type="radio" name="isSignature" id="isSignatureYes" value="yes" />
      <label class="form-check-label" for="radioExample1">
        Yes
      </label>
    </div>
    <div class="verify form-check mb-2 col-3 ml-2">
      <input class="form-check-input" type="radio" name="isSignature" id="isSignatureNo" value="no" />
      <label class="form-check-label" for="radioExample2">
        No
      </label>
    </div>
    </div>
        <div class="col-md-12">
    <p class="verifyComments fw-bold col-6 text-left">ID type</p>

    			<select class="form-select form-select-sm col-6" aria-label=".form-select-sm example" id="idType" style="width:45% !important;font-size: 1.333rem !important;">
    			<option>Aadhaar ( UIDAI )</option>
    			<option>Passport</option>
    			<option>INCOME TAX PAN Card (Permanent Account Number)</option>
    			<option>Voter ID / Election Commission ID card</option> 
    			<option>Driving License</option>
    			<option>Ration Card with Photo</option>
    			<option>Photo Bank ATM Card</option>
    			<option>Photo Credit Card</option>
    			<option>Marriage certificate with photograph</option>
    			<option>Smart card issued by CSD ( Canteen Store Department)</option>
    			<option>Identity card issued to employees by Central/State Government</option>
    			<option>GST Certificate containing Photo of the authorirsed signatory</option>
</select>
    	
    </div>
  </form>
  <div class="text-end">
   <span class="text-danger" id="verifyAlertMsg"></span> <button type="button" id="cafVerifyBtn" class="btn btn-primary">Submit</button>
  </div>
</div>
</div>


                

            </div>
            </div>
             <div class="cls" id="second">
                         <div class="card" style="height: 100% !important;]">
                <h5 class="text-center mb-4">Proof Verification</h5>
              
                   <form class="form-card" onsubmit="event.preventDefault()">

               
<div class="row">
    		<label for="pIdentity" class="col-sm-4 col-md-4 control-label">Proof of Address</label>
    		<div class="col-sm-7 col-md-7">
    			<div class="input-group">
    				<div id="radioBtn" class="btn-group">
    					<a class="cafvalidationcheck btn btn-primary btn-sm active" data-toggle="pIdentity" data-title="Y">YES</a>
    					<a class="cafvalidationcheck btn btn-primary btn-sm notActive" data-toggle="pIdentity" data-title="N">NO</a>
    				</div>
    				<input type="hidden" name="pIdentity" id="pIdentity">
    			</div>
    		</div>
    	</div>
    	<br/><br/><br/>
    	<div class="row">
    		<label for="pAddress" class="col-sm-4 col-md-4 control-label">Proof of Identity</label>
    		<div class="col-sm-7 col-md-7">
    			<div class="input-group">
    				<div id="radioBtn" class="btn-group">
    					<a class="cafvalidationcheck btn btn-primary btn-sm active" data-toggle="pAddress" data-title="Y">YES</a>
    					
    					<a class="cafvalidationcheck btn btn-primary btn-sm notActive" data-toggle="pAddress" data-title="N">NO</a>
    				</div>
    				<input type="hidden" name="pAddress" id="pAddress">
    			</div>
    		</div>
    	</div>
    	<br/><br/><br/>
    	<div class="row">
    		<label for="cafVerificationStatus" class="col-sm-4 col-md-4 control-label">Is the Caf verified successfully or not</label>
    		<div class="col-sm-7 col-md-7">
    			<div class="input-group">
    				<div id="cafVerifyradioBtn" class="btn-group">
    					<a class="cafvalidationcheck btn btn-primary btn-sm active" data-toggle="cafVerificationStatus" data-title="yes">YES</a>
    					
    					<a class="cafvalidationcheck btn btn-primary btn-sm notActive" data-toggle="cafVerificationStatus" data-title="no">NO</a>
    				</div>
    				<input type="hidden" name="cafVerificationStatus" id="cafVerificationStatus">
    			</div>
    		</div>
    	</div>
    	<br/><br/><br/>
    	    	<div class="row form-group" id="cafVerifyFailRemarksArea" >
    		<label for="pAddress" class="col-sm-4 col-md-4 control-label" style="float: left;">Remarks</label>
    		<div class="col-sm-7 col-md-7">
    			<select class="form-select form-select-sm" aria-label=".form-select-sm example" id="verificationStatus" style="width:auto">
</select>
    		</div>
    	</div>
    	<br/><br/></br>
 <div class="row form-group justify-content-end">
                        <div class="form-group col-sm-6"> <button id="verify" class="btn-block btn btn-success">Verify</button> </div>
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
                                        <div class="modal modal-lg" id="cafVerifyModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Caf Verification</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: right;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         
         
         <p class="modal-comments row" id="verifyCafFilled">&#8226; CAF is filled in all respect :</p>
<br>
<p class="modal-comments row mt-2" id="verifyCustomerPhoto">&#8226; Customer photo status :</p>
<br>
<p class="modal-comments row mt-2" id="verifyProofId">&#8226; Proof of identity :</p>
<p class="modal-comments row mt-2" id="verifyProofAddress">&#8226; Proof of Address :</p>
<p class="modal-comments row mt-2" id="verifySignature">&#8226; Customer signature status</p>
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
        <button type="button" class="btn btn-success" onclick="CourierAcknowledge()">OK</button>
        <button type="button" class="btn btn-secondary" id="cafVerifyCloseBtn" onclick="closeCafVerifyModal()">Close</button>
      </div>
      </div>
      
    </div>
  </div>
</div>
            </div>
        </div>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="resources/js/CafDetaila/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="resources/js/CafDetaila/jquery-validation/dist/additional-methods.min.js"></script>
    <script src="resources/js/CafDetaila/jquery-steps/jquery.steps.min.js"></script>
    <script src="resources/js/home/bootstrap/scripts.js"></script>
    <script src="resources/js/CafDetaila/nouislider/nouislider.min.js"></script>
    <script src="resources/js/CafDetaila/wnumb/wNumb.js"></script>
  <!--   <script src="resources/js/CafDetaila/main.js"></script> -->

   <script src="resources/js/CafVerify/CafDetails.js"></script>
   
      
    </body>
</html>