<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class = "super">
		<h1>Welcome <c:out value="${name}"/></h1>
		<a href = "/clear">Logout</a>
	</div>
</body>
</html>