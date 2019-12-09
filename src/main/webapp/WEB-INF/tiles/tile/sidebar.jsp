<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

      <aside class="page-sidebar">
                <!-- 왼쪽 상단 네브바 내려오는거  -->
                <div class="page-logo">
                    <a href="#" class="page-logo-link press-scale-down d-flex align-items-center position-relative"
                        data-toggle="modal" data-target="#modal-shortcut">
                        <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="SmartAdmin WebApp" aria-roledescription="logo">
                        <span class="page-logo-text mr-1">Team sport tournament</span>
                        <span class="position-absolute text-white opacity-50 small pos-top pos-right mr-2 mt-n2"></span>
                        <i class="fal fa-angle-down d-inline-block ml-1 fs-lg color-primary-300"></i>
                    </a>
                </div>

                <!-- BEGIN PRIMARY NAVIGATION -->
                <nav id="js-primary-nav" class="primary-nav" role="navigation">

                    <div class="info-card" style="padding: 0%">

                        <img src="${pageContext.request.contextPath}/resources/img/main3-1.png" style="width: 100%; height: 100%; " onclick="location.href='/'">

                    </div>
                    <!-- END Left Aside -->


                    <!-- start head  -->

                    <!-- end head  -->


                    <!-- 상단바 -->

                    <ul id="js-nav-menu" class="nav-menu">
                       
                        <li class="active open">
                         <a href="#" title="Application Intel" data-filter-tags="application intel">
                                 <i class="fal fa-table"></i>
                                <span class="nav-link-text" data-i18n="nav.application_intel">Board</span>
                            </a>
                            <ul>
                             <li class="active">
                                <a href="/BoardList?tst_board_category=자유 게시판" title="자유 게시판" data-filter-tags="application intel analytics dashboard">
                                   <span class="nav-link-text" data-i18n="nav.application_intel_analytics_dashboard">자유 게시판</span>
                                 </a>
                             </li>
                             <li>
                                <a href="/BoardList?tst_board_category=모집 게시판" title="모집 게시판" data-filter-tags="application intel analytics dashboard">
                                   <span class="nav-link-text" data-i18n="nav.application_intel_analytics_dashboard">모집 게시판</span>
                                 </a>
                             </li>
                             <li>
                                <a href="/BoardList?tst_board_category=블랙리스트 게시판" title="블랙리스트 게시판" data-filter-tags="application intel analytics dashboard">
                                   <span class="nav-link-text" data-i18n="nav.application_intel_analytics_dashboard">블랙리스트 게시판</span>
                                 </a>
                             </li>
                             <li>
                                <a href="/BoardList?tst_board_category=공지 게시판" title="공지 게시판" data-filter-tags="application intel analytics dashboard">
                                   <span class="nav-link-text" data-i18n="nav.application_intel_analytics_dashboard">공지 게시판</span>
                                 </a>
                             </li>
                             
                            </ul>
                        </li>
                        
                        <li class="active open">
                         <a href="/teamList" title="Application Intel" data-filter-tags="application intel">
                                 <i class="fal fa-window"></i>
                                <span class="nav-link-text" data-i18n="nav.application_intel">Team list</span>
                            </a>
                        </li>
                        
                        <li>
                         <a href="#" title="Application Intel" data-filter-tags="application intel">
                                 <i class="fal fa-bolt"></i>
                                <span class="nav-link-text" data-i18n="nav.application_intel">My Team</span>
                            </a>
                            <ul id="list">
                            
<!--                              <li> -->
<!--                                 <a href="????" title="????" data-filter-tags="application intel analytics dashboard"> -->
<!--                                    <span class="nav-link-text" data-i18n="nav.application_intel_analytics_dashboard">??????</span> -->
<!--                                  </a> -->
<!--                              </li> -->
                             
                             
                            </ul>
                        </li>
                        
                        
                       
                        
                        
<!--                     </ul> -->
                    <div class="filter-message js-filter-message bg-success-600"></div>
                </nav>
                <!-- END PRIMARY NAVIGATION -->
                <!-- NAV FOOTER -->
                <div class="nav-footer shadow-top">
                    <a href="#" onclick="return false;" data-action="toggle" data-class="nav-function-minify"
                        class="hidden-md-down">
                        <i class="ni ni-chevron-right"></i>
                        <i class="ni ni-chevron-right"></i>
                    </a>
<!--                     <ul class="list-table m-auto nav-footer-buttons"> -->
                        <li>
                            <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Chat logs">
                                <i class="fal fa-comments"></i>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top"
                                title="Support Chat">
                                <i class="fal fa-life-ring"></i>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top"
                                title="Make a call">
                                <i class="fal fa-phone"></i>
                            </a>
                        </li>
                    </ul>
                </div> <!-- END NAV FOOTER -->
            </aside>
            <sec:authentication var="principal" property="principal" />
				<input type="hidden" value='${principal.username}' name="tst_user_nickname" id="tst_user_nickname">
</body>
<script type="text/javascript">

function thisIsAll(){
	let tst_user_nickname = $('#tst_user_nickname').val();
	var elem = '';
$.ajax({
	async : true,
	url : '${pageContext.request.contextPath}/sideBarList?tst_user_nickname='+tst_user_nickname,
	type : 'GET',
	success : function(data) {
		for(var i = 0; i < data.length; i++){
			 elem = elem + '<li><a href="/teamDetailpage?tst_team_no=' + data[i].tst_team_no + '" title="????" data-filter-tags="application intel analytics dashboard"><span class="nav-link-text" data-i18n="nav.application_intel_analytics_dashboard">'+ data[i].tst_team_name +'</span></a></li>';
		}
		document.getElementById('list').innerHTML = elem;
	},
	error : function() {
		console.log("실패");
	}
});


} 

$(document).ready(function() {
	thisIsAll();
});




</script>
</html>