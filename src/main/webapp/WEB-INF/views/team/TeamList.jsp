<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 11.19 조준서 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Team List</title>

</head>
<body>
   <main id="js-page-content" role="main" class="page-content">
<!--    <ol class="breadcrumb page-breadcrumb"> -->
<!--       <li class="position-absolute pos-top pos-right d-none d-sm-block"></li> -->
<!--    </ol> -->
   <div class="subheader">
      <h1 class="subheader-title">
      <div class="flex-1 fs-xxl text-contrast">Team List <small>나만의 팀을 찾으세요 </small></div>
      </h1>
   </div>
   
   <div class="row">
      <div class="col-xl-12">
         <div class="border-faded bg-faded p-3 mb-g d-flex">
      <div class="input-group input-group-sm bg-white shadow-inset-2">
<!-- 11.04 검색 -->
           <div class="input-group-prepend">
                <span class="input-group-text bg-transparent border-right-0 py-1 px-3 text-success">
                 <i class="fal fa-search"></i>
                </span>
           </div>
           <form class="kth" action="get" style="display: -webkit-inline-box; width: 89%;">
           <input type="text" class="form-control border-left-0 bg-transparent pl-0" placeholder="Type here..." style="height:auto;" name="keyword" id="keyword" value="${ pagination.keyword }">
            <div class="input-group-append" style="margin-left:3px;">
               <button class="btn btn-default waves-effect waves-themed" name="btnSearch" id="btnSearch" type="submit">Search</button>
            </div>
            </form>
       </div>            
            <div class="btn-group btn-group-lg btn-group-toggle hidden-lg-down ml-3" data-toggle="buttons">
               <label class="btn btn-default active"> <input type="radio"
                  name="contactview" id="grid" checked="" value="grid">
                  <i class="fas fa-table"></i>
               </label> 
               <label class="btn btn-default"> <input type="radio"
                  name="contactview" id="table" value="table">
                  <i class="fas fa-th-list"></i>
               </label>
            </div>
         </div>
      </div>
   </div>
   
   <div class="row" id="js-contacts">
      <c:forEach var="teamList" items="${teamList}">
      <div class="col-xl-4">
         <div id="c_${teamList.tst_team_no }" class="card border shadow-0 mb-g shadow-sm-hover" data-filter-tags="oliver kopyov">

         <!--       여기는 사용자 사용  이름 누르면 나오는 메뉴-->
            <div class="card-body border-faded border-top-0 border-left-0 border-right-0 rounded-top">
               <div class="d-flex flex-row align-items-center">
                  <span > <span class="rounded-circle profile-image d-block "style="background-image: url('img/demo/avatars/avatar-b.png'); background-size: cover;"></span>
                  </span>
                  <div class="info-card-text flex-1">
                     <a href="javascript:void(0);" class="fs-xl text-truncate text-truncate-lg text-info" data-toggle="dropdown" aria-expanded="false"> ${teamList.tst_team_name}
                        <i class="fal fa-angle-down d-inline-block ml-1 fs-md"></i>
                     </a>
                     <div class="dropdown-menu">
                     	<!-- 11.18 조준서 수정 -->
                        <a class="dropdown-item" onclick="insertMessage(${teamList.tst_team_no })">참가 신청</a> <a
                           class="dropdown-item" href="#">매칭 신청</a> <a
                           class="dropdown-item" href="#">Block</a>
                     </div>
                     <span class="text-truncate text-truncate-xl">${teamList.tst_team_content}</span>
                  </div>
                  <button class="js-expand-btn btn btn-sm btn-default d-none" data-toggle="collapse" data-target="#c_${teamList.tst_team_no}> .card-body + .card-body" aria-expanded="false">
                     <span class="collapsed-hidden">+</span> 
                     <span class="collapsed-reveal">-</span>
                  </button>
               </div>
            </div>
               
            <!-- 팀정보 -->
            <div class="card-body p-0 collapse show" onclick="detailTeam(${teamList.tst_team_no})">
               <div class="p-3" >
                  <a class="mt-1 d-block fs-sm fw-400 text-dark">
                     <i class="fas fa-mobile-alt text-muted mr-2"></i> ${teamList.tst_user_nickname }
                  </a> 
                  <a class="mt-1 d-block fs-sm fw-400 text-dark"> 
                     <i class="fas fa-mouse-pointer text-muted mr-2"></i> Win: ${ teamList.tst_team_win } / Lose : ${ teamList.tst_team_lose }  
                  </a>
                  <address class="fs-sm fw-400 mt-4 text-muted">
                     <i class="fas fa-map-pin mr-2"></i>${ teamList.tst_team_type }
                  </address>
               </div>
            </div>
            
            
         </div>
      </div>
      </c:forEach>
         
   </div>
<div id="paginationBox" style="margin-left:33rem; margin-bottom: 1rem;">

      <ul class="pagination">

         <c:if test="${pagination.prev}">
            <li class="page-item"><a class="page-link"  onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
         </c:if>

         <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
            <li class="page-item <c:out value="${pagination.page == idx ? 'class=active' : ''}"/> " >
            <a class="page-link"  onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
         </c:forEach>

         <c:if test="${pagination.next}">
            <li class="page-item" ><a class="page-link"  onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
         </c:if>

      </ul>

   </div>

   <!-- pagination{e} -->
   </main>


   <nav class="shortcut-menu d-none d-sm-block">
        <input type="checkbox" class="menu-open" name="menu-open" id="menu_open" />
        <label for="menu_open" class="menu-open-button ">
            <span class="app-shortcut-icon d-block"></span>
        </label>
        <a href="#" class="menu-item btn" data-toggle="tooltip" data-placement="left" title="Scroll Top">
            <i class="fal fa-arrow-up"></i>
        </a>
        <a href="page_login_alt.html" class="menu-item btn" data-toggle="tooltip" data-placement="left" title="Logout">
            <i class="fal fa-sign-out"></i>
        </a>
        <a href="#" class="menu-item btn" data-action="app-fullscreen" data-toggle="tooltip" data-placement="left"
            title="Full Screen">
            <i class="fal fa-expand"></i>
        </a>
        <a href="#" class="menu-item btn" data-action="app-print" data-toggle="tooltip" data-placement="left"
            title="Print page">
            <i class="fal fa-print"></i>
        </a>
        <a onclick="teamInsert()" class="menu-item btn" data-action="app-board" data-toggle="tooltip" data-placement="left" title="New Team">
            <i class="fal fa-microphone"></i>
<!--             <i class='subheader-icon fal fa-plus-circle'></i> -->
        </a>
    </nav>
<c:url var="teamListURL" value="/teamList"></c:url>

<!-- 11.19 조준서 -->
<sec:authentication var="principal" property="principal" />
<input type="hidden" value='${principal.username}' name="tst_from_nicname" id="tst_from_nicname">

</body>

   <script type="text/javascript">
   //11.02 페이징
   function detailTeam(no){
      location.href= "/teamDetailpage?tst_team_no=" + no;
   }
   function fn_prev(page, range, rangeSize) {

      var page = ((range - 2) * rangeSize) + 1;
      var range = range - 1;
      var url = "/teamList";
      url = url + "?page=" + page;
      url = url + "&range=" + range;
      location.href = url;
   }
   //페이지 번호 클릭
   function fn_pagination(page, range, rangeSize, searchType, keyword) {
      var url = "/teamList";
      url = url + "?page=" + page;
      url = url + "&range=" + range;
      location.href = url;   

   }
   //다음 버튼 이벤트
   function fn_next(page, range, rangeSize) {
      var page = parseInt((range * rangeSize)) + 1;
      var range = parseInt(range) + 1;
      var url = "/teamList";
      url = url + "?page=" + page;
      url = url + "&range=" + range;
      location.href = url;
   }
   // 11.04 검색
   $(document).on('click', '#btnSearch', function(e){

      e.preventDefault();
      var url = "${teamListURL}";
      url = url + "?page=" + ${pagination.page};
      url = url + "&range=" + ${pagination.range};
      url = url + "&keyword=" + $('#keyword').val();
      location.href = url;
      console.log(url);

   });
   function teamInsert(){
      location.href= "/teamInsert";
   }
   
   
   /*11.18 조준서 수정  */
   function insertMessage(tst_team_no){
	   let tst_from_nicname = $('#tst_from_nicname').val();
	   $.ajax({
			async : true,
			url : '${pageContext.request.contextPath}/insertMessageT?tst_team_no='+tst_team_no +"&tst_from_nicname="+tst_from_nicname,
			type : 'GET',
			success : function() {
			},
			error : function() {
				console.log("실패");
			}
		});
	   
	   Swal.fire(
               {
                   type: "success",
                   title: "신청이 완료 되었습니다.",
                   showConfirmButton: false,
                   timer: 1500
               })
	   
   }
   
   
   
   </script>

</html>