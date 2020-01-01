package com.elibrary.login.password.retrieve;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class PasswordServlet extends HttpServlet {
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
		
		String SQ=request.getParameter("pSecurityQ");
		String SA=request.getParameter("pSecurityA");
		String eid=request.getParameter("eID");
		PrintWriter out = response.getWriter();
		RequestDispatcher rd=null;
		RequestDispatcher rs1=null;
		ResultSet rs=null;
		String sql="select * from tUser";
		
		
			try {
				//DriverManager.registerDriver(new com.mysql.jdbc.Driver());
				//con = DriverManager.getConnection(url, user, password);
				//PreparedStatement ust = con.prepareStatement(usersql);
				if(eid!="" && SQ!="" && SA!=""){
				rs=st.executeQuery(sql);
				while(rs.next()){
					if((rs.getString(6)).compareTo(SQ)==0 && (rs.getString(7)).compareToIgnoreCase(SA)==0 && (rs.getString(5)).compareTo(eid)==0){
						//rd=request.getRequestDispatcher("/NewPasswordServlet");
						//request.setAttribute("email",eid);
						rd=request.getRequestDispatcher("/newPassword.jsp");
						request.setAttribute("email",eid);
						rd.forward(request, response);
					//rs1.forward(request,response);
					}}
				if(rd==null){
					rd=request.getRequestDispatcher("/passwordRetrieval.jsp");
					request.setAttribute("error1","Wrong data entered.");
					rd.forward(request, response);
					}
				}else{
						rd=request.getRequestDispatcher("/passwordRetrieval.jsp");
						request.setAttribute("error","Fill up all the required fields");
						rd.forward(request, response);
					}
				
					
				}
				
				
				//else
					///out.print(id+" is logged in");
					
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
				
			 catch (SQLException e) {
				// TODO Auto-generated catch block
				 rd=request.getRequestDispatcher("/passwordRetrieval.jsp");
					request.setAttribute("error1","Wrong data entered.");
					rd.forward(request, response);
				e.printStackTrace();
			}catch(Exception e){
				rd=request.getRequestDispatcher("/passwordRetrieval.jsp");
				request.setAttribute("error1","Wrong data entered.");
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
