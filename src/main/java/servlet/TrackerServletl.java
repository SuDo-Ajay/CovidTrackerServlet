package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import java.sql.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

//<img src="${pageContext.request.contextPath}/images/hazmat.png" />


@WebServlet(name = "TrackerServlet", urlPatterns = {"/TrackerServlet"})

public class TrackerServletl extends HttpServlet {
	private static final long serialVersionUID = 123847189L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrackerServletl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
		String statename =  request.getParameter("statename");
		String state = request.getParameter("statename");
		String query = "Select * from regional_data having statename = '" +state+ "';";
		Boolean status = false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/databasename","userid","password");
	        PreparedStatement ps = con.prepareStatement(query);
	        ResultSet r = ps.executeQuery();
	        status = r.next();
	        
	        if(status) {
	        	RequestDispatcher rd = request.getRequestDispatcher("resultl.jsp");
				rd.forward(request,response);
	        }
	        else {
	        	RequestDispatcher rd = request.getRequestDispatcher("resulterrorl.jsp");
				rd.forward(request,response);
	        }
	        
			
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
