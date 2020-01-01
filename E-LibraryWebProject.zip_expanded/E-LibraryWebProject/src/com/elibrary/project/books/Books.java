package com.elibrary.project.books;

public class Books {
	private int id;
	private String name ;
	private String category;
	private String author;
	private String publisher;
	private String summary;
	public Books() {
		// TODO Auto-generated constructor stub
	}

	
	public Books( String name,String category , String author,  String publisher,
			String summary) {
		super();
		this.name= name;
		this.author = author;
		this.category = category;
		this.publisher = publisher;
		this.summary = summary;
	}
	public Books(int id, String name, String category ,String author,String publisher,
			String summary) {
		super();
		this.id = id;
		this.name= name;
		this.author = author;
		this.category = category;
		this.publisher = publisher;
		this.summary = summary;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public String getPublisher() {
		return publisher;
	}


	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}


	public String getSummary() {
		return summary;
	}


	public void setSummary(String summary) {
		this.summary = summary;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}
	
	
	
	
		
	

}

