<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Materialize CSS text only template</title>

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="images/android-desktop.png">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Materialize CSS">
    <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">

    <link rel="shortcut icon" href="images/favicon.png">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
    <link rel="canonical" href="http://www.example.com/">
    -->

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
    <!-- <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="resources/css/home/styles.css">

 <link rel="stylesheet" href="resources/css/home/modal.css">    
    
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://unpkg.com/slick-loader/slick-loader.min.css">
<link rel="stylesheet" href="resources/css/home/ajaxTable.min.css">
    <style>
    #view-source {
      position: fixed;
      display: block;
      right: 0;
      bottom: 0;
      margin-right: 40px;
      margin-bottom: 40px;
      z-index: 900;
    }
    </style>
  </head>
  <body class="mdl-demo">
    <nav class="color-primary">
      <div class="nav-wrapper">
        <a href="#" class="brand-logo">Name &amp; Title</a>
      </div>
    </nav>  
<!--     <div class="tab-bar  color-primary--dark">
      <a href="#overview" class="layout__tab is-active">Overview</a>
      <a href="#features" class="layout__tab">Features</a>
      <a href="#features" class="layout__tab">Details</a>
      <a href="#features" class="layout__tab">Technology</a>
      <a href="#features" class="layout__tab">FAQ</a>
      <button class="btn-floating btn-large waves-effect waves-light red" id="add">
        <i class="material-icons" role="presentation">add</i>
        <span class="visuallyhidden">Add</span>
      </button>
    </div> -->
    <div class="container">
      <main class="mdl-layout__content">
        <div class="mdl-layout__tab-panel is-active" id="overview">
          <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
            <div class="card">
              <div class="row">
                <!-- <div class="col s4">
                  <header class="section__play-btn mdl-cell mdl-cell--3-col-desktop mdl-cell--2-col-tablet mdl-cell--4-col-phone mdl-color--teal-100 mdl-color-text--white">
                    <i class="material-icons">play_circle_filled</i>
                  </header>
                </div> -->
                <div class="col s12">
                  <div class="card-content">                  
                    <div class="row">
   <div class="col input-field col s4 m4 l4 " style>
    <select multiple id="rdropdown">
      <option value="" disabled selected>Select An option</option>
      
    </select>
    <label>Region</label>
  </div>
  <div class="col input-field col s4 m4 l4" style>
    <select multiple id="cdropdown">
     
    </select>
    <label>Center</label>
  </div>
  <!-- <div class="col input-field col s4 m4 l4" style>
    <select multiple>
      <option value="" disabled selected>Select An option</option>
      <option value="1">Item 1</option>
      <option value="2">Item 2</option>
      <option value="3">Item 3</option>
      <option value="4">Item 4</option>
      <option value="5">Item 5</option>
    </select>
    <label>Center ID</label>
  </div> -->
</div>                  </div>
                  <div class="card-action">
                    <a href="#" class="mdl-button" onclick="getCafs()">Search</a>
                  </div>
                </div>              
              </div>
            </div>                
          </section>
          <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
            <div class="row">
              <div class="col s12">
              <div class="card">
                <div class="card-content">
                  <h4 class="card-title">Details<i class="material-icons right">more_vert</i></h4>
                  <div class="row">
                    <div class="table-responsive col s12">
                      <table id="cafDetailsTab">
  <thead>
    <th>Caff ID</th>
    <th>Subscriber Code</th>
    <th>Subscriber Name</th>
    <th id="viewDetails"></th>
  </thead>
  <tbody>

  </tbody>
</table>
                      
                    </div>
                                   
                  </div>

                </div>
                <div class="card-action">
                  <a href="#" class="mdl-button">Read our features</a>
                </div>
              </div>                
              </div>
            </div>
          </section>
          <section class="section--center">
            <div class="row">
              <div class="col">
                <div class="card">
                  <div class="card-content">
                    <h4 class="card-title">Technology<i class="material-icons right">more_vert</i></h4>
                    <p>Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu. Nostrud in laboris labore nisi amet do dolor eu fugiat consectetur elit cillum esse. Pariatur occaecat nisi laboris tempor laboris eiusmod qui id Lorem esse commodo in. Exercitation aute dolore deserunt culpa consequat elit labore incididunt elit anim.</p>
                  </div>
                  <div class="card-action">
                    <a href="#" class="mdl-button">Read our features</a>
                  </div>
                </div>
              </div>
            </div>
          </section>
<!--           <section class="section--footer mdl-color--white mdl-grid">
            <div class="row">
              <div class="col s12 m6 testimonials">
                <div class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
                  <div class="section__circle-container__circle color-secondary section__circle--big"></div>
                </div>
                <div class="section__text mdl-cell mdl-cell--4-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone">
                  <h5>Lorem ipsum dolor sit amet</h5>
                  Qui sint ut et qui nisi cupidatat. Reprehenderit nostrud proident officia exercitation anim et pariatur ex.
                </div>
              </div>
              <div class="col s12 m6 testimonials">
                <div class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
                  <div class="section__circle-container__circle color-secondary section__circle--big"></div>
                </div>
                <div class="section__text mdl-cell mdl-cell--4-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone">
                  <h5>Lorem ipsum dolor sit amet</h5>
                  Qui sint ut et qui nisi cupidatat. Reprehenderit nostrud proident officia exercitation anim et pariatur ex.
                </div>                
              </div>
            </div>
          </section> -->
        </div>
        
         <div id="modal1" class="modal">
    <div class="modal-content">
                 <div class="card">
                <div class="row">
    <div class="col input-field input-outlined s6">
      <input placeholder="Placeholder" id="cafNo" type="text" >
      <label for="cafNo">Caf Number</label>
    </div>
    <div class="col input-field input-outlined s6">
      <input id="subcode" type="text">
      <label for="subcode">Subscriber Code</label>
    </div>
  </div>
   <div class="row">
    <div class="col input-field input-outlined s6">
      <input placeholder="Placeholder" id="subname" type="text">
      <label for="subname">Subscriber Name</label>
    </div>
    <div class="col input-field input-outlined s6">
      <input id="actvton" type="text">
      <label for="actvton">Activated On</label>
    </div>
  </div>
   <div class="row">
    <div class="col input-field input-outlined s6">
      <input  id="contactNo" type="text">
      <label for="contactNo">Contact Number</label>
    </div>
    <div class="col input-field input-outlined s6">
      <input id="email" type="text">
      <label for="email">Email</label>
    </div>
  </div>
  <div class="row">
    <div class="col input-field input-outlined s6">
      <input  id="address" type="text">
      <label for="address">Address</label>
    </div>
    <div class="col input-field input-outlined s6">
      <input id="status" type="text">
      <label for="status">Status</label>
    </div>
  </div>
            </div>
    </div>

  </div>
      </main>
    </div>
    <footer class="page-footer">
<!--       <div class="row">
        <div class="col s3">
          <input class="mdl-mega-footer--heading-checkbox" type="checkbox" checked>
          <h6 class="mdl-mega-footer--heading">Features</h6>
          <ul class="mdl-mega-footer--link-list">
            <li><a href="#">About</a></li>
            <li><a href="#">Terms</a></li>
            <li><a href="#">Partners</a></li>
            <li><a href="#">Updates</a></li>
          </ul>
        </div>
        <div class="col s3">
          <input class="mdl-mega-footer--heading-checkbox" type="checkbox" checked>
          <h6 class="mdl-mega-footer--heading">Details</h6>
          <ul class="mdl-mega-footer--link-list">
            <li><a href="#">Spec</a></li>
            <li><a href="#">Tools</a></li>
            <li><a href="#">Resources</a></li>
          </ul>
        </div>
        <div class="col s3">
          <input class="mdl-mega-footer--heading-checkbox" type="checkbox" checked>
          <h6 class="mdl-mega-footer--heading">Technology</h6>
          <ul class="mdl-mega-footer--link-list">
            <li><a href="#">How it works</a></li>
            <li><a href="#">Patterns</a></li>
            <li><a href="#">Usage</a></li>
            <li><a href="#">Products</a></li>
            <li><a href="#">Contracts</a></li>
          </ul>
        </div>
        <div class="col s3">
          <input class="mdl-mega-footer--heading-checkbox" type="checkbox" checked>
          <h6 class="mdl-mega-footer--heading">FAQ</h6>
          <ul class="mdl-mega-footer--link-list">
            <li><a href="#">Questions</a></li>
            <li><a href="#">Answers</a></li>
            <li><a href="#">Contact us</a></li>
          </ul>
        </div>
      </div> -->
      <div class="footer-copyright">
        <div class="">
        © 2014 Copyright Text
        <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
        </div>
      </div>
    </footer>
    <a href="" target="_blank" id="view-source" class="btn">View Source</a>
  </body>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- bootstrap js -->
<!-- <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script> -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"></script>

<script type="text/javascript" src="resources/mat/js/materialize.min.js"></script>

<script type="text/javascript" src="https://unpkg.com/slick-loader/slick-loader.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/csvexporter/csvExport.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/jquery-excel-exporter/excel-export.min.js"></script>
<script type="text/javascript" src="resources/js/home/ajaxTable.js"></script>
<script type="text/javascript" src="resources/js/home/home.js"></script>

```

</html>
