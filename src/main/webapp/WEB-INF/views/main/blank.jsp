<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
         <meta charset="utf-8">
        <title>
            Main
        </title>
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

</head>
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
            

var apiURI ="http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=2ba391459480be52aabcd8dc7b0f5a0b"  
          $.ajax({
            url : apiURI,
            method : 'GET',
            success :  (data)=> {
              var temp = String((data.main.temp - 272)).substring(0,3); // 온도
              var location = data.name; // 지역이름 
              $('#chatLog').append(temp　+ "도입니다. "+'\n');
//               var imgURL = "http://openweathermap.org/img/w/" + data.weather[0].icon + ".png";
//               alert(data.weather[0].icon);
//               http://openweathermap.org/img/w/10n.png
              let result = '';
              if(data.weather[0].icon == '01d' ||data.weather[0].icon == '01n'){
            	  result= '01d';
              }else if(data.weather[0].icon =='02d'|| data.weather[0].icon =='02n'){
            	  result= '02d';
              }else if(data.weather[0].icon == '03d' || data.weather[0].icon == '03n'){
            	  result= '03d';
              }else if(data.weather[0].icon == '04d' || data.weather[0].icon == '50n'|| data.weather[0].icon == '04n'){
            	  result= '04d';
              }else if(data.weather[0].icon == '09d'|| data.weather[0].icon == '09n'){
            	  result= '09d';
              }else if(data.weather[0].icon == '11d' || data.weather[0].icon == '11n'|| data.weather[0].icon == '10n'){
            	  result= '11d';
              }else if(data.weather[0].icon == '13d'||data.weather[0].icon == '13n'){
            	  result= '13d';
              }
              
              $('#img').attr("src", "${pageContext.request.contextPath}/resources/img/"+result+".png");
            }
          });  

        </script>
<body>

                <main id="js-page-content" role="main" class="page-content">
                 <sec:authentication var="principal" property="principal" />
				<input type="hidden" value='${principal.username}' name="tst_user_nickname" id="tst_user_nickname">    
            
                
                    <div class="subheader">
                            <div class="d-flex mr-0">
                                <div class="mr-2">
<!--                                     <span class="peity-donut" data-peity="{ &quot;fill&quot;: [&quot;#2196F3&quot;, &quot;#9acffa&quot;],  &quot;innerRadius&quot;: 14, &quot;radius&quot;: 20 }">3/10</span> -->
   <img src="" id="img"width="100" height="70"></img>
                                </div>
                                <div>
                                    <label class="fs-sm mb-0 mt-2 mt-md-0">온도</label>
                                    <h4 class="font-weight-bold mb-0" id="chatLog"></h4>
                                </div>
                            </div>
                        </div>

                     
                        <div class="row">
                        
                            <div class="col-sm-6 col-xl-3">
                                <div class="p-3 bg-primary-300 rounded overflow-hidden position-relative text-white mb-g">
                                    <div class="">
                                       <h3 class="display-4 d-block l-h-n m-0 fw-500">
                                           김태현보다 잘하는 팀
                                            <small class="m-0 l-h-n">팀원 많은 팀</small>
                                        </h3>
                                    </div>
                                    <img style="opacity: 0.5" class="fal fa-gem position-absolute pos-right pos-bottom opacity-15  mb-n1 mr-n4" alt="battle" width="150" height="100" src="http://pngimg.com/uploads/football/football_PNG52775.png">
                                </div>
                            </div>
                            
                            <div class="col-sm-6 col-xl-3">
                                <div class="p-3 bg-warning-400 rounded overflow-hidden position-relative text-white mb-g">
                                    <div class="">
                                        <h3 class="display-4 d-block l-h-n m-0 fw-500">
                                        
                                         xogus으로 만든 팀
                                            <small class="m-0 l-h-n">승률이 좋은 팀</small>
                                           
                                        </h3>
                                    </div>
                                    <img style="opacity: 0.5" class="fal fa-gem position-absolute pos-right pos-bottom opacity-15  mb-n1 mr-n4" alt="battle" width="150" height="100" src="${pageContext.request.contextPath}/resources/img/battle.png">
                                </div>
                            </div>
                            
                            <div class="col-sm-6 col-xl-3">
                                <div class="p-3 bg-success-200 rounded overflow-hidden position-relative text-white mb-g">
                                    <div class="">
                                        <h3 class="display-4 d-block l-h-n m-0 fw-500">
							서장훈 따라잡기
                                            <small class="m-0 l-h-n">팀원 교류가 많은 팀 </small>
                                        </h3>
                                    </div>
                                    <img style="opacity: 0.5" class="fal fa-gem position-absolute pos-right pos-bottom opacity-15  mb-n1 mr-n4" alt="battle" width="150" height="100" src="https://upload.wikimedia.org/wikipedia/commons/7/7a/Basketball.png">
                                </div>
                            </div>
                            
                            <div class="col-sm-6 col-xl-3">
                                <div class="p-3 bg-info-200 rounded overflow-hidden position-relative text-white mb-g">
                                    <div class="">
                                        <h3 class="display-4 d-block l-h-n m-0 fw-500">
                                            skt t1
                                            <small class="m-0 l-h-n">현재 팀원 모집</small>
                                        </h3>
                                    </div>
                                    <img style="opacity: 0.5" class="fal fa-gem position-absolute pos-right pos-bottom opacity-15  mb-n1 mr-n4" alt="battle" width="150" height="100" src="https://tistory4.daumcdn.net/tistory/2924964/skin/images/lol192x192.png">
                                </div>
                            </div>
                            
                            
                        </div>
                        
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Team profits
                                        </h2>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content bg-subtlelight-fade">
                                            <div id="flot-toggles" class="w-100 mt-4" style="height: 250px">
                                            
	                                        <a href="${pageContext.request.contextPath}/teamList?page=1&range=1&keyword=배틀그라운드">		<img alt="battle" 	width="200" height="230"	src="${pageContext.request.contextPath}/resources/img/battle.png">                         		</a>
	                                         <a href="${pageContext.request.contextPath}/teamList?page=1&range=1&keyword=리그오브레전드">	<img alt="lol" 	width="200" height="230"	src="https://tistory4.daumcdn.net/tistory/2924964/skin/images/lol192x192.png">                 		</a>
	                                         <a href="${pageContext.request.contextPath}/teamList?page=1&range=1&keyword=축구">			<img alt="foot" 	width="200" height="230"	src="http://pngimg.com/uploads/football/football_PNG52775.png">                                </a>
	                                         <a href="${pageContext.request.contextPath}/teamList?page=1&range=1&keyword=야구">			<img alt="base" 	width="200" height="230"	src="${pageContext.request.contextPath}/resources/img/base.png">  </a>
	                                         <a href="${pageContext.request.contextPath}/teamList?page=1&range=1&keyword=농구">			<img alt="bascket" 	width="200" height="230"	src="https://upload.wikimedia.org/wikipedia/commons/7/7a/Basketball.png">                      </a>
	                                        
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div id="panel-2" class="panel panel-locked" data-panel-sortable data-panel-collapsed data-panel-close>
                                    <div class="panel-hdr">
                                        <h2>
                                            오늘의 팀 <span class="fw-300"><i>Target</i></span>
                                        </h2>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content poisition-relative">
                                            <div class="p-1 position-absolute pos-right pos-top mt-3 mr-3 z-index-cloud d-flex align-items-center justify-content-center">
                                                <div class="border-faded border-top-0 border-left-0 border-bottom-0 py-2 pr-4 mr-3 hidden-sm-down">
                                                    <div class="text-right fw-500 l-h-n d-flex flex-column">
                                                        <div class="h3 m-0 d-flex align-items-center justify-content-end">
                                                            <div class='icon-stack mr-2'>
                                                                <i class="base base-7 icon-stack-3x opacity-100 color-success-600"></i>
                                                                <i class="base base-7 icon-stack-2x opacity-100 color-success-500"></i>
                                                                <i class="fal fa-arrow-up icon-stack-1x opacity-100 color-white"></i>
                                                            </div>
                                                            유자와 아이들
                                                        </div>
                                                        <span class="m-0 fs-xs text-muted">팀장 : 콧구멍 </span>
                                                    </div>
                                                </div>
                                                <div class="js-easy-pie-chart color-info-400 position-relative d-inline-flex align-items-center justify-content-center" data-percent="75" data-piesize="95" data-linewidth="10" data-scalelength="5">
                                                        <div class="position-absolute pos-top pos-left pos-right pos-bottom d-flex align-items-center justify-content-center fw-500 fs-xl text-dark">75%</div>
                                                </div>
                                                
                                            </div>
                                            
                                            	<div class="panel-content">
                                            <div class="frame-wrap">
                                            <div class="header">
                            <h4 class="title">안녕하세요, 유자와 아이들입니다. </br>
                            함께 농구를 할 사람들을 모집합니다.</h4>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">

                                    <tbody>
                                        <tr>
                                            <th>종목
                                            </th><td>농구</td>
                                        </tr>
                                        <tr>
                                            <th>승률
                                            </th><td>78%</td>
                                        </tr>
                                        <tr>
                                            <th>전적
                                            </th><td>15승 5패</td>

                                        </tr>
                                        <tr>
                                            <th>평균나이</th>
                                            <td>22</td>
                                        </tr>
                                        <tr>
                                            <th>주장</th>
                                            <td>콧구멍</td>
                                        </tr>
                                        <tr>
                                            <th>위치</th>
                                            <td>일산</td>
                                        </tr>
                                        <tr>
                                            <th>나이</th>
                                            <td>26</td>
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
                            </div>
                            
                            
                            
                            
                            
                                                 <div class="col-lg-6">
                                <div id="panel-3" class="panel panel-locked" data-panel-sortable data-panel-collapsed data-panel-close>
                                    <div class="panel-hdr">
                                        <h2>
                                            My <span class="fw-300"><i>profile</i></span>
                                        </h2>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content poisition-relative">
                                            <div class="pb-5 pt-3">
                                            
                                                <div class="card mb-g rounded-top">
                                    <div class="row no-gutters row-grid" >
                                        <div class="col-12">
                                            <div class="d-flex flex-column align-items-center justify-content-center p-4">
												<!-- 유진이 이미지 태현이 이미지 준서 이미지 -->     
												<c:choose>
													<c:when test="${principal.username == '유진이이'}"> 
													<img src="https://pbs.twimg.com/media/EGsNsB4U0AAeo-Z.jpg" class="rounded-circle shadow-2 img-thumbnail" alt="">
													</c:when>
													
													<c:when test="${principal.username == '스누피'}"> 
													 <img src="https://image.chosun.com/sitedata/image/201610/21/2016102101259_0.jpg" class="rounded-circle shadow-2 img-thumbnail" alt="">
													</c:when>
													
													<c:when test="${principal.username == 'xogus'}"> 
													<img src="https://www.nemopan.com/files/attach/images/6294/841/331/009/757eef5bab05e69b697e36d27323a11d.jpg" class="rounded-circle shadow-2 img-thumbnail" alt="">
													</c:when>
													
													<c:otherwise>
													<img src="https://icon-library.net/images/default-user-icon/default-user-icon-8.jpg" class="rounded-circle shadow-2 img-thumbnail" alt="">
													</c:otherwise>
												</c:choose>     
                                                <h5 class="mb-0 fw-700 text-center mt-3">
                                                              ${MyPage.tst_user_location}
                                                    <small class="text-muted mb-0">지역</small>
                                                </h5>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="text-center py-3">
                                                <h5 class="mb-0 fw-700">
                                                    ${MyPage.tst_user_brith}
                                                    <small class="text-muted mb-0">나이</small>
                                                </h5>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="text-center py-3">
                                                <h5 class="mb-0 fw-700">
                                                    ${MyPage.tst_user_gender}
                                                    <small class="text-muted mb-0">성별</small>
                                                </h5>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="p-3 text-center">
<!--                                                 <a href="javascript:void(0);" class="btn-link font-weight-bold">Follow</a> <span class="text-primary d-inline-block mx-3">&#9679;</span> -->
                                                <a href="javascript:void(0);" class="btn-link font-weight-bold" style="font-size: 1.2rem;"> ${MyPage.tst_user_nickname}</a> 
<!--                                                 <span class="text-primary d-inline-block mx-3">&#9679;</span> -->
<!--                                                 <a href="javascript:void(0);" class="btn-link font-weight-bold">Connect</a> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                
                                
                                
                                
                                
                                
                                
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                            
                            
							<div class="col-lg-12">
                                <div id="panel-4" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            MY <span class="fw-300"><i>Tables</i></span>
                                        </h2>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
                                                <thead class="bg-warning-200" style="line-height: 0.5;">
                                                    <tr>
                                                        <th>No</th>
                                                        <th>카테고리</th>
                                                        <th>제목</th>
                                                        <th>닉네임</th>
                                                        <th>등록일자</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="row" items="${MyList}">
                                                    <tr>
                                                        <td>${row.no }</td>
                                                        <td>${row.tst_board_category }</td>
                                                        <td>
                                                           <ol class="breadcrumb page-breadcrumb" style="margin: 0.3rem;">
                                                              <li class="breadcrumb-item">${row.tst_board_title }</li>
                                                           </ol>
                                                        </td>
                                                        <td>${row.tst_user_nickname }</td>
                                                        <td>${row.tst_insert_date }</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <!-- datatable end -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main> 
                    
     
        
   <span id ="todaysWeather"></span>
   
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
        
        
	<script>
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
       

</body>

</html>