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
                               <div class="flex-1 fs-xxl text-contrast"> <i class='subheader-icon fal fa-table'>&nbsp</i>Board List <small>자유롭게 작성해주세요. </small></div>
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
                                                        Select a cell below to see events (you can also use your arrow keys once a cell is selected)
                                                    </div>
                                                    <table id="dt-basic-example" name="test" class="table table-bordered table-hove	r table-striped w-100">
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
                                                            <tr>
                                                                  <td>${row.no }</td>
                                                                <td>${row.tst_board_category}</td>
                                                                <td>
                                                                	<ol class="breadcrumb page-breadcrumb" style="margin:1rem;">
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
                                                <div class="col-xl-5">
                                                    <div class="frame-heading mt-3 mt-xl-0">
                                                        Displaying all key events
                                                    </div>
                                                    <div id="app-eventlog" class="alert alert-primary p-1 h-auto my-3"></div>
                                                    <a href="#" class="btn btn-sm btn-outline-danger" onclick="clearlogText(); return false;">
                                                        Clear Log
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>


	<nav class="shortcut-menu d-none d-sm-block">
        <input type="checkbox" class="menu-open" name="menu-open" id="menu_open" />
        <label for="menu_open" class="menu-open-button ">
            <span class="app-shortcut-icon d-block"></span>
        </label>
        <a href="#" class="menu-item btn" data-toggle="tooltip" data-placement="left" title="Scroll Top">
            <i class="fal fa-arrow-up"></i>
        </a>
        <a href="page_login_alt.html" class="menu-item btn" data-toggle="tooltip" data-placement="left" title="Logout">
            <i class="fal fa-sign-out"></i>
        </a>
        <a href="#" class="menu-item btn" data-action="app-fullscreen" data-toggle="tooltip" data-placement="left"
            title="Full Screen">
            <i class="fal fa-expand"></i>
        </a>
        
        <a href="/BoardInsert?tst_board_category=${category }" class="menu-item btn"  title="BoardInsert">
            <i class="fal fa-microphone"></i>
<!--             <i class='subheader-icon fal fa-plus-circle'></i> -->
        </a>
    </nav>



</body>

</html>