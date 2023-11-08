<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ajaxTest1.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		/* 일반 아이디 검색 */
		function idCheck() {
			/* let mid = document.myform.mid.value;
			let mid = myform.mid.value;
			let mid = document.getElementById("mid").value; */
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false; 
			} 
			location.href="ajaxTest1Ok.st?mid="+mid;
		}
		
		/* ajax로 아이디 검색1 */
		function idcheck1() {
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false; 
			} 
			$.ajax({
				url : "${ctp}/ajaxTest1",
				type : "get",
				/* data : {키,값}, */
				/* data : {
					mid:mid,
					pwd:pwd
					}, 여러개 지정 방법*/
				data : {mid:mid},
				contextType : "application/json",  /* 생량 가능 */
				charset : "UTF-8",  /* 생략 가능 */
				success : function(res) {
					//alert("서버에 성공적으로 다녀왔습니다. ==> " + res);
					$("#demo").html(res);
				},
				error : function() {
					alert("전송 오류");
				}
			});
			}
		
		/* 아이디 검색2 */
		function idcheck2() {
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false; 
			} 
			
			let query = {
					mid:mid
			}
			
			$.ajax({
				url : "${ctp}/ajaxTest2",
				type : "post",
				data : query,
				success : function(res) {
					$("#demo").html(res);
					let str = res.split("/");
					$("#tMid").html(str[0]);
					$("#name").html(str[1]);
					$("#point").html(str[2]);						
					$("#todayCount").html(str[3]);						
				},
				error : function() {
					alert("전송 오류");
				}
			});
		}
		
		/* 아이디 검색3(문자열 처리) */
		function idcheck3() {
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false; 
			} 
			
			$.ajax({
				url : "${ctp}/ajaxTest3",
				type : "post",
				data : {mid:mid},
				success : function(res) {
					$("#demo").html(res);
					$("#tMid").html(res.substring(res.indexOf("mid=")+4,res.indexOf(",",res.indexOf("mid="))));
					$("#name").html(res.substring(res.indexOf("name=")+5,res.indexOf(",",res.indexOf("name="))));
					$("#point").html(res.substring(res.indexOf("point=")+6,res.indexOf(",",res.indexOf("point="))));						
					$("#todayCount").html(res.substring(res.indexOf("todayCount=")+11,res.indexOf("]")));	
				},
				error : function() {
					alert("전송 오류");
				}
			});
		}
		
		/* 아이디 검색4(HashMap 활용) */
		function idcheck4() {
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false; 
			}
			$.ajax({
				url : "${ctp}/ajaxTest4",
				type : "post",
				data : {mid:mid},
				success : function(res) {
					console.log("res : ",res);
					$("#demo").html(res);
					
					/* JSON형식을 java 형식으로 변경 */
					let js = JSON.parse(res);
					console.log("js : ",js);
					
					$("#tMid").html(js.mid);
					$("#name").html(js.name);
					$("#point").html(js.point);						
					$("#todayCount").html(js.todayCount);						
				},
				error : function() {
					alert("전송 오류");
				}
			});
		}
		
		/* 아이디 검색5(vos 형식으로 처리) */
		function idcheck5() {
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false; 
			}	
			$.ajax({
				url : "${ctp}/ajaxTest5",
				type : "post",
				data : {mid:mid},
				success : function(res) {
					$("#demo").html(res);
					let js = JSON.parse(res);
					console.log("js", js);
					
					let tMid = "";
					let tName = "";
					let tPoint = "";
					let tTodayCount = "";
					for(let j of js) {
						tMid += j.mid + "/";
						tName += j.name + "/";
						tPoint += j.point + "/";
						tTodayCount += j.todayCount + "/";
					}
					$("#tMid").html(tMid);
					$("#name").html(tName);
					$("#point").html(tPoint);						
					$("#todayCount").html(tTodayCount);				
				},
				error : function() {
					alert("전송 오류");
				}
			});
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
	<p><br /></p>
	<div class="container">
		<h2>AJax 연습</h2>
		<hr />
		<form name="myform">
			아이디 : 
			<div class="input-group">
			<input type="text" name="mid" id="mid" class="form-control" />
				<div class="input-group-append">
					<input type="button" value="아이디 일반 검색" onclick="idCheck()" class="btn btn-success" />			
				</div>
			</div>
			<hr />
			AJax검색 : <br />
				<div>
					<input type="button" value="아이디 검색1" onclick="idcheck1()" class="btn btn-info" />
					<input type="button" value="아이디 검색2" onclick="idcheck2()" class="btn btn-secondary" />
					<input type="button" value="아이디 검색3" onclick="idcheck3()" class="btn btn-success" />
					<input type="button" value="아이디 검색4" onclick="idcheck4()" class="btn btn-warning" />
					<input type="button" value="아이디 검색5" onclick="idcheck5()" class="btn btn-danger" />
				</div>
			<div>
			</div>
			<hr />
			<div>출력 결과 :<font color="red"><span id="demo" ></span></font></div>		
			<hr />
			<div>
				<div>아이디 : <font color="blue"><span id="tMid"></span></font></div>
				<div>성명 : <font color="blue"><span id="name"></span></font></div>
				<div>포인트 : <font color="blue"><span id="point"></span></font></div>
				<div>오늘 방문 횟수 : <font color="blue"><span id="todayCount"></span></font></div>
			</div>	
		</form>
		<hr />
		<div><a href="javascript:location.href='${ctp}/';" class="btn btn-primary">돌아가기</a></div>
	</div>
	<p><br /></p>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>