<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    <!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>
            Login
        </title>
        <meta name="description" content="Login">
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
        <!-- Optional: page related CSS-->
        <link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/resources/css/fa-brands.css">
    </head>
    <body class="desktop chrome webkit pace-done mod-main-boxed">
    
<!--       <a href="#" onclick="return true;" class="btn btn-switch m-0" data-action="toggle" data-class="mod-main-boxed"></a> -->
      
        <div class="page-wrapper">
            <div class="page-inner bg-brand-gradient">
                <div class="page-content-wrapper bg-transparent m-0">
                    <div class="height-10 w-100 shadow-lg px-4 bg-brand-gradient">
                        <div class="d-flex align-items-center container p-0">
                            <div class="page-logo width-mobile-auto m-0 align-items-center justify-content-center p-0 bg-transparent bg-img-none shadow-0 height-9">
                                <a href="javascript:void(0)" class="page-logo-link press-scale-down d-flex align-items-center">
                                    <span class="page-logo-text mr-1">Team Sport Tournament</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="flex-1" background-size: cover;">
                        <div class="container py-4 py-lg-5 my-lg-5 px-4 px-sm-0">
                            <div class="row">
                                <div class="col col-md-6 col-lg-7 hidden-sm-down">
                                    <h2 class="fs-xxl fw-500 mt-4 text-white">
                                        The simplest UI toolkit for developers &amp; programmers
                                        <small class="h3 fw-300 mt-3 mb-5 text-white opacity-60">
                                        </small>
                                    </h2>
<!--                                     <a href="#" class="fs-lg fw-500 text-white opacity-70">Learn more &gt;&gt;</a> -->
<!--                                     <div class="d-sm-flex flex-column align-items-center justify-content-center d-md-block"> -->
<!--                                         <div class="px-0 py-1 mt-5 text-white fs-nano opacity-50"> -->
<!--                                             Find us on social media -->
<!--                                         </div> -->
<!--                                         <div class="d-flex flex-row opacity-70"> -->
<!--                                             <a href="#" class="mr-2 fs-xxl text-white"> -->
<!--                                                 <i class="fab fa-facebook-square"></i> -->
<!--                                             </a> -->
<!--                                             <a href="#" class="mr-2 fs-xxl text-white"> -->
<!--                                                 <i class="fab fa-twitter-square"></i> -->
<!--                                             </a> -->
<!--                                             <a href="#" class="mr-2 fs-xxl text-white"> -->
<!--                                                 <i class="fab fa-google-plus-square"></i> -->
<!--                                             </a> -->
<!--                                             <a href="#" class="mr-2 fs-xxl text-white"> -->
<!--                                                 <i class="fab fa-linkedin"></i> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                </div>
                                <div class="col-sm-12 col-md-6 col-lg-5 col-xl-4 ml-auto">
                                    <h1 class="text-white fw-300 mb-3 d-sm-block d-md-none">
                                        Secure login
                                    </h1>
                                    <div class="card p-4 rounded-plus bg-faded">
                                    
                                        <form id="js-login" action="/login" method="post">
                                            <div class="form-group">
                                                <label class="form-label" for="username">ID</label>
                                                <input type="text" name="tst_user_id" id="tst_user_id"  class="form-control form-control-lg" placeholder="your id" required>
                                                <div class="help-block">아이디를 작성해주세요.</div>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label" for="password">Password</label>
                                                <input type="password" name="tst_user_pw" id="tst_user_pw" class="form-control form-control-lg" placeholder="your password" required>
                                                <div class="help-block">비밀번호를 작성해주세요.</div>
                                            </div>
                                            <div class="form-group text-left">
                                                <div class="custom-control custom-checkbox">
                                               		<c:if test="${param.error != null}"> 
                                                    	<span class="text-danger">아이디와 비밀번호가 잘못되었습니다.</span>
                                                	</c:if>
                                                </div>
                                            </div>
                                            <div class="row no-gutters">
                                                <div class="col-lg-6 pl-lg-1 my-2">
                                                    <button id="js-login-btn" type="submit" class="btn btn-success btn-block btn-lg">login</button>
                                                </div>
                                                 <div class="col-lg-6 pl-lg-1 my-2">
                                                    <button id="js-login-btn" type="button" class="btn btn-danger btn-block btn-lg" onclick="location.href='${pageContext.request.contextPath}/signUp'">Sign Up</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                
							
								<c:if test="${key == 1}"> 
							
                                  <div class="col-sm-12 col-md-6 col-lg-5 col-xl-4 ml-auto" style="padding-top: 20px;">
                                		 <div class="alert alert-primary">
                                    <div class="d-flex flex-start w-100">
                                        <div class="d-flex align-center mr-2 hidden-sm-down">
                                            <span class="icon-stack icon-stack-lg">
                                                <i class="base-7 icon-stack-3x color-primary-400"></i>
                                                <i class="base-7 icon-stack-2x color-primary-600 opacity-70"></i>
                                                <i class="fal fa-key icon-stack-1x text-white opacity-90"></i>
                                            </span>
                                        </div>
                                        <div class="d-flex flex-fill">
                                            <div class="flex-fill">
                                                <span class="h5">Get early access!</span>
                                                <br> 
                                                	인증 성공
                                            </div>
                                        </div>
                                    </div>
                                </div>
		                          </div>
		                          
		                        </c:if>
		                        
                            </div>
                            <div class="position-absolute pos-bottom pos-left pos-right p-3 text-center text-white">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="${pageContext.request.contextPath}/resources/js/vendors.bundle.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/app.bundle.js"></script>
        <script>
            $("#js-login-btn").click(function(event)
            {
                var form = $("#js-login")

                if (form[0].checkValidity() === false)
                {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.addClass('was-validated');
            });

            
            //영어라 몰라 그냥 감으로 치는중
            $.get("/user", function(data) {
                $("#user").html(data.userAuthentication.details.name);
                $(".unauthenticated").hide()
                $(".authenticated").show()
            });
            
            
        </script>
    </body>
</html>
