<%@page import="java.time.LocalDate"%>
<br/>
<br/>
<br/>
<nav class="navbar navbar-expand-lg bg-primary fixed-bottom" style="marigin-top:200px" data-bs-theme="dark">
  <div class="container-fluid">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="#">&copy; <%=LocalDate.now().getYear() %> All rights reserved by Students            
          </a>
        </li>        
        </ul>
        </div>
        </nav>

<script src="/airline/js/sweetalert.min.js"></script>
<script src="/airline/js/jquery-3.6.0.js"></script>
<script src="/airline/js/DataTables/datatables.js"></script>
<script src="/airline/js/bootstrap.js"></script>
<script src="/airline/js/jquery.validate.js"></script>
<script src="/airline/js/additional-methods.js"></script>
<%
if(!msg.equals(""))
{
%>
<script>
swal("Airline Reservation System","<%=msg%>","<%=icon%>");
</script>
<%
}
%>
</body>
</html>