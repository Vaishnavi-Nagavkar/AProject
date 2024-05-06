<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String sql="select * from BusSchedules";
String filter="";
if(request.getParameter("q")!=null){
	sql=sql+" From1 like '%"+ request.getParameter("q")+"%' or  To1 like '%"+ request.getParameter("q")+"%'";
	if(!request.getParameter("q").equals(""))
	filter="Filter Results for "+  request.getParameter("q");
}
%>
<div class="col-12">
<br/>
<h3>Browse Flight Schedules:: <%=filter %></h3>
<br/>
<br/>
<table id="table1" class="table table-bordered">
<thead class="table-dark">
<thead class="table-dark">
<tr>
<th>Id</th>
<th>Date</th>
<th>FlightType</th>
<th>FlightNo</th>
<th>FlightName</th>
<th>Source</th>
<th>Destination</th>
<th>Departure</th>
<th>ETA</th>
<th>Return</th>
<th>EcoFare</th>
<th>BusinFare</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from ScheduleView");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(8) %></td>
<td><%=rs.getString(9) %></td>
<td><%=rs.getString(10) %></td>
<td><%=rs.getString(11) %></td>
<td><%=rs.getString(12) %></td>
<td>
<a href="/airline/user/reserve.jsp?pid=<%=rs.getString(1) %>" class="btn btn-info">Reserve</a>
</td>
</tr>

<%
}
%>

</tbody>
</table>
</div>

<%@ include file="../footer.jsp"%>
<script>
$(function(){
	$("#table1").DataTable(); //Apply DataTable library on Table whose ID is table1
});
</script>