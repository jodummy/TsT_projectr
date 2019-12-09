<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- swal -->
<script src="${pageContext.request.contextPath}/resources/js/notifications/sweetalert2/sweetalert2.bundle.js"></script>
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/notifications/sweetalert2/sweetalert2.bundle.css">
<!--  -->
<meta name="description" content="Date Picker">
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
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/formplugins/bootstrap-datepicker/bootstrap-datepicker.css">
<title>Insert title here</title>
</head>

<body class="mod-bg-1 ">
<script>
/*  function teamMatchingList(tst_team_no){
    if(confirm("조건 매칭을 진행하시겠습니까? \n수락시 등록 된 조건으로 상대 팀이 매칭 됩니다!") == true)
         location.href ="/matchingList/"+tst_team_no;
      else
         return;
 } */

 function teamMatchingList(tst_team_no){
    const swalWithBootstrapButtons = Swal.mixin({
         customClass: {
           confirmButton: 'btn btn-success',
           cancelButton: 'btn btn-danger'
         },
       })
      swalWithBootstrapButtons.fire({
         title: '등록된 조건으로 매칭이 시작됩니다!',
         showCancelButton: true,
         confirmButtonText: '매칭!',
         cancelButtonText: '취소',
         reverseButtons: true
       }).then((result) => {
         if (result.value) {
               location.href ="/matchingList/"+tst_team_no;
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
 
function teamMatchingUpdate(tst_team_no){
    if(confirm("매칭 정보를 수정하시겠습니까?") == true)
      location.href = "/matchingUpdate/"+tst_team_no;
      else return ;
}
function teamMatchingInsert(tst_team_no){
   if(confirm("매칭 정보를 등록하시겠습니까?") == true)
      location.href = "/insertTeamMatching/"+tst_team_no;
   else return;
}
/* function teamRandomMatchingList(tst_team_no){
   if(confirm("랜덤 매칭을 진행하시겠습니까? \n랜덤 매칭은 나이와 종목으로만 매칭을 진행합니다!"))
      location.href = "/randomMatchingList/"+tst_team_no;
   else return ;
 }
 */ 
 function teamRandomMatchingList(tst_team_no){
    const swalWithBootstrapButtons = Swal.mixin({
         customClass: {
           confirmButton: 'btn btn-success',
           cancelButton: 'btn btn-danger'
         },
       })
      swalWithBootstrapButtons.fire({
         title: '나이와 종목만으로 매칭이 시작됩니다!',
         showCancelButton: true,
         confirmButtonText: '매칭!',
         cancelButtonText: '취소',
         reverseButtons: true
       }).then((result) => {
         if (result.value) {
            location.href = "/randomMatchingList/"+tst_team_no;
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
       <li class="breadcrumb-item" onclick="back_home(${teamVo.tst_team_no })">Team Home</li>
       <li class="position-absolute pos-top pos-right d-none d-sm-block"><span class="js-get-date"></span></li>
   </ol>
   <div class="subheader">
       <h1 class="subheader-title">
           <i class='subheader-icon fal fa-window'></i> 매칭 페이지
       </h1>
   </div>
   <div class="row">
       <div class="col-md-12 col-xl-6">
           <!--Basic alerts-->
      <div class="col-xl-12">
        <c:if test="${count == 0 }">
         <div id="panel-1" class="panel">
         <div class="panel-hdr">
                   <h2>
                          조건 매칭
                   </h2>
                   <div class="panel-toolbar">
                       <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                       <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                       <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                   </div>
                 </div>
             <div class="panel-container show">
             <div class="panel-content">
               <form method="post" action="/insertTeamMatching/${teamVo.tst_team_no}">
                     <div class="form-group">
                        <label class="form-label" for="simpleinput">팀명</label> 
                        <input type="text" class="form-control" value="${teamVo.tst_team_name }" id="tst_team_name" name="tst_team_name" disabled="disabled">
                     </div>
                     
                     <div class="form-group">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="inputGroupSelect01" style="border: none; background: none; padding: 0px;">종목</label>
                    </div>
                    <select class="custom-select" id="tst_team_con_matching_type" name="tst_team_con_matching_type">
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
                              <select class="custom-select" id="tst_team_con_matching_location" name="tst_team_con_matching_location" >
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
                       <div class="col-md-6" style="padding:0px;float: left; ">
                            <label class="form-label" for="simpleinput">나이</label> 
                            <input value="${teamVo.tst_team_age }" type="number" id="simpleinput" class="form-control" id="tst_team_con_matching_age" name="tst_team_con_matching_age" style="width: 95%;">
                       </div>
                   </div>
                   <div class="form-group">
                      <div class="col-md-6" style="padding:0px;float: left;">
                            <label class="form-label" for="simpleinput">성별</label> 
                           <div class="form-group">
                                  <select class="custom-select" id="tst_team_con_matching_gender" name="tst_team_con_matching_gender">
                           <option value='Men'>Men</option>
                           <option value='Women'>Women</option>
                                     </select>                                        
                              </div>
                        </div>
                     </div>
                     
                         <div class="form-group">
                        <label class="form-label" for="simpleinput">Date</label> 
                        <input type="date" id="simpleinput" class="form-control" id="tst_team_con_matching_date" name="tst_team_con_matching_date">
                     </div>
                     
                  <button type="submit" class="btn btn-default waves-effect waves-themed" style=" margin-bottom:10px;" data-toggle="modal" data-target="#example-modal-alert">등록</button>                  
                  </form>
               </div>
            </div>
         </div>
         </c:if>
         <c:if test="${ count >= 1 }">
         <div id="panel-1" class="panel">
         <div class="panel-hdr">
                   <h2>
                          조건 매칭
                   </h2>
                   <div class="panel-toolbar">
                       <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                       <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                       <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                   </div>
                 </div>
             <div class="panel-container show">
             <div class="panel-content">
               <form method="post" action="/matchingUpdate/${teamVo.tst_team_no}">
                     <div class="form-group">
                        <label class="form-label" for="simpleinput">팀명</label> 
                        <input type="text" class="form-control" value="${teamVo.tst_team_name }" id="tst_team_name" name="tst_team_name" disabled="disabled">
                     </div>
                     
                    <div class="form-group">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="inputGroupSelect01" style="border: none; background: none; padding: 0px;">종목</label>
                    </div>
                    <select class="custom-select" id="tst_team_con_matching_type" name="tst_team_con_matching_type">
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
                              <select class="custom-select" id="tst_team_con_matching_location" name="tst_team_con_matching_location" >
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
                       <div class="col-md-6" style="padding:0px;float: left; ">
                            <label class="form-label" for="simpleinput">나이</label> 
                            <input value="${teamVo.tst_team_age }" type="number" id="simpleinput" class="form-control" id="tst_team_con_matching_age" name="tst_team_con_matching_age" style="width: 95%;">
                       </div>
                   </div>
                   <div class="form-group">
                      <div class="col-md-6" style="padding:0px;float: left;">
                            <label class="form-label" for="simpleinput">성별</label> 
                           <div class="form-group">
                                  <select class="custom-select" id="tst_team_con_matching_gender" name="tst_team_con_matching_gender">
                           <option value='Men'>Men</option>
                           <option value='Women'>Women</option>
                                     </select>                                        
                              </div>
                        </div>
                     </div>
                     
                         <div class="form-group">
                        <label class="form-label" for="simpleinput">Date</label> 
                        <input type="date" id="simpleinput" class="form-control" id="tst_team_con_matching_date" name="tst_team_con_matching_date">
                     </div>
                  <button class="btn btn-default waves-effect waves-themed" style=" margin-bottom:10px;" data-toggle="modal" data-target="#example-modal-alert">수정</button>                  
                  </form>
               </div>
            </div>
         </div>
         </c:if>
      </div>
       </div>
       <div class="col-md-12 col-xl-6">
           <!--Basic alerts-->
      <div class="col-xl-12">
      
         <div id="panel-1" class="panel">
         <div class="panel-hdr">
                   <h2>
                          등록된 매칭 내용입니다!
                   </h2>
                   <div class="panel-toolbar">
                       <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                       <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                       <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                   </div>
                 </div>
                 <c:if test="${count > 0}">
             <div class="panel-container show">
                <div class="panel-content">
                     <div class="form-group">
                        <label class="form-label" for="simpleinput">팀명</label> 
                        <input type="text" class="form-control" value="${teamVo.tst_team_name }" id="tst_team_name" name="tst_team_name" disabled="disabled">
                     </div>
                     
                     <div class="form-group">
                        <label class="form-label" for="simpleinput">종목</label> 
                        <input type="text" class="form-control" id="tst_team_con_matching_type" name="tst_team_con_matching_type" value="${matchingVo.tst_team_con_matching_type }" disabled="disabled">
                     </div>

                      <div class="form-group">
                            <label class="form-label" for="simpleinput">위치</label> 
                            <input value="${matchingVo.tst_team_con_matching_location }" type="text" id="simpleinput" class="form-control" id="tst_team_con_matching_location" disabled="disabled" name="tst_team_con_matching_location" style="width: 95%;">
                   </div>
                    <div class="form-group">
                       <div class="col-md-6" style="padding:0px;float: left; ">
                            <label class="form-label" for="simpleinput">나이</label> 
                            <input value="${matchingVo.tst_team_con_matching_age }" type="number" id="simpleinput" class="form-control" id="tst_team_con_matching_age" disabled="disabled" name="tst_team_con_matching_age" style="width: 95%;">
                       </div>
                   </div>
                   <div class="form-group">
                      <div class="col-md-6" style="padding:0px;float: left;">
                          <label class="form-label" for="simpleinput">성별</label> 
                             <input type="text" class="form-control" id="tst_team_con_matching_gender" name="tst_team_con_matching_gender" value="${matchingVo.tst_team_con_matching_gender }" disabled="disabled">
                        </div>
                     </div>
                     
                        <div class="form-group">
                          <label class="form-label" for="simpleinput">Data</label> 
                          <input type="text" id="simpleinput" class="form-control" id="tst_team_con_matching_date" name="tst_team_con_matching_date" value="${matchingVo.tst_team_con_matching_date }" disabled="disabled">
                        </div>
                  </div>
                     <button type="button" class="btn btn-default waves-effect waves-themed" style="left:15px; margin-bottom:10px;" data-toggle="modal" data-target="#example-modal-alert" onclick="teamMatchingList(${teamVo.tst_team_no})">조건 매칭</button>
                     <button type="button" class="btn btn-default waves-effect waves-themed" style="left:15px; margin-bottom:10px;" data-toggle="modal" data-target="#example-modal-alert" onclick="teamRandomMatchingList(${teamVo.tst_team_no})">랜덤 매칭</button>
               </div>
            </c:if>
            
               <c:if test="${count == 0 }">
                   <div style="padding:auto;">
                      <p style="text-align: center; margin:220px 130px; font-size: large;"> 매칭을 등록해 주세요!</p>
                   </div>
               </c:if>
            </div>
         </div>
           <!--Dismissable Alerts-->
           <!--Large Alerts-->
          </div>
      </div>
 </main>
        <!-- 11.25 date -->
</body>
<script src="${pageContext.request.contextPath}/resources/js/vendors.bundle.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app.bundle.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/formplugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript">
function back_home(tst_team_no){
      if (confirm("매칭을 취소하시겠습니까?") == true){
         location.href = '/teamDetailpage?tst_team_no='+tst_team_no;
      }
      else return ;
   }
</script>
</html>