package com.elibrary.project.controller;

import java.io.IOException;
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
import javax.swing.text.StyledEditorKit.BoldAction;
import com.elibrary.project.books.Books;
import javax.servlet.http.Part;
/**
 * Servlet implementation class WelcomeServlet
 */
public class SearchBookServlet extends HttpServlet {
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
	        
		String returnPage = "/home.jsp";
		String typeofBook = request.getParameter("type");
		String bookid = request.getParameter("id");
		String nameofBook = request.getParameter("search");
		String selectQuery = "SELECT * FROM tBOOK";
		if (nameofBook!=null) {
			selectQuery += " WHERE bookname='"+ nameofBook +"'";
		}
			if(typeofBook!=null){
				selectQuery += " WHERE category='"+ typeofBook +"'";
			
		}
		if(bookid!=null){
			returnPage = "/showbook.jsp";
			selectQuery += " WHERE id='"+ bookid +"'";
		}
		
		String openorDownload = request.getParameter("open");
		if(openorDownload!=null){
			returnPage = "/openordownload.jsp";
			request.setAttribute("openorDownload", openorDownload);
		}
	
	String message = "";
	try {
			ResultSet rs = statement.executeQuery(selectQuery);
			ArrayList<Books> booksList = new ArrayList<Books>();
			while(rs.next()){
				int id = rs.getInt(1);
				String title = rs.getString(2);
				String genre = rs.getString(3);
				String author= rs.getString(4);
				String publisher = rs.getString(5);
				String description = rs.getString(6);
				
				Books book = new Books(id, title,  genre, author ,publisher ,description);
				booksList.add(book);
			}
			request.setAttribute("BOOKS_LIST", booksList);
			
		} catch (SQLException e) {
			e.printStackTrace();	
		}catch (Exception e) {
		
			e.printStackTrace();
		}
	RequestDispatcher rd = request.getRequestDispatcher(returnPage);
	rd.forward(request, response);
	}

	}
