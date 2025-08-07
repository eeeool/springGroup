<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String buseo = request.getParameter("buseo");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>t13Res.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 t13Res.jsp</h2>
  
  <%-- <% if (buseo.equals("1")) { %> --%>
  <jsp:forward page="t13Insa.jsp"></jsp:forward>
  	<%-- <jsp:param value="<%=mid%>" name="mid"/> --%>
 <%-- <% } else if (buseo.equals("2")) { %> --%> 
  <jsp:forward page="t13Yung.jsp"></jsp:forward>
  	<%-- <jsp:param value="<%=mid%>" name="mid"/> --%>
 <%-- <% } else if (buseo.equals("3")) { %> --%>
  <jsp:forward page="t13Chong.jsp"></jsp:forward>
  	<%-- <jsp:param value="<%=mid%>" name="mid"/> --%>
 
  <!-- <p><a href='t13.jsp' class='btn btn-success'>돌아가기</a></p> -->
</div>
<p><br/></p>
</body>
</html>