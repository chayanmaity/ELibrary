package com.elibrary.add.user;
import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;



public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String url = "jdbc:mysql://localhost:3306/userDB";
	private String user = "root";
	private String password ="";
	Connection con=null;
	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		// step 1 register driver
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("class Not found");
		}
		// step 2:create connection
		try {
			con = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			System.out.println("driver manager exception");
		}
		// step 3: create a statement

		/*try {
			pst = (PreparedStatement) con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/

	}

	public void destroy() {
		// TODO Auto-generated method stub
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fName = request.getParameter("fName");
		String surname = request.getParameter("surname");
		String userID = request.getParameter("userID");
		String passWord= request.getParameter("password");
		String emailID = request.getParameter("emailID");
		String securityQ=request.getParameter("securityQ");
		String securityA=request.getParameter("securityA");
		String insertQuery="INSERT INTO tUser(Name,Surname,UserName,Password,Email_ID,Question,Answer) VALUES (?,?,?,?,?,?,?)";
		PrintWriter out = response.getWriter();
		RequestDispatcher rd=null;
		try {
			if(fName!="" && surname!="" && userID!="" && passWord!="" && emailID!="" && securityQ!="" && securityA!=""){
			PreparedStatement pst = con.prepareStatement(insertQuery);
			pst.setString(1, fName);
	        pst.setString(2, surname);
	        pst.setString(3, userID);
			pst.setString(4, passWord);
			pst.setString(5, emailID);
		    pst.setString(6, securityQ);
		    pst.setString(7, securityA);
		    pst.execute();
		    rd=request.getRequestDispatcher("/login.jsp");
            rd.forward(request,response);}
			else{rd=request.getRequestDispatcher("/signUp.jsp");
			request.setAttribute("error5","Fill up all the required fields.");
			rd.forward(request, response);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			rd=request.getRequestDispatcher("/signUp.jsp");
			request.setAttribute("error6","This username already exists.");
			rd.forward(request, response);
			e.printStackTrace();
		}catch(Exception e){
			rd=request.getRequestDispatcher("/signUp.jsp");
			request.setAttribute("error6","This username already exists.");
			rd.forward(request, response);
			e.printStackTrace();
		}	   
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
