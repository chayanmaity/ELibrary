package com.elibrary.project.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig( fileSizeThreshold = 1024 * 1024,
maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class UploadBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String url = "jdbc:mysql://localhost:3306/booksDB";
	private String user = "root";
	private String password ="";   
	Connection con=null;
	PreparedStatement statement=null;
	
	PreparedStatement statement1=null;
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

	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			doGet(request, response);
		
        
		
	}
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// gets values of text fields
	    	 
			String title =request.getParameter("title");
	    	 String author = request.getParameter("author");
	    	 String genre = request.getParameter("genre");
	    	 String publisher = request.getParameter("publisher");
	    	 String description = request.getParameter("description");

	    	 System.out.println(title);
	    	 System.out.println(author);
	    	 System.out.println(genre);
	    	 InputStream inputStream1 = null;
	    	 InputStream inputStream = null; // input stream of the upload file
	    	 Part filePart1 = request.getPart("file");
	    	 Part filePart=request.getPart("bookfile");
	        String insertBookSql = "INSERT INTO tBOOK (bookname, category,author, PUBLISHER, summary,display) " +
	        		" values (?,?,?,?,?,?)";
	       
	       
	         
	        String message11 = null;  // message will be sent back to client
	         
	        try {
	            if(title!="" && genre!="" && author!="" && publisher!="" && description!="" && filePart.getSize()!=0 && filePart1.getSize()!=0){
	            	statement = con.prepareStatement(insertBookSql);
		            statement.setString(1, title);
		            statement.setString(2, genre);
		            statement.setString(3, author);
		            statement.setString(4, publisher);
		            statement.setString(5, description);
		           
			        
			        System.out.println(filePart1.getName());
//			        InputStream fileContent = filePart.getInputStream();
			        
			            // prints out some information for debugging
			            System.out.println(filePart1.getName());
			            System.out.println(filePart1.getSize());
			            System.out.println(filePart1.getContentType());
			             
			            inputStream1= filePart1.getInputStream();
			        
			            
			            statement.setBlob(6, inputStream1);
	                	statement.executeUpdate();
		            
		            
		            System.out.println(filePart.getName());
//		            InputStream fileContent = filePart.getInputStream();
		           
		                // prints out some information for debugging
		                System.out.println(filePart.getName());
		                System.out.println(filePart.getSize());
		                System.out.println(filePart.getContentType());
		                
		                inputStream = filePart.getInputStream();
		            
	                	String idSelect = "select id from tbook where bookname = '"+title+"'";
	                	
	                	Statement st = con.createStatement();
	                	ResultSet rs = st.executeQuery(idSelect);
	                	int bookid =0;
	                	if(rs.next()){
	                		bookid = rs.getInt(1);
	                	}
	                	
	                	System.out.println(bookid);
	                	String inserPDFSql = "INSERT INTO tPDF" +
	                						" values (?,?,?)";
	                	
	                	statement1 = con.prepareStatement(inserPDFSql);
	                	
	                	statement1.setInt(1, bookid);
	                	statement1.setBlob(2, inputStream);
	                	statement1.setString(3, filePart.getContentType());
	                	statement1.executeUpdate();
	                	
	                	message11 = "Book is now uploaded successfully..";}
	                
	     
	                
	            
	            
	            else {
	            	message11 = "Fill up all the required fields.";
	            }
	                
	            
	        
	            
	         // sets the message in request scope
	            request.setAttribute("message5", message11);
	             
	            // forwards to the message page
	            request.getRequestDispatcher("/uploadbook.jsp").forward(request, response);
	        } catch (SQLException ex) {
	            message11 = "ERROR: " + ex.getMessage();
	            // sets the message in request scope
	            request.setAttribute("message5", message11);
	            request.getRequestDispatcher("/uploadbook.jsp").forward(request, response);
	            ex.printStackTrace();
	        } 
	    
		}
}
