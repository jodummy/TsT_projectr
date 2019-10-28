<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                            <span class="text-white opacity-50 ml-auto mr-2 hidden-sm-down">
                                Already a member?
                            </span>
                            <a href="/login" class="btn-link text-white ml-auto ml-sm-0">
                                Secure Login
                            </a>
                        </div>
                    </div>
                    <div class="flex-1"  background-size: cover;">
                        <div class="container py-4 py-lg-5 my-lg-5 px-4 px-sm-0">
                            <div class="row">
                                <div class="col-xl-12">
                                    <h2 class="fs-xxl fw-500 mt-4 text-white text-center">
                                        Register now, Team Sport Tournament free!
<!--                                         <small class="h3 fw-300 mt-3 mb-5 text-white opacity-60 hidden-sm-down"> -->
<!--                                             Your registration is free for a limited time. Enjoy SmartAdmin on your mobile, desktop or tablet. -->
<!--                                             <br>It is ready to go wherever you go! -->
<!--                                         </small> -->
                                    </h2>
                                </div>
                                <div class="col-xl-6 ml-auto mr-auto">
                                    <div class="card p-4 rounded-plus bg-faded">
                                        <div class="alert alert-primary text-dark" role="alert">
                                            <strong>안녕하세요 :)</strong> 저희는 이메일 인증을 통해 사용자 인증을 하고 있습니다. 이메일은 지연시간이 생길 수 있어 10분정도 기다려주시면 감사드리겠습니다.
                                        </div>
                                        
                                        <form id="js-login" action="/Login" method="post">
                                        
                                            <div class="form-group row">
                                                <label class="col-xl-12 form-label" for="fname">ID</label>
                                                <div class="col-8 pr-1">
                                                    <input type="text" id="tst_user_id" name="tst_user_id" class="form-control" placeholder="User Id 5~10자리로 작성해 주세요." required>
                                                    <div class="invalid-feedback">ID를 작성해 주세요.</div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <label class="col-xl-12 form-label" for="fname">NickName</label>
                                                <div class="col-8 pr-1">
                                                    <input type="text" id="" class="form-control" id="tst_user_nickname" name="tst_user_nickname" placeholder="User NickName 4~8자리로 작성해 주세요. " required>
                                                    <div class="invalid-feedback">닉네임을 작성해 주세요.</div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <label class="col-xl-12 form-label" for="fname">Email</label>
                                                <div class="col-8 pr-1">
                                                    <input type="email" id="" class="form-control" id="tst_user_email" email="tst_user_email" placeholder="aaaa@aaaa.aaa " required>
                                                    <div class="invalid-feedback">이메일을 작성해 주세요.</div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <label class="col-xl-12 form-label" for="fname">Password</label>
                                                <div class="col-8 pr-1">
                                                    <input type="Password" id="" class="form-control" placeholder="User Password 8자리이상 작성해 주세요. " required>
                                                    <div class="invalid-feedback"></div>
                                                </div>
                                            </div>
                                            
                                             <div class="form-group row">
                                                <label class="col-xl-12 form-label" for="fname">PasswordConfirm</label>
                                                <div class="col-8 pr-1">
                                                    <input type="Password" id="" class="form-control" id="tst_user_pw" name="tst_user_pw" placeholder="User Password 8자리이상 작성해 주세요. " required>
                                                    <div class="invalid-feedback">비밀번호를 작성해 주세요.</div>
                                                </div>
                                            </div>


 											<div class="form-group row" style="margin-bottom: 1px">
                                            	<label class="col-xl-12 form-label" for="fname">Gender</label>
                                            </div>
                                            
                                            	<div class="custom-control custom-radio mb-2">
                                                    <input type="radio" class="custom-control-input" id="customControlValidation2" name="radio-stacked" required="" value="M">
                                                    <label class="custom-control-label" for="customControlValidation2">남성</label>
                                                </div>
                                                
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" id="customControlValidation3" name="radio-stacked" required="" value="F">
                                                    <label class="custom-control-label" for="customControlValidation3">여성</label>
                                                    <div class="invalid-feedback">성별을 체크해 주세요.</div>
                                                </div>
                                                
												<div class="form-group row" style="margin-top: 1.5rem;">
                                                	<label class="col-xl-12 form-label" for="fname">Age</label>
                                                	<div class="col-8 pr-1">
                                                    	<input type="text" id="tst_user_id" name="tst_user_id" class="form-control" placeholder="나이를 작성해 주세요" required>
                                                    	<div class="invalid-feedback">Age를 작성해 주세요.</div>
                                                	</div>
                                            	</div>                                            
                                            
                                            <div class="row no-gutters">
                                                <div class="col-lg-6 pl-lg-1 my-2">
                                                    <button id="js-login-btn" type="submit" class="btn btn-block btn-danger btn-lg mt-3" onclick="test()">Sign Up</button>
                                                </div>
                                            </div>
                                            
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="position-absolute pos-bottom pos-left pos-right p-3 text-center text-white">
                            2019 © SmartAdmin by&nbsp;<a href='https://www.gotbootstrap.com' class='text-white opacity-40 fw-500' title='gotbootstrap.com' target='_blank'>gotbootstrap.com</a>
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

        </script>
    </body>
    
      <script>
      function test(){
    	  alert($('#radio-stacked').val());
      }
    </script>
</html>
