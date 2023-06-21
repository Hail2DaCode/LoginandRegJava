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
	<div class = "super">
		<div class = "row">
			<h1>Welcome <c:out value="${name}"/></h1>
			<a href = "/clear">Logout</a>
		</div>
		<div class = "row">
			<p>Books from everyone's shelves:</p>
			<p id = "smallParagraph"><a href = "/bookmarket">Go to BookMarket!</a></p>
			<a href = "books/new">+ Add a book to my shelf!</a>
		</div>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Posted By</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var = "book" items = "${ books }">
					<tr>
						<td><c:out value = "${ book.id }"/></td>
						<td><a href = "/books/${book.id}"><c:out value="${book.title}"/></a></td>
						<td><c:out value = "${ book.author }"/></td>
						<td><c:out value = "${ book.user.userName }"/></td>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>