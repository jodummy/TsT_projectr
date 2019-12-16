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
.table td {
   text-align: center;
   padding: 0rem;
   vertical-align: middle;
   border-top: 1px solid #e9e9e9;
}
</style>



<body>



   <main id="js-page-content" role="main" class="page-content">

   <div class="subheader">
      <h1 class="subheader-title">
         <div class="flex-1 fs-xxl text-contrast">
            <i class='subheader-icon fal fa-table'>&nbsp</i>Board List <small>자유롭게
               작성해주세요. </small>
         </div>
      </h1>
   </div>



   <div class="row">
      <div class="col-xl-12">
         <div id="panel-1" class="panel">
            <div class="panel-container show">
               <div class="panel-content">
                  <div class="row">
                     <div class="col-xl-7">
                        <!-- datatable start -->
                        <div class="frame-heading mb-0">
                        </div>
                        <table id="dt-basic-example" name="test" class="table table-bordered table-hove   r table-striped w-100">
                           <thead class="bg-primary-600">
                              <tr>
                                 <th>No</th>
                                 <th>Category</th>
                                 <th>Title</th>
                                 <c:if test="${category != '블랙리스트 게시판' }">
                                 <th>UserNickname</th>
                                 </c:if>
                                 <th>Date</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach var="row" items="${BoardList}">
                                 <tr onclick="detail(${row.tst_board_no})">
                                    <td>${row.no }</td>
                                    <td>${row.tst_board_category}</td>
                                    <td>
                                       <ol class="breadcrumb page-breadcrumb"
                                          style="margin: 1rem;">
                                          <li class="breadcrumb-item">${row.tst_board_title}</li>
                                       </ol>
                                    </td>
                                    <c:if test="${row.tst_board_category != '블랙리스트 게시판' }">
                                    <td>${row.tst_user_nickname}</td>
                                    </c:if>
                                    <td>${row.tst_insert_date}</td>
                                 </tr>
                              </c:forEach>
                           </tbody>

                        </table>
                        <!-- datatable end -->
                     </div>

                     <div class="col-xl-5" id="test">
                     </div>

                     <input type="hidden" value="${userId }" name="userId" id="userId"/>
                     <!--                                 </div> -->
                     <!-- post comment - end -->

                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   
   
<!--    여기 -->
<!-- <div class="card mb-g"> -->
<!--                                     <div class="card-body pb-0 px-4"> -->
<!--          <div class="card-body py-0 px-4 border-faded border-right-0 border-bottom-0 border-left-0"> -->
<!--                                         <div class="d-flex flex-column align-items-center"> -->
<!--                                             comment -->
<!--                                             <div class="d-flex flex-row w-100 py-4"> -->
<!--                                                 <div class="d-inline-block align-middle status status-sm status-success mr-3"> -->
<!--                                                     <span class="profile-image profile-image-md rounded-circle d-block mt-1" style="background-image:url('img/demo/avatars/avatar-c.png'); background-size: cover;"></span> -->
<!--                                                 </div> -->
<!--                                                 <div class="mb-0 flex-1 text-dark"> -->
<!--                                                     <div class="d-flex"> -->
<!--                                                         <a href="javascript:void(0);" class="text-dark fw-500"> -->
<!--                                                             Test name -->
<!--                                                         </a><span class="text-muted fs-xs opacity-70 ml-auto"> -->
<!--                                                             15 minutes -->
<!--                                                         </span> -->
<!--                                                     </div> -->
<!--                                                     <p class="mb-0"> -->
<!--                                                         Excellent work, looking forward to it. -->
<!--                                                     </p> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                             <hr class="m-0 w-100"> -->
<!--                                             comment end -->
                                          
<!--                                             add comment -->
<!--                                             <div class="py-3 w-100"> -->
<!--                                                 <textarea class="form-control border-0 p-0" rows="2" placeholder="add a comment..."></textarea> -->
<!--                                             </div> -->
<!--                                             add comment end -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     </div> -->
<!--                                     </div> -->
   </main>


   <nav class="shortcut-menu d-none d-sm-block"> <input
      type="checkbox" class="menu-open" name="menu-open" id="menu_open" />
   <label for="menu_open" class="menu-open-button "> <span
      class="app-shortcut-icon d-block"></span>
   </label>
<!--     <a href="#" class="menu-item btn" data-toggle="tooltip" -->
<!--       data-placement="left" title="Scroll Top"> <i -->
<!--       class="fal fa-arrow-up"></i> -->
<!--    </a> -->
    <a href="/logout" class="menu-item btn"
      data-toggle="tooltip" data-placement="left" title="Logout"> <i
      class="fal fa-sign-out"></i>
   </a> <a href="#" class="menu-item btn" data-action="app-fullscreen"
      data-toggle="tooltip" data-placement="left" title="Full Screen"> <i
      class="fal fa-expand"></i>
   </a> <a href="/BoardInsert?tst_board_category=${category }"
      class="menu-item btn" data-toggle="tooltip" data-placement="left" title="Board Insert"> <i
      class="fal fa-arrow-up"></i>
   </a> </nav>
  

</body>
<script type="text/javascript">
var str= "";
var replyCount = 0;
function detail(no){
   replyCount = 0;
   str= "";
//    이거 닉네임으로 바꿔야됨
   var value = $('#userId').val();
   
$.ajax({
    type: "GET",
    url : "/BoardDetail?tst_board_no="+no,
    success : function(result){
    	
    	let img = 'https://pbs.twimg.com/media/EGsNsB4U0AAeo-Z.jpg';
    	if(result.tst_user_nickname == '스누피'){
    		img='https://image.chosun.com/sitedata/image/201610/21/2016102101259_0.jpg';
    	}
       str += "<div class='card mb-g' style='margin-top: 2rem; max-height:560px;overflow:auto; '>"
       	  +"<div class='card-body pb-0 px-4' ><div class='d-flex flex-row pb-3 pt-2  border-top-0 border-left-0 border-right-0' >"
       	  +"<div class='d-inline-block align-middle status status-success mr-3'>"
       	  +"<span class='profile-image rounded-circle d-block' style='background-image:url("
       	  + img
       	  +"); background-size: cover;'></span>"
          + "</div><h5 class='mb-0 flex-1 text-dark fw-500'>"+ result.tst_user_nickname +"<small class='m-0 l-h-n'>"+ result.tst_board_title +"</small></h5><span class='text-muted fs-xs opacity-70'>"+ result.tst_insert_date +"</span></div>"
          + "<div class='pb-3 pt-2 border-top-0 border-left-0 border-right-0 text-muted'>"+ result.tst_board_contents +"</div>"
//           + "<div class='d-flex align-items-center demo-h-spacing py-3' style='float:left;'><a class='d-inline-flex align-items-center text-dark'><i class='fal fa-comment fs-xs mr-1'></i> <span onclick='replyBoard(" + result.tst_board_no +")'> Comments</span></a></div>";
       
//           이거 닉네임으로 바꿔야됨
          if(result.tst_user_nickname == value){
             str+= "<button type='button' class='btn btn-sm btn-primary' onclick='deleteBoard(" + result.tst_board_no +")' style='margin-left:1rem; float:right; margin-top:1rem;'>삭제</button>"
                 + "<button type='button' class='btn btn-sm btn-primary' onclick='ModifyBoard(" + result.tst_board_no +")' style='margin-left:1rem; float:right; margin-top:1rem;'>수정</button>";
          }
          //여기
//        str += "<div class='d-flex align-items-center demo-h-spacing py-3' style='margin-top: 2rem;'><a href='javascript:void(0);' class='d-inline-flex align-items-center text-dark'><i class='fal fa-comment fs-xs mr-1'></i> <span onclick='replyBoard(" + result.tst_board_no +")'>"
//           + result.tst_reply_count + " Comments</span></a></div>"
//           + "<form action='/BoardReplyInsert' method='get'><input type='hidden' value="+ result.tst_board_no +" id='tst_board_no'> <hr class='m-0 w-100'> <div class='py-3 w-90'> <textarea class='form-control p-0' rows='2' placeholder='add a comment...' style='width:90%;margin-bottom:1.5rem;float:left;' id='tst_board_reply_content'> </textarea> <button type='submit'  class='btn btn-sm btn-outline-dark' style='float:left;width:10%;height:2.4rem;padding:0;'>입력</button> </div> </form>"

       str += "<div class='d-flex align-items-center demo-h-spacing py-3' style='margin-top: 2rem;'><a href='javascript:void(0);' class='d-inline-flex align-items-center text-dark'><i class='fal fa-comment fs-xs mr-1'></i> <span onclick='replyBoard(" + result.tst_board_no +")'> "  + result.tst_reply_count + " Comments</span></a></div>"
       	   + "<hr class='m-0 w-100'> <div class='py-3 w-90'> <textarea class='form-control p-0' rows='2' placeholder='add a comment...' style='width:90%;margin-bottom:1.5rem;float:left;' id='tst_board_reply_content' name='tst_board_reply_content'> </textarea> <button class='btn btn-sm btn-outline-dark' style='float:left;width:10%;height:2.4rem;padding:0;' onclick='replyInsertBoard("+ result.tst_board_no +")' >입력</button> </div>"
//        <input type="hidden" value="${userId }" name="userId" id="userId"/>
       $("#test").html(str);
    }
 });
}

function replyInsertBoard(tst_board_no){
	   let tst_board_reply_content = $('#tst_board_reply_content').val();
	    $.ajax({
	          type: "GET",
	          url : "/BoardReplyInsert?tst_board_no=" + tst_board_no +"&tst_board_reply_content=" + tst_board_reply_content, 
	          success : function(result){
	             }
	          });
	    window.location.reload(true);
	}
	
	
function replyBoard(tst_board_no){
	   var value = $('#tst_user_nickname').val();
	   if(replyCount == 0){
	    $.ajax({
	          type: "GET",
	          url : "/BoardReplyList?tst_board_no="+tst_board_no,
	          success : function(result){
	             
	             for(var i=0; i < result.length; i++){
	             str += "</br> <div class='d-flex flex-row w-100 py-4'> <div class='d-inline-block align-middle status status-sm status-success mr-3'> <span class='profile-image profile-image-md rounded-circle d-block mt-1' style='background-image:url(https://image.chosun.com/sitedata/image/201610/21/2016102101259_0.jpg); background-size: cover;''></span>"
	                   + "</div> <div class='mb-0 flex-1 text-dark'> <div class='d-flex'> <a href='javascript:void(0);' class='text-dark fw-500'>"
	                   + result[i].tst_user_nickname + "</a><span class='text-muted fs-xs opacity-70 ml-auto'> " +result[i].tst_board_reply_date+ " </span> </div> <p class='mb-0'> " +result[i].tst_board_reply_content+ " </p> </div> </div>"
	                  
	                   if(result[i].tst_user_nickname == value){
	                   str += "<button type='button' class='btn btn-xs btn-dark' style=' float:right; margin-top:0;' onclick='deleteReplyBoard("+result[i].tst_board_reply_no+")'>삭제</button>"
	                }
	             }   
	             str += "</div></div>";
	             $("#test").html(str);
	             str = "";
	             replyCount = 1;
	             }
	          });
	   }
	}
	
function deleteReplyBoard(tst_board_reply_no){
    $.ajax({
          type: "GET",
          url : "/BoardReplyDelete?tst_board_reply_no="+tst_board_reply_no,
          success : function(result){
             }
          });
    window.location.reload(true);
}

function deleteBoard(no){
    $.ajax({
          type: "GET",
          url : "/BoardDelete?tst_board_no="+no,
          success : function(result){
//              console.log(result);
              location.href = "/BoardList?tst_board_category=" + result;
             }
          });
}

function ModifyBoard(no){
   location.href='/BoardModify?tst_board_no=' + no;
}


</script>

</html>