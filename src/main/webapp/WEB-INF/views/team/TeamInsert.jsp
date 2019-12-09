<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- swal -->
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/notifications/sweetalert2/sweetalert2.bundle.css">
<script src="${pageContext.request.contextPath}/resources/js/notifications/sweetalert2/sweetalert2.bundle.js"></script>
<!--  -->
<script src="//cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
<script src="/resources/static/js/jquery-3.2.1.min.js"></script>
<link href="/resources/static/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/static/js/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Team List</title>

</head>
<body>
<main id="js-page-content" role="main" class="page-content">
<div class="subheader">
   <h1 class="subheader-title">
      <i class='subheader-icon fal fa-edit'></i> 팀 생성 <small>
         당신의 팀을 만들어 보세요! </small>
   </h1>
</div>
   <div class="row">
      <div class="col-xl-6">
         <div id="panel-1" class="panel">
            <div class="panel-container show">
               <div class="panel-content">
                  <form method="post" action="/teamInsertPage">
                     <div class="form-group">
                        <label class="form-label" for="simpleinput">팀 명</label> 
                        <input type="text" id="simpleinput" class="form-control" id="tst_team_name" name="tst_team_name" >
                     </div>
   
                  <div class="form-group">
                       <div class="input-group-prepend">
                           <label class="input-group-text" for="inputGroupSelect01" style="border: none; background: none; padding: 0px;">종목</label>
                       </div>
                       <select class="custom-select" id="tst_team_type" name="tst_team_type">
                  <option value='축구'>축구</option>
                  <option value='농구'>농구</option>
                  <option value='야구'>야구</option>
                  <option value='리그오브레전드'>리그오브레전드</option>
                  <option value='배틀그라운드'>배틀그라운드</option>
                       </select>
                   </div>                                     
               <div class="form-group">
                       <div class="input-group-prepend">
                           <label class="input-group-text" for="inputGroupSelect01" style="border: none; background: none; padding: 0px;">위치</label>
                       </div>
                       <select class="custom-select" id="tst_team_location" name="tst_team_location">
                  <option value='서울'>서울</option>
                  <option value='부산'>부산</option>
                  <option value='인천'>인천</option>
                  <option value='일산'>일산</option>
                  <option value='수원'>수원</option>
                  <option value='대구'>대구</option>
                  <option value='울산'>울산</option>                                       
                       </select>
                   </div>   
                  
                   <div class="form-group">
                        <label class="form-label" for="simpleinput">팀장</label> 
                        <input type="text" class="form-control" id="tst_user_nickname" name="tst_user_nickname" value="${tst_user_nickname}" disabled="disabled" >
                   </div>
                   <div class="form-group">
                        <label class="form-label" for="simpleinput">나이</label> 
                        <input type="number" id="simpleinput" class="form-control" id="tst_team_age" name="tst_team_age"  >
                   </div>
                     <div class="form-group">
                        <label class="form-label" for="example-textarea">팀 소개글</label>
                        <textarea class="form-control" id="simpleinput" id="tst_team_content" name="tst_team_content"rows="5" ></textarea>
                     </div>
               <button class="btn btn-default waves-effect waves-themed" style=" margin-bottom:10px;" data-toggle="modal" data-target="#example-modal-alert">Make Team!</button>                  
               </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</main>
</body>