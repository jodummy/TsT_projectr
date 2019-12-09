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
                                <i class='subheader-icon fal fa-credit-card-front'></i> 게시글 수정
                                <small>
                                       게시글을 수정해 주세요.
                                </small>
                            </h1>
                        </div>
                    <form action="/BoardModifyPage" method="get">
                        <div class="row">
                            <div class="col-xl-12">
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            <span class="fw-300"style="font-size: 1.5em;">${detail.tst_board_category } </span>
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
                                     <li><a href="javascript:void(0);"style="font-size: 1.2em;">작성자 : ${detail.tst_user_nickname }</a></li>
                                     <li class="position-absolute pos-top pos-right d-none d-sm-block"><span class=""style="font-size: 1.2em;">${detail.tst_modify_date }</span></li>
                                   </ol>
                                   </div> 
                                    <!-- 길이 수정 -->
                                    
                                    <div class="col-xl-5">
                                        <div class="form-group">
                                                    <label class="form-label" for="simpleinput" style="font-size: 2em;">Title</label>
                                                    <input type="text" id="title" name="title" class="form-control" value="${detail.tst_board_title }">
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
                                          <div class="js-summernote" id="saveToLocal"></div>
                                          </div>
                                        </div>
                             </div>

<!--                            tst_board_contents -->
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                       
<%--                        <input type="hidden" name="tst_board_category" id="tst_board_category" value="${detail.tst_board_category }" /> --%>
<%--                        <input type="hidden" name="tst_user_id" id="tst_user_id" value="${detail.tst_user_id }" /> --%>
<%--                        <input type="hidden" name="tst_board_no" id="tst_board_no" value="${detail.tst_board_no }" /> --%>
                       <p id="contentsModifyId" />
                       
                        <div class="demo">
<!--                         <button type="button" class="btn btn-primary" onclick="tt()">tt</button> -->
                             <button type="button" class="btn btn-primary" onclick="modifyActionClick()">수정</button>
<%--                              <button type="button" class="btn btn-primary" onclick="list(${boardVo.tst_board_category})" >목록</button> --%>
                        </div>
                    </form>
                        
                    </main>            
                    
</body>

<script type="text/javascript">

function modifyActionClick(){
var modifyTitle = document.getElementById('title').value;
var modifyContetns = document.getElementById('test').innerHTML;

$.ajax({
    type: "GET",
    url : "/BoardModifyPage",
    data : {
       tst_board_no : "${detail.tst_board_no }",
       tst_user_id : "${detail.tst_user_nickname }" ,
       tst_board_category : "${detail.tst_board_category }",
       tst_board_title : modifyTitle,
       tst_board_contents : modifyContetns,
    },
    success : function(result){
        location.href = "/BoardList?tst_board_category=" + result;
       }
    });

}


window.onload = function () {
   document.getElementById('test').innerHTML = "${detail.tst_board_contents }";
}


</script>

</html>