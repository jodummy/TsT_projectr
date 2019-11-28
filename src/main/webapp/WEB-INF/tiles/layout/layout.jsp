<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html;">
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
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/miscellaneous/reactions/reactions.css">
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/miscellaneous/fullcalendar/fullcalendar.bundle.css">
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/miscellaneous/jqvmap/jqvmap.bundle.css">
<meta name="description" content="Contacts">
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/fa-solid.css">
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/fa-brands.css">
<!-- 10.26 boardList -->
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/formplugins/summernote/summernote.css">


</head>
<body class="mod-bg-1 ">
	<script>
		/**
		 *	This script should be placed right after the body tag for fast execution 
		 *	Note: the script is written in pure javascript and does not depend on thirdparty library
		 **/
		'use strict';

		var classHolder = document.getElementsByTagName("BODY")[0],
		/** 
		 * Load from localstorage
		 **/
		themeSettings = (localStorage.getItem('themeSettings')) ? JSON
				.parse(localStorage.getItem('themeSettings')) : {}, themeURL = themeSettings.themeURL
				|| '', themeOptions = themeSettings.themeOptions || '';
		/** 
		 * Load theme options
		 **/
		if (themeSettings.themeOptions) {
			classHolder.className = themeSettings.themeOptions;
			console.log("%c✔ Theme settings loaded", "color: #148f32");
		} else {
			console
					.log("Heads up! Theme settings is empty or does not exist, loading default settings...");
		}
		if (themeSettings.themeURL && !document.getElementById('mytheme')) {
			var cssfile = document.createElement('link');
			cssfile.id = 'mytheme';
			cssfile.rel = 'stylesheet';
			cssfile.href = themeURL;
			document.getElementsByTagName('head')[0].appendChild(cssfile);
		}
		/** 
		 * Save to localstorage 
		 **/
		var saveSettings = function() {
			themeSettings.themeOptions = String(classHolder.className).split(
					/[^\w-]+/).filter(function(item) {
				return /^(nav|header|mod|display)-/i.test(item);
			}).join(' ');
			if (document.getElementById('mytheme')) {
				themeSettings.themeURL = document.getElementById('mytheme')
						.getAttribute("href");
			}
			;
			localStorage
					.setItem('themeSettings', JSON.stringify(themeSettings));
		}
		/** 
		 * Reset settings
		 **/
		var resetSettings = function() {
			localStorage.setItem("themeSettings", "");
		}
	</script>

	<div class="page-wrapper">
		<div class="page-inner">			
			<tiles:insertAttribute name="sidebar" ignore="true" />
			 <div class="page-content-wrapper">
			<tiles:insertAttribute name="header" ignore="true" />
			<tiles:insertAttribute name="body" ignore="true" />
			<tiles:insertAttribute name="footer" ignore="true" />
			</div>
		</div>
	</div>
	
	






    <div class="modal fade js-modal-messenger modal-backdrop-transparent" tabindex="-1" role="dialog"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-right">
            <div class="modal-content h-100">
               
                <div class="dropdown-header bg-trans-gradient d-flex align-items-center w-100">
                    <div class="d-flex flex-row align-items-center mt-1 mb-1 color-white">
                        <span class="mr-2">
                            <span class="rounded-circle profile-image d-block"
                                style="background-image:url('img/demo/avatars/avatar-d.png'); background-size: cover;"></span>
                        </span>
                        <div class="info-card-text">
                            <a href="javascript:void(0);" class="fs-lg text-truncate text-truncate-lg text-white"
                                data-toggle="dropdown" aria-expanded="false">
                                Tracey Chang
                                <i class="fal fa-angle-down d-inline-block ml-1 text-white fs-md"></i>
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Send Email</a>
                                <a class="dropdown-item" href="#">Create Appointment</a>
                                <a class="dropdown-item" href="#">Block User</a>
                            </div>
                            <span class="text-truncate text-truncate-md opacity-80">IT Director</span>
                        </div>
                    </div>
                    <button type="button" class="close text-white position-absolute pos-top pos-right p-2 m-1 mr-2"
                        data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fal fa-times"></i></span>
                    </button>
                </div>
                
                <div class="modal-body p-0 h-100 d-flex">
                    <!-- BEGIN msgr-list -->
    <div
        class="msgr-list d-flex flex-column bg-faded border-faded border-top-0 border-right-0 border-bottom-0 position-absolute pos-top pos-bottom">
        <div>
            <div class="height-4 width-3 h3 m-0 d-flex justify-content-center flex-column color-primary-500 pl-3 mt-2">
                <i class="fal fa-search"></i>
            </div>
            <div class="w-100">
                <ul id="js-msgr-listfilter" class="list-unstyled m-0">
                    <li>
                        <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white"
                            data-filter-tags="tracey chang online">
                            <div class="d-table-cell align-middle status status-success status-sm ">
                                <span class="profile-image-md rounded-circle d-block"
                                    style="background-image:url('img/demo/avatars/avatar-d.png'); background-size: cover;"></span>
                            </div>
                            <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                <div class="text-truncate text-truncate-md">
                                    Tracey Chang
                                    <small class="d-block font-italic text-success fs-xs">
                                        Online
                                    </small>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white"
                            data-filter-tags="oliver kopyuv online">
                            <div class="d-table-cell align-middle status status-success status-sm ">
                                <span class="profile-image-md rounded-circle d-block"
                                    style="background-image:url('img/demo/avatars/avatar-b.png'); background-size: cover;"></span>
                            </div>
                            <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                <div class="text-truncate text-truncate-md">
                                    Oliver Kopyuv
                                    <small class="d-block font-italic text-success fs-xs">
                                        Online
                                    </small>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white"
                            data-filter-tags="dr john cook phd away">
                            <div class="d-table-cell align-middle status status-warning status-sm ">
                                <span class="profile-image-md rounded-circle d-block"
                                    style="background-image:url('img/demo/avatars/avatar-e.png'); background-size: cover;"></span>
                            </div>
                            <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                <div class="text-truncate text-truncate-md">
                                    Dr. John Cook PhD
                                    <small class="d-block font-italic fs-xs">
                                        Away
                                    </small>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white"
                            data-filter-tags="ali amdaney online">
                            <div class="d-table-cell align-middle status status-success status-sm ">
                                <span class="profile-image-md rounded-circle d-block"
                                    style="background-image:url('img/demo/avatars/avatar-g.png'); background-size: cover;"></span>
                            </div>
                            <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                <div class="text-truncate text-truncate-md">
                                    Ali Amdaney
                                    <small class="d-block font-italic fs-xs text-success">
                                        Online
                                    </small>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white"
                            data-filter-tags="sarah mcbrook online">
                            <div class="d-table-cell align-middle status status-success status-sm">
                                <span class="profile-image-md rounded-circle d-block"
                                    style="background-image:url('img/demo/avatars/avatar-h.png'); background-size: cover;"></span>
                            </div>
                            <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                <div class="text-truncate text-truncate-md">
                                    Sarah McBrook
                                    <small class="d-block font-italic fs-xs text-success">
                                        Online
                                    </small>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white"
                            data-filter-tags="ali amdaney offline">
                            <div class="d-table-cell align-middle status status-sm">
                                <span class="profile-image-md rounded-circle d-block"
                                    style="background-image:url('img/demo/avatars/avatar-a.png'); background-size: cover;"></span>
                            </div>
                            <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                <div class="text-truncate text-truncate-md">
                                    oliver.kopyuv@gotbootstrap.com
                                    <small class="d-block font-italic fs-xs">
                                        Offline
                                    </small>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white"
                            data-filter-tags="ali amdaney busy">
                            <div class="d-table-cell align-middle status status-danger status-sm">
                                <span class="profile-image-md rounded-circle d-block"
                                    style="background-image:url('img/demo/avatars/avatar-j.png'); background-size: cover;"></span>
                            </div>
                            <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                <div class="text-truncate text-truncate-md">
                                    oliver.kopyuv@gotbootstrap.com
                                    <small class="d-block font-italic fs-xs text-danger">
                                        Busy
                                    </small>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white"
                            data-filter-tags="ali amdaney offline">
                            <div class="d-table-cell align-middle status status-sm">
                                <span class="profile-image-md rounded-circle d-block"
                                    style="background-image:url('img/demo/avatars/avatar-c.png'); background-size: cover;"></span>
                            </div>
                            <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                <div class="text-truncate text-truncate-md">
                                    oliver.kopyuv@gotbootstrap.com
                                    <small class="d-block font-italic fs-xs">
                                        Offline
                                    </small>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white"
                            data-filter-tags="ali amdaney inactive">
                            <div class="d-table-cell align-middle">
                                <span class="profile-image-md rounded-circle d-block"
                                    style="background-image:url('img/demo/avatars/avatar-m.png'); background-size: cover;"></span>
                            </div>
                            <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                <div class="text-truncate text-truncate-md">
                                    +714651347790
                                    <small class="d-block font-italic fs-xs opacity-50">
                                        Missed Call
                                    </small>
                                </div>
                            </div>
                        </a>
                    </li>
                </ul>
                <div class="filter-message js-filter-message"></div>
            </div>
        </div>
        <div>
            <a class="fs-xl d-flex align-items-center p-3">
                <i class="fal fa-cogs"></i>
            </a>
        </div>
    </div>
    <!-- END msgr-list -->
    <!-- BEGIN msgr -->
    <div class="msgr d-flex h-100 flex-column bg-white">
        <!-- BEGIN custom-scroll -->
        <div class="custom-scroll flex-1 h-100">
            <div id="chat_container" class="w-100 p-4">
                <!-- start .chat-segment -->
                <div class="chat-segment">
                    <div class="time-stamp text-center mb-2 fw-400">
                        Jun 19
                    </div>
                </div>
                <!--  end .chat-segment -->
                <!-- start .chat-segment -->
                <div class="chat-segment chat-segment-sent">
                    <div class="chat-message">
                        <p>
                            Hey Tracey, did you get my files?
                        </p>
                    </div>
                    <div class="text-right fw-300 text-muted mt-1 fs-xs">
                        3:00 pm
                    </div>
                </div>
                <!--  end .chat-segment -->
                <!-- start .chat-segment -->
                <div class="chat-segment chat-segment-get">
                    <div class="chat-message">
                        <p>
                            Hi
                        </p>
                        <p>
                            Sorry going through a busy time in office. Yes I analyzed the solution.
                        </p>
                        <p>
                            It will require some resource, which I could not manage.
                        </p>
                    </div>
                    <div class="fw-300 text-muted mt-1 fs-xs">
                        3:24 pm
                    </div>
                </div>
                <!--  end .chat-segment -->
                <!-- start .chat-segment -->
                <div class="chat-segment chat-segment-sent chat-start">
                    <div class="chat-message">
                        <p>
                            Okay
                        </p>
                    </div>
                </div>
                <!--  end .chat-segment -->
                <!-- start .chat-segment -->
                <div class="chat-segment chat-segment-sent chat-end">
                    <div class="chat-message">
                        <p>
                            Sending you some dough today, you can allocate the resources to this
                            project.
                        </p>
                    </div>
                    <div class="text-right fw-300 text-muted mt-1 fs-xs">
                        3:26 pm
                    </div>
                </div>
                <!--  end .chat-segment -->
                <!-- start .chat-segment -->
                <div class="chat-segment chat-segment-get chat-start">
                    <div class="chat-message">
                        <p>
                            Perfect. Thanks a lot!
                        </p>
                    </div>
                </div>
                <!--  end .chat-segment -->
                <!-- start .chat-segment -->
                <div class="chat-segment chat-segment-get">
                    <div class="chat-message">
                        <p>
                            I will have them ready by tonight.
                        </p>
                    </div>
                </div>
                <!--  end .chat-segment -->
                <!-- start .chat-segment -->
                <div class="chat-segment chat-segment-get chat-end">
                    <div class="chat-message">
                        <p>
                            Cheers
                        </p>
                    </div>
                </div>
                <!--  end .chat-segment -->
                <!-- start .chat-segment for timestamp -->
                <div class="chat-segment">
                    <div class="time-stamp text-center mb-2 fw-400">
                        Jun 20
                    </div>
                </div>
                <!--  end .chat-segment for timestamp -->
            </div>
        </div>
        <!-- END custom-scroll  -->
        <!-- BEGIN msgr__chatinput -->
        <div class="d-flex flex-column">
            <div
                class="border-faded border-right-0 border-bottom-0 border-left-0 flex-1 mr-3 ml-3 position-relative shadow-top">
                <div class="pt-3 pb-1 pr-0 pl-0 rounded-0" tabindex="-1">
                    <div id="msgr_input" contenteditable="true" data-placeholder="Type your message here..."
                        class="height-10 form-content-editable"></div>
                </div>
            </div>
            <div class="height-8 px-3 d-flex flex-row align-items-center flex-wrap flex-shrink-0">
                <a href="javascript:void(0);" class="btn btn-icon fs-xl width-1 mr-1" data-toggle="tooltip"
                    data-original-title="More options" data-placement="top">
                    <i class="fal fa-ellipsis-v-alt color-fusion-300"></i>
                </a>
                <a href="javascript:void(0);" class="btn btn-icon fs-xl mr-1" data-toggle="tooltip"
                    data-original-title="Attach files" data-placement="top">
                    <i class="fal fa-paperclip color-fusion-300"></i>
                </a>
                <a href="javascript:void(0);" class="btn btn-icon fs-xl mr-1" data-toggle="tooltip"
                    data-original-title="Insert photo" data-placement="top">
                    <i class="fal fa-camera color-fusion-300"></i>
                </a>
                <div class="ml-auto">
                    <a href="javascript:void(0);" class="btn btn-info">Send</a>
                </div>
            </div>
        </div>
        <!-- END msgr__chatinput -->
    </div>
    <!-- END msgr -->
    </div>
    </div>
    </div>
    </div>
    <!-- END Messenger -->
    <!-- BEGIN Page Settings -->
    <div class="modal fade js-modal-settings modal-backdrop-transparent" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-right modal-md">
            <div class="modal-content">
                <div class="dropdown-header bg-trans-gradient d-flex justify-content-center align-items-center w-100">
                    <h4 class="m-0 text-center color-white">
                        Layout Settings
                        <small class="mb-0 opacity-80">User Interface Settings</small>
                    </h4>
                    <button type="button" class="close text-white position-absolute pos-top pos-right p-2 m-1 mr-2"
                        data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fal fa-times"></i></span>
                    </button>
                </div>
                <div class="modal-body p-0">
                    <div class="settings-panel">
                        <div class="mt-4 d-table w-100 px-5">
                            <div class="d-table-cell align-middle">
                                <h5 class="p-0">
                                    App Layout
                                </h5>
                            </div>
                        </div>
                        <div class="list" id="fh">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="header-function-fixed"></a>
                            <span class="onoffswitch-title">Fixed Header</span>
                            <span class="onoffswitch-title-desc">header is in a fixed at all times</span>
                        </div>
                        <div class="list" id="nff">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="nav-function-fixed"></a>
                            <span class="onoffswitch-title">Fixed Navigation</span>
                            <span class="onoffswitch-title-desc">left panel is fixed</span>
                        </div>
                        <div class="list" id="nfm">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="nav-function-minify"></a>
                            <span class="onoffswitch-title">Minify Navigation</span>
                            <span class="onoffswitch-title-desc">Skew nav to maximize space</span>
                        </div>
                        <div class="list" id="nfh">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="nav-function-hidden"></a>
                            <span class="onoffswitch-title">Hide Navigation</span>
                            <span class="onoffswitch-title-desc">roll mouse on edge to reveal</span>
                        </div>
                        <div class="list" id="nft">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="nav-function-top"></a>
                            <span class="onoffswitch-title">Top Navigation</span>
                            <span class="onoffswitch-title-desc">Relocate left pane to top</span>
                        </div>
                        <div class="list" id="mmb">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="mod-main-boxed"></a>
                            <span class="onoffswitch-title">Boxed Layout</span>
                            <span class="onoffswitch-title-desc">Encapsulates to a container</span>
                        </div>
                        <div class="expanded">
                            <ul class="">
                                <li>
                                    <div class="bg-fusion-50" data-action="toggle" data-class="mod-bg-1"></div>
                                </li>
                                <li>
                                    <div class="bg-warning-200" data-action="toggle" data-class="mod-bg-2"></div>
                                </li>
                                <li>
                                    <div class="bg-primary-200" data-action="toggle" data-class="mod-bg-3"></div>
                                </li>
                                <li>
                                    <div class="bg-success-300" data-action="toggle" data-class="mod-bg-4"></div>
                                </li>
                            </ul>
                            <div class="list" id="mbgf">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                    data-class="mod-fixed-bg"></a>
                                <span class="onoffswitch-title">Fixed Background</span>
                            </div>
                        </div>
                        <div class="mt-4 d-table w-100 px-5">
                            <div class="d-table-cell align-middle">
                                <h5 class="p-0">
                                    Mobile Menu
                                </h5>
                            </div>
                        </div>
                        <div class="list" id="nmp">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="nav-mobile-push"></a>
                            <span class="onoffswitch-title">Push Content</span>
                            <span class="onoffswitch-title-desc">Content pushed on menu reveal</span>
                        </div>
                        <div class="list" id="nmno">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="nav-mobile-no-overlay"></a>
                            <span class="onoffswitch-title">No Overlay</span>
                            <span class="onoffswitch-title-desc">Removes mesh on menu reveal</span>
                        </div>
                        <div class="list" id="sldo">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="nav-mobile-slide-out"></a>
                            <span class="onoffswitch-title">Off-Canvas <sup>(beta)</sup></span>
                            <span class="onoffswitch-title-desc">Content overlaps menu</span>
                        </div>
                        <div class="mt-4 d-table w-100 px-5">
                            <div class="d-table-cell align-middle">
                                <h5 class="p-0">
                                    Accessibility
                                </h5>
                            </div>
                        </div>
                        <div class="list" id="mbf">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="mod-bigger-font"></a>
                            <span class="onoffswitch-title">Bigger Content Font</span>
                            <span class="onoffswitch-title-desc">content fonts are bigger for readability</span>
                        </div>
                        <div class="list" id="mhc">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="mod-high-contrast"></a>
                            <span class="onoffswitch-title">High Contrast Text (WCAG 2 AA)</span>
                            <span class="onoffswitch-title-desc">4.5:1 text contrast ratio</span>
                        </div>
                        <div class="list" id="mcb">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="mod-color-blind"></a>
                            <span class="onoffswitch-title">Daltonism <sup>(beta)</sup> </span>
                            <span class="onoffswitch-title-desc">color vision deficiency</span>
                        </div>
                        <div class="list" id="mpc">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="mod-pace-custom"></a>
                            <span class="onoffswitch-title">Preloader Inside</span>
                            <span class="onoffswitch-title-desc">preloader will be inside content</span>
                        </div>
                        <div class="mt-4 d-table w-100 px-5">
                            <div class="d-table-cell align-middle">
                                <h5 class="p-0">
                                    Global Modifications
                                </h5>
                            </div>
                        </div>
                        <div class="list" id="mcbg">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="mod-clean-page-bg"></a>
                            <span class="onoffswitch-title">Clean Page Background</span>
                            <span class="onoffswitch-title-desc">adds more whitespace</span>
                        </div>
                        <div class="list" id="mhni">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="mod-hide-nav-icons"></a>
                            <span class="onoffswitch-title">Hide Navigation Icons</span>
                            <span class="onoffswitch-title-desc">invisible navigation icons</span>
                        </div>
                        <div class="list" id="dan">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="mod-disable-animation"></a>
                            <span class="onoffswitch-title">Disable CSS Animation</span>
                            <span class="onoffswitch-title-desc">Disables CSS based animations</span>
                        </div>
                        <div class="list" id="mhic">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="mod-hide-info-card"></a>
                            <span class="onoffswitch-title">Hide Info Card</span>
                            <span class="onoffswitch-title-desc">Hides info card from left panel</span>
                        </div>
                        <div class="list" id="mlph">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="mod-lean-subheader"></a>
                            <span class="onoffswitch-title">Lean Subheader</span>
                            <span class="onoffswitch-title-desc">distinguished page header</span>
                        </div>
                        <div class="list" id="mnl">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle"
                                data-class="mod-nav-link"></a>
                            <span class="onoffswitch-title">Hierarchical Navigation</span>
                            <span class="onoffswitch-title-desc">Clear breakdown of nav links</span>
                        </div>
                        <div class="list mt-1">
                            <span class="onoffswitch-title">Global Font Size <small>(RESETS ON REFRESH)</small> </span>
                            <div class="btn-group btn-group-sm btn-group-toggle my-2" data-toggle="buttons">
                                <label class="btn btn-default btn-sm" data-action="toggle-swap"
                                    data-class="root-text-sm" data-target="html">
                                    <input type="radio" name="changeFrontSize"> SM
                                </label>
                                <label class="btn btn-default btn-sm" data-action="toggle-swap" data-class="root-text"
                                    data-target="html">
                                    <input type="radio" name="changeFrontSize" checked=""> MD
                                </label>
                                <label class="btn btn-default btn-sm" data-action="toggle-swap"
                                    data-class="root-text-lg" data-target="html">
                                    <input type="radio" name="changeFrontSize"> LG
                                </label>
                                <label class="btn btn-default btn-sm" data-action="toggle-swap"
                                    data-class="root-text-xl" data-target="html">
                                    <input type="radio" name="changeFrontSize"> XL
                                </label>
                            </div>
                            <span class="onoffswitch-title-desc d-block mb-0">Change <strong>root</strong> font size to
                                effect rem
                                values</span>
                        </div>
                        <hr class="mb-0 mt-4">
                        <div class="mt-2 d-table w-100 pl-5 pr-3">
                            <div class="fs-xs text-muted p-2 alert alert-warning mt-3 mb-2">
                                <i class="fal fa-exclamation-triangle text-warning mr-2"></i>The settings below uses
                                localStorage to load
                                the external CSS file as an overlap to the base css. Due to network latency and CPU
                                utilization, you may
                                experience a brief flickering effect on page load which may show the intial applied
                                theme for a split
                                second. Setting the prefered style/theme in the header will prevent this from happening.
                            </div>
                        </div>
                        <div class="mt-2 d-table w-100 pl-5 pr-3">
                            <div class="d-table-cell align-middle">
                                <h5 class="p-0">
                                    Theme colors
                                </h5>
                            </div>
                        </div>
                        <div class="expanded theme-colors pl-5 pr-3">
                            <ul class="m-0">
                                <li>
                                    <a href="#" id="myapp-0" data-action="theme-update" data-themesave data-theme=""
                                        data-toggle="tooltip" data-placement="top" title="Wisteria (base css)"
                                        data-original-title="Wisteria (base css)"></a>
                                </li>
                                <li>
                                    <a href="#" id="myapp-1" data-action="theme-update" data-themesave
                                        data-theme="css/themes/cust-theme-1.css" data-toggle="tooltip"
                                        data-placement="top" title="Tapestry" data-original-title="Tapestry"></a>
                                </li>
                                <li>
                                    <a href="#" id="myapp-2" data-action="theme-update" data-themesave
                                        data-theme="css/themes/cust-theme-2.css" data-toggle="tooltip"
                                        data-placement="top" title="Atlantis" data-original-title="Atlantis"></a>
                                </li>
                                <li>
                                    <a href="#" id="myapp-3" data-action="theme-update" data-themesave
                                        data-theme="css/themes/cust-theme-3.css" data-toggle="tooltip"
                                        data-placement="top" title="Indigo" data-original-title="Indigo"></a>
                                </li>
                                <li>
                                    <a href="#" id="myapp-4" data-action="theme-update" data-themesave
                                        data-theme="css/themes/cust-theme-4.css" data-toggle="tooltip"
                                        data-placement="top" title="Dodger Blue" data-original-title="Dodger Blue"></a>
                                </li>
                                <li>
                                    <a href="#" id="myapp-5" data-action="theme-update" data-themesave
                                        data-theme="css/themes/cust-theme-5.css" data-toggle="tooltip"
                                        data-placement="top" title="Tradewind" data-original-title="Tradewind"></a>
                                </li>
                                <li>
                                    <a href="#" id="myapp-6" data-action="theme-update" data-themesave
                                        data-theme="css/themes/cust-theme-6.css" data-toggle="tooltip"
                                        data-placement="top" title="Cranberry" data-original-title="Cranberry"></a>
                                </li>
                                <li>
                                    <a href="#" id="myapp-7" data-action="theme-update" data-themesave
                                        data-theme="css/themes/cust-theme-7.css" data-toggle="tooltip"
                                        data-placement="top" title="Oslo Gray" data-original-title="Oslo Gray"></a>
                                </li>
                                <li>
                                    <a href="#" id="myapp-8" data-action="theme-update" data-themesave
                                        data-theme="css/themes/cust-theme-8.css" data-toggle="tooltip"
                                        data-placement="top" title="Chetwode Blue"
                                        data-original-title="Chetwode Blue"></a>
                                </li>
                                <li>
                                    <a href="#" id="myapp-9" data-action="theme-update" data-themesave
                                        data-theme="css/themes/cust-theme-9.css" data-toggle="tooltip"
                                        data-placement="top" title="Apricot" data-original-title="Apricot"></a>
                                </li>
                                <li>
                                    <a href="#" id="myapp-10" data-action="theme-update" data-themesave
                                        data-theme="css/themes/cust-theme-10.css" data-toggle="tooltip"
                                        data-placement="top" title="Blue Smoke" data-original-title="Blue Smoke"></a>
                                </li>
                                <li>
                                    <a href="#" id="myapp-11" data-action="theme-update" data-themesave
                                        data-theme="css/themes/cust-theme-11.css" data-toggle="tooltip"
                                        data-placement="top" title="Green Smoke" data-original-title="Green Smoke"></a>
                                </li>
                                <li>
                                    <a href="#" id="myapp-12" data-action="theme-update" data-themesave
                                        data-theme="css/themes/cust-theme-12.css" data-toggle="tooltip"
                                        data-placement="top" title="Wild Blue Yonder"
                                        data-original-title="Wild Blue Yonder"></a>
                                </li>
                                <li>
                                    <a href="#" id="myapp-13" data-action="theme-update" data-themesave
                                        data-theme="css/themes/cust-theme-13.css" data-toggle="tooltip"
                                        data-placement="top" title="Emerald" data-original-title="Emerald"></a>
                                </li>
                            </ul>
                        </div>
                        <hr class="mb-0 mt-4">
                        <div class="pl-5 pr-3 py-3 bg-faded">
                            <div class="row no-gutters">
                                <div class="col-6 pr-1">
                                    <a href="#" class="btn btn-outline-danger fw-500 btn-block"
                                        data-action="app-reset">Reset Settings</a>
                                </div>
                                <div class="col-6 pl-1">
                                    <a href="#" class="btn btn-danger fw-500 btn-block"
                                        data-action="factory-reset">Factory Reset</a>
                                </div>
                            </div>
                        </div>
                    </div> <span id="saving"></span>
                </div>
            </div>
        </div>
    </div>
	
	
	 <!-- END Page Settings -->
        <!-- base vendor bundle: 
			 DOC: if you remove pace.js from core please note on Internet Explorer some CSS animations may execute before a page is fully loaded, resulting 'jump' animations 
						+ pace.js (recommended)
						+ jquery.js (core)
						+ jquery-ui-cust.js (core)
						+ popper.js (core)
						+ bootstrap.js (core)
						+ slimscroll.js (extension)
						+ app.navigation.js (core)
						+ ba-throttle-debounce.js (core)
						+ waves.js (extension)
						+ smartpanels.js (extension)
						+ src/../jquery-snippets.js (core) -->
						
        <script src="${pageContext.request.contextPath}/resources/js/vendors.bundle.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/app.bundle.js"></script>
     	<script type="${pageContext.request.contextPath}/resources/text/javascript">
            /* Activate smart panels */
            $('#js-page-content').smartPanel();
        </script>      
        <script src="${pageContext.request.contextPath}/resources/js/dependency/moment/moment.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/miscellaneous/fullcalendar/fullcalendar.bundle.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/statistics/sparkline/sparkline.bundle.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/statistics/easypiechart/easypiechart.bundle.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/statistics/flot/flot.bundle.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/miscellaneous/jqvmap/jqvmap.bundle.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/datagrid/datatables/datatables.bundle.js"></script>
        
		<!--10.26 ListBoard -->
		<script src="${pageContext.request.contextPath}/resources/js/formplugins/summernote/summernote.js"></script>
		
        <script>
            $(document).ready(function()
            {
                //$('#js-page-content').smartPanel(); 

                //
                //
                var dataSetPie = [
                {
                    label: "Asia",
                    data: 4119630000,
                    color: color.primary._500
                },
                {
                    label: "Latin America",
                    data: 590950000,
                    color: color.info._500
                },
                {
                    label: "Africa",
                    data: 1012960000,
                    color: color.warning._500
                },
                {
                    label: "Oceania",
                    data: 95100000,
                    color: color.danger._500
                },
                {
                    label: "Europe",
                    data: 727080000,
                    color: color.success._500
                },
                {
                    label: "North America",
                    data: 344120000,
                    color: color.fusion._400
                }];


                $.plot($("#flotPie"), dataSetPie,
                {
                    series:
                    {
                        pie:
                        {
                            innerRadius: 0.5,
                            show: true,
                            radius: 1,
                            label:
                            {
                                show: true,
                                radius: 2 / 3,
                                threshold: 0.1
                            }
                        }
                    },
                    legend:
                    {
                        show: false
                    }
                });


                $.plot('#flotBar1', [
                {
                    data: [
                        [1, 0],
                        [2, 0],
                        [3, 0],
                        [4, 1],
                        [5, 3],
                        [6, 3],
                        [7, 10],
                        [8, 11],
                        [9, 10],
                        [10, 9],
                        [11, 12],
                        [12, 8],
                        [13, 10],
                        [14, 6],
                        [15, 3]
                    ],
                    bars:
                    {
                        show: true,
                        lineWidth: 0,
                        fillColor: color.fusion._50,
                        barWidth: .3,
                        order: 'left'
                    }
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
                        [9, 10],
                        [10, 11],
                        [11, 3]
                    ],
                    bars:
                    {
                        show: true,
                        lineWidth: 0,
                        fillColor: color.success._500,
                        barWidth: .3,
                        align: 'right'
                    }
                }],
                {
                    grid:
                    {
                        borderWidth: 0,
                    },
                    yaxis:
                    {
                        min: 0,
                        max: 15,
                        tickColor: '#F0F0F0',
                        ticks: [
                            [0, ''],
                            [5, '$5000'],
                            [10, '$25000'],
                            [15, '$45000']
                        ],
                        font:
                        {
                            color: '#444',
                            size: 10
                        }
                    },
                    xaxis:
                    {
                        mode: 'categories',
                        tickColor: '#F0F0F0',
                        ticks: [
                            [0, '3am'],
                            [1, '4am'],
                            [2, '5am'],
                            [3, '6am'],
                            [4, '7am'],
                            [5, '8am'],
                            [6, '9am'],
                            [7, '10am'],
                            [8, '11am'],
                            [9, '12nn'],
                            [10, '1pm'],
                            [11, '2pm'],
                            [12, '3pm'],
                            [13, '4pm'],
                            [14, '5pm']
                        ],
                        font:
                        {
                            color: '#999',
                            size: 9
                        }
                    }
                });


                /*
                 * VECTOR MAP
                 */

                var data_array = {
                    "af": "16.63",
                    "al": "0",
                    "dz": "158.97",
                    "ao": "85.81",
                    "ag": "1.1",
                    "ar": "351.02",
                    "am": "8.83",
                    "au": "1219.72",
                    "at": "366.26",
                    "az": "52.17",
                    "bs": "7.54",
                    "bh": "21.73",
                    "bd": "105.4",
                    "bb": "3.96",
                    "by": "52.89",
                    "be": "461.33",
                    "bz": "1.43",
                    "bj": "6.49",
                    "bt": "1.4",
                    "bo": "19.18",
                    "ba": "16.2",
                    "bw": "12.5",
                    "br": "2023.53",
                    "bn": "11.96",
                    "bg": "44.84",
                    "bf": "8.67",
                    "bi": "1.47",
                    "kh": "11.36",
                    "cm": "21.88",
                    "ca": "1563.66",
                    "cv": "1.57",
                    "cf": "2.11",
                    "td": "7.59",
                    "cl": "199.18",
                    "cn": "5745.13",
                    "co": "283.11",
                    "km": "0.56",
                    "cd": "12.6",
                    "cg": "11.88",
                    "cr": "35.02",
                    "ci": "22.38",
                    "hr": "59.92",
                    "cy": "22.75",
                    "cz": "195.23",
                    "dk": "304.56",
                    "dj": "1.14",
                    "dm": "0.38",
                    "do": "50.87",
                    "ec": "61.49",
                    "eg": "216.83",
                    "sv": "21.8",
                    "gq": "14.55",
                    "er": "2.25",
                    "ee": "19.22",
                    "et": "30.94",
                    "fj": "3.15",
                    "fi": "231.98",
                    "fr": "2555.44",
                    "ga": "12.56",
                    "gm": "1.04",
                    "ge": "11.23",
                    "de": "3305.9",
                    "gh": "18.06",
                    "gr": "305.01",
                    "gd": "0.65",
                    "gt": "40.77",
                    "gn": "4.34",
                    "gw": "0.83",
                    "gy": "2.2",
                    "ht": "6.5",
                    "hn": "15.34",
                    "hk": "226.49",
                    "hu": "132.28",
                    "is": "0",
                    "in": "1430.02",
                    "id": "695.06",
                    "ir": "337.9",
                    "iq": "84.14",
                    "ie": "204.14",
                    "il": "201.25",
                    "it": "2036.69",
                    "jm": "13.74",
                    "jp": "5390.9",
                    "jo": "27.13",
                    "kz": "129.76",
                    "ke": "32.42",
                    "ki": "0.15",
                    "kw": "117.32",
                    "kg": "4.44",
                    "la": "6.34",
                    "lv": "23.39",
                    "lb": "39.15",
                    "ls": "1.8",
                    "lr": "0.98",
                    "lt": "35.73",
                    "lu": "52.43",
                    "mk": "9.58",
                    "mg": "8.33",
                    "mw": "5.04",
                    "my": "218.95",
                    "mv": "1.43",
                    "ml": "9.08",
                    "mt": "7.8",
                    "mr": "3.49",
                    "mu": "9.43",
                    "mx": "1004.04",
                    "md": "5.36",
                    "rw": "5.69",
                    "ws": "0.55",
                    "st": "0.19",
                    "sa": "434.44",
                    "sn": "12.66",
                    "rs": "38.92",
                    "sc": "0.92",
                    "sl": "1.9",
                    "sg": "217.38",
                    "sk": "86.26",
                    "si": "46.44",
                    "sb": "0.67",
                    "za": "354.41",
                    "es": "1374.78",
                    "lk": "48.24",
                    "kn": "0.56",
                    "lc": "1",
                    "vc": "0.58",
                    "sd": "65.93",
                    "sr": "3.3",
                    "sz": "3.17",
                    "se": "444.59",
                    "ch": "522.44",
                    "sy": "59.63",
                    "tw": "426.98",
                    "tj": "5.58",
                    "tz": "22.43",
                    "th": "312.61",
                    "tl": "0.62",
                    "tg": "3.07",
                    "to": "0.3",
                    "tt": "21.2",
                    "tn": "43.86",
                    "tr": "729.05",
                    "tm": "0",
                    "ug": "17.12",
                    "ua": "136.56",
                    "ae": "239.65",
                    "gb": "2258.57",
                    "us": "14624.18",
                    "uy": "40.71",
                    "uz": "37.72",
                    "vu": "0.72",
                    "ve": "285.21",
                    "vn": "101.99",
                    "ye": "30.02",
                    "zm": "15.69",
                    "zw": "0"
                };

                $('#vector-map').vectorMap(
                {
                    map: 'world_en',
                    backgroundColor: 'transparent',
                    color: color.warning._50,
                    borderOpacity: 0.5,
                    borderWidth: 1,
                    hoverColor: color.success._300,
                    hoverOpacity: null,
                    selectedColor: color.success._500,
                    selectedRegions: ['US'],
                    enableZoom: true,
                    showTooltip: true,
                    scaleColors: [color.primary._400, color.primary._50],
                    values: data_array,
                    normalizeFunction: 'polynomial',
                    onRegionClick: function(element, code, region)
                    {
                        /*var message = 'You clicked "'
						+ region
						+ '" which has the code: '
						+ code.toLowerCase();
			 
					console.log(message);*/

                        var randomNumber = Math.floor(Math.random() * 10000000);
                        var arrow;

                        if (Math.random() >= 0.5 == true)
                        {
                            arrow = '<div class="ml-2 d-inline-flex"><i class="fal fa-caret-up text-success fs-xs"></i></div>'
                        }
                        else
                        {
                            arrow = '<div class="ml-2 d-inline-flex"><i class="fal fa-caret-down text-danger fs-xs"></i></div>'
                        }

                        $('.js-jqvmap-flag').attr('src', 'https://lipis.github.io/flag-icon-css/flags/4x3/' + code.toLowerCase() + '.svg');
                        $('.js-jqvmap-country').html(region + ' - ' + '$' + randomNumber.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + arrow);
                    }
                });


                /* TAB 1: UPDATING CHART */
                var data = [],
                    totalPoints = 200;
                var getRandomData = function()
                {
                    if (data.length > 0)
                        data = data.slice(1);

                    // do a random walk
                    while (data.length < totalPoints)
                    {
                        var prev = data.length > 0 ? data[data.length - 1] : 50;
                        var y = prev + Math.random() * 10 - 5;
                        if (y < 0)
                            y = 0;
                        if (y > 100)
                            y = 100;
                        data.push(y);
                    }

                    // zip the generated y values with the x values
                    var res = [];
                    for (var i = 0; i < data.length; ++i)
                        res.push([i, data[i]])
                    return res;
                }
                // setup control widget
                var updateInterval = 1500;
                $("#updating-chart").val(updateInterval).change(function()
                {

                    var v = $(this).val();
                    if (v && !isNaN(+v))
                    {
                        updateInterval = +v;
                        $(this).val("" + updateInterval);
                    }

                });
                // setup plot
                var options = {
                    colors: [color.primary._700],
                    series:
                    {
                        lines:
                        {
                            show: true,
                            lineWidth: 0.5,
                            fill: 0.9,
                            fillColor:
                            {
                                colors: [
                                {
                                    opacity: 0.6
                                },
                                {
                                    opacity: 0
                                }]
                            },
                        },

                        shadowSize: 0 // Drawing is faster without shadows
                    },
                    grid:
                    {
                        borderColor: '#F0F0F0',
                        borderWidth: 1,
                        labelMargin: 5
                    },
                    xaxis:
                    {
                        color: '#F0F0F0',
                        font:
                        {
                            size: 10,
                            color: '#999'
                        }
                    },
                    yaxis:
                    {
                        min: 0,
                        max: 100,
                        color: '#F0F0F0',
                        font:
                        {
                            size: 10,
                            color: '#999'
                        }
                    }
                };
                var plot = $.plot($("#updating-chart"), [getRandomData()], options);
                /* live switch */
                $('input[type="checkbox"]#start_interval').click(function()
                {
                    if ($(this).prop('checked'))
                    {
                        $on = true;
                        updateInterval = 1500;
                        update();
                    }
                    else
                    {
                        clearInterval(updateInterval);
                        $on = false;
                    }
                });
                var update = function()
                {
                    if ($on == true)
                    {
                        plot.setData([getRandomData()]);
                        plot.draw();
                        setTimeout(update, updateInterval);

                    }
                    else
                    {
                        clearInterval(updateInterval)
                    }

                }



                /*calendar */
                var todayDate = moment().startOf('day');
                var YM = todayDate.format('YYYY-MM');
                var YESTERDAY = todayDate.clone().subtract(1, 'day').format('YYYY-MM-DD');
                var TODAY = todayDate.format('YYYY-MM-DD');
                var TOMORROW = todayDate.clone().add(1, 'day').format('YYYY-MM-DD');


                var calendarEl = document.getElementById('calendar');

                var calendar = new FullCalendar.Calendar(calendarEl,
                {
                    plugins: ['dayGrid', 'list', 'timeGrid', 'interaction', 'bootstrap'],
                    themeSystem: 'bootstrap',
                    timeZone: 'UTC',
                    dateAlignment: "month", //week, month
                    buttonText:
                    {
                        today: 'today',
                        month: 'month',
                        week: 'week',
                        day: 'day',
                        list: 'list'
                    },
                    eventTimeFormat:
                    {
                        hour: 'numeric',
                        minute: '2-digit',
                        meridiem: 'short'
                    },
                    navLinks: true,
                    header:
                    {
                        left: 'title',
                        center: '',
                        right: 'today prev,next'
                    },
                    footer:
                    {
                        left: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek',
                        center: '',
                        right: ''
                    },
                    editable: true,
                    eventLimit: true, // allow "more" link when too many events
                    events: [
                    {
                        title: 'All Day Event',
                        start: YM + '-01',
                        description: 'This is a test description', //this is currently bugged: https://github.com/fullcalendar/fullcalendar/issues/1795
                        className: "border-warning bg-warning text-dark"
                    },
                    {
                        title: 'Reporting',
                        start: YM + '-14T13:30:00',
                        end: YM + '-14',
                        className: "bg-white border-primary text-primary"
                    },
                    {
                        title: 'Surgery oncall',
                        start: YM + '-02',
                        end: YM + '-03',
                        className: "bg-primary border-primary text-white"
                    },
                    {
                        title: 'NextGen Expo 2019 - Product Release',
                        start: YM + '-03',
                        end: YM + '-05',
                        className: "bg-info border-info text-white"
                    },
                    {
                        title: 'Dinner',
                        start: YM + '-12',
                        end: YM + '-10'
                    },
                    {
                        id: 999,
                        title: 'Repeating Event',
                        start: YM + '-09T16:00:00',
                        className: "bg-danger border-danger text-white"
                    },
                    {
                        id: 1000,
                        title: 'Repeating Event',
                        start: YM + '-16T16:00:00'
                    },
                    {
                        title: 'Conference',
                        start: YESTERDAY,
                        end: TOMORROW,
                        className: "bg-success border-success text-white"
                    },
                    {
                        title: 'Meeting',
                        start: TODAY + 'T10:30:00',
                        end: TODAY + 'T12:30:00',
                        className: "bg-primary text-white border-primary"
                    },
                    {
                        title: 'Lunch',
                        start: TODAY + 'T12:00:00',
                        className: "bg-info border-info"
                    },
                    {
                        title: 'Meeting',
                        start: TODAY + 'T14:30:00',
                        className: "bg-warning text-dark border-warning"
                    },
                    {
                        title: 'Happy Hour',
                        start: TODAY + 'T17:30:00',
                        className: "bg-success border-success text-white"
                    },
                    {
                        title: 'Dinner',
                        start: TODAY + 'T20:00:00',
                        className: "bg-danger border-danger text-white"
                    },
                    {
                        title: 'Birthday Party',
                        start: TOMORROW + 'T07:00:00',
                        className: "bg-primary text-white border-primary text-white"
                    },
                    {
                        title: 'Gotbootstrap Meeting',
                        url: 'http://gotbootstrap.com/',
                        start: YM + '-28',
                        className: "bg-info border-info text-white"
                    }],
                    viewSkeletonRender: function()
                    {
                        $('.fc-toolbar .btn-default').addClass('btn-sm');
                        $('.fc-header-toolbar h2').addClass('fs-md');
                        $('#calendar').addClass('fc-reset-order')
                    },

                });

                calendar.render();
            });
            
            
            $(document).ready(function()
                    {

                        $('input[type=radio][name=contactview]').change(function()
                        {
                            if (this.value == 'grid')
                            {
                                $('#js-contacts .card').removeClassPrefix('mb-').addClass('mb-g');
                                $('#js-contacts .col-xl-12').removeClassPrefix('col-xl-').addClass('col-xl-4');
                                $('#js-contacts .js-expand-btn').addClass('d-none');
                                $('#js-contacts .card-body + .card-body').addClass('show');

                            }
                            else if (this.value == 'table')
                            {
                                $('#js-contacts .card').removeClassPrefix('mb-').addClass('mb-1');
                                $('#js-contacts .col-xl-4').removeClassPrefix('col-xl-').addClass('col-xl-12');
                                $('#js-contacts .js-expand-btn').removeClass('d-none');
                                $('#js-contacts .card-body + .card-body').removeClass('show');
                            }

                        });

                        //initialize filter
                        initApp.listFilter($('#js-contacts'), $('#js-filter-contacts'));
                    });


            var events = $('#app-eventlog');
            var clearlogText = function()
            {
                events.empty();
            }

            $(document).ready(function()
            {
                var table = $('#dt-basic-example').DataTable(
                {
                    responsive: true,
                    blurable: false,
                    keys: true,
                    stateSave: true,
                    filter: false, //for demo purpose only
                    lengthChange: false //for demo purpose only
                });
                table.on('key', function(e, datatable, key, cell, originalEvent)
                    {
                        events.prepend('<div class="my-1"><span class="mr-2 badge badge-info width-10 text-left">Key press</span> <span class="fw-500 text-primary"> ' + key + ' </span> for cell <i>' + cell.data() + '</i></div>');
                    })
                    .on('key-focus', function(e, datatable, cell)
                    {
                        events.prepend('<div class="my-1"><span class="mr-2 badge badge-success width-10 text-left">Cell focus</span> <i>' + cell.data() + '</i></div>');
                    })
                    .on('key-blur', function(e, datatable, cell)
                    {
                        events.prepend('<div class="my-1"><span class="mr-2 badge badge-warning width-10 text-left">Cell blur</span> <i>' + cell.data() + '</i></div>');
                    })
            });
            
			//10.26 ListBoard
            var autoSave = $('#autoSave');
            var interval;
            var timer = function()
            {
                interval = setInterval(function()
                {
                    //start slide...
                    if (autoSave.prop('checked'))
                        saveToLocal();

                    clearInterval(interval);
                }, 3000);
            };

            //save
            var saveToLocal = function()
            {
                localStorage.setItem('summernoteData', $('#saveToLocal').summernote("code"));
                console.log("saved");
            }

            //delete 
            var removeFromLocal = function()
            {
                localStorage.removeItem("summernoteData");
                $('#saveToLocal').summernote('reset');
            }

            $(document).ready(function()
            {
                //init default
                $('.js-summernote').summernote(
                {
                    height: 200,
                    tabsize: 2,
                    placeholder: "Type here...",
                    dialogsFade: true,
                    toolbar: [
                        ['style', ['style']],
                        ['font', ['strikethrough', 'superscript', 'subscript']],
                        ['font', ['bold', 'italic', 'underline', 'clear']],
                        ['fontsize', ['fontsize']],
                        ['fontname', ['fontname']],
                        ['color', ['color']],
                        ['para', ['ul', 'ol', 'paragraph']],
                        ['height', ['height']]
                        ['table', ['table']],
                        ['insert', ['link', 'picture', 'video']],
                        ['view', ['fullscreen', 'codeview', 'help']]
                    ],
                    callbacks:
                    {
                        //restore from localStorage
                        onInit: function(e)
                        {
                            $('.js-summernote').summernote("code", localStorage.getItem("summernoteData"));
                        },
                        onChange: function(contents, $editable)
                        {
                            clearInterval(interval);
                            timer();
                        }
                    }
                });

                //load emojis
                $.ajax(
                {
                    url: 'https://api.github.com/emojis',
                    async: false
                }).then(function(data)
                {
                    window.emojis = Object.keys(data);
                    window.emojiUrls = data;
                });

                //init emoji example
                $(".js-hint2emoji").summernote(
                {
                    height: 100,
                    toolbar: false,
                    placeholder: 'type starting with : and any alphabet',
                    hint:
                    {
                        match: /:([\-+\w]+)$/,
                        search: function(keyword, callback)
                        {
                            callback($.grep(emojis, function(item)
                            {
                                return item.indexOf(keyword) === 0;
                            }));
                        },
                        template: function(item)
                        {
                            var content = emojiUrls[item];
                            return '<img src="' + content + '" width="20" /> :' + item + ':';
                        },
                        content: function(item)
                        {
                            var url = emojiUrls[item];
                            if (url)
                            {
                                return $('<img />').attr('src', url).css('width', 20)[0];
                            }
                            return '';
                        }
                    }
                });

                //init mentions example
                $(".js-hint2mention").summernote(
                {
                    height: 100,
                    toolbar: false,
                    placeholder: "type starting with @",
                    hint:
                    {
                        mentions: ['jayden', 'sam', 'alvin', 'david'],
                        match: /\B@(\w*)$/,
                        search: function(keyword, callback)
                        {
                            callback($.grep(this.mentions, function(item)
                            {
                                return item.indexOf(keyword) == 0;
                            }));
                        },
                        content: function(item)
                        {
                            return '@' + item;
                        }
                    }
                });

            });

	//             10.26 ListBoard
            var autoSave = $('#autoSave');
            var interval;
            var timer = function()
            {
                interval = setInterval(function()
                {
                    //start slide...
                    if (autoSave.prop('checked'))
                        saveToLocal();

                    clearInterval(interval);
                }, 3000);
            };

            //save
            var saveToLocal = function()
            {
                localStorage.setItem('summernoteData', $('#saveToLocal').summernote("code"));
                console.log("saved");
            }

            //delete 
            var removeFromLocal = function()
            {
                localStorage.removeItem("summernoteData");
                $('#saveToLocal').summernote('reset');
            }

            $(document).ready(function()
            {
                //init default
                $('.js-summernote').summernote(
                {
                    height: 200,
                    tabsize: 2,
                    placeholder: "Type here...",
                    dialogsFade: true,
                    toolbar: [
                        ['style', ['style']],
                        ['font', ['strikethrough', 'superscript', 'subscript']],
                        ['font', ['bold', 'italic', 'underline', 'clear']],
                        ['fontsize', ['fontsize']],
                        ['fontname', ['fontname']],
                        ['color', ['color']],
                        ['para', ['ul', 'ol', 'paragraph']],
                        ['height', ['height']]
                        ['table', ['table']],
                        ['insert', ['link', 'picture', 'video']],
                        ['view', ['fullscreen', 'codeview', 'help']]
                    ],
                    callbacks:
                    {
                        //restore from localStorage
                        onInit: function(e)
                        {
                            $('.js-summernote').summernote("code", localStorage.getItem("summernoteData"));
                        },
                        onChange: function(contents, $editable)
                        {
                            clearInterval(interval);
                            timer();
                        }
                    }
                });

                //load emojis
                $.ajax(
                {
                    url: 'https://api.github.com/emojis',
                    async: false
                }).then(function(data)
                {
                    window.emojis = Object.keys(data);
                    window.emojiUrls = data;
                });

                //init emoji example
                $(".js-hint2emoji").summernote(
                {
                    height: 100,
                    toolbar: false,
                    placeholder: 'type starting with : and any alphabet',
                    hint:
                    {
                        match: /:([\-+\w]+)$/,
                        search: function(keyword, callback)
                        {
                            callback($.grep(emojis, function(item)
                            {
                                return item.indexOf(keyword) === 0;
                            }));
                        },
                        template: function(item)
                        {
                            var content = emojiUrls[item];
                            return '<img src="' + content + '" width="20" /> :' + item + ':';
                        },
                        content: function(item)
                        {
                            var url = emojiUrls[item];
                            if (url)
                            {
                                return $('<img />').attr('src', url).css('width', 20)[0];
                            }
                            return '';
                        }
                    }
                });

                //init mentions example
                $(".js-hint2mention").summernote(
                {
                    height: 100,
                    toolbar: false,
                    placeholder: "type starting with @",
                    hint:
                    {
                        mentions: ['jayden', 'sam', 'alvin', 'david'],
                        match: /\B@(\w*)$/,
                        search: function(keyword, callback)
                        {
                            callback($.grep(this.mentions, function(item)
                            {
                                return item.indexOf(keyword) == 0;
                            }));
                        },
                        content: function(item)
                        {
                            return '@' + item;
                        }
                    }
                });

            });
            
            
            
           /*  11.14 list setting   */ 
            
                deleteEmail = function(threadID)
                {

                    // delete after animation is complete
                    threadID.animate(
                    {
                        height: 'toggle',
                        opacity: 'toggle'
                    }, '200', 'easeOutExpo', function()
                    {
                        //remove email after animation is complete
                        $(this).remove();
                        //update unread email count
                        newEmailDisplayTab();
                    });

                    //we remove any tooltips (this is a bug with bootstrap where the tooltip stays on screen after removing parent)
                    $('.tooltip').tooltip('dispose');

                    //uncheck master select all
                    if ($("#js-msg-select-all").is(":checked"))
                    {
                        $("#js-msg-select-all").prop('checked', false);
                    }

                    return this;
                }

            // select all component demo
            $("#js-msg-select-all").on("change", function(e)
            {
                if (this.checked)
                {
                    $('#js-emails :checkbox').prop("checked", $(this).is(":checked")).closest("li").addClass("state-selected");
                }
                else
                {
                    $('#js-emails :checkbox').prop("checked", $(this).is(":checked")).closest("li").removeClass("state-selected");
                }
            });

            // add or remove state-selected class to emails when they are checked
            $('#js-emails :checkbox').on("change", function()
            {

                if ($("#js-msg-select-all").is(":checked"))
                {
                    $('#js-msg-select-all').prop('indeterminate', true);
                }

                if (this.checked)
                {
                    $(this).closest("li").addClass("state-selected");
                }
                else
                {
                    $(this).closest("li").removeClass("state-selected");
                }

            });

            // email delete button triggers
            $(".js-delete-email").on('click', function()
            {
                deleteEmail($(this).closest("li"));
            })
            $("#js-delete-selected").on('click', function()
            {
                deleteEmail($("#js-emails input:checked").closest("li"))
            });


            // show unread email count (once)
            newEmailDisplayTab()


        </script>
	
</html>