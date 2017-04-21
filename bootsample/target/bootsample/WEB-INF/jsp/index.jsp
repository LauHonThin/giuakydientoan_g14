<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache"> 
    <meta http-equiv="Cache-Control" content="no-cache"> 
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
    
    <title>Article Manager | Home</title>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
    
     <link href="static/css/style.css" rel="stylesheet">
    
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
	<link href="static/dist/summernote.css" rel="stylesheet">
	<script src="static/dist/summernote.min.js"></script>
	
	<!-- include summernote-ko-KR -->
	<script src="static/dist/lang/summernote-ko-KR.js"></script>
    
    <!--[if lt IE 9]>
		<script src="static/js/html5shiv.min.js"></script>
		<script src="static/js/respond.min.js"></script>
	<![endif]-->
</head>

<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Nhóm 14</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-article">New Article</a></li>
					<li><a href="all-articles">All Article</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Welcome to Article Manager</h1>
				</div>
			</div>
		</c:when>
		
		<c:when test="${mode == 'MODE_ARTICLES' }">
			<div class="container text-center " id="taskDiv">
				<h3>My Articles</h3>
				<br>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>Title</th>
								<th>Content</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="article" items="${articles}">
								<tr>
									<td>${article.id}</td>
									<td>${article.title}</td>
									<td>${article.content}</td>
									<td><a href="update-article?id=${article.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-article?id=${article.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							
							</c:forEach>
							
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>New Article</h3>
				<br>
				<form class="form-horizontal" method ="POST" action="save-article" enctype="multipart/form-data" >
					<input type="hidden" name="id" value="${article.id}" />
					<div class="form-group">
						<label class="control-label col-md-3">Tiêu đề: </label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="title" value="${article.title}"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 ">Nội dung:</label>
						
						<div class="col-md-9">
							 
							 <textarea id="summernote" name="content">${article.content}</textarea>
          
            				<script>
	            				$('#summernote').summernote({
	            					  height: 300,                 // set editor height
	            					  minHeight: null,             // set minimum height of editor
	            					  maxHeight: null,             // set maximum height of editor
	            					  focus: true                  // set focus to editable area after initializing summernote
	            					});
							  </script>
				           
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">File đính kèm: </label>
						<div class="col-md-9">
							<input type="file"  name="file" />
						</div>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save">
					</div>
				</form>
			</div>
		</c:when>
	</c:choose>
	
</body>
</html>
