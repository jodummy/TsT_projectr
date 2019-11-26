<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
                     <main id="js-page-content" role="main" class="page-content">
                        <ol class="breadcrumb page-breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">SmartAdmin</a></li>
                            <li class="breadcrumb-item">Form Plugins</li>
                            <li class="breadcrumb-item active">Summernote</li>
                            <li class="position-absolute pos-top pos-right d-none d-sm-block"><span class="js-get-date"></span></li>
                        </ol>

                            <div class="d-flex flex-start w-100">
                                <div class="mr-2 hidden-md-down">
                                    <span class="icon-stack icon-stack-lg">

                            </div>
                        </div>
                        <div class="row">
                           



                     
                            <div class="col-xl-10" style="line-height: 4;">
                                <div id="panel-2" class="panel" >
                                    <div class="panel-hdr" >
                                        <h2>
                                               팀 공지사항 작성 <span class="fw-300"></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    
                                    
                                    
                                     <form action="${pageContext.request.contextPath}/teamNoticeInsertPage" method="get">
                                    <div class="panel-container show">
                                        <div class="panel-content">

                                            <!-- 제목작성부분 -->
                                            <div class="col-xl-5">
                                        <div class="form-group">
                                                    <label class="form-label" for="simpleinput" style="font-size: 2em;">Title</label>
                                                    <input type="text" id="tst_team_notice_board_title" name="tst_team_notice_board_title" class="form-control">
                                        </div>
                                    
                                    </div>
                                            
                                            <!-- 내용작성부분 -->
                                        <div class="form-group">
                                             <label class="form-label" for="simpleinput" style="font-size: 1em;">Notice</label>
                                             <textarea name="tst_team_notice_board_content" id="tst_team_notice_board_content" cols="30" rows="10" class="js-hint2emoji" style="height: 300px; line-height: 5;"></textarea>
                                        </div>
<!--                                         form-control -->
<!--                                              <input type="textarea" > -->
<!--                                             <div class="js-hint2emoji" style="height: 300px;"></div> -->
                                            </br>
                                          <div class="form-group">
                                            <button type="submit" class="btn btn-primary" style="margin-left: 32rem;">등록</button>
                                          </div>
                                        
                                        </div>
                                        </div>
                                    
                                    <input type="hidden" value="${tst_team_no}" name="tst_team_no" id="tst_team_no"/>
                                    </form>                  
                                    
                                    
                                    
                                </div>
                            </div>
<!--                             <div class="col-xl-6"> -->
<!--                                 <div id="panel-3" class="panel"> -->
<!--                                     <div class="panel-hdr"> -->
<!--                                         <h2> -->
<!--                                             Hint <span class="fw-300"><i>for Mentions</i></span> -->
<!--                                         </h2> -->
<!--                                         <div class="panel-toolbar"> -->
<!--                                             <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button> -->
<!--                                             <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button> -->
<!--                                             <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="panel-container show"> -->
<!--                                         <div class="panel-content"> -->
<!--                                             <div class="panel-tag"> -->
<!--                                                 For Mentions: [jayden, sam, alvin, david] -->
<!--                                             </div> -->
<!--                                             <div class="js-hint2mention"></div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                        </div>
                        
                    </main>
</body>
<!-- <script type="text/javascript"> -->
<!-- // function kk(){ -->
<!-- // var contents = document.getElementById('notice').innerHTML;  -->
<!-- // var contentsHtml = '<input type="hidden" name="tst_board_contents" id="tst_board_contents" value="'+ contents +'" />' -->

<!-- // $("#contentsId").html(contentsHtml); -->
<!-- // } -->


<!-- </script> -->
</html>