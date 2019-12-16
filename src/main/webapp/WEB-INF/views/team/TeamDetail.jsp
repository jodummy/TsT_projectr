<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/notifications/sweetalert2/sweetalert2.bundle.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- 팀 삭제 -->
<script src="${pageContext.request.contextPath}/resources/js/notifications/sweetalert2/sweetalert2.bundle.js"></script>
 <meta name="description" content="Marketing Dashboard">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no, minimal-ui">
        <!-- Call App Mode on ios devices -->
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <!-- Remove Tap Highlight on Windows Phone IE -->
        <meta name="msapplication-tap-highlight" content="no">
        <!-- base css -->
        <link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/vendors.bundle.css">
        <link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/app.bundle.css">
        <!-- Place favicon.ico in the root directory -->
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/img/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/favicon/favicon-32x32.png">
        <link rel="mask-icon" href="${pageContext.request.contextPath}/resources/img/favicon/safari-pinned-tab.svg" color="#5bbad5">
        <link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/datagrid/datatables/datatables.bundle.css">

		
		<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/miscellaneous/lightgallery/lightgallery.bundle.css">
		<link rel="mask-icon" href="${pageContext.request.contextPath}/resources/img/favicon/safari-pinned-tab.svg" color="#5bbad5">
		<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/img/favicon/apple-touch-icon.png">
		
		
<script type="text/javascript">

/**
 *	This script should be placed right after the body tag for fast execution 
 *	Note: the script is written in pure javascript and does not depend on thirdparty library
 **/
'use strict';

var classHolder = document.getElementsByTagName("BODY")[0],
    /** 
     * Load from localstorage
     **/
    themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) :
    {},
    themeURL = themeSettings.themeURL || '',
    themeOptions = themeSettings.themeOptions || '';
/** 
 * Load theme options
 **/
if (themeSettings.themeOptions)
{
    classHolder.className = themeSettings.themeOptions;
    console.log("%c✔ Theme settings loaded", "color: #148f32");
}
else
{
    console.log("Heads up! Theme settings is empty or does not exist, loading default settings...");
}
if (themeSettings.themeURL && !document.getElementById('mytheme'))
{
    var cssfile = document.createElement('link');
    cssfile.id = 'mytheme';
    cssfile.rel = 'stylesheet';
    cssfile.href = themeURL;
    document.getElementsByTagName('head')[0].appendChild(cssfile);
}
/** 
 * Save to localstorage 
 **/
var saveSettings = function()
{
    themeSettings.themeOptions = String(classHolder.className).split(/[^\w-]+/).filter(function(item)
    {
        return /^(nav|header|mod|display)-/i.test(item);
    }).join(' ');
    if (document.getElementById('mytheme'))
    {
        themeSettings.themeURL = document.getElementById('mytheme').getAttribute("href");
    };
    localStorage.setItem('themeSettings', JSON.stringify(themeSettings));
}
/** 
 * Reset settings
 **/
 
var resetSettings = function()
{
    localStorage.setItem("themeSettings", "");
}


/* function teamDelete(tst_team_no){
      if(confirm("정말 삭제하시겠습니가?!") == true)
         location.href ="/delete?tst_team_no="+tst_team_no;
      else
         return;
   } */
   function teamDelete(tst_team_no){
      const swalWithBootstrapButtons = Swal.mixin({
         customClass: {
           confirmButton: 'btn btn-success',
           cancelButton: 'btn btn-danger'
         },
       })
      swalWithBootstrapButtons.fire({
         title: '팀을 삭제하시겠습니까?',
         text: "삭제시 팀에 대한 모든 정보가 사라집니다!",
         showCancelButton: true,
         confirmButtonText: '삭제',
         cancelButtonText: '취소',
         reverseButtons: true
       }).then((result) => {
         if (result.value) {
           swalWithBootstrapButtons.fire(
             'Deleted!',
             'Your file has been deleted.',
             'success'
           )
           location.href ="/delete?tst_team_no="+tst_team_no;
         } else if (
           /* Read more about handling dismissals below */
           result.dismiss === Swal.DismissReason.cancel
         ) {
           swalWithBootstrapButtons.fire(
             '취소되었습니다 :)',
           )
         }
       })
   }
   function addMember(tst_team_no){
      var tst_user_nickname1 = "qwer";
      const swalWithBootstrapButtons = Swal.mixin({
         customClass: {
           confirmButton: 'btn btn-success',
           cancelButton: 'btn btn-danger'
         },
         buttonsStyling: false
       })
      Swal.fire({
         title: '팀원 초대',
         input: 'text',
         inputAttributes: {
           autocapitalize: 'off'
         },
         showCancelButton: true,
         confirmButtonText: '초대하기',
         showLoaderOnConfirm: true,
         preConfirm: (tst_user_nickname) => {
           return fetch("/overlapName_add/"+tst_team_no+"?tst_user_nickname="+ tst_user_nickname)
           .then(response => {
              tst_user_nickname1 = tst_user_nickname;
               if (!response.ok) {
                 throw new Error(response.statusText)
               }
               return response.json()
             })
             .catch(error => {
               Swal.showValidationMessage(
                 `Request failed: ${error}`
               )
             })
         },
       }).then((result) => {
          if(result.value == 1){
             swalWithBootstrapButtons.fire(
                     '초대가 완료되었습니다!'
                     
                   )
             location.href="/addTeamMember/"+tst_team_no+"?tst_user_nickname="+tst_user_nickname1;
          }
          else if(result.value == 2){
             Swal.fire(
                    '이미 초대되었습니다!'
                  )} 
              else if(result.value == 0){
                 Swal.fire(
                       '해당 사용자가 존재하지 않습니다!'
                 )}
       });
   }
/*    function teamUpdate(tst_team_no){
      if(confirm("팀 수정을 원하시나요?") == true)
         location.href ="/teamUpdate?tst_team_no="+tst_team_no;
      else
         return;
   } */
function teamUpdate(tst_team_no){
      const swalWithBootstrapButtons = Swal.mixin({
         customClass: {
           confirmButton: 'btn btn-success',
           cancelButton: 'btn btn-danger'
         },
       })
      swalWithBootstrapButtons.fire({
         title: '팀을 수정하시겠습니까?',
         showCancelButton: true,
         confirmButtonText: '수정',
         cancelButtonText: '취소',
         reverseButtons: true
       }).then((result) => {
         if (result.value) {
            location.href ="/teamUpdate?tst_team_no="+tst_team_no;
         } else if (
           /* Read more about handling dismissals below */
           result.dismiss === Swal.DismissReason.cancel
         ) {
           swalWithBootstrapButtons.fire(
             '취소되었습니다 :)',
           )
         }
       })
   }   
//  유진 함수
// 공지사항 디테일
 function noticeDetail(tst_team_notice_board_no){
    location.href = "/teamNoticeDetail?tst_team_notice_board_no="+tst_team_notice_board_no;
 }
 
//  공지사항 입력
 function noticeInsert(tst_team_no){
    location.href = "/teamNoticeInsert?tst_team_no="+tst_team_no;
 }
 
//공지사항 삭제
 function noticeDelete(tst_team_no){
    location.href = "/teamNoticeDelete?tst_team_no="+tst_team_no;
 }
 
 function teamMatchingList(tst_team_no){
       if(confirm("매칭을 진행하시겠습니까? \n수락시 등록 된 조건으로 상대 팀이 매칭 됩니다!") == true)
            location.href ="/matchingList/"+tst_team_no;
         else
            return;
    }
/*  function teamLeave(tst_user_nickname, tst_team_no){
    if(confirm("해당 팀원을 강퇴하시겠습니까?") == true)
         location.href ="/teamLeave/"+tst_team_no+"?tst_user_nickname="+tst_user_nickname;
      else
         return;
 } */

 function teamLeave(tst_user_nickname, tst_team_no){
    const swalWithBootstrapButtons = Swal.mixin({
         customClass: {
           confirmButton: 'btn btn-success',
           cancelButton: 'btn btn-danger'
         },
       })
      swalWithBootstrapButtons.fire({
         title: '해당 팀원을 강퇴하시겠습니까?',
         showCancelButton: true,
         confirmButtonText: '강퇴',
         cancelButtonText: '취소',
         reverseButtons: true
       }).then((result) => {
         if (result.value) {
           location.href ="/teamLeave/"+tst_team_no+"?tst_user_nickname="+tst_user_nickname;
         } else if (
           /* Read more about handling dismissals below */
           result.dismiss === Swal.DismissReason.cancel
         ) {
           swalWithBootstrapButtons.fire(
             '취소되었습니다 :)',
           )
         }
       })
 }
 function leaveTeam(tst_user_nickname, tst_team_no){
    const swalWithBootstrapButtons = Swal.mixin({
         customClass: {
           confirmButton: 'btn btn-success',
           cancelButton: 'btn btn-danger'
         },
       })
      swalWithBootstrapButtons.fire({
         title: '팀을 나가시겠습니까?',
         showCancelButton: true,
         confirmButtonText: '나가기!',
         cancelButtonText: '남기',
         reverseButtons: true
       }).then((result) => {
         if (result.value) {
           location.href ="/leaveTeam/"+tst_team_no+"?tst_user_nickname="+tst_user_nickname;
         } else if (
           /* Read more about handling dismissals below */
           result.dismiss === Swal.DismissReason.cancel
         ) {
           swalWithBootstrapButtons.fire(
             '취소되었습니다 :)',
           )
         }
       })
 }
 
 
 </script>
               <main id="js-page-content" role="main" class="page-content">
                        <ol class="breadcrumb page-breadcrumb">
                        	<li class="breadcrumb-item"><a href="/teamList">팀 목록</a></li>
                           <!-- 팀장만 보이게 하기! 11.14 -->
                                <c:if test="${ detailTeam.tst_user_nickname == login_user }">
                                 <li class="breadcrumb-item" onclick="teamDelete(${detailTeam.tst_team_no})">팀 삭제</li>
                               <li class="breadcrumb-item active" onclick="teamUpdate(${detailTeam.tst_team_no})">팀 수정</li>
                               <li class="breadcrumb-item" onclick="addMember(${detailTeam.tst_team_no})" id="addMember">팀원 초대</li>
                               <li class="breadcrumb-item"><a href="insertTeamData/${ detailTeam.tst_team_no }">매칭 등록</a></li>
                              </c:if>
                              <c:forEach var="members" items="${member}">
                              <c:if test="${members.tst_user_nickname == login_user }">
                                 <c:if test="${ detailTeam.tst_user_nickname != login_user }">
                               <li class="breadcrumb-item" onclick="leaveTeam('${login_user}', '${detailTeam.tst_team_no}')">팀 나가기</li>
                                 </c:if>
                        </c:if>
                              </c:forEach>
                        </ol>
                    
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class="fal fa-th-list text-primary"></i> ${sorry }
                            </h1>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <!--Basic tables-->
                                
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                      <!-- 10.29 -->
                                        <h2>
                                              팀 정보
                                        </h2>
<!--                                         <div class="panel-toolbar"> -->
<!--                                             <button class="btn btn-panel waves-effect waves-themed" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button> -->
<!--                                             <button class="btn btn-panel waves-effect waves-themed" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button> -->
<!--                                             <button class="btn btn-panel waves-effect waves-themed" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button> -->
<!--                                         </div> -->
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
                                            <td>${ detailTeam.tst_team_avgage }</td>
                                        </tr>
                                        <tr>
                                            <th>주장</th>
                                            <td>${ detailTeam.tst_user_nickname}</td>
                                        </tr>
                                        <tr>
                                            <th>위치</th>
                                            <td>${ detailTeam.tst_team_location }</td>
                                        </tr>
<!--                                         <tr> -->
<!--                                             <th>나이</th> -->
<%--                                             <td>${ detailTeam.tst_team_age }</td> --%>
<!--                                         </tr> -->
                                    </tbody>
                                </table>

                            </div>
                        </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                

                            </div>
                            <input type="hidden" value="${tst_team_no }" name="tst_team_no" id="tst_team_no"/>
                            <div class="col-xl-6">
                                <!--Table bordered-->
                                <div id="panel-2" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                              members
                                        </h2>
<!--                                         <div class="panel-toolbar"> -->
<!--                                             <button class="btn btn-panel waves-effect waves-themed" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button> -->
<!--                                             <button class="btn btn-panel waves-effect waves-themed" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button> -->
<!--                                             <button class="btn btn-panel waves-effect waves-themed" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button> -->
<!--                                         </div> -->
                                    </div>
                                    <div class="frame-wrap">
                                                <table class="table m-0">
                                                    <thead class="thead-themed">
                                                        <tr>
                                                            <th>이름</th>
                                                            <th>나이</th>
                                                            <th>position</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                  <c:forEach var="members" items="${member}">
                                                    <tbody>
                                                        <tr>
                                                            <td>${ members.tst_user_nickname }</td>
                                                            <td>${ members.tst_user_brith }</td>
                                                           <!-- 팀장인지 팀원인지 구별할 수 있게 함 -->
                                                           <c:if test="${detailTeam.tst_user_nickname == members.tst_user_nickname }">
                                                            <td>주장</td>
                                                           </c:if>
                                                           <c:if test="${detailTeam.tst_user_nickname != members.tst_user_nickname }">
                                                            <td>회원</td>
                                                           </c:if>
                                                           <c:if test="${ detailTeam.tst_user_nickname == login_user }">
                                                               <c:if test="${detailTeam.tst_user_nickname == members.tst_user_nickname }">
                                                               <td></td>
                                                                 </c:if>
                                                                 <c:if test="${detailTeam.tst_user_nickname != members.tst_user_nickname }">
                                                               <td><a onclick="teamLeave('${members.tst_user_nickname}', '${detailTeam.tst_team_no}')">강퇴</a></td>
                                                               </c:if>
                                                            </c:if>
                                                        </tr>
                                                    </tbody>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                </div>
                      </div>
                      
                      
                      
                      <div class="col-xl-6">
                                <div id="panel-3" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            MY <span class="fw-300"><i>Score</i></span>
                                        </h2>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
                                                <thead class="bg-warning-200" style="line-height: 0.5;">
                                                    <tr>
                                                        <th>상대팀</th>
                                                        <th>우리팀</th>
                                                        <th>경기 일자</th>
                                                        <th>경기 결과</th>
                                                    </tr>
                                                </thead>
                                               
                                                <tbody>
                                                <!-- 이쪽 수정해야 할거야 번호 때문에 -->
                                                <c:forEach var="selectYourTeam" items="${selectYourTeam}">
                                                    <c:choose>
                                                     <c:when test="${selectYourTeam.tst_team_accept == 'Y'}">
	           											<tr onclick="resultSet('${selectYourTeam.tst_my_team_no}' , '${selectYourTeam.tst_your_team_no}')" >
	                                                         <td>${selectYourTeam.tst_team_name}</td>
		                                                     <td>${selectYourTeam.jjs_team_name }</td>
		                                                     <td>${selectYourTeam.tst_date}</td>
		                                                      <td style="background-color: gray"></td>
	                                                    </tr>
	        											</c:when>     
	                                                    <c:when test="${selectYourTeam.tst_team_accept != 'Y' && selectYourTeam.tst_win eq tst_team_no}">
	           												<tr>
		                                                        <td>${selectYourTeam.tst_team_name}</td>
		                                                        <td>${selectYourTeam.jjs_team_name }</td>
		                                                        <td>${selectYourTeam.tst_date}</td>
		                                                        <td style="background-color: blue"></td>
		                                                    </tr>
	        											</c:when>         
	        											<c:otherwise>
	          	 											 <tr>
		                                                        <td>${selectYourTeam.tst_team_name}</td>
		                                                        <td>${selectYourTeam.jjs_team_name }</td>
		                                                        <td>${selectYourTeam.tst_date}</td>
		                                                        <td style="background-color: red"></td>
		                                                    </tr>
	         											</c:otherwise>
	                                                </c:choose>
                                                </c:forEach>
                                              
                                                </tbody>
                                            </table>
                                            <!-- datatable end -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                      
                      
               </div>
               
                <div class="col-xl-12">
                                <div id="panel-5" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Team <span class="fw-300"><i>Photo</i></span>
                                        </h2>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div id="js-lightgallery">
                                                <a class="" href="${pageContext.request.contextPath}/resources/img/1.jpg" data-sub-html="?">
                                                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/1.jpg" alt="image">
                                                </a>
                                                <a class="" href="${pageContext.request.contextPath}/resources/img/2.jpg" data-sub-html="?">
                                                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/2.jpg" alt="image">
                                                </a>
                                                <a class="" href="${pageContext.request.contextPath}/resources/img/3.jpg" data-sub-html="?">
                                                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/3.jpg" alt="image">
                                                </a>
                                                <a class="" href="${pageContext.request.contextPath}/resources/img/4.jpg" data-sub-html="?">
                                                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/4.jpg" alt="image">
                                                </a>
                                                <a class="" href="${pageContext.request.contextPath}/resources/img/5.jpg" data-sub-html="?">
                                                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/5.jpg" alt="image">
                                                </a>
                                                <a class="" href="${pageContext.request.contextPath}/resources/img/6.jpg" data-sub-html="?">
                                                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/6.jpg" alt="image">
                                                </a>
                                                <a class="" href="${pageContext.request.contextPath}/resources/img/7.jpg" data-sub-html="?">
                                                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/7.jpg" alt="image">
                                                </a>
                                                <a class="" href="${pageContext.request.contextPath}/resources/img/8.jpg" data-sub-html="?">
                                                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/8.jpg" alt="image">
                                                </a>
                                                <a class="" href="${pageContext.request.contextPath}/resources/img/9.jpg" data-sub-html="?">
                                                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/9.jpg" alt="image">
                                                </a>
                                                <a class="" href="${pageContext.request.contextPath}/resources/img/10.jpg" data-sub-html="?">
                                                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/10.jpg" alt="image">
                                                </a>
                                                <a class="" href="${pageContext.request.contextPath}/resources/img/11.jpg" data-sub-html="?">
                                                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/11.jpg" alt="image">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
               
               </br>
                        <div class="subheader">
                        </div>
             <c:forEach var="members" items="${member}">
            <c:if test="${members.tst_user_nickname  == login_user}">
                <div class="col-xl-12">
                    <div>
                        <div id="panel-4" class="panel">
                            <div class="panel-hdr">
                                <h2>
                                    TeamNotice <span class="fw-300"><i>Table</i></span>
                                </h2>
<!--                                 <div class="panel-toolbar"> -->
<!--                                     <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button> -->
<!--                                     <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button> -->
<!--                                     <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button> -->
<!--                                 </div> -->
                            </div>
                            <div class="panel-container show">
                                <div class="panel-content">
                                    
                      <!-- datatable start -->
                    <c:if test="${login_user == detailTeam.tst_user_nickname}">
                    <button type="button" class="btn btn-outline-warning" onclick="noticeInsert(${detailTeam.tst_team_no})">게시글 입력</button>
                    </c:if>
                   </br>
                   </br>
            <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
                  <thead class="bg-primary-600" style="line-height: 0.5;">
                      <tr>
                          <th>No</th>
                          <th>Title</th>
                          <th>Nickname</th>
                          <th>UserView</th>
                          <th>Date</th>
                      </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="row" items="${TeamBoardList}">
                     <tr onclick="noticeDetail(${row.tst_team_notice_board_no})" style="line-height: 1.1; bo">
                           <td>${row.no }</td>
                           <td style="padding-top: 0; padding-bottom: 0;">
                              <ol class="breadcrumb page-breadcrumb"
                                 style="margin: 1rem;">
                                 <li class="breadcrumb-item">${row.tst_team_notice_board_title}</li>
                              </ol>
                           </td>
                           <td>${row.tst_user_nickname}</td>
                           <td id = "lineC">${row.team_members_view} / ${row.teammembers}</td>
                           <td>${row.tst_team_notice_insert_date}</td>
                     </tr>
                     </c:forEach>
                  </tbody>
            </table>
                                    
                                    <!-- datatable end -->
                                    
<!--                                     </div> -->
                      <div class="col-xl-5" id="test">
                      
                      </div>
                      <input type="hidden" value="${userId}" name="userId" id="userId"/>
                      
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
   </c:if>
   </c:forEach>
   
   <!-- 여기야 -->
                           
   
</main>
                  
        <script src="${pageContext.request.contextPath}/resources/js/vendors.bundle.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/app.bundle.js"></script>
        <script type="text/javascript">
            /* Activate smart panels */
            $('#js-page-content').smartPanel();
        </script>
        <!-- The order of scripts is irrelevant. Please check out the plugin pages for more details about these plugins below: -->
        <script src="${pageContext.request.contextPath}/resources/js/statistics/peity/peity.bundle.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/statistics/flot/flot.bundle.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/statistics/easypiechart/easypiechart.bundle.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/datagrid/datatables/datatables.bundle.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/notifications/sweetalert2/sweetalert2.bundle.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/miscellaneous/lightgallery/lightgallery.bundle.js"></script>
        
	<script>
	
	 $(document).ready(function()
	            {
	                var $initScope = $('#js-lightgallery');
	                if ($initScope.length)
	                {
	                    $initScope.justifiedGallery(
	                    {
	                        border: -1,
	                        rowHeight: 150,
	                        margins: 8,
	                        waitThumbnailsLoad: true,
	                        randomize: false,
	                    }).on('jg.complete', function()
	                    {
	                        $initScope.lightGallery(
	                        {
	                            thumbnail: true,
	                            animateThumb: true,
	                            showThumbByDefault: true,
	                        });
	                    });
	                };
	                $initScope.on('onAfterOpen.lg', function(event)
	                {
	                    $('body').addClass("overflow-hidden");
	                });
	                $initScope.on('onCloseAfter.lg', function(event)
	                {
	                    $('body').removeClass("overflow-hidden");
	                });
	            });
	
	
	
	function resultSet(no,no2){
		let myTst_team_no = $('#tst_team_no').val();
		let loseNo = 0;
		if(myTst_team_no == no){
			loseNo = no2;
		}else{
			loseNo = no;
		}
		var swalWithBootstrapButtons = Swal.mixin(
                {
                    customClass:
                    {
                        confirmButton: "btn btn-primary",
                        cancelButton: "btn btn-danger mr-2"
                    },
                    buttonsStyling: false
                });
                swalWithBootstrapButtons
                    .fire(
                    {
                        title: "경기에서 이기셨나요?",
                        text: "경기 결과를 알려주세요!",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonText: "Yes!",
                        cancelButtonText: "No..",
                        reverseButtons: true
                    })
                    .then(function(result)
                    {
                        if (result.value)
                        {
                            swalWithBootstrapButtons.fire(
                                "축하드립니다!",
                                "다음 경기도 즐겨주세요 :)",
                                "success"
                            );
                
                            $.ajax({
                      	      async : true,
                      	      url : '${pageContext.request.contextPath}resultSet/?win_no='+myTst_team_no + "&loseNo="+loseNo +"&myTeam="+$('#tst_team_no').val(),
                      	      type : 'GET',
                      	      success : function() {
                      	      },
                      	      error : function() {
                      	         console.log("실패");
                      	      }
                      	   });
                
                        }
                        else if (result.dismiss === Swal.DismissReason.cancel)
                        {
                            swalWithBootstrapButtons.fire(
                                "안타깝네요..",
                                "다음 경기도 즐겨주세요 :)",
                                "error"
                            );
                            
                            $.ajax({
                      	      async : true,
                      	      url : '${pageContext.request.contextPath}resultSet/?win_no='+loseNo+ "&loseNo="+myTst_team_no+"&myTeam="+$('#tst_team_no').val(),
                      	      type : 'GET',
                      	      success : function() {
                      	      },
                      	      error : function() {
                      	         console.log("실패");
                      	      }
                      	   });
                        }
                    });
                    
                setTimeout(function(){
                	location.reload();
                	},3000);
	}
                
		 
	
	
	
	
	
	
	
            /* defined datas */
            var dataTargetProfit = [
                [1354586000000, 153],
                [1364587000000, 658],
                [1374588000000, 198],
                [1384589000000, 663],
                [1394590000000, 801],
                [1404591000000, 1080],
                [1414592000000, 353],
                [1424593000000, 749],
                [1434594000000, 523],
                [1444595000000, 258],
                [1454596000000, 688],
                [1464597000000, 364]
            ]
            var dataProfit = [
                [1354586000000, 53],
                [1364587000000, 65],
                [1374588000000, 98],
                [1384589000000, 83],
                [1394590000000, 980],
                [1404591000000, 808],
                [1414592000000, 720],
                [1424593000000, 674],
                [1434594000000, 23],
                [1444595000000, 79],
                [1454596000000, 88],
                [1464597000000, 36]
            ]
            var dataSignups = [
                [1354586000000, 647],
                [1364587000000, 435],
                [1374588000000, 784],
                [1384589000000, 346],
                [1394590000000, 487],
                [1404591000000, 463],
                [1414592000000, 479],
                [1424593000000, 236],
                [1434594000000, 843],
                [1444595000000, 657],
                [1454596000000, 241],
                [1464597000000, 341]
            ]
            var dataSet1 = [
                [0, 10],
                [100, 8],
                [200, 7],
                [300, 5],
                [400, 4],
                [500, 6],
                [600, 3],
                [700, 2]
            ];
            var dataSet2 = [
                [0, 9],
                [100, 6],
                [200, 5],
                [300, 3],
                [400, 3],
                [500, 5],
                [600, 2],
                [700, 1]
            ];

            $(document).ready(function()
            {

                /* init datatables */
                $('#dt-basic-example').dataTable(
                {
                    responsive: true,
                    dom: "<'row mb-3'<'col-sm-12 col-md-6 d-flex align-items-center justify-content-start'f><'col-sm-12 col-md-6 d-flex align-items-center justify-content-end'B>>" +
                        "<'row'<'col-sm-12'tr>>" +
                        "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
                    buttons: [
                        {
                            extend: 'colvis',
                            text: 'Column Visibility',
                            titleAttr: 'Col visibility',
                            className: 'btn-outline-default'
                        },
                        {
                            extend: 'copyHtml5',
                            text: 'Copy',
                            titleAttr: 'Copy to clipboard',
                            className: 'btn-outline-default'
                        },
                        {
                            extend: 'print',
                            text: '<i class="fal fa-print"></i>',
                            titleAttr: 'Print Table',
                            className: 'btn-outline-default'
                        }

                    ],
                    columnDefs: [
                        {
                            targets: -1,
                            title: '',
                            orderable: false,
                            render: function(data, type, full, meta)
                            {

                                return "";
                            },
                        },

                    ]

                });


                /* flot toggle example */
                var flot_toggle = function()
                {

                    var data = [
                    {
                        label: "Target Profit",
                        data: dataTargetProfit,
                        color: color.info._400,
                        bars:
                        {
                            show: true,
                            align: "center",
                            barWidth: 30 * 30 * 60 * 1000 * 80,
                            lineWidth: 0,
                            /*fillColor: {
                            	colors: [color.primary._500, color.primary._900]
                            },*/
                            fillColor:
                            {
                                colors: [
                                {
                                    opacity: 0.9
                                },
                                {
                                    opacity: 0.1
                                }]
                            }
                        },
                        highlightColor: 'rgba(255,255,255,0.3)',
                        shadowSize: 0
                    },
                    {
                        label: "Actual Profit",
                        data: dataProfit,
                        color: color.warning._500,
                        lines:
                        {
                            show: true,
                            lineWidth: 2
                        },
                        shadowSize: 0,
                        points:
                        {
                            show: true
                        }
                    },
                    {
                        label: "User Signups",
                        data: dataSignups,
                        color: color.success._500,
                        lines:
                        {
                            show: true,
                            lineWidth: 2
                        },
                        shadowSize: 0,
                        points:
                        {
                            show: true
                        }
                    }]

                    var options = {
                        grid:
                        {
                            hoverable: true,
                            clickable: true,
                            tickColor: '#f2f2f2',
                            borderWidth: 1,
                            borderColor: '#f2f2f2'
                        },
                        tooltip: true,
                        tooltipOpts:
                        {
                            cssClass: 'tooltip-inner',
                            defaultTheme: false
                        },
                        xaxis:
                        {
                            mode: "time"
                        },
                        yaxes:
                        {
                            tickFormatter: function(val, axis)
                            {
                                return "$" + val;
                            },
                            max: 1200
                        }

                    };

                    var plot2 = null;

                    function plotNow()
                    {
                        var d = [];
                        $("#js-checkbox-toggles").find(':checkbox').each(function()
                        {
                            if ($(this).is(':checked'))
                            {
                                d.push(data[$(this).attr("name").substr(4, 1)]);
                            }
                        });
                        if (d.length > 0)
                        {
                            if (plot2)
                            {
                                plot2.setData(d);
                                plot2.draw();
                            }
                            else
                            {
                                plot2 = $.plot($("#flot-toggles"), d, options);
                            }
                        }

                    };

                    $("#js-checkbox-toggles").find(':checkbox').on('change', function()
                    {
                        plotNow();
                    });
                    plotNow()
                }
                flot_toggle();
                /* flot toggle example -- end*/

                /* flot area */
                var flotArea = $.plot($('#flot-area'), [
                {
                    data: dataSet1,
                    label: 'New Customer',
                    color: color.success._200
                },
                {
                    data: dataSet2,
                    label: 'Returning Customer',
                    color: color.info._200
                }],
                {
                    series:
                    {
                        lines:
                        {
                            show: true,
                            lineWidth: 2,
                            fill: true,
                            fillColor:
                            {
                                colors: [
                                {
                                    opacity: 0
                                },
                                {
                                    opacity: 0.5
                                }]
                            }
                        },
                        shadowSize: 0
                    },
                    points:
                    {
                        show: true,
                    },
                    legend:
                    {
                        noColumns: 1,
                        position: 'nw'
                    },
                    grid:
                    {
                        hoverable: true,
                        clickable: true,
                        borderColor: '#ddd',
                        tickColor: '#ddd',
                        aboveData: true,
                        borderWidth: 0,
                        labelMargin: 5,
                        backgroundColor: 'transparent'
                    },
                    yaxis:
                    {
                        tickLength: 1,
                        min: 0,
                        max: 15,
                        color: '#eee',
                        font:
                        {
                            size: 0,
                            color: '#999'
                        }
                    },
                    xaxis:
                    {
                        tickLength: 1,
                        color: '#eee',
                        font:
                        {
                            size: 10,
                            color: '#999'
                        }
                    }

                });
                /* flot area -- end */

                var flotVisit = $.plot('#flotVisit', [
                {
                    data: [
                        [3, 0],
                        [4, 1],
                        [5, 3],
                        [6, 3],
                        [7, 10],
                        [8, 11],
                        [9, 12],
                        [10, 9],
                        [11, 12],
                        [12, 8],
                        [13, 5]
                    ],
                    color: color.success._200
                },
                {
                    data: [
                        [1, 0],
                        [2, 0],
                        [3, 1],
                        [4, 2],
                        [5, 2],
                        [6, 5],
                        [7, 8],
                        [8, 12],
                        [9, 9],
                        [10, 11],
                        [11, 5]
                    ],
                    color: color.info._200
                }],
                {
                    series:
                    {
                        shadowSize: 0,
                        lines:
                        {
                            show: true,
                            lineWidth: 2,
                            fill: true,
                            fillColor:
                            {
                                colors: [
                                {
                                    opacity: 0
                                },
                                {
                                    opacity: 0.12
                                }]
                            }
                        }
                    },
                    grid:
                    {
                        borderWidth: 0
                    },
                    yaxis:
                    {
                        min: 0,
                        max: 15,
                        tickColor: '#ddd',
                        ticks: [
                            [0, ''],
                            [5, '100K'],
                            [10, '200K'],
                            [15, '300K']
                        ],
                        font:
                        {
                            color: '#444',
                            size: 10
                        }
                    },
                    xaxis:
                    {

                        tickColor: '#eee',
                        ticks: [
                            [2, '2am'],
                            [3, '3am'],
                            [4, '4am'],
                            [5, '5am'],
                            [6, '6am'],
                            [7, '7am'],
                            [8, '8am'],
                            [9, '9am'],
                            [10, '1pm'],
                            [11, '2pm'],
                            [12, '3pm'],
                            [13, '4pm']
                        ],
                        font:
                        {
                            color: '#999',
                            size: 9
                        }
                    }
                });


            });

        </script>
                    
</body>
</html>