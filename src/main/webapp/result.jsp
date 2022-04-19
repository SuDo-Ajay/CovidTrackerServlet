<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import = "java.sql.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tracker Page</title>
		<link rel="preconnect" href="https://fonts.gstatic.com">
    	<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="charts.min.css">
        <link rel = "stylesheet" href="./styles.css"/>
    </head>
	<body>
		<div class = "Header">
			<p>Covid Case Tracker - India</p>
			<div class="Header-Right">
				<a class="Active" href="./register.html">Account</a>
				<a class="Active" href="./index.html">Tracker</a>
			</div>
		</div>
		<div class="Logo-Circle">
			<div class="Logo">
				<img width=60 src="test-tube.png" usemap="#image-map" />
			</div>
		</div>
		<%
		String state = request.getParameter("statename");
		String query = "Select * from regional_data having statename = '" +state+ "';";
		%>
		<div class="Main-Text">
			<h2>Covid Tracker - India<br></h2>
			<h2><%=state %> Results</h2>
		</div>
	<main>
	<section class = "result-glass">
		<div class = "result-info">
		<%
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/databasename","userid","password");
		    PreparedStatement ps = conn.prepareStatement(query);
			ResultSet r = ps.executeQuery();
			r.next();
			
			long totalCases = r.getLong("totalCases");  
            long recoveries = r.getLong("recoveries");
            long deaths = r.getLong("deaths");  
		%>
			<table class="charts-css bar show-labels data-spacing-20" id="case-chart">
                <caption> Case Count, Deaths and Recovered Informatics</caption>
                <tr>
                    <th scope="Total-cases"> Total Cases </th>
                    <td style="--size: calc(<%=totalCases %>/8000000); --color: grey"><%=totalCases %></td>
                </tr>
                <tr>
                    <th scope="Recoveries"> Recovery </th>
                    <td style="--size: calc(<%=recoveries %>/8000000); --color: green"><%=recoveries %></td>
                </tr>
                <tr>
                    <th scope="Deaths"> Deaths </th>
                    <td style="--size: calc(<%=deaths %>/300000); --color: black"><%=deaths %></td>
                </tr>
            </table>
		</div>
	</section>
	</main>
    </body>
</html>
<%
		}
		catch(Exception e) {
			System.out.println(e);
		}
%>

