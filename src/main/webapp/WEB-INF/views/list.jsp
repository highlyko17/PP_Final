<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
		 pageEncoding="UTF-8"%>
<%@page import="com.example.board.BoardDAO, com.example.board.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>오무식카가</title>
	<style>
		body {
			font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
			background-color: #f4f4f4;
			margin: 0;
			padding: 0;
		}

		h1 {
			text-align: center;
			color: #006bb3;
		}

		table {
			border-collapse: collapse;
			width: 90%;
			margin: 20px auto;
			background-color: #fff;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}

		th, td {
			border: 1px solid #ddd;
			padding: 15px;
			text-align: center;
		}

		th {
			background-color: #006bb3;
			color: white;
		}

		tr:nth-child(even) {
			background-color: #f2f2f2;
		}

		tr:hover {
			background-color: #ddd;
		}

		a {
			text-decoration: none;
			color: #006bb3;
		}

		a:hover {
			color: #004080;
		}

		#addPost {
			display: block;
			width: 90%;
			margin: 20px auto;
			text-align: center;
			background-color: #006bb3;
			color: white;
			padding: 10px;
			border-radius: 5px;
			text-decoration: none;
		}

	</style>
	<script>
		function delete_ok(id){
			var a = confirm("정말로 삭제하겠습니까?");
			if(a) location.href='deleteok/' + id;
		}
	</script>
</head>
<body>
<h1>오무식카가</h1>

<table id="list" width="90%">
	<tr>
		<th>Id</th>
		<th>Category</th>
		<th>Name</th>
		<th>Location</th>
		<th>Content</th>
		<th>Registration Date</th>
		<th>Revision Date</th>
		<th>Detail</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>


	<c:forEach items="${list}" var="u">
		<tr>
			<td>${u.seq}</td>
			<td>${u.category}</td>
			<td>${u.title}</td>
			<td>${u.writer}</td>
			<td>${u.content}</td>
			<td>${u.regDate}</td>
			<td>${u.updateDate}</td>
			<td><a href="detail/${u.seq}">Detail</a></td>
			<td><a href="editform/${u.seq}">Edit</a></td>
			<td><a href="javascript:delete_ok('${u.seq}')">Delete</a></td>

		</tr>
	</c:forEach>
</table>
<br/><a id = "addPost" href="add">Add New Post</a>
</body>
</html>