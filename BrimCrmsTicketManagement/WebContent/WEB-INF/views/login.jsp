<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

<head>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<meta charset="ISO-8859-1">
<meta name="viewport" content="initial-scale=1.0, width=device-width">
<title>BrimCrmsTicketManagement</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
<style type="text/css">
/* body { min-height: 100vh; } */
html, body {
  height: 100%;
}
</style>
</head>
<body>
<div class="container-fluid">
  <div class="section"></div>

   
    <center>
     
      <div class="section"></div>

      <h5 class="indigo-text">Please, login into your account</h5>
      <div class="section"></div>

      <div class="container-fluid">
        <div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">

          <form class="col s12" method="post">
            <div class='row'>
              <div class='col s12'>
              </div>
            </div>

            <div class='row'>
              <div class='input-field col s12'>
                <input class='validate' type='text' name='username' id='username' />
                <label for='username'>Enter your Username</label>
              </div>
            </div>

            <div class='row'>
              <div class='input-field col s12'>
                <input class='validate' type='password' name='password' id='password' />
                <label for='password'>Enter your password</label>
              </div>
              <label style='float: right;'>
								<a class='pink-text' href='#!'><b>Forgot Password?</b></a>
							</label>
            </div>

            <br />
             <%
             if(!request.getParameterMap().containsKey("error")){
            	 
             }
             String var1="false";
if(request.getParameterMap().containsKey("error")){
	 var1 = request.getParameter("error");
             }
             
           System.out.println(var1);
                if(var1.equals("true"))
                {
            %>
                  <div style="color:red;margin:10px 0px;">
                Login Failed!!!<br />
                Reason :  Bad Credentials
                
         </div>
                
           <%
                }
             %>
            
             
        
       
           
            <center>
              <div class='row'>
                <button type='submit' name='btn_login' class='col s12 btn btn-large waves-effect indigo'>Login</button>
              </div>
            </center>
          </form>
        </div>
      </div>
      <a href="#!">Create account</a>
    </center>

    <div class="section"></div>
    <div class="section"></div>
       
  <footer class="page-footer  light-blue darken-3  z-depth-5">
          
          <div class="footer-copyright  light-blue darken-3">
            <div style="margin-left:10px" class="container pull-left">
            © 2020 Asianet Satellite Communications Pvt Ltd.
            
            </div>
            <a style="margin-right:20px" class="grey-text text-lighten-4 pull right" >Powered By Asianet</a>
          </div>
        </footer>
</div>

  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
</body>

</html>