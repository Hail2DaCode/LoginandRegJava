<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login and Registration</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class = "super">
		<h1>Welcome!</h1>
		<p>Join our growing community.</p>
		<form:form action = "/register" method = "post" modelAttribute = "newUser">
			<div class = "row" id = "header">
				<h2>Register</h2>
			</div>
			<div class="row" id = "row1">
				<form:label path="userName">User Name:</form:label>
				<form:errors class="error" path = "userName"/>
				<form:input path="userName"/>
			</div>
			<div class="row" id = "row2">
				<form:label path="email">Email:</form:label>
				<form:errors class="error" path = "email"/>
				<form:input path="email"/>
			</div>
			<div class="row" id = "row3">
				<form:label path="password">Password:</form:label>
				<form:errors class="error" path = "password"/>
				<form:input path="password" type = "password"/>
			</div>
			<div class="row" id = "row4">
				<form:label path="confirm">Confirm PW:</form:label>
				<form:errors class="error" path = "confirm"/>
				<form:input path="confirm"/>
			</div>
			<div class = "row" id = "row5">
				<form:label path = "birthday">Birthday:</form:label>
				<form:errors class = "error" path = "birthday"/>
				<form:input path = "birthday" type = "date"/>
			</div>
			<div class = "row" id = "row6">
				<form:label path = "sigil">Sigil:</form:label>
				<form:errors class = "error" path = "sigil"/>
				<form:select path="sigil">
					<form:option value = "direwolf" path = "sigil"/>
					<form:option value = "golden lion" path = "sigil"/>
					<form:option value = "kraken" path = "sigil"/>
					<form:option value = "black dragon" path = "sigil"/>
					<form:option value = "blue rose" path = "sigil"/>
				</form:select>
			</div>
			<div class="row" id = "finalRow">
				<input class="btn" id ="submit" type = "submit" value="Submit"/>
			</div>
		</form:form>
		<form:form action = "/login" method = "post" modelAttribute = "newLogin">
			<div class = "row" id = "header2">
				<h3>Login</h3>
			</div>
			<div class="row" id = "row6">
				<form:label path="email">Email:</form:label>
				<form:errors class="error" path = "email"/>
				<form:input path="email"/>
			</div>
			<div class="row" id = "row7">
				<form:label path="password">Password:</form:label>
				<form:errors class="error" path = "password"/>
				<form:input path="password"/>
			</div>
			<div class="row" id = "row8">
				<input class="btn" id ="submit" type = "submit" value="Submit"/>
			</div>
		</form:form>
	</div>
</body>
</html>