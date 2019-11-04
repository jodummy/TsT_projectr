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
								<div class="frame-heading mb-0">Select a cell below to see
									events (you can also use your arrow keys once a cell is
									selected)</div>
								<table id="dt-basic-example" name="test"
									class="table table-bordered table-hove	r table-striped w-100">
									<thead class="bg-primary-600">
										<tr>
											<th>no</th>
											<th>category</th>
											<th>title</th>
											<th>name</th>
											<th>insert_date</th>
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
												<td>${row.tst_user_id}</td>
												<td>${row.tst_insert_date}</td>
											</tr>
										</c:forEach>
									</tbody>

								</table>
								<!-- datatable end -->
							</div>

							<div class="col-xl-5" id="test">
							</div>


							<!--                                 </div> -->
							<!-- post comment - end -->

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>


	<nav class="shortcut-menu d-none d-sm-block"> <input
		type="checkbox" class="menu-open" name="menu-open" id="menu_open" />
	<label for="menu_open" class="menu-open-button "> <span
		class="app-shortcut-icon d-block"></span>
	</label> <a href="#" class="menu-item btn" data-toggle="tooltip"
		data-placement="left" title="Scroll Top"> <i
		class="fal fa-arrow-up"></i>
	</a> <a href="page_login_alt.html" class="menu-item btn"
		data-toggle="tooltip" data-placement="left" title="Logout"> <i
		class="fal fa-sign-out"></i>
	</a> <a href="#" class="menu-item btn" data-action="app-fullscreen"
		data-toggle="tooltip" data-placement="left" title="Full Screen"> <i
		class="fal fa-expand"></i>
	</a> <a href="/BoardInsert?tst_board_category=${category }"
		class="menu-item btn" title="BoardInsert"> <i
		class="fal fa-microphone"></i> <!--             <i class='subheader-icon fal fa-plus-circle'></i> -->
	</a> </nav>

</body>
<script type="text/javascript">


function detail(no){
	var str= "";

$.ajax({
    type: "GET",
    url : "/BoardDetail?tst_board_no="+no,
    success : function(result){
    	console.log(result);
    	str += "<div class='card mb-g' style='margin-top: 2rem;'><div class='card-body pb-0 px-4' ><div class='d-flex flex-row pb-3 pt-2  border-top-0 border-left-0 border-right-0' ><div class='d-inline-block align-middle status status-success mr-3'><span class='profile-image rounded-circle d-block' style='background-image:url(${pageContext.request.contextPath}/resources/img/demo/avatars/avatar-e.png); background-size: cover;'></span>"
    		+ "</div><h5 class='mb-0 flex-1 text-dark fw-500'>"+ result.tst_user_id +"<small class='m-0 l-h-n'>"+ result.tst_board_title +"</small></h5><span class='text-muted fs-xs opacity-70'>"+ result.tst_insert_date +"</span></div>"
    		+ "<div class='pb-3 pt-2 border-top-0 border-left-0 border-right-0 text-muted'>"+ result.tst_board_contents +"</div>"
    		+ "<div class='d-flex align-items-center demo-h-spacing py-3'><a href='javascript:void(0);' class='d-inline-flex align-items-center text-dark'><i class='fal fa-comment fs-xs mr-1'></i> <span>2 Comments</span></a></div></div></div>"
    		
    		+ "<button type='button' class='btn btn-sm btn-primary' onclick='deleteBoard(" + result.tst_board_no +")' style='margin-left:25rem'>삭제</button>"
    		+ "<button type='button' class='btn btn-sm btn-primary' onclick='ModifyBoard(" + result.tst_board_no +")' style='margin-left:1rem'>수정</button>"
//     		<input type="button" id="modifybutton" value="����" onclick="location.href='modifyBoard?tst_board_no=${detailBoard.tst_board_no}'">
//     		+ "<input type='button' id='deletebutton' value='����' onclick='location.href='/BoardDelete?tst_board_no=${detailBoard.tst_board_no}''>"
// 		+ "<input type='button' id='deletebutton' value='����' onclick='location.href='BoardDelete?tst_board_no= '+ result.tst_board_no +'>"
//     		+ "<input type='button' id='listebutton' value='���' onclick='next()'>"
    		$("#test").html(str);
    	}
    });
}



function deleteBoard(no){
	 $.ajax({
		    type: "GET",
		    url : "/BoardDelete?tst_board_no="+no,
		    success : function(result){
// 		    	console.log(result);
		    	alert("삭제 되었습니다.");
		    	 location.href = "/BoardList?tst_board_category=" + result;
		    	}
		    });
}

function ModifyBoard(no){
	location.href='/BoardModify?tst_board_no=' + no;
}


</script>

</html>