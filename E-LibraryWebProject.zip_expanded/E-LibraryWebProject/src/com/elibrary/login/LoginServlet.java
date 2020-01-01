package com.elibrary.login;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String url = "jdbc:mysql://localhost:3306/userDB";
	private String user = "root";
	private String password ="";
	Connection con=null;
   Statement st=null;
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

				try {
					st = con.createStatement();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id="";
		String userName=request.getParameter("userName");
		String passWord=request.getParameter("password");
		PrintWriter out = response.getWriter();
		RequestDispatcher rd=null;
		ResultSet rs=null;
		String usersql="select * from tUser";
		
			try {
				//DriverManager.registerDriver(new com.mysql.jdbc.Driver());
				//con = DriverManager.getConnection(url, user, password);
				//PreparedStatement ust = con.prepareStatement(usersql);
				if(userName!="" && passWord!=""){
				rs=st.executeQuery(usersql);
				while(rs.next()){
					if((rs.getString(3)).compareTo(userName)==0 && (rs.getString(4)).compareTo(passWord)==0){
					id="Welcome "+rs.getString(1)+" "+rs.getString(2);
					rd=request.getRequestDispatcher("/HomeServlet");
					request.setAttribute("welcome",id);
					rd.forward(request, response);
					//out.print(id+" is logged in");
					}
								
					
				}
				if(id=="")
				{
					rd=request.getRequestDispatcher("/login.jsp");
					request.setAttribute("error8","Incorrect User Name or Password.");
					rd.forward(request, response);
				}
					
				}else{
					rd=request.getRequestDispatcher("/login.jsp");
					request.setAttribute("error7","Fill up all the required fields." );
					rd.forward(request, response);
				}
				
				
					
				/* *if(id!=null)
				{
					String passsql="select Password from tUser where UserName='"+id+"'";
					//PreparedStatement pst = con.prepareStatement(passsql);
					rs=st.executeQuery(passsql);
					if(){
					//out.print("logged in");
						rd=request.getRequestDispatcher("/signUp.jsp");
		            rd.forward(request,response); 
					}	
					else 
						out.print("error");}
				else
					out.print("error");*/
				}
			 catch (SQLException e) {
				// TODO Auto-generated catch block
				 rd=request.getRequestDispatcher("/login.jsp");
					request.setAttribute("error8","Incorrect User Name or Password.");
					rd.forward(request, response);
				e.printStackTrace();
			}catch(Exception e){
				rd=request.getRequestDispatcher("/login.jsp");
				request.setAttribute("error8","Incorrect User Name or Password.");
				rd.forward(request, response);
				e.printStackTrace();
			}	   
			
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public void destroy() {
		// TODO Auto-generated method stub
		try {
			con.close();
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}


}
