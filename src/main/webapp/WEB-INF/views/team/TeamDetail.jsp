<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- 팀 삭제 -->
<script type="text/javascript">

function teamDelete(tst_team_no){
	if(confirm("정말 삭제하시겠습니가?!") == true)
		location.href ="/delete?tst_team_no="+tst_team_no;
	else
		return;
}
                    	
function addMember(){
	var member = prompt("초대할 사용자의 닉네임을 입력해주세요!",'');
	document.write(member);
}
function teamUpdate(tst_team_no){
	if(confirm("팀 수정을 원하시나요?") == true)
		location.href ="/teamUpdate?tst_team_no="+tst_team_no;
	else
		return;
}           	
</script>
					
					<main id="js-page-content" role="main" class="page-content">
                        <ol class="breadcrumb page-breadcrumb">
                        <!-- 
                        	10.29 팀 삭제
                        	팀의 방장 이름과 principal getname의 컬럼값이 다름.
                        -->
<%--                			<c:if test="${detailTeam.tst_user_nickname } == ${ login_user }">	 --%>
                       		<li class="breadcrumb-item" onclick="teamDelete(${detailTeam.tst_team_no})">팀 삭제</li>
 							<li class="breadcrumb-item active" onclick="teamUpdate(${detailTeam.tst_team_no})">팀 수정</li>
                            <li class="breadcrumb-item" onclick="addMember()">팀원 초대하기</li>
<%--  						</c:if> --%>
                      	
                            <li class="position-absolute pos-top pos-right d-none d-sm-block"><span class="js-get-date">Tuesday, October 29, 2019</span></li>
                        </ol>
                    
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class="fal fa-th-list text-primary"></i> Basic tables
                                <small>
                                    Documentation and examples for opt-in styling of tables (given their prevelant use in JavaScript plugins) with Bootstrap.
                                </small>
                            </h1>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-xl-6">
                                <!--Basic tables-->
                                
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                		<!-- 10.29 -->
                                        <h2>
                                           	팀 정보
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="frame-wrap">
                                            <div class="header">
                            <h4 class="title">${ detailTeam.tst_team_name }</h4>
                            <p class="category">${detailTeam.tst_team_content }</p>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">

                                    <tbody>
                                        <tr>
                                            <th>종목
                                            </th><td>${detailTeam.tst_team_type }</td>
                                        </tr>
                                        <tr>
                                            <th>승률
                                            </th><td>${ score }%</td>
                                        </tr>
                                        <tr>
                                            <th>전적
                                            </th><td>${detailTeam.tst_team_win}승 ${detailTeam.tst_team_lose }패</td>

                                        </tr>
                                        <tr>
                                            <th>평균나이</th>
                                            <td>유저 테이블에 나이값 넣어줘야함!</td>
                                        </tr>
                                        <tr>
                                            <th>주장</th>
                                            <td>${ detailTeam.tst_user_nickname}</td>
                                        </tr>
                                        <tr>
                                            <th>위치</th>
                                            <td>${ detailTeam.tst_team_location }</td>
                                        </tr>
                                        <tr>
                                            <th>나이</th>
                                            <td>${ detailTeam.tst_team_age }</td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Table head-->
                                <div id="panel-2" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Table <span class="fw-300"><i>head</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="panel-tag">
                                                Similar to default and inverse tables, use one of two modifier classes to make <code>&lt;thead&gt;</code>s appear custom, dark gray, white and themed.
                                            </div>
                                            <h5 class="frame-heading">
                                                Inverse
                                            </h5>
                                            <div class="frame-wrap">
                                                <table class="table m-0">
                                                    <thead class="thead-dark">
                                                        <tr>
                                                            <th>#</th>
                                                            <th>First Name</th>
                                                            <th>Last Name</th>
                                                            <th>Username</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row">1</th>
                                                            <td>Mark</td>
                                                            <td>Otto</td>
                                                            <td>@mdo</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">2</th>
                                                            <td>Jacob</td>
                                                            <td>Thornton</td>
                                                            <td>@fat</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">3</th>
                                                            <td>Larry</td>
                                                            <td>the Bird</td>
                                                            <td>@twitter</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <h5 class="frame-heading">
                                                Custom <a href="utilities_color_pallet.html" title="Color Pallets"><i class="fal fa-reply"></i> </a>
                                            </h5>
                                            <div class="frame-wrap">
                                                <table class="table m-0">
                                                    <thead class="bg-fusion-50">
                                                        <tr>
                                                            <th>#</th>
                                                            <th>First Name</th>
                                                            <th>Last Name</th>
                                                            <th>Username</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row">1</th>
                                                            <td>Mark</td>
                                                            <td>Otto</td>
                                                            <td>@mdo</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">2</th>
                                                            <td>Jacob</td>
                                                            <td>Thornton</td>
                                                            <td>@fat</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">3</th>
                                                            <td>Larry</td>
                                                            <td>the Bird</td>
                                                            <td>@twitter</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <h5 class="frame-heading">
                                                Dark
                                            </h5>
                                            <div class="frame-wrap">
                                                <table class="table m-0">
                                                    <thead class="thead-dark">
                                                        <tr>
                                                            <th>#</th>
                                                            <th>First Name</th>
                                                            <th>Last Name</th>
                                                            <th>Username</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row">1</th>
                                                            <td>Mark</td>
                                                            <td>Otto</td>
                                                            <td>@mdo</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">2</th>
                                                            <td>Jacob</td>
                                                            <td>Thornton</td>
                                                            <td>@fat</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">3</th>
                                                            <td>Larry</td>
                                                            <td>the Bird</td>
                                                            <td>@twitter</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <h5 class="frame-heading">
                                                Themed
                                            </h5>
                                            <div class="frame-wrap">
                                                <table class="table m-0">
                                                    <thead class="thead-themed">
                                                        <tr>
                                                            <th>#</th>
                                                            <th>First Name</th>
                                                            <th>Last Name</th>
                                                            <th>Username</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row">1</th>
                                                            <td>Mark</td>
                                                            <td>Otto</td>
                                                            <td>@mdo</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">2</th>
                                                            <td>Jacob</td>
                                                            <td>Thornton</td>
                                                            <td>@fat</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">3</th>
                                                            <td>Larry</td>
                                                            <td>the Bird</td>
                                                            <td>@twitter</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Table rows-->
                                <div id="panel-3" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Table <span class="fw-300"><i>rows</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="panel-tag">
                                                Add <code>.table-striped</code> to add zebra-striping to any table, and add <code>.table-dark</code> for inverse pattern
                                            </div>
                                            <h5 class="frame-heading">
                                                Pattern
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-xl-6">
                                <!--Table bordered-->
                                <div id="panel-4" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                              members
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="frame-wrap">
                                                <table class="table m-0">
                                                    <thead class="thead-themed">
                                                        <tr>
                                                            <th>이름</th>
                                                            <th>위치</th>
                                                            <th>나이</th>
                                                            <th>position</th>
                                                        </tr>
                                                    </thead>
                                                    <c:forEach var="members" items="${member}">
                                                    <tbody>
                                                        <tr>
                                                            <td>${ members.tst_user_nickname }</td>
                                                            <td>${ members.tst_user_location } </td>
                                                            <td>${ members.tst_user_brith }</td>
                                                        </tr>
                                                    </tbody>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                </div>
                                <!--Table hover-->
                                <div id="panel-5" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Table <span class="fw-300"><i>Hover</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="panel-tag">
                                                Add <code>.table-hover</code> to enable a hover state on table rows within a <code>&lt;tbody&gt;</code>
                                            </div>
                                            <h5 class="frame-heading">
                                                Hoverable
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                                <!--Contextual classes-->
                                <div id="panel-6" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Contextual <span class="fw-300"><i>classes</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="panel-tag">
                                                Use contextual classes to color table rows or individual cells. See the full list of <a href="utilities_color_pallet.html" title="Color Pallets" target="_blank">color selection</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Table small-->
                                <div id="panel-7" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Table <span class="fw-300"><i>Small</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="panel-tag">
                                                Add <code> .table-sm</code> to make tables more compact by cutting cell padding in half. See the full list of <a href="utilities_color_pallet.html" title="Color Pallets">color selection</a> to add backgrounds as well
                                            </div>
                                            <h5 class="frame-heading">
                                                Compact
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                                <!--Table responsive-->
                                <div id="panel-8" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Table <span class="fw-300"><i>Responsive</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="panel-tag">
                                                Make table responsive with <code>.table-responsive</code>. Maximum breakpoint can be applied by adding <code>.table-responsive-sm</code>, <code>.table-responsive-ms</code>, <code>.table-responsive-lg</code>, <code>.table-responsive-xl</code>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                    
</body>
</html>