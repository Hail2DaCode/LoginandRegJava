<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h2>Add a Book to your Shelf</h2>
		<p><a href = "/books">back to the shelves</a></p>
		<form:form class="form" action="/new/Book" method = "post" modelAttribute="book">
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
			<form:input type = "hidden" path = "user" value = "${id}"/>
			<input class="btn" id ="submit" type = "submit" value="Add"/>
		</div>
	</form:form>
	</div>
</body>
</html>