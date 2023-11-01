<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>jstl3.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		input {
			margin:10px
		}
	</style>
</head>
<body>
	<p><br /></p>
	<div class="container ">
		<h3>구구단 연습</h3>
		<form name="myform ">
			<div>시작단 : <input type="number" name="startDan" autofocus class="form-control"/></div>
			<div>끝단 : <input type="number" name="endDan" autofocus class="form-control"/></div>
			<div>한 줄에 출력될 개수 : <input type="number" name="su" autofocus class="form-control"/></div>
			<div><input type="submit" value="계산" class="btn-success form-control" /></div>
		</form>
		<hr />
		<div id="demo">
			
			<c:set var="sDan" value="${param.startDan}"></c:set>
			<c:set var="eDan" value="${param.endDan}"></c:set>
			<c:set var="temp" value=""></c:set>
			<c:set var="su" value="${param.su}"></c:set>
			<c:if test="${sDan > eDan}">
				${temp} = ${sDan}
				${sDan} = ${eDan}
				${eDan} = ${temp}
			</c:if>
			
			<table>
				<c:if test="${!empty sDan && !empty eDan}">
					<tr>
					<c:forEach var="i" begin="${sDan}" end="${eDan}" varStatus="st">
						<td class="pr-4 pb-3">
						* ${ i } 단 *<br />
						<c:forEach var="j" begin="1" end="9">
							${i} * ${j} = ${i*j} <br />
						</c:forEach>
						</td>
						<c:if test="${st.count % su == 0}"></tr></c:if>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
	<p><br /></p>
</body>
</html>