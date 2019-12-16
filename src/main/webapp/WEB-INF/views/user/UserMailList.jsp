<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mail Box</title>

    <link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/notifications/sweetalert2/sweetalert2.bundle.css">
    <link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/theme-demo.css">

</head>
<body>

    <main id="js-page-content" role="main" class="page-content">
                        <!-- Page heading removed for composed layout -->
                        <div class="d-flex flex-grow-1 p-0">
                            <!-- left slider -->
                            <div id="js-inbox-menu" class="flex-wrap position-relative bg-white slide-on-mobile slide-on-mobile-left">
                                <div class="position-absolute pos-top pos-bottom w-100">
                                    <div class="d-flex h-100 flex-column">
                                        <div class="px-3 px-sm-4 px-lg-5 py-4 align-items-center">
                                            <div class="btn-group btn-block" role="group" aria-label="Button group with nested dropdown ">
                                                <button type="button" class="btn btn-danger btn-block fs-md" data-action="toggle" data-class="d-flex" data-target="#panel-compose" data-focus="message-to">Compose</button>
                                                <div class="btn-group" role="group">
                                                    <button id="btnGroupDrop1" type="button" class="btn btn-danger dropdown-toggle px-2 js-waves-off" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                                    <!-- 새로만들기 드롭바 -->
                                                    <div class="dropdown-menu p-0" aria-labelledby="btnGroupDrop1">
                                                        <a class="dropdown-item" href="#">Work group A</a>
                                                        <a class="dropdown-item" href="#">New page</a>
                                                        <a class="dropdown-item" href="#">Edit signature</a>
                                                        <div class="dropdown-divider m-0"></div>
                                                        <a class="dropdown-item" href="#"> <i class="fas fa-plus width-1"></i> Add more</a>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                        <div class="flex-1 pr-3">
                                            <a href="#" class="dropdown-item px-3 px-sm-4 pr-lg-3 pl-lg-5 py-2 fs-md font-weight-bold d-flex justify-content-between rounded-pill border-top-left-radius-0 border-bottom-left-radius-0 ">
                                                <div>
                                                    <i class="fas fa-folder-open width-1"></i>Inbox
                                                </div>
                                                <div class="fw-400 fs-xs js-unread-emails-count"></div>
                                            </a>
                                            <a href="javascript:void(0)" class="dropdown-item px-3 px-sm-4 pr-lg-3 pl-lg-5 py-2 fs-md d-flex justify-content-between rounded-pill border-top-left-radius-0 border-bottom-left-radius-0">
                                                <div>
                                                    <i class="fas fa-paper-plane width-1"></i>Sent
                                                </div>
                                            </a>
                                            <a href="javascript:void(0)" class="dropdown-item px-3 px-sm-4 pr-lg-3 pl-lg-5 py-2 fs-md font-weight-bold d-flex justify-content-between rounded-pill border-top-left-radius-0 border-bottom-left-radius-0">
                                                <div>
                                                    <i class="fas fa-trash width-1"></i>Trash
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-backdrop" data-action="toggle" data-class="slide-on-mobile-left-show" data-target="#js-inbox-menu"></div> <!-- end left slider -->
                            <!-- inbox container -->
                            <div class="d-flex flex-column flex-grow-1 bg-white">
                                <!-- inbox header -->
                                <div class="flex-grow-0">
                                    <!-- inbox title -->
                                    <div class="d-flex align-items-center pl-2 pr-3 py-3 pl-sm-3 pr-sm-4 py-sm-4 px-lg-5 py-lg-4  border-faded border-top-0 border-left-0 border-right-0 flex-shrink-0">
                                        <!-- button for mobile -->
                                        <a href="javascript:void(0);" class="pl-3 pr-3 py-2 d-flex d-lg-none align-items-center justify-content-center mr-2 btn" data-action="toggle" data-class="slide-on-mobile-left-show" data-target="#js-inbox-menu">
                                            <i class="fal fa-ellipsis-v h1 mb-0 "></i>
                                        </a>
                                        <!-- end button for mobile -->
                                        <h1 class="subheader-title ml-1 ml-lg-0">
                                            <i class="fas fa-folder-open mr-2 hidden-lg-down"></i>
                                            Inbox
                                        </h1>
                                    </div>
                                    <!-- end inbox title -->
                                    <!-- inbox button shortcut -->
                                    <div class="d-flex flex-wrap align-items-center pl-3 pr-1 py-2 px-sm-4 px-lg-5 border-faded border-top-0 border-left-0 border-right-0">
                                        <div class="flex-1 d-flex align-items-center">
                                            <div class="custom-control custom-checkbox mr-2 mr-lg-2 d-inline-block">
                                                <input type="checkbox" class="custom-control-input" id="js-msg-select-all">
                                                <label class="custom-control-label bolder" for="js-msg-select-all"></label>
                                            </div>
                                            <!-- 새로고침 기능 만들어 줄거야 -->
                                            <a href="javascript:void(0);" class="btn btn-icon rounded-circle mr-1">
                                                <i class="fas fa-redo fs-md"></i>
                                            </a>
                                            <a href="javascript:void(0);" id="js-delete-selected" class="btn btn-icon rounded-circle mr-1">
                                                <i class="fas fa-trash fs-md"></i>
                                            </a>
                                        </div>
                                        <div class="text-muted mr-1 mr-lg-3 ml-auto">
                                            1 - 50 <span class="hidden-lg-down"> of ${count} </span>
                                        </div>
                                        <div class="d-flex flex-wrap">
                                            <button class="btn btn-icon rounded-circle"><i class="fal fa-chevron-left fs-md"></i></button>
                                            <button class="btn btn-icon rounded-circle"><i class="fal fa-chevron-right fs-md"></i></button>
                                        </div>
                                    </div>
                                    <!-- end inbox button shortcut -->
                                </div>
                                <!-- end inbox header -->
                                <!-- inbox message -->
                                <div class="flex-wrap align-items-center flex-grow-1 position-relative bg-gray-50">
                                    <div class="position-absolute pos-top pos-bottom w-100 custom-scroll">
                                        <div class="d-flex h-100 flex-column">
                                            <!-- message list (the part that scrolls) -->
                                            <ul id="js-emails" class="notification notification-layout-2">
                                                
                                                
                                                <!-- 내용  id="js-sweetalert2-example-8"-->
                                                  <c:forEach var="mailList" items="${mailList}">
                                                   <li class="unread">
                                                       <div class="d-flex align-items-center px-3 px-sm-4 px-lg-5 py-1 py-lg-0 height-4 height-mobile-auto">
                                                           <div class="custom-control custom-checkbox mr-3 order-1">
                                                               <input type="checkbox" class="custom-control-input" id="msg-${mailList.tst_message_no }">
                                                               <label class="custom-control-label" for="msg-${mailList.tst_message_no }"></label>
                                                           </div>
                                                           <div class="d-flex flex-row flex-wrap flex-1 align-items-s   tretch align-self-stretch order-2 order-lg-3" >
                                                               <div class="row w-100">
                                                   <c:if test="${mailList.tst_message_category eq 'T'}">
                                                       <a onclick="test('${mailList.tst_message_no }','${mailList.tst_from_nicname }','${mailList.tst_message_title }')" class="name d-flex width-sm align-items-center pt-1 pb-0 py-lg-1 col-12 col-lg-auto">${mailList.tst_from_nicname }</a>
                                                                      <a onclick="test('${mailList.tst_message_no }','${mailList.tst_from_nicname }','${mailList.tst_message_title }')" class="name d-flex align-items-center pt-0 pb-1 py-lg-1 flex-1 col-12 col-lg-auto">${mailList.tst_message_title }</a>
                                                   </c:if>
                                                   <c:if test="${mailList.tst_message_category eq 'F'}">
                                                       <a onclick="messageTest('${mailList.tst_message_content }','${mailList.tst_from_nicname }','${mailList.tst_message_no }')" class="name d-flex width-sm align-items-center pt-1 pb-0 py-lg-1 col-12 col-lg-auto">${mailList.tst_from_nicname }</a>
                                                                      <a onclick="messageTest('${mailList.tst_message_content }','${mailList.tst_from_nicname }','${mailList.tst_message_no }')" class="name d-flex align-items-center pt-0 pb-1 py-lg-1 flex-1 col-12 col-lg-auto">${mailList.tst_message_title }</a>
                                                   </c:if>
                                                    <c:if test="${mailList.tst_message_category eq 'C'}">
                                                       <a onclick="maching('${mailList.tst_message_no }','${mailList.tst_from_nicname }','${mailList.tst_message_title }','${mailList.tst_message_content }')" class="name d-flex width-sm align-items-center pt-1 pb-0 py-lg-1 col-12 col-lg-auto">${mailList.tst_from_nicname }</a>
                                                                      <a onclick="maching('${mailList.tst_message_no }','${mailList.tst_from_nicname }','${mailList.tst_message_title }','${mailList.tst_message_content }')" class="name d-flex align-items-center pt-0 pb-1 py-lg-1 flex-1 col-12 col-lg-auto">${mailList.tst_message_title }</a>
                                                   </c:if>
                                                               </div>
                                                           </div>
                                                           <div class="fs-sm text-muted ml-auto hide-on-hover-parent order-4 position-on-mobile-absolute pos-top pos-right mt-2 mr-3 mr-sm-4 mt-lg-0 mr-lg-0">${mailList.tst_from_date }</div>
                                                       </div>
                                                   </li>
                                                  </c:forEach>
                                              
                                              
                                            </ul>
                                            <!-- end message list -->
                                        </div>
                                    </div>
                                </div>
                                <!-- end inbox message -->
                            </div>
                            <!-- end inbox container -->
                            <!-- compose message -->
                            <div id="panel-compose" class="panel w-100 position-fixed pos-bottom pos-right mb-0 z-index-cloud mr-lg-4 shadow-3 border-bottom-left-radius-0 border-bottom-right-radius-0 expand-full-height-on-mobile expand-full-width-on-mobile shadow" style="max-width:40rem; height:35rem; display: none;">
                                <div class="position-relative h-100 w-100 d-flex flex-column">
                                    <!-- desktop view -->
                                    <div class="panel-hdr bg-fusion-600 height-4 d-none d-sm-none d-lg-flex">
                                        <h4 class="flex-1 fs-lg color-white mb-0 pl-3">
                                            New Message
                                        </h4>
                                        <div class="panel-toolbar pr-2">
                                            <a href="javascript:void(0);" class="btn btn-icon btn-icon-light fs-xl mr-1" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen" data-placement="bottom">
                                                <i class="fal fa-expand-alt"></i>
                                            </a>
                                            <a href="javascript:void(0);" class="btn btn-icon btn-icon-light fs-xl" data-action="toggle" data-class="d-flex" data-target="#panel-compose" data-toggle="tooltip" data-original-title="Save & Close" data-placement="bottom">
                                                <i class="fal fa-times"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- end desktop view -->
                                    <!-- mobile view -->
                                    <div class="d-flex d-lg-none align-items-center px-3 py-3 bg-faded  border-faded border-top-0 border-left-0 border-right-0 flex-shrink-0">
                                        <!-- button for mobile -->
                                        <!-- end button for mobile -->
                                        <h3 class="subheader-title">
                                            New message
                                        </h3>
                                        <div class="ml-auto">
                                            <button type="button" class="btn btn-outline-danger" data-action="toggle" data-class="d-flex" data-target="#panel-compose" id="compose">Cancel</button>
                                        </div>
                                    </div>
                                    
                                    <!-- end mobile view -->
                                    <div class="panel-container show rounded-0 flex-1 d-flex flex-column">
                                        <div class="px-3">
                                            <input id="message-to" type="text" placeholder="Recipients" class="form-control border-top-0 border-left-0 border-right-0 px-0 rounded-0 fs-md mt-2 pr-5" tabindex="2">
                                            <a href="javascript:void(0)" class="position-absolute pos-right pos-top mt-3 mr-4" data-action="toggle" data-class="d-block" data-target="#message-to-cc" data-focus="message-to-cc" data-toggle="tooltip" data-original-title="Add Cc recipients" data-placement="bottom">Cc</a>
                                            <input id="message-to-cc" type="text" placeholder="Cc" class="form-control border-top-0 border-left-0 border-right-0 px-0 rounded-0 fs-md mt-2 d-none" tabindex="3">
                                            <input id="message-title" type="text" placeholder="Subject" class="form-control border-top-0 border-left-0 border-right-0 px-0 rounded-0 fs-md mt-2" tabindex="4">
                                        </div>
                                        <div class="flex-1" style="overflow-y: auto;">
                                            <div id='fake_textarea' class="form-control rounded-0 w-100 h-100 border-0 py-3" contenteditable tabindex="5">
                                                <br>
                                                <br>
                                                <div class="d-flex d-column align-items-start mb-3">
                                                    <div class="border-left pl-3">
                                                    </div>
                                                </div>
                                              
                                            </div>
                                        </div>
                                        <div class="px-3 py-4 d-flex flex-row align-items-center flex-wrap flex-shrink-0">
                                            <a href="javascript:void(0);" class="btn btn-info mr-3" onclick="content()">Send</a>
                                            <a href="javascript:void(0);" class="btn btn-icon fs-xl mr-1" data-toggle="tooltip" data-original-title="Formatting options" data-placement="top">
                                                <i class="fas fa-font color-fusion-300"></i>
                                            </a>
                                            <a href="javascript:void(0);" class="btn btn-icon fs-xl mr-1" data-toggle="tooltip" data-original-title="Attach files" data-placement="top">
                                                <i class="fas fa-paperclip color-fusion-300"></i>
                                            </a>
                                            <a href="javascript:void(0);" class="btn btn-icon fs-xl mr-1" data-toggle="tooltip" data-original-title="Insert photo" data-placement="top">
                                                <i class="fas fa-camera color-fusion-300"></i>
                                            </a>
                                            <div class="ml-auto">
                                                <a href="javascript:void(0);" class="btn btn-icon fs-xl" data-toggle="tooltip" data-original-title="Disregard draft" data-placement="top">
                                                    <i class="fas fa-trash color-fusion-300"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div> 
                               <!-- end compose message -->
                               
                        </div>
                    </main>
   
<script src="${pageContext.request.contextPath}/resources/js/notifications/sweetalert2/sweetalert2.bundle.js"></script>

</body>
<script type="text/javascript">

function test(no,tst_from_nicname,tst_message_title){
//읽기 체크 
   $.ajax({
      async : true,
      url : '${pageContext.request.contextPath}/updateMailCheck?tst_message_no='+no,
      type : 'GET',
      success : function() {
      },
      error : function() {
         console.log("실패");
      }
   });
   
   let str = tst_message_title;

   
   let swalWithBootstrapButtons = Swal.mixin(
            {
                customClass:
                {
                    confirmButton: "btn btn-primary",
                    cancelButton: "btn btn-danger mr-2"
                },
                buttonsStyling: false
            });
            swalWithBootstrapButtons
                .fire(
                {
                    title: "사용자 가입을 수락하시겠어요?",
                    text: tst_from_nicname,
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Yes!",
                    cancelButtonText: "No!",
                    reverseButtons: true
                })
                .then(function(result)
                {
                    if (result.value)
                    {
                        swalWithBootstrapButtons.fire(
                            "수락하였습니다!",
                            "함께 잘해봐요 :)",
                            "success"
                        );
                     location.href="${pageContext.request.contextPath}/addMember?tst_from_nicname="+tst_from_nicname+"&tst_message_title="+str.substring( 0, str.lastIndexOf("팀") );
                    }
                    else if (
                        // Read more about handling dismissals
                        result.dismiss === Swal.DismissReason.cancel
                    )
                    {
                        swalWithBootstrapButtons.fire(
                            "거절하였습니다.",
                            "다음 기회에 잘 부탁드려요 :)",
                            "error"
                        );
                    }
                });
}


function maching(no,tst_from_nicname,tst_message_title,tst_message_content){
	//읽기 체크 
	   $.ajax({
	      async : true,
	      url : '${pageContext.request.contextPath}/updateMailCheck?tst_message_no='+no,
	      type : 'GET',
	      success : function() {
	      },
	      error : function() {
	         console.log("실패");
	      }
	   });
	   let str = tst_message_title;
	   let swalWithBootstrapButtons = Swal.mixin(
	            {
	                customClass:
	                {
	                    confirmButton: "btn btn-primary",
	                    cancelButton: "btn btn-danger mr-2"
	                },
	                buttonsStyling: false
	            });
	            swalWithBootstrapButtons
	                .fire(
	                {
	                    title: "매칭을 수락하시겠어요?",
	                    text: tst_from_nicname,
	                    type: "warning",
	                    showCancelButton: true,
	                    confirmButtonText: "Yes!",
	                    cancelButtonText: "No!",
	                    reverseButtons: true
	                })
	                .then(function(result)
	                {
	                    if (result.value)
	                    {
	                        swalWithBootstrapButtons.fire(
	                            "수락하였습니다!",
	                            "즐거운 경기해요! :)",
	                            "success"
	                        );
	                        location.href="/maching?tst_from_nicname="+tst_from_nicname +"&tst_message_title="+str.substring(0,str.lastIndexOf('경'))+"&tst_my_team="+tst_message_content.substring(tst_message_content.lastIndexOf('>')+1,tst_message_content.length);
	                        
	                    }
	                    else if (
	                        // Read more about handling dismissals
	                        result.dismiss === Swal.DismissReason.cancel
	                    )
	                    {
	                        swalWithBootstrapButtons.fire(
	                            "거절하였습니다.",
	                            "다음 기회에 잘 부탁드려요 :)",
	                            "error"
	                        );
	                    }
	                });
	}



function content(){
   let tst_message_content = $('#fake_textarea').text();
   let tst_to_nicname = $('#message-to').val();
   let tst_message_title = $('#message-title').val();
   
   location.href = "${pageContext.request.contextPath}/insertMessage?tst_message_content="+tst_message_content+"&tst_to_nicname="+tst_to_nicname+"&tst_message_title="+tst_message_title;
}

function messageTest(content,from,no){
   
   //읽기 체크 
   $.ajax({
      async : true,
      url : '${pageContext.request.contextPath}/updateMailCheck?tst_message_no='+no,
      type : 'GET',
      success : function() {
      },
      error : function() {
         console.log("실패");
      }
   });
   
    Swal.fire(
             {
                 title: content,
                 text: from,
                 showCancelButton: true,
                 confirmButtonText: "Reply!"
             }).then(function(result)
             {
                 if (result.value)
                 {
                    $("#compose").trigger("click");
                    $('#message-to').val(from);
                 }
             });
    

}

</script>

</html>