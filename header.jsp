<%@page import="com.util.db.DataAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
DataAccess db=new DataAccess();
String msg="",search="",icon="success";
if(request.getParameter("btnsearch")!=null){
	search=request.getParameter("txtsearch");
	session.setAttribute("search",search);
	response.sendRedirect("/airline/airlineschedules.jsp?q="+search);
	//Redirects or moves from one page to another page (State lost)
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Airline Reservation System::</title>
<link href="/airline/css/bootstrap.css" rel="stylesheet"/>
<link href="/airline/js/DataTables/datatables.css" rel="stylesheet"/>

<style>
label.error{
color:red;
font-weight:bold;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-primary" style="border-bottom:2px solid yellow" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="/airline/index.jsp">
    <img src="/airline/images/logo.jpg" class="rounded-circle" width="100px" height="60px' alt="NA"/>
    AIRLINE RESERVATION
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
      <%
      if(session.getAttribute("user")==null) //if No login
      {      
      %>
        <li class="nav-item">
          <a class="nav-link active" href="/airline/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>        
        <li class="nav-item">
          <a class="nav-link" href="/airline/flightschedules.jsp">Flight Schedules</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/airline/about.jsp">About Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/airline/contact.jsp">Contact Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/airline/feedback.jsp">Feedback</a>
        </li>        
       <%
       }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("admin")){
       %> 
       <li class="nav-item">
          <a class="nav-link active" href="/airline/admin/admin.jsp">Admin
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/airline/admin/locations.jsp">Locations</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/airline/admin/flight.jsp">FlightInfo</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/airline/admin/flightschedules.jsp">FlightSchedules</a>
        </li>        
        <li class="nav-item">
          <a class="nav-link" href="/airline/admin/reservations.jsp">Bookings</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/airline/admin/feedbacks.jsp">Feedbacks</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/airline/admin/customerList.jsp">Customers</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/airline/admin/reportlist.jsp">Reports</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/airline/admin/changepass.jsp">Change Password</a>
        </li>        
       <%
       }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("customer")){
       %>
       <li class="nav-item">
          <a class="nav-link active" href="/airline/user/user.jsp">Customer
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/airline/flightschedules.jsp">Flight Schedules</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/airline/user/reservations.jsp">Reservations</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/airline/changepass.jsp">Change Password</a>
        </li>
        
       <%
       }
       %>
      </ul>
      <%
      if(session.getAttribute("user")==null || (session.getAttribute("user")!=null && session.getAttribute("type").equals("customer")) ) //if No login
      {      
      %>
      <form class="d-flex" method="post">
        <input class="form-control me-sm-2" type="search" name="txtsearch" placeholder="Search Flight Schedule" value="<%=session.getAttribute("search")==null?"":session.getAttribute("search")%>"/>
        <button class="btn btn-secondary my-2 my-sm-0" type="submit" name="btnsearch" value="Search">Search</button>
      </form>
      <%
      }
      %>
      <%
      if(session.getAttribute("user")==null){
      %>
      <ul class="navbar-nav float-right">
      <li class="nav-item">
          <a class="nav-link" href="/airline/login.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/airline/signup.jsp">Signup</a>
        </li>
      </ul>
      <%
      }else{
      %>
      <ul class="navbar-nav float-right">
      <li class="nav-item">
          <a class="nav-link" href="#"><%=session.getAttribute("user")%></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/airline/logout.jsp">Logout</a>
        </li>
      </ul>
      <%
      }
      %>
    </div>
  </div>
</nav>
