<!DOCTYPE HTML>
<%@page import="dto.Series"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%	session.setAttribute("menu", new String("series")); %>
<%
	request.getRequestDispatcher("/router?seriesAction=getAll").include(request,response);
	Object[] series = (Object[]) session.getAttribute("seriesList");
	session.removeAttribute("seriesList");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Search</title>
		<jsp:include page="headerLinks.jsp"/>
		
		<!-- Loading Filters -->
		<script type="text/javascript" src="scripts/jquery-1.6.1.min.js"></script>
		<script type="text/javascript" src="scripts/picnet.table.filter.min.js"></script>
		<script type="text/javascript" src="scripts/searchFilter.js"></script>
	</head>
	<body>
	
		<div class="container">
			<jsp:include page="menu.jsp" />
			<div class="searchControls">
				<div style="float:left;">
					Quick Find: 
					<input type="text" id="quickFind">
				</div>
				
				<div style="clear: left; float: left; margin-top: 20px;">
					<form name = selectForm method="post">
						Hidden Field: <input type="text" id="hiddenYearField" name="hiddenYearField"/>
						Select
						
						<select size="1" name="selectYear" onchange="refreshFilter();" target="_parent._top"
								onmouseclick="this.focus()">
							<option selected value="Select Year">Select year</option>
							<option value="2000">2000</option>
							<option value="2001">2001</option>
						</select>
					</form>
				</div>
				
				<div>
					<form name="mainform">

						<p>
						<select name="file" size="1" onchange="PrintValues();"  target="_parent._top"
						        onmouseclick="this.focus()">
						  <option value="Joe,Yin">First Option</option>
						
						  <option value="Hi,Me">Second Option</option>
						</select>
						
						<input name="result">
						
						</form>
				
				</div>
				
				
			</div>	
			<div class="contents">
				<table id= "searchTable">
					<thead>
						<tr>
							<th filter="false">Name</th>
							<th filter="false">Year</th>
							<th filter="false">Network</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int i = 0; i < series.length; i++) {
								Series s = (Series) series[i];
						%>
							<tr>
								<td>
									<a href="linkControl?link=getSeriesById&id=<%=s.getId()%>"><%=s.getName()%></a>
								</td>
								<td><%=s.getAnoInicial()%></td>
								<td><%=s.getNetwork() %></td>
							</tr>
						<%}%>
					</tbody>
				</table>
			</div>		
							
		</div>
		<jsp:include page="footer.jsp" />
	
	</body>
</html>