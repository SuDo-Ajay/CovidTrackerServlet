package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class LoginServlet
 */

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		String username = request.getParameter("usernamel");
		String password = request.getParameter("passwordl");
		String query = "select * from registervalues having username=? and password=?;";
		Boolean status = false;
		
		try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
	         Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/#databasename","userid","password");
	         PreparedStatement ps = conn.prepareStatement(query);
	         ps.setString(1, username);
	         ps.setString(2, password);
			 ResultSet r = ps.executeQuery();

			 status = r.next();
			 
			 if(status) {
				 RequestDispatcher rd = request.getRequestDispatcher("dashboardlanding.jsp");
				 rd.forward(request,response);
			 }
			 else {
				 RequestDispatcher rd = request.getRequestDispatcher("loginfailed.html");
				 rd.forward(request,response);
			 }
	        	
	        conn.close();
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
