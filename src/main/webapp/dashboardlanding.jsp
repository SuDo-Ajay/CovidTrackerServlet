<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import = "java.sql.*" %>
<%@page import = "java.sql.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tracker Page</title>
		<link rel="preconnect" href="https://fonts.gstatic.com">
    	<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
        <link rel = "stylesheet" href="./styles.css"/>
      	<link rel="stylesheet" href="charts.min.css">
    </head>
	<body>
	<% 
    	String name = request.getParameter("usernamel").toString();
		session.setAttribute("user", name);
		String query1 = "select * from registervalues where username='"+name+"';";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/databasename","userid","password");
		    PreparedStatement ps = conn.prepareStatement(query1);
		    ResultSet r1 = ps.executeQuery();
		    r1.next();
		    String track = r1.getString("trackedstate");
		    String status = r1.getString("infected");
		    session.setAttribute("user", name);
		    session.setAttribute("infectedstatus", status);

			%>
			
			<div class = "Header">
			<p>Covid Case Tracker - India</p>
			<div class="Header-Right">
				<a class="Active" href="./">Logout</a>
				<a class="Active" href="./account.jsp"><%= name %></a>
				<a class="Active" href="./indexl.jsp">Tracker</a>
				<a class="Active" href="./dashboard.jsp">Dashboard</a>
			</div>
		</div>
		<div class="Logo-Circle">
			<div class="Logo">
				<img width=60 src="test-tube.png" usemap="#image-map" />
			</div>
		</div>
		<div class="Main-Text">
			<h2>Covid Tracker - India<br></h2>
			<h3>Welcome <%= name %> ! ! !</h3>
			<h3> Infected : <%=status %></h3>
		</div>
	<main>
	<section class = "dashboard-glass">
		<div class = "dashboard-info">
		<%
			ResultSet rs = ps.executeQuery();
			rs.next();
			String tracked = rs.getString("trackedstate");
			session.setAttribute("userstate",tracked);
			conn.close();

		%>
			
			<h2>Tracked State : <%= tracked %></h2>
			<%
		}
		catch(Exception e) {
			System.out.println(e);
		}
		%>
		
		<%
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/databasename","userid","password");
		String tracked = session.getAttribute("userstate").toString();
		String query2 = "select * from regional_data where statename='"+tracked+"';";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		    PreparedStatement ps = conn.prepareStatement(query2);
			ResultSet r2 = ps.executeQuery();
			r2.next();
			
			long totalCases = r2.getLong("totalCases");  
            long recoveries = r2.getLong("recoveries");
            long deaths = r2.getLong("deaths");  
		%>
            <h2>Informatics :</h2>
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
	<div class = "circle1"></div>
	<div class = "circle2"></div>
    </body>
</html>
<%
		}
		catch(Exception e) {
			System.out.println(e);
		}
%>
		

    

