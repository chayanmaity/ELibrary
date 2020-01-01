package com.elibrary.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.elibrary.project.books.Books;

/**
 * Servlet implementation class WelcomeServlet
 */
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String url = "jdbc:mysql://localhost:3306/booksDB";
	private String user = "root";
	private String password ="";   
	Connection con=null;
	Statement statement=null;
	
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// STEP 1 - REGISTER THE DRIVER
		
					try {
						Class.forName("com.mysql.jdbc.Driver");
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					}
					
				
					// step 2:create connection
					try {
						con = DriverManager.getConnection(url, user, password);
					} catch (SQLException e) {
						System.out.println("driver manager exception");
					}
					// step 3: create a statement

							try {
								statement = con.createStatement();
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}	
				}
	public void destroy() {
			try {
				con.close();
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			doGet(request, response);
	
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String selectQuery = "SELECT * FROM tBOOK";
		
	
	String message = "";
	try {
			ResultSet rs = statement.executeQuery(selectQuery);
			ArrayList<Books> booksList = new ArrayList<Books>();
			while(rs.next()){
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String category = rs.getString(3);
				String author= rs.getString(4);
				
				String publisher = rs.getString(5);
				String summary = rs.getString(6);
				
				Books book = new Books(id, name, category, author, publisher, summary);
				booksList.add(book);
			}
			request.setAttribute("BOOKS_LIST", booksList);
			RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
			request.setAttribute("w1", request.getAttribute("welcome"));
			rd.forward(request, response);
		} catch (SQLException e) {
			RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
			rd.forward(request, response);
		}catch (Exception e) {
			RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
			rd.forward(request, response);
		}

	

	}

}
