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
<!-- 	<ol class="breadcrumb page-breadcrumb"> -->
<!-- 		<li class="position-absolute pos-top pos-right d-none d-sm-block"></li> -->
<!-- 	</ol> -->
	<div class="subheader">
		<h1 class="subheader-title">
		<div class="flex-1 fs-xxl text-contrast">Team List <small>나만의 팀을 찾으세요 </small></div>
		</h1>
	</div>
	
	<div class="row">
		<div class="col-xl-12">
			<div class="border-faded bg-faded p-3 mb-g d-flex">
				<input type="text" id="js-filter-contacts" name="filter-contacts"
					class="form-control shadow-inset-2 form-control-lg"
					placeholder="Filter contacts">
				<div
					class="btn-group btn-group-lg btn-group-toggle hidden-lg-down ml-3"
					data-toggle="buttons">
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
			<div id="c_1" class="card border shadow-0 mb-g shadow-sm-hover" data-filter-tags="oliver kopyov">
			
			<!-- 		여기는 사용자 사용  이름 누르면 나오는 메뉴-->
			
				<div class="card-body border-faded border-top-0 border-left-0 border-right-0 rounded-top">
					<div class="d-flex flex-row align-items-center">
						<span > <span class="rounded-circle profile-image d-block "style="background-image: url('img/demo/avatars/avatar-b.png'); background-size: cover;"></span>
						</span>
						<div class="info-card-text flex-1">
							<a href="javascript:void(0);" class="fs-xl text-truncate text-truncate-lg text-info" data-toggle="dropdown" aria-expanded="false"> ${teamList.tst_team_name}
								<i class="fal fa-angle-down d-inline-block ml-1 fs-md"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#">참가 신청</a> <a
									class="dropdown-item" href="#">매칭 신청</a> <a
									class="dropdown-item" href="#">Block</a>
							</div>
							<span class="text-truncate text-truncate-xl">${teamList.tst_team_content}</span>
						</div>
						<!--data-target="#c_?? <- 증가 수정 총 값 받아와서 출력 -->
						<button class="js-expand-btn btn btn-sm btn-default d-none"
							data-toggle="collapse"
							data-target="#c_1 > .card-body + .card-body"
							aria-expanded="false">
							<span class="collapsed-hidden">+</span> <span
								class="collapsed-reveal">-</span>
						</button>
					</div>
				</div>
				
				
				<div class="card-body p-0 collapse show">
					<div class="p-3">
						<a class="mt-1 d-block fs-sm fw-400 text-dark">
							<i class="fas fa-mobile-alt text-muted mr-2"></i> ${teamList.tst_user_nickname }
						</a> 
						<a class="mt-1 d-block fs-sm fw-400 text-dark"> 
							<i class="fas fa-mouse-pointer text-muted mr-2"></i> Win: ${ teamList.tst_team_win } / Lose : ${ teamList.tst_team_lose }  
						</a>
						<address class="fs-sm fw-400 mt-4 text-muted">
							<i class="fas fa-map-pin mr-2"></i> 15 Charist St, Detroit, MI, 48212, USA
						</address>
					</div>
				</div>
				
				
			</div>
		</div>
		</c:forEach>
	</div>
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
        <a href="#" class="menu-item btn" data-action="app-board" data-toggle="tooltip" data-placement="left" title="New Team">
            <i class="fal fa-microphone"></i>
<!--             <i class='subheader-icon fal fa-plus-circle'></i> -->
        </a>
    </nav>






</body>
	


</html>