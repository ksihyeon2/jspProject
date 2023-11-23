<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>apiTest.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		const API_KEY = 'g8jpf0Sq1im2O47aR2o9qLMB%2FRa2Zni%2BKgSaC8fxQkAOSHPgIt6xN4NYHrKDpPbsaGYtN%2Ft%2FtClyl9JanE5KFA%3D%3D';
		
		async function getCrimeData() {
			let year = $("#year").val();
			let apiYear = "";
			if(year == 2015) {
				apiYear = "/15084592/v1/uddi:fbbfd36d-d528-4c8e-aa9b-d5cdbdeec669";// 보려고 하는 년도
			} else if(year == 2016) {
				apiYear = "/15084592/v1/uddi:21ec6fa1-a033-413b-b049-8433f5b446ff";
			} else if(year == 2017) {
				apiYear = "/15084592/v1/uddi:67117bd9-5ee1-4e07-ae4a-bfe0861ee116";
			} else if(year == 2018) {
				apiYear = "/15084592/v1/uddi:2d687e27-b5c3-4bdb-9b77-c644dcafcbc7";
			} else if(year == 2019) {
				apiYear = "/15084592/v1/uddi:b6cc7731-181b-48e1-9a6c-ae81388e46b0";
			} else if(year == 2020) {
				apiYear = "/15084592/v1/uddi:fdde1218-987c-49ba-9326-8e3ba276141e";
			} else if(year == 2021) {
				apiYear = "/15084592/v1/uddi:943e757d-462b-4b3a-ab9f-9a8553637ca2";
			} else if(year == 2022) {
				apiYear = "/15084592/v1/uddi:5e08264d-acb3-4842-b494-b08f318aa14c";
			}
			let url = "https://api.odcloud.kr/api";  // api 주소
			url += apiYear;
			url += "?serviceKey="+API_KEY;
			url += "&page=1&perPage=200";
			
			let response = await fetch(url);
			//console.log(response);
			
			let res = await response.json();
			//console.log(res);
			
			let str = "";
			let ymd = "";
			if(year == 2019) {
					str = res.data.map((item,i) => [
					(i+1) + "."
					+ "발생년도 : " + item.발생연도 + "년"
					+ ", 경찰서 : " + item.경찰서
					+ ", 강도 : " + item.강도 + "건"
					+ ", 살인 : " + item.살인 + "건"
					+ ", 절도 : " + item.절도 + "건"
					+ ", 폭력 : " + item.폭력 + "건"
					+ "<br />"
				]);
			} else {
					str = res.data.map((item,i) => [
					(i+1) + "."
					+ "발생년도 : " + item.발생년도 + "년"
					+ ", 경찰서 : " + item.경찰서
					+ ", 강도 : " + item.강도 + "건"
					+ ", 살인 : " + item.살인 + "건"
					+ ", 절도 : " + item.절도 + "건"
					+ ", 폭력 : " + item.폭력 + "건"
					+ "<br />"
				]);
			}
			
			$("#demo").html(str);
		}
		
		async function saveCrimeData() {
			let year = $("#year").val();
			let apiYear = "";
			if(year == 2015) {
				apiYear = "/15084592/v1/uddi:fbbfd36d-d528-4c8e-aa9b-d5cdbdeec669";// 보려고 하는 년도
			} else if(year == 2016) {
				apiYear = "/15084592/v1/uddi:21ec6fa1-a033-413b-b049-8433f5b446ff";
			} else if(year == 2017) {
				apiYear = "/15084592/v1/uddi:67117bd9-5ee1-4e07-ae4a-bfe0861ee116";
			} else if(year == 2018) {
				apiYear = "/15084592/v1/uddi:2d687e27-b5c3-4bdb-9b77-c644dcafcbc7";
			} else if(year == 2019) {
				apiYear = "/15084592/v1/uddi:b6cc7731-181b-48e1-9a6c-ae81388e46b0";
			} else if(year == 2020) {
				apiYear = "/15084592/v1/uddi:fdde1218-987c-49ba-9326-8e3ba276141e";
			} else if(year == 2021) {
				apiYear = "/15084592/v1/uddi:943e757d-462b-4b3a-ab9f-9a8553637ca2";
			} else if(year == 2022) {
				apiYear = "/15084592/v1/uddi:5e08264d-acb3-4842-b494-b08f318aa14c";
			}
			let url = "https://api.odcloud.kr/api";  // api 주소
			url += apiYear;
			url += "?serviceKey="+API_KEY;
			url += "&page=1&perPage=200";
			
			let response = await fetch(url);
			//console.log(response);
			
			let res = await response.json();
			//console.log(res);
			
			let str = "";
			let ymd = "";
			if(year == 2019) {
					str = res.data.map((item,i) => [
					(i+1) + "."
					+ "발생년도 : " + item.발생연도 + "년"
					+ ", 경찰서 : " + item.경찰서
					+ ", 강도 : " + item.강도 + "건"
					+ ", 살인 : " + item.살인 + "건"
					+ ", 절도 : " + item.절도 + "건"
					+ ", 폭력 : " + item.폭력 + "건"
					+ "<br />"
				]);
			} else {
					str = res.data.map((item,i) => [
					(i+1) + "."
					+ "발생년도 : " + item.발생년도 + "년"
					+ ", 경찰서 : " + item.경찰서
					+ ", 강도 : " + item.강도 + "건"
					+ ", 살인 : " + item.살인 + "건"
					+ ", 절도 : " + item.절도 + "건"
					+ ", 폭력 : " + item.폭력 + "건"
					+ "<br />"
				]);
			}
			
			$("#demo").html(str);
			
			// 화면에 출력된 자료들을 모두 DB에 저장시켜준다.
			let query = "";
			for(let i=0; i<res.data.length; i++) {
				if(res.data[i].경찰서 != null) {
					query = {
							year : year,
							police : res.data[i].경찰서,
							robbery : res.data[i].강도,
							murder : res.data[i].살인,
							theft : res.data[i].절도,
							violence : res.data[i].폭력
					}
				}
				
				$.ajax({
					url : "saveCrimeData.st",
					type : "post",
					data : query,
					error : function() {
						alert("전송 오류");
					}
				});
			}
			alert(year + "년도 자료가 DB에 저장되었습니다.");
		}
		
		function deleteCrimeData() {
			let year = $("#year").val();
			let ans = confirm(year+"년도의 자료를 삭제하시겠습니까?");
			if(!ans) {
				return false;
			}
			$.ajax({
				url : "deleteCrimeDate.st",
				type : "post",
				data : {year : year},
				success : function(res) {
					if(res != "0") {
						if(res != "-1") {
							alert(year + "년도 자료 삭제 완료");
							location.reload();							
						} else {
							alert(year+"년도의 저장된 자료가 없습니다.");
						}
					} else {
						alert("삭제 실패");
					}
				},
				error : function() {
					alert("전송 오류");
				}
			});
		}
		
		/* DB 자료 출력 */
		function listCrimeData() {
			myform.action = "listCrimeData.st";
			myform.submit();
		}
		
		/* DB의 경찰서별 자료 출력 */
		function policeCheck() {
			myform.action = "policeCheck.st";
			myform.submit();
		}
		
		/* 경찰서별 + 년도별 DB 자료 출력 */
		function yearPoliceCheck() {
			myform.action = "yearPoliceCheck.st";
			myform.submit();
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
	<p><br /></p>
	<div class="container">
		<h2>경찰청 강력범죄 발생 현황 자료 리스트</h2>
		<hr />
		<form name="myform" method="post">
			<div>
				<select name="year" id="year">
					<c:forEach var="i" begin="2015" end="2022">
						<option value="${i}"  <c:if test="${year == i}">selected</c:if>  >${i}년도</option>
					</c:forEach>
				</select>
				<input type="button" value="범죄조회" onclick="getCrimeData()" class="btn btn-info" />
				<input type="button" value="범죄자DB저장" onclick="saveCrimeData()" class="btn btn-primary" />
				<input type="button" value="범죄자DB삭제" onclick="deleteCrimeData()" class="btn btn-danger" />
				<input type="button" value="범죄자DB출력" onclick="listCrimeData()" class="btn btn-success" />
			</div>
			<div>
				경찰서 지역명 :
				<select name="police" id="police" class="mt-4" onchange="policeCheck()">
					<option <c:if test="${police == '서울'}">selected</c:if>>서울</option>
					<option <c:if test="${police == '경기'}">selected</c:if>>경기</option>
					<option <c:if test="${police == '강원'}">selected</c:if>>강원</option>
					<option <c:if test="${police == '충북'}">selected</c:if>>충북</option>
					<option <c:if test="${police == '충남'}">selected</c:if>>충남</option>
					<option <c:if test="${police == '전북'}">selected</c:if>>전북</option>
					<option <c:if test="${police == '전남'}">selected</c:if>>전남</option>
					<option <c:if test="${police == '경북'}">selected</c:if>>경북</option>
					<option <c:if test="${police == '경남'}">selected</c:if>>경남</option>
					<option <c:if test="${police == '제주'}">selected</c:if>>제주</option>
				</select>
				| 정렬순서 :
				<input type="radio" name="yearOrder" value="a" checked />오름차순
				<input type="radio" name="yearOrder" value="d" />내림차순 | 
				<input type="button" value="년도/경찰서별 출력" onclick="yearPoliceCheck()" class="btn btn-secondary" />
			</div>
		</form>
		<hr />
		<div id="demo"></div>
		<hr />
	<c:if test="${!empty vos}">
    <h3>범죄 분석 통계(<font color="red"><b>합계</b></font>)</h3>
    <table class="table table-hover">
      <tr class="table-dark text-dark">
        <th>구분</th>
        <th>년도</th>
        <th>강도(건)</th>
        <th>살인(건)</th>
        <th>절도(건)</th>
        <th>폭력(건)</th>
      </tr>
      <tr>
        <td>총계</td>
        <td>${analyzeVo.year}</td>
        <td>${analyzeVo.totRobbery}</td>
        <td>${analyzeVo.totMurder}</td>
        <td>${analyzeVo.totTheft}</td>
        <td>${analyzeVo.totViolence}</td>
      </tr>
    </table>
    <hr/>
    <h3>범죄 분석 통계(<font color="red"><b>평균</b></font>)</h3>
    <table class="table table-hover">
      <tr class="table-dark text-dark">
        <th>구분</th>
        <th>년도</th>
        <th>강도</th>
        <th>살인</th>
        <th>절도</th>
        <th>폭력</th>
      </tr>
      <tr>
        <td>총계</td>
        <td>${analyzeVo.year}</td>
        <td>${analyzeVo.avgRobbery}</td>
        <td>${analyzeVo.avgMurder}</td>
        <td>${analyzeVo.avgTheft}</td>
        <td>${analyzeVo.avgViolence}</td>
      </tr>
    </table>
    <hr/>
    <h3><font color="blue"><b>${year}</b></font>년 범죄 통계 현황(총 : <font color="bule"><b>${fn:length(vos)}</b></font>건)</h3>
    <c:if test="${!empty vos}">
      경찰서별 : 
    </c:if>
    <table class="table table-hover">
      <tr class="table-dark text-dark">
      	<th>번호</th>
        <th>구분</th>
        <th>년도</th>
        <th>강도</th>
        <th>살인</th>
        <th>절도</th>
        <th>폭력</th>
      </tr>
      <c:forEach var="vo" items="${vos}" varStatus="st">
        <tr>
          <td>${st.count}</td>
          <td>${vo.year}</td>
          <td>${vo.police}</td>
          <td>${vo.robbery}</td>
          <td>${vo.murder}</td>
          <td>${vo.theft}</td>
          <td>${vo.violence}</td>
        </tr>
      </c:forEach>
      <tr><td colspan="7" class="p-0 m-0"></td></tr>
    </table>
  </c:if>
  </div>
	<p><br /></p>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>