<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="tag.jsp" flush="true"/>
</head>
<body>


 <sec:authentication var="principal" property="principal" />
				<input type="hidden" value='${principal.username}' name="tst_user_nickname" id="tst_user_nickname">    

             <!-- BEGIN Page Header -->
                    <header class="page-header" role="banner">
                        <!-- we need this logo when user switches to nav-function-top -->
                        <div class="page-logo">
                            <a href="#" class="page-logo-link press-scale-down d-flex align-items-center position-relative" data-toggle="modal" data-target="#modal-shortcut">
                                <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="SmartAdmin WebApp" aria-roledescription="logo">
                                <span class="page-logo-text mr-1">SmartAdmin WebApp</span>
                                <span class="position-absolute text-white opacity-50 small pos-top pos-right mr-2 mt-n2"></span>
                                <i class="fal fa-angle-down d-inline-block ml-1 fs-lg color-primary-300"></i>
                            </a>
                        </div>
                        <!-- DOC: nav menu layout change shortcut -->
                        <div class="hidden-md-down dropdown-icon-menu position-relative">
                            <a href="#" class="header-btn btn js-waves-off" data-action="toggle" data-class="nav-function-hidden" title="Hide Navigation">
                                <i class="ni ni-menu"></i>
                            </a>
                            <ul>
                                <li>
                                    <a href="#" class="btn js-waves-off" data-action="toggle" data-class="nav-function-minify" title="Minify Navigation">
                                        <i class="ni ni-minify-nav"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn js-waves-off" data-action="toggle" data-class="nav-function-fixed" title="Lock Navigation">
                                        <i class="ni ni-lock-nav"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <!-- DOC: mobile button appears during mobile width -->
                        <div class="hidden-lg-up">
                            <a href="#" class="header-btn btn press-scale-down" data-action="toggle" data-class="mobile-nav-on">
                                <i class="ni ni-menu"></i>
                            </a>
                        </div>
                        <div class="search">
                            <form class="app-forms hidden-xs-down" role="search" action="page_search.html" autocomplete="off">
                                <input type="text" id="search-field" placeholder="Search for anything" class="form-control" tabindex="1">
                                <a href="#" onclick="return false;" class="btn-danger btn-search-close js-waves-off d-none" data-action="toggle" data-class="mobile-search-on">
                                    <i class="fal fa-times"></i>
                                </a>
                            </form>
                        </div>
                        <div class="ml-auto d-flex">
                            <!-- activate app search icon (mobile) -->
                            <div class="hidden-sm-up">
                                <a href="#" class="header-icon" data-action="toggle" data-class="mobile-search-on" data-focus="search-field" title="Search">
                                    <i class="fal fa-search"></i>
                                </a>
                            </div>
                          <!-- app settings -->
                            <!--아이콘들  -->
                            <div>
                                <a href="#" class="header-icon" data-toggle="dropdown" title="My Apps">
                                    <i class="fal fa-cube"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-animated w-auto h-auto">
                                    <div class="dropdown-header bg-trans-gradient d-flex justify-content-center align-items-center rounded-top">
                                        <h4 class="m-0 text-center color-white">
                                            Quick Shortcut
                                            <small class="mb-0 opacity-80">User Applications & Addons</small>
                                        </h4>
                                    </div>
                                    <div class="custom-scroll h-100">
                                        <ul class="app-list">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/BoardList?tst_board_category=자유%20게시판" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-4 icon-stack-3x color-fusion-400"></i>
                                                        <i class="base-5 icon-stack-2x color-fusion-200"></i>
                                                        <i class="base-5 icon-stack-1x color-fusion-100"></i>
                                                        <i class="fal fa-keyboard icon-stack-1x color-info-50"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Notice
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/teamList" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-2 icon-stack-3x color-primary-400"></i>
                                                        <i class="base-10 text-white icon-stack-1x"></i>
                                                        <i class="ni md-profile color-primary-800 icon-stack-2x"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Team Lsit
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/TsT" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-7 icon-stack-3x color-info-500"></i>
                                                        <i class="base-7 icon-stack-2x color-info-700"></i>
                                                        <i class="ni ni-graph icon-stack-1x text-white"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        TsT
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/mailList" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-4 icon-stack-3x color-danger-500"></i>
                                                        <i class="base-4 icon-stack-1x color-danger-400"></i>
                                                        <i class="ni ni-envelope icon-stack-1x text-white"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Messages
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/Maps" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-19 icon-stack-3x color-primary-400"></i>
                                                        <i class="base-7 icon-stack-2x color-primary-300"></i>
                                                        <i class="base-7 icon-stack-1x fs-xxl color-primary-200"></i>
                                                        <i class="base-7 icon-stack-1x color-primary-500"></i>
                                                        <i class="fal fa-globe icon-stack-1x text-white opacity-85"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Maps
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/chat/room" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-5 icon-stack-3x color-success-700 opacity-80"></i>
                                                        <i class="base-12 icon-stack-2x color-success-700 opacity-30"></i>
                                                        <i class="fal fa-comment-alt icon-stack-1x text-white"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Chat
                                                    </span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            

                            <!-- app message -->
                            <a href="#" class="header-icon" data-toggle="modal" data-target=".js-modal-messenger">
                                <i class="fal fa-globe"></i>
                                <span class="badge badge-icon">!</span>
                            </a>
                            <!-- app notification -->
                            
                            <div>
                                <a href="#" class="header-icon" data-toggle="dropdown" title="You got 11 notifications">
                                    <i class="fal fa-bell"></i>
                                    <span class="badge badge-icon" id="countMail" name="countMail"></span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-animated dropdown-xl">
                                    <div class="dropdown-header bg-trans-gradient d-flex justify-content-center align-items-center rounded-top mb-2">
                                        <h4 class="m-0 text-center color-white">
                                            	${principal.username}
                                            <small class="mb-0 opacity-80">User Notifications</small>
                                        </h4>
                                    </div>
                                    <ul class="nav nav-tabs nav-tabs-clean" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link px-4 fs-md js-waves-on fw-500" data-toggle="tab" href="#tab-messages" data-i18n="drpdwn.messages">Messages</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link px-4 fs-md js-waves-on fw-500" data-toggle="tab" href="#tab-events" data-i18n="drpdwn.events">Events</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content tab-notification">
                                        <div class="tab-pane active p-3 text-center">
                                            <h5 class="mt-4 pt-4 fw-500">
                                                <span class="d-block fa-3x pb-4 text-muted">
                                                    <i class="ni ni-arrow-up text-gradient opacity-70"></i>
                                                </span> Select a tab above to activate
                                                <small class="mt-3 fs-b fw-400 text-muted">
                                                    This blank page message helps protect your privacy, or you can show the first message here automatically through
                                                    <a href="#">settings page</a>
                                                </small>
                                            </h5>
                                        </div>
                                        
                                        <div class="tab-pane" id="tab-messages" role="tabpanel">
                                            <div class="custom-scroll h-100">
                                                <ul class="notification" id="listHeader">
                                                </ul>
                                            </div>
                                        </div>
                                        
                                        
                                        <div class="tab-pane" id="tab-events" role="tabpanel">
                                            <div class="d-flex flex-column h-100">
                                                <div class="h-auto">
                                                
                                                
                                                    <table id="calendar" class="table table-bordered table-calendar m-0 w-100 h-100 border-0">
                                                        <tr>
                                                            <th colspan="7" class="pt-3 pb-2 pl-3 pr-3 text-center">
                                                                <div class="js-get-date h5 mb-2">[your date here]</div>
                                                            </th>
                                                        </tr>
                                                        <tr class="text-center">
                                                            <th>Sun</th>
                                                            <th>Mon</th>
                                                            <th>Tue</th>
                                                            <th>Wed</th>
                                                            <th>Thu</th>
                                                            <th>Fri</th>
                                                            <th>Sat</th>
                                                        </tr>
                                                         <tbody id="calendar-body" class="calendar-body"></tbody>
                                                    </table>
                                                    
                                                    
                                                    
                                                </div>
                                                
                                                <div class="flex-1 custom-scroll">
                                                    <div class="p-2">
                                                        <div class="d-flex align-items-center text-left mb-3">
                                                            <div class="width-5 fw-300 text-primary l-h-n mr-1 align-self-start fs-xxl">
                                                                12
                                                            </div>
                                                            <div class="flex-1">
                                                                <div class="d-flex flex-column">
                                                                    <span class="l-h-n fs-md fw-500 opacity-70">
                                                                        December 2019
                                                                    </span>
                                                                    <span class="l-h-n fs-nano fw-400 text-secondary">
                                                                        Thu
                                                                    </span>
                                                                </div>
                                                                <div class="mt-3">
                                                                    <p>
                                                                        <strong>12:20PM</strong> - 성공회FC
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="py-2 px-3 bg-faded d-block rounded-bottom text-right border-faded border-bottom-0 border-right-0 border-left-0">
                                    </div>
                                </div>
                            </div>
                            <!-- app user menu -->
                            <div>
                                <a href="#" data-toggle="dropdown" title="drlantern@gotbootstrap.com" class="header-icon d-flex align-items-center justify-content-center ml-2">
                                
<%--                                     <img src="https://img2.yna.co.kr/photo/yna/YH/2019/10/29/PYH2019102903730001300_P2.jpg" class="profile-image rounded-circle" alt="${principal.username}"> --%>
                                     			<c:choose>
													<c:when test="${principal.username == '유진이이'}"> 
													<img src="https://pbs.twimg.com/media/EGsNsB4U0AAeo-Z.jpg" class="profile-image rounded-circle" alt="${principal.username}">
													</c:when>
													
													<c:when test="${principal.username == '스누피'}"> 
													 <img src="https://image.chosun.com/sitedata/image/201610/21/2016102101259_0.jpg" class="profile-image rounded-circle" alt="${principal.username}">
													</c:when>
													
													<c:when test="${principal.username == 'xogus'}"> 
													<img src="https://www.nemopan.com/files/attach/images/6294/841/331/009/757eef5bab05e69b697e36d27323a11d.jpg" class="profile-image rounded-circle" alt="${principal.username}">
													</c:when>
													
													<c:otherwise>
													<img src="https://icon-library.net/images/default-user-icon/default-user-icon-8.jpg" class="profile-image rounded-circle" alt="${principal.username}">
													</c:otherwise>
												</c:choose>     
                                    
                                    
                                    
                                    <!-- you can also add username next to the avatar with the codes below:
									<span class="ml-1 mr-1 text-truncate text-truncate-header hidden-xs-down">Me</span>
									<i class="ni ni-chevron-down hidden-xs-down"></i> -->
                                </a>
                                <div class="dropdown-menu dropdown-menu-animated dropdown-lg">
                                    <div class="dropdown-header bg-trans-gradient d-flex flex-row py-4 rounded-top">
                                        <div class="d-flex flex-row align-items-center mt-1 mb-1 color-white">
                                            <span class="mr-2">
                                               <c:choose>
													<c:when test="${principal.username == '유진이이'}"> 
													<img src="https://pbs.twimg.com/media/EGsNsB4U0AAeo-Z.jpg" class="rounded-circle profile-image" alt="">
													</c:when>
													
													<c:when test="${principal.username == '스누피'}"> 
													 <img src="https://image.chosun.com/sitedata/image/201610/21/2016102101259_0.jpg" class="rounded-circle profile-image" alt="">
													</c:when>
													
													<c:when test="${principal.username == 'xogus'}"> 
													<img src="https://www.nemopan.com/files/attach/images/6294/841/331/009/757eef5bab05e69b697e36d27323a11d.jpg" class="rounded-circle profile-image" alt="">
													</c:when>
													
													<c:otherwise>
													<img src="https://icon-library.net/images/default-user-icon/default-user-icon-8.jpg" class="rounded-circle profile-image" alt="">
													</c:otherwise>
												</c:choose>     
                                            </span>
                                            <div class="info-card-text">
                                                <div class="fs-lg text-truncate text-truncate-lg">${principal.username}</div>
                                                <span class="text-truncate text-truncate-md opacity-80">잘 부탁드려요</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dropdown-divider m-0"></div>
                                    <a href="#" class="dropdown-item" data-action="app-reset">
                                        <span data-i18n="drpdwn.reset_layout">Reset Layout</span>
                                    </a>
                                    <a href="#" class="dropdown-item" data-toggle="modal" data-target=".js-modal-settings">
                                        <span data-i18n="drpdwn.settings">Settings</span>
                                    </a>
                                    <div class="dropdown-divider m-0"></div>
                                    <a href="/mailList" class="dropdown-item">
                                        <span>MailBox</span>
                                    </a>
                                    <a href="#" class="dropdown-item" data-action="app-print">
                                        <span data-i18n="drpdwn.print">Print</span>
                                        <i class="float-right text-muted fw-n">Ctrl + P</i>
                                    </a>
                                    <div class="dropdown-divider m-0"></div>
                                    
                                    
                                     <form action="/logout" method="POST" name="logOutForm">
                      		 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                      		 			 <a class="dropdown-item fw-500 pt-3 pb-3"  onclick="submitAtag()">
                                        	<span data-i18n="drpdwn.page-logout">Logout</span>
                                        	<span class="float-right fw-n">&commat;codexlantern</span>
                                    	 </a>
                   					 </form>
                   					 
                                   
                                    
                                    
                                    
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- END Page Header -->          
               
                      
</body>
<script type="text/javascript">
   function submitAtag(){
       let form = document.logOutForm;
       form.submit();
   }
   
   function thisIsAllHeader(){
		let tst_user_nickname = $('#tst_user_nickname').val();
		var elemH= '';
		
	$.ajax({
		async : true,
		url : '${pageContext.request.contextPath}/headerList?tst_user_nickname='+tst_user_nickname,
		type : 'GET',
		success : function(dataH) {
			for(var i = 0; i < dataH.length; i++){
				elemH = elemH + '<li class="unread"><a href="/mailList" class="d-flex align-items-center"><span class="d-flex flex-column flex-1 ml-1"><span class="name">'+ dataH[i].tst_from_nicname +' <span class="badge badge-primary fw-n position-absolute pos-top pos-right mt-1">INBOX</span></span><span class="msg-a fs-sm">'+ dataH[i].tst_message_title +'</span> <span class="msg-b fs-xs">'+ dataH[i].tst_message_content +'</span></span></a></li>';
			}
			document.getElementById('listHeader').innerHTML = elemH;
		},
		error : function() {
			console.log("실패");
		}
	});
	
	} 

   function countMailCheck(){
	   let tst_user_nickname = $('#tst_user_nickname').val();
	   
	   $.ajax({
			async : true,
			url : '${pageContext.request.contextPath}/countMailCheck?tst_user_nickname='+tst_user_nickname,
			type : 'GET',
			success : function(dataH) {
// 				alert(dataH);
				$("#countMail").text(dataH);
			},
			error : function() {
				console.log("실패");
			}
		});
	   
	   
   }
   
   var currentTitle = document.getElementById('current-year-month');
   var calendarBody = document.getElementById('calendar-body');
   var today = new Date();
   var first = new Date(today.getFullYear(), today.getMonth(),1);
   var dayList = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
   var monthList = ['January','February','March','April','May','June','July','August','September','October','November','December'];
   var leapYear=[31,29,31,30,31,30,31,31,30,31,30,31];
   var notLeapYear=[31,28,31,30,31,30,31,31,30,31,30,31];
   var pageFirst = first;
   var pageYear;
   if(first.getFullYear() % 4 === 0){
       pageYear = leapYear;
   }else{
       pageYear = notLeapYear;
   }

   function showCalendar(){
       let monthCnt = 100;
       let cnt = 1;
       for(var i = 0; i < 6; i++){
           var $tr = document.createElement('tr');
           $tr.setAttribute('id', monthCnt);   
           for(var j = 0; j < 7; j++){
               if((i === 0 && j < first.getDay()) || cnt > pageYear[first.getMonth()]){
                   var $td = document.createElement('td');
                   $tr.appendChild($td);     
               }else{
                   var $td = document.createElement('td');
                   $td.textContent = cnt;
                   $td.setAttribute('id', cnt);                
                   $tr.appendChild($td);
                   cnt++;
               }
           }
           monthCnt++;
           calendarBody.appendChild($tr);
       }
   }

   var section1s = document.getElementsByClassName("js-get-date h5 mb-2");


  
   var today = new Date();
   var dd = today.getDate();
   
   
   
	$(document).ready(function() {
		thisIsAllHeader();
		countMailCheck();
		showCalendar();
		$( '#'+dd ).addClass( 'bg-primary-300 pattern-0' );
		$( '#'+12 ).css("background-color","#DBA3E9");
		
	});
	
	
</script>
</html>