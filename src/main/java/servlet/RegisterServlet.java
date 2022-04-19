package servlet;

import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.*;


@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();  
		
		String username = request.getParameter("usernamer");
		String email = request.getParameter("emailr");
		String password = request.getParameter("passwordr");
		String trackedstate = request.getParameter("trackedstater");
		String status = request.getParameter("statusr");
		String query1 = "insert into registervalues values(?,?,?,?,?);";
		String query2 = "select totalCases from regional_data where statename='"+ trackedstate +"';";
		String updateq = "update regional_data set totalCases = ? where statename='"+trackedstate+"';";
		
		try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
	         Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/databasename","userid","password");
	         PreparedStatement ps = conn.prepareStatement(query1);
	         ps.setString(1, username);
	         ps.setString(2, email);
	         ps.setString(3, password);
	         ps.setString(4, trackedstate);
	         ps.setString(5, status);
	         
	         int i = ps.executeUpdate();


	        if(i>0) {
	        	RequestDispatcher rd = request.getRequestDispatcher("loginsuccess.html");
				rd.forward(request,response);
	        }
	        else {
	        	RequestDispatcher rd = request.getRequestDispatcher("registerfail.html");
				rd.forward(request,response);
	        }
	        	
	        conn.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","Shaunis@sh33p");
	        PreparedStatement ps2 = con.prepareStatement(query2);
	        ResultSet rs = ps2.executeQuery();
	        rs.next();
	        Long total = rs.getLong("totalCases");
	        total = total + 1;
	        PreparedStatement ps3 = con.prepareStatement(updateq);
	        ps3.setLong(1, total);
	        ps3.executeUpdate();
	        
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
