<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Read Share</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="super">
		<div class = "row">
			<h1><c:out value="${book.title }"/></h1>
			<p><a href = "/books">back to the shelves</a></p>
		</div>
		<c:choose>
			<c:when test = "${book.user.userName == name }">
				<p>You read <c:out value="${book.title }"/> by <c:out value="${book.author }"/></p>
				<p>Here are your thoughts</p>
				<hr>
				<p><c:out value = "${ book.opinion }"/></p>
				<hr>
				<div class = "row">
					<form class="searchForm" action = "/books/${ id }/edit" method = "get">
						<input class = "btn" type = "submit" value = "edit"/>
					</form>
					<form  class="searchForm" action="/books/${id}/delete" method = "get">
						<input class = "btn" type = "submit" value = "delete"/>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<p><c:out value = "${book.user.userName }"/> read <c:out value="${book.title }"/> by <c:out value="${book.author }"/></p>
				<p>Here are <c:out value = "${book.user.userName }"/>'s thoughts</p>
				<hr>
				<p><c:out value = "${ book.opinion }"/></p>
				<hr>
			</c:otherwise>
		</c:choose>
		
	</div>
</body>
</html>