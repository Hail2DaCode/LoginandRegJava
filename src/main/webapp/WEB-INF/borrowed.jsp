<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Lender Dashboard</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class = "super">
		<div class = "row">
			<p>Hello, "${ name }" Welcome to..</p>
			<p><a href = "/books">back to the shelves</a></p>
		</div>
		<h1>The Book Broker!</h1>
		<p>Available Books to Borrow</p>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Owner</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var = "unborrow" items = "${ unborrowed }">
					<tr>
						<td><c:out value = "${ unborrow.id }"/></td>
						<td><c:out value = "${ unborrow.title }"/></td>
						<td><c:out value = "${ unborrow.author }"/></td>
						<td><c:out value = "${ unborrow.user.userName }"/></td>
					<c:choose>
						<c:when test = "${unborrow.user.id == id }">
						<td>
							<a href = "/books/${ unborrow.id }/edit">Edit</a>
							<a href = "books/${ unborrow.id }/delete">Delete</a>
						</td>
						</c:when>
						<c:otherwise>
							<td><a href = "/bookmarket/${unborrow.id }">borrow</a></td>
						</c:otherwise>
					</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<p>Books I am borrowing...</p>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Owner</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var = "borrow" items = "${user.borrows }">
				<tr>
					<td><c:out value = "${borrow.id}"/></td>
					<td><c:out value = "${borrow.title}"/></td>
					<td><c:out value = "${borrow.author}"/></td>
					<td><c:out value = "${borrow.user.userName}"/></td>
					<td><a href = "/return/${borrow.id }">return</a></td>
				</tr>
			</c:forEach>	
			</tbody>
		</table>
	</div>
</body>
</html>