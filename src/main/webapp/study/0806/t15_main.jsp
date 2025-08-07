<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <%-- <%@ include file="/include/bs5.jsp" %> --%>
	<jsp:include page="/include/bs5.jsp"></jsp:include>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>t15_main.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2 class="text-center">성적 계산하기</h2>
  <div class="row">
  	<div class="col"><a href="t15_1.jsp" class="btn btn-success">JSP일반</a></div>
  	<div class="col"><a href="t15_2.jsp" class="btn btn-success">Servlet</a></div>
  </div>
</div>
<p><br/></p>
</body>
</html>