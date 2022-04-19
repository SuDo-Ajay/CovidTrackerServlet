<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import = "java.sql.*" %>
<%@page import = "java.sql.*" %>
<%

String name = session.getAttribute("user").toString();
String query1 = "update registervalues set infected = 'No' where username='"+name+"';";
String state = session.getAttribute("userstate").toString();
String query2 = "select * from regional_data where statename='"+state+"';";
String updatequery1 = "update regional_data set totalCases = ? where statename='"+state+"';";
String updatequery2 = "update regional_data set recoveries = ? where statename='"+state+"';";

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/databasename","userid","password");
    PreparedStatement ps = conn.prepareStatement(query1);
    ps.executeUpdate();
    Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/databasename","userid","password");
    PreparedStatement ps2 = conn1.prepareStatement(query2);
    ResultSet rs = ps2.executeQuery();
    rs.next();
    Long cases = rs.getLong("totalCases");
    Long recovery = rs.getLong("recoveries");
    cases = cases - 1;
    recovery = recovery + 1;
    PreparedStatement ps3 = conn1.prepareStatement(updatequery1);
    ps3.setLong(1,cases);
    ps3.executeUpdate();
    PreparedStatement ps4 = conn1.prepareStatement(updatequery2);
    ps4.setLong(1,recovery);
    ps4.executeUpdate();
    String newstatus = "No";
    session.setAttribute("infectedstatus",newstatus);
}
catch(Exception e) {
	System.out.println(e);
}
	

%>
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
            
            	<form>
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

