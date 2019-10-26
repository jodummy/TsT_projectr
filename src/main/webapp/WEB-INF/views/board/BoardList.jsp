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
                               <div class="flex-1 fs-xxl text-contrast"> <i class='subheader-icon fal fa-table'>&nbsp&nbsp</i>Board List <small>공지를 읽어 주세요 </small></div>
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
                                                    <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
                                                        <thead class="bg-primary-600">
                                                            <tr>
                                                                <th>no</th>
                                                                <th>title</th>
                                                                <th>name</th>
                                                                <th> </th>
                                                                <th>date</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>Tiger Nixon</td>
                                                                <td>System Architect</td>
                                                                <td>Edinburgh</td>
                                                                <td>61</td>
                                                                <td>2011/04/25</td>
                                                                <td>$320,800</td>
                                                            </tr>
                                                           
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






</body>
</html>