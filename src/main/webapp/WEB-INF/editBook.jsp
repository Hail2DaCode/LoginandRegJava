<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Share</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class = "super">
		<h2>Change your Entry</h2>
		<p><a href = "/books">back to the shelves</a></p>
		<form:form class="form" action="/books/${ book.id }" method = "put" modelAttribute="book">
		<div class="add" id = "add1">
			<form:label path="title">Title</form:label>
			<form:errors class="error" path = "title"/>
			<form:input path="title"/>
		</div>
		<div class="add" id = "add2">
			<form:label path="author">Author</form:label>
			<form:errors class="error" path = "author"/>
			<form:input path="author"/>
		</div>
		<div class="add" id = "add3">
			<form:label path="opinion">My Thoughts</form:label>
			<form:errors class="error" path = "opinion"/>
			<form:textarea path="opinion"  rows="5" columns = "30"/>
		</div>
		<div class = "add" id = "add5">
			<form:input type = "hidden" path = "borrower" value = "${book.borrower.id}"/>
			<input class="btn" id ="submit" type = "submit" value="Submit"/>
		</div>
	</form:form>
	<form:form action = "/books/${book.id }/delete" method = "get" id = "deleteForm" class="deleteForm" modelAttribute = "book">
		<input class = "btn" type = "submit" value = "Delete">
	</form:form>
	</div>
</body>
</html>