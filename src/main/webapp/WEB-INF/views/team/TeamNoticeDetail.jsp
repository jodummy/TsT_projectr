<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>

::-webkit-scrollbar{
  width:20px;
} 

::-webkit-scrollbar-thumb{
   background-color: rgba(255,255,255,1);

}  


</style>





<body>

                             <main id="js-page-content" role="main" class="page-content">
                             
                        <div class="subheader">

                        </div>
                        <div class="row">
                            <div class="col-xl-12">


                                <div class="card mb-g border shadow-0">
                                    <div class="card-header bg-white">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col">
                                                <span class="h6 font-weight-bold text-uppercase"> <i class='subheader-icon fal fa-plus-circle'></i> 공지 사항 </span>
                                            </div>
                                            <div class="col d-flex">
                                                <a href="../teamDetailpage?tst_team_no=${noticeDetail.tst_team_no }" class="btn btn-outline-success btn-sm ml-auto mr-2 flex-shrink-0">목록</a>
                                                <c:if test="${user_nickname== noticeDetail.tst_user_nickname}">
                                                <a href="../teamNoticeModify?tst_team_notice_board_no=${noticeDetail.tst_team_notice_board_no}&tst_team_no=${noticeDetail.tst_team_no}" class="btn btn-sm btn-outline-warning mr-2">수정</a>
                                                <a href="../teamNoticeDelete?tst_team_notice_board_no=${noticeDetail.tst_team_notice_board_no}&tst_team_no=${noticeDetail.tst_team_no}" class="btn btn-outline-danger btn-sm flex-shrink-0">삭제</a>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>

                                
                                    <div class="card-body p-0">
                                        <div class="row no-gutters row-grid">
                                          
                                            <div class="col-12" style="line-height: 2.5;">
                                                <div class="row no-gutters row-grid align-items-stretch">
                                                
											<!--   여기에 넣어봐 그거 디테일 -->

   
<!--                                             여기가핗요해 -->
                                            <div class="card m-auto border col-8" style="margin:0 !important; ">
                                                <div class="card-header py-2">
                                                    <div class="card-title">
                                                      
                        <ol class="breadcrumb page-breadcrumb">
                         	<li class="breadcrumb-item"><a href="javascript:void(0);">${noticeDetail.tst_user_nickname	}</a></li>
                         	<li class="breadcrumb-item">${noticeDetail.tst_team_notice_modify_date}</li>
                        </ol>
                       <h1>${noticeDetail.tst_team_notice_board_title }</h1>
                        
<%--                                                         ${noticeDetail.tst_team_notice_insert_date} --%>
                                                    </div>
                                                </div>
                                                <div class="card-body">
                                                    <blockquote class="blockquote mb-0">
                                                        <p>${noticeDetail.tst_team_notice_board_content}</p>
                                                    </blockquote>
                                                </div>
                                            </div>
                                            <input type="hidden" value="${noticeDetail.tst_team_no }" name="team_no" id="team_no">


                                            <div class="col-8 col-md-3 hidden-md-down" style="width:410px;height:200px;overflow-y:overlay;position:relative;">
                                                <div class="p-3 p-md-3" >
                                                
                                                
                                                
                                                <c:forEach var="check" items="${check}">
                                                    <div class="d-flex align-items-center" >
                                                        <div class="d-inline-block align-middle status status-success status-sm mr-2">
                                                            <span class="profile-image-md rounded-circle d-block" style="background-image:url('img/demo/avatars/avatar-d.png'); background-size: cover;"></span>
                                                        </div>
                                                        <div class="flex-1 min-width-0">
                                                            <a href="javascript:void(0)">
                                                            ${check.tst_user_nickname}
                                                            </a>
                                                            <div class="text-muted small text-truncate">
                                                                ${check.tst_team_notice_board_check_date} <a href="javascript:void(0)" class="text-info"></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                  </c:forEach>
                                                    
                                                    
                                                    
                                                </div>
                                            </div>
                                            
                                            
                                                    
                                                </div>
                                            </div>
                                           

                                           
                                        </div>
                                    </div>
                                </div>
    
                            </div>
                        </div>
                    </main>
                                
                                
                                

                        
                        

                                     

</body>
</html>