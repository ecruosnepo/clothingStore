<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <c:if test="${result == '1' }">
	<script>
		alert('회원가입이 완료 되었습니다.');
		location.href='index';
	</script>
</c:if>
<c:if test="${result == '0' }">
	<script>
		alert('사용하실 이메일과 비밀번호를 입력 해주세요.');
		history.go(-1);
	</script>
</c:if>
<c:if test="${result == '2' }">
	<script>
		alert('사용하실 이메일을 입력 해주세요.');
		history.go(-1);
	</script>
</c:if>
<c:if test="${result == '3' }">
	<script>
		alert('사용하실 비밀번호를 입력 해주세요.');
		history.back();
	</script>
</c:if>
<c:if test="${result == '4' }">
	<script>
		alert('개인정보 동의 체크를 해주세요.');
		history.back();
	</script>
</c:if> 























