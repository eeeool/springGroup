<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>

<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/include/bs5.jsp" />
  <title>guestList.jsp</title>
  
  <script>
  	'use strict';
  	
  	function guestDelete(idx) {
  		let ans = confirm('현재 게시글을 삭제하시겠습니까?');
  		
  		if (!ans) return false;
  		
  		$.ajax({
  			url: 'GuestDelete.gu',
  			type: 'post',
  			data: {idx: idx},
  			success: function(res) {
  				if (res != '0') {
  					alert('게시글이 삭제 되었습니다.');
  					location.reload();
  				}
  				else alert('게시글 삭제 실패');
  			}
  		});
  	}
  	
  	function guestEdit(idx) {
 	    let email = $('#email_' + idx).text();
	    let homePage = $('#homePage_' + idx).text();
	    let content = $('#content_' + idx).html();
	
	    $('#email_' + idx).html('<input type="text" id="email_' + idx + '" class="form-control" value="' + email + '" />');
	    $('#homePage_' + idx).html('<input type="text" id="homePage_' + idx + '" class="form-control" value="' + homePage + '" />');
	    $('#content_' + idx).html('<textarea id="content_' + idx + '" class="form-control" rows="5">' + content + '</textarea>');
	
	    $('#editBtn_' + idx).hide();
	    $('#saveBtn_' + idx).show();
	    $('#cancelBtn_' + idx).show();
  	}
  	
  	function guestUpdate(idx) {
  		if (!confirm('게시글을 수정하시겠습니까?')) return;
  		
 	    let email = $('#email_' + idx + ' input').val().trim();
 	    let homePage = $('#homePage_' + idx + ' input').val().trim();
  		let content = $('#content_' + idx + ' textarea').val().trim();
  		  		
  		$.ajax({
  			url: 'GuestUpdate.gu',
  			type: 'post',
  			data: {
  				idx: idx,
  				email: email,
  				homePage: homePage,
  				content: content
  			},
  			success: function(res) {
  				if (res != 0) {
  					alert('게시글이 수정되었습니다.');
  					location.reload();
  				}
  				else alert('게시글 수정 실패');
  			}
  		});
  	}
  </script>
  
  <style>
  	th {
  		background-color: #eee !important;
  		text-align: center;	
  	}
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">방명록 리스트</h2>
  <table class="table table-borderless m-0 p-0">
  	<tr>
  		<td><a href="GuestInput.gu" class="btn btn-success btn-sm">글쓰기</a></td>
  		<td class="text-end">
  			<c:if test="${sAdmin != 'adminOK'}"><a href="Admin.gu" class="btn btn-primary btn-sm">관리자</a></c:if>
  			<c:if test="${sAdmin == 'adminOK'}"><a href="AdminOut.gu" class="btn btn-primary btn-sm">관리자 로그아웃</a></c:if>
  		</td>
  	</tr>
  </table>
 	<hr/>
  
  <c:forEach var="vo" items="${vos}" varStatus="st">
  	<table class="table table-borderless m-0 p-0">
	  	<tr>
	  		<td>번호: ${vo.idx}
	  			<c:if test="${sAdmin == 'adminOK'}"><a href='javascript:guestDelete(${vo.idx})' class='btn btn-danger btn-sm'>삭제</a></c:if></td>
		  			<c:if test="${sAdmin != 'adminOK' && sNickName == vo.name}">
		  				<a href="javascript:guestEdit(${vo.idx})" id="editBtn_${vo.idx}" class="btn btn-warning btn-sm me-1">수정</a>
		  				<a href="javascript:guestUpdate(${vo.idx})" id="saveBtn_${vo.idx}" class="btn btn-warning btn-sm me-1" style='display: none'>완료</a>
		  				<a href="javascript:guestDelete(${vo.idx})" class="btn btn-danger btn-sm me-1">삭제</a>
		  				<a href="javascript:void(0);" id="cancelBtn_${vo.idx}" onclick="location.reload()" class="btn btn-info btn-sm" style='display: none'>취소</a>
		  			</c:if>
		  			
	  		<td class="text-end">방문IP: ${vo.hostIp}</td>
	  	</tr>
  	</table>
  	<table class="table table-bordered">
	  	<tr>
	  		<th>성명</th>
	  		<td>${vo.name}</td>
	  		<th>방문일자</th>
	  		<td>${vo.vDate}</td>
	  	</tr>
	  	<tr>
	  		<th>이메일</th>
	  		<td colspan="3" id="email_${vo.idx}">
	  		 	<c:if test="${empty vo.email || fn:length(vo.email)<6 || fn:indexOf(vo.email, '@') == -1 || fn:indexOf(vo.email, '.') == -1}">- 없음 -</c:if>
	  		 	<c:if test="${!empty vo.email && fn:length(vo.email)>=6 && fn:indexOf(vo.email, '@') != -1 && fn:indexOf(vo.email, '.') != -1}">${vo.email}</c:if>
	  		 </td>
	  	</tr>
	  	<tr>
	  		<th>홈페이지</th>
	  		<td colspan="3" id="homePage_${vo.idx}">
	  			<c:if test="${empty vo.homePage || fn:length(vo.homePage)<10 || fn:indexOf(vo.homePage, '.') == -1}">- 없음 -</c:if>
	  			<c:if test="${!empty vo.homePage && fn:length(vo.homePage)>=10 && fn:indexOf(vo.homePage, '.') != -1}"><a href="${vo.homePage}">${vo.homePage}</a></c:if>
	  		</td>
	  	</tr>
	  	<tr>
	  		<th>방문소감</th>
	  		<td colspan="3" id="content_${vo.idx}" style="height: 150px">${fn:replace(vo.content, newLine, "<br/>")}</td>
	  	</tr>
  	</table>
  	<br/>
  </c:forEach>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>