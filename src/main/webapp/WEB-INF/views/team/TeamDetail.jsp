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

   /* 
   function addMember(tst_team_no){
      var tst_user_id = prompt("초대할 사용자의 닉네임을 입력해주세요!",'');
      if (tst_user_id != null) 
         location.href="/addTeamMember/"+tst_team_no+"?tst_user_id="+tst_user_id;
      else return;
         
   } */ 

           
   function addMember(tst_team_no){
      var tst_user_nickname = prompt("초대할 사용자의 로그인 ID를 입력해주세요!",'');
      if (tst_user_nickname != null) {
         $.ajax({
            url : "${pageContext.request.contextPath}/overlapName_add/"+tst_team_no+"?tst_user_nickname="+ tst_user_nickname,
            type : 'get',
            success : function(data){
               if(data === 1){ //해당 ID User가 전체 유저목록에 있을 때
                  confirm
                  location.href="/addTeamMember/"+tst_team_no+"?tst_user_nickname="+tst_user_nickname;
                  }
                else if(data === 2){
                  alert(tst_user_nickname + " 에 대한 사용자가 존재합니다!!")
               } 
               else{
                  alert(tst_user_nickname + " 사용자가 존재하지 않습니다!")
               }
            },
            error : function() {
               console.log("실패");
            }
         })
      }
      else return;
   }
   function teamUpdate(tst_team_no){
      if(confirm("팀 수정을 원하시나요?") == true)
         location.href ="/teamUpdate?tst_team_no="+tst_team_no;
      else
         return;
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
</script>
               
               <main id="js-page-content" role="main" class="page-content">
                        <ol class="breadcrumb page-breadcrumb">
                           <!-- 팀장만 보이게 하기! 11.14 -->
                                   <li class="breadcrumb-item" onclick="teamDelete(${detailTeam.tst_team_no})">팀 삭제</li>
                            <li class="breadcrumb-item active" onclick="teamUpdate(${detailTeam.tst_team_no})">팀 수정</li>
                                  <li class="breadcrumb-item" onclick="addMember(${detailTeam.tst_team_no})" id="addMember">팀원 초대하기</li>
                        </ol>
                    
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class="fal fa-th-list text-primary"></i> MY TEAM
<!--                                 <small> -->
<!--                                     Documentation and examples for opt-in styling of tables (given their prevelant use in JavaScript plugins) with Bootstrap. -->
<!--                                 </small> -->
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
                                

                            </div>
                            <input type="hidden" value="${tst_team_no }" name="tst_team_no" id="tst_team_no"/>
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
                                                           <!-- 팀장인지 팀원인지 구별할 수 있게 함 -->
                                                           <c:if test="${detailTeam.tst_user_nickname == members.tst_user_nickname }">
                                                            <td>주장입니다~</td>
                                                           </c:if>
                                                           <c:if test="${detailTeam.tst_user_nickname != members.tst_user_nickname }">
                                                            <td>회원입니다~</td>
                                                           </c:if>
                                                        </tr>
                                                    </tbody>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                </div>
                      </div>

               </div>
               
               </br>
                        <div class="subheader">
                            <h1 class="subheader-title">
<!--                                 <i class='subheader-icon fal fa-table'></i> 팀 공지 게시판 -->
<!--                                 <small> -->
<!--                                           팀 공지 게시판을 확인 해 주세요. -->
<!--                                 </small> -->
                            </h1>
                        </div>
                     <c:forEach var="members" items="${member}">
				<c:if test="${members.tst_user_nickname  == login_user}">
                        <div class="col-xl-12">
                            <div>
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            TeamNotice <span class="fw-300"><i>Table</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            
                              <!-- datatable start -->
                              <c:if test="${login_user == detailTeam.tst_user_nickname}">
                              <button type="button" class="btn btn-outline-warning" onclick="noticeInsert(${detailTeam.tst_team_no})">게시글 입력</button>
                              </c:if>
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
                                    <td>
                                       <ol class="breadcrumb page-breadcrumb"
                                          style="margin: 1rem;">
                                          <li class="breadcrumb-item">${row.tst_team_notice_board_title}</li>
                                       </ol>
                                    </td>
                                    <td>${row.tst_user_nickname}</td>
                                    <td>${row.team_members_view} / ${row.teammembers}</td>
                                    <td>${row.tst_team_notice_insert_date}</td>
                              </tr>
                              </c:forEach>
                           </tbody>
                                               
					</table>
                                            
                                            <!-- datatable end -->
                                            
<!--                                             </div> -->
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
                          
                           
                     
                    </main>
                    
</body>
</html>