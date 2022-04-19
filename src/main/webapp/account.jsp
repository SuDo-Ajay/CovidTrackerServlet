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
    </head>
	<body>
	<% 
    	String name = session.getAttribute("user").toString();
		String query = "select * from registervalues where username='"+name+"';";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/databasename","userid","password");
		    PreparedStatement ps = conn.prepareStatement(query);

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
			<h3>Welcome <%=name %> ! ! !</h3>
		</div>
				<%
			ResultSet rs = ps.executeQuery();
			rs.next();
			String track = rs.getString("trackedstate");
			String email = rs.getString("email");
			String status = rs.getString("infected");

		%>
	<main>
	<section class = "account-glass">
		<div class = "account-info">
			<h3>Name : <%= name %></h3>
            <h3>E-Mail : <%= email %></h3>
            <h3>Tracked State : <%= track %> </h3>
            <h3>Infected : <%=status %></h3>
             <%
            status = session.getAttribute("infectedstatus").toString();
             %>
             <%
             if(status.equals("Yes")) {
             %>
            <h3>Recovered from Corona ? Click below to change Status</h3>
            
            	<form name=Account action=StatusChange method="POST">
					<input type="submit" value="Cured" name="register"  />
				</form>
				<%
             }else {
				%>
		</div>
	</section>
	</main>
    </body>
</html>

<%
             }
		}
		catch(Exception e) {
			System.out.println(e);
		}
		%>

