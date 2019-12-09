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
                       
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class='subheader-icon fal fa-credit-card-front'></i> 게시글 작성
                                <small>
                                       게시글을 작성해 주세요.
                                </small>
                            </h1>
                        </div>
                    <form action="/BoardInsertPage" method="get">
                        <div class="row">
                            <div class="col-xl-12">
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            <span class="fw-300"style="font-size: 1.5em;">${boardVo.tst_board_category } </span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                    </br>
                                     <div class="col-xl-12">
                                      <ol class="breadcrumb page-breadcrumb">
                                     <li class="breadcrumb-item "><a href="javascript:void(0);"style="font-size: 1.2em;">작성자 : ${boardVo.tst_user_nickname }</a></li>
                                     <li class="position-absolute pos-top pos-right d-none d-sm-block"><span class="js-get-date"style="font-size: 1.2em;"></span></li>
                                   </ol>
                                   </div> 
                                    <!-- 길이 수정 -->
                                    
                                    <div class="col-xl-5">
                                        <div class="form-group">
                                                    <label class="form-label" for="simpleinput" style="font-size: 2em;">Title</label>
                                                    <input type="text" id="tst_board_title" name="tst_board_title" class="form-control">
                                        </div>
                                    </div>
                                    
<!--                                         <div class="panel-content"> -->
<!--                                             <div class="js-summernote" name="tst_board_contents" id="tst_board_contents"></div> -->
<!--                                         </div> -->


<!--                               이쪽 css수정하고  -->
                     <div class="col-xl-12" style="margin-top:1rem;">
                              <div class="form-group">
                                                    <label class="form-label" for="simpleinput" style="font-size: 2em;">Contents</label>
<!--                                                     <textarea rows="" cols="" name="tst_board_contents" id="tst_board_contents"></textarea> -->
                                          <div class="panel-content" style="padding:0;">
                                          <div class="js-summernote" id="saveToLocal" ></div>
                                          </div>
                                        </div>
                             </div>

                           
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                       
                       <input type="hidden" name="tst_board_category" id="tst_board_category" value="${boardVo.tst_board_category }" />
                       <input type="hidden" name="tst_user_nickname" id="tst_user_nickname" value="${boardVo.tst_user_nickname }" />
                       <p id="contentsId" />
                       
                        <div class="demo">
                             <button type="submit" class="btn btn-primary" onclick="tt()">등록</button>
<%--                              <button type="button" class="btn btn-primary" onclick="list(${boardVo.tst_board_category})" >목록</button> --%>
                        </div>
                    </form>
                        
                    </main>            
                    
                    
</body>
<script type="text/javascript">
function tt(){
var contents = document.getElementById('test').innerHTML;
var contentsHtml = '<input type="hidden" name="tst_board_contents" id="tst_board_contents" value="'+ contents +'" />'

$("#contentsId").html(contentsHtml);
}

// function list(boardVo){
//    location.href="/BoardList";
// }
</script>
</html>