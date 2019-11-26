<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Team List</title>

</head>
<body>
<main id="js-page-content" role="main" class="page-content">
<div class="subheader">
   <h1 class="subheader-title">
      <i class='subheader-icon fal fa-edit'></i> Basic Inputs <small>
         Default input elements for forms </small>
   </h1>
</div>
<div class="row">
   <div class="col-xl-6">
      <div id="panel-1" class="panel">
         <div class="panel-container show">
            <div class="panel-content">
               <form method="post" action="/teamUpdate">
                  <div class="form-group">
                     <label class="form-label" for="simpleinput">팀 명</label> 
                     <input type="text" id="simpleinput" class="form-control" id="tst_team_name" name="tst_team_name" value="${team.tst_team_name}" disabled="disabled">
                  </div>
                  <div class="form-group">
                     <label class="form-label" for="simpleinput">종목</label> 
                     <input type="text" id="simpleinput" class="form-control" id="tst_team_type" name="tst_team_type" value="${team.tst_team_type}" disabled="disabled">
                  </div>
                  <div class="form-group">
                     <label class="form-label" for="simpleinput">주 위치</label> 
                     <input type="text" id="simpleinput" class="form-control" id="tst_team_location" name="tst_team_location"value="${team.tst_team_location}" disabled="disabled">
                  </div>
                  <div class="form-group">
                     <label class="form-label" for="simpleinput">팀장</label> 
                     <input type="text" class="form-control" id="tst_user_nickname" name="tst_user_nickname" value="${team.tst_user_nickname}" >
                  </div>
                  <div class="form-group">
                     <label class="form-label" for="simpleinput">나이</label> 
                     <input type="text" id="simpleinput" class="form-control" id="tst_team_age" name="tst_team_age" value="${team.tst_team_age}" >
                  </div>
                  <div class="form-group">
                     <label class="form-label" for="example-textarea">Text area</label>
                     <textarea class="form-control" id="simpleinput" id="tst_team_content" name="tst_team_content"rows="5" >${ team.tst_team_content }</textarea>
                  </div>
                  <input type="submit" value="create">
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
</main>
</body>
