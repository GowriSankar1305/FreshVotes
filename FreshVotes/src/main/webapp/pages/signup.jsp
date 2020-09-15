<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keyword" content="">
<meta name="author" content="" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/themify.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/flag-icon.min.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/app.min.css" />
<link rel="icon" href="${pageContext.request.contextPath }/static/images/favicon.ico" type="image/x-icon">
<title>Sign up</title>
</head>
<body>
<sec:csrfMetaTags/>
<div class="ht-100v text-center">
         <div class="row pd-0 mg-0">
            <div class="col-lg-6 bg-gradient hidden-sm">
               <div class="ht-100v d-flex">
                  <div class="align-self-center">
                     <img src="assets/images/logo-sm.png" class="img-fluid" alt="">
                     <h3 class="tx-20 tx-semibold tx-gray-100 pd-t-50">JOIN OUR GREAT COMMUNITY</h3>
                     <p class="pd-y-15 pd-x-10 pd-md-x-100 tx-gray-200">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
                     <a href="#" class="btn btn-outline-primary"><span class="tx-gray-200">Sign In</span></a>
                  </div>
               </div>
            </div>
            <div class="col-lg-6 bg-light">
               <div class="ht-100v d-flex align-items-center justify-content-center">
                  <div class="">
                  <form action="register" method="POST" id="signUpFrm">
                     <h3 class="tx-dark mg-b-5 tx-left">Create New Account</h3>
                     <div class="form-group tx-left">
                        <label class="tx-gray-500 mg-b-5">Email address</label>
                        <input type="email" class="form-control" placeholder="yourname@yourmail.com" required="required" 
                        name="emailAddress" data-parsley-trigger="focusout" id="emailAddress"
                        data-parsley-checkemail data-parsley-checkemail-message="Email Address already Exists">
                     </div>
                     <div class="form-group tx-left">
                        <div class="d-flex justify-content-between mg-b-5">
                           <label class="tx-gray-500 mg-b-0">Full Name</label>
                        </div>
                        <input type="text" class="form-control" placeholder="First Name" 
                        required="required" name="name" id="name" data-parsley-pattern="^[A-Za-z ]{3,50}$">
                     </div>
                     <div class="form-group tx-left">
                        <div class="d-flex justify-content-between mg-b-5">
                           <label class="tx-gray-500 mg-b-0">User Name</label>
                        </div>
                        <input type="text" class="form-control" placeholder="Enter UserName" required="required" 
                        name="userName" data-parsley-trigger="focusout" id="userName" data-parsley-length="[4,25]" data-parsley-pattern="^[A-Za-z0-9]+$"
                        data-parsley-checkuname data-parsley-checkuname-message="UserName already Exists. Try Another">
                     </div>
                     <div class="form-group tx-left">
                        <div class="d-flex justify-content-between mg-b-5">
                           <label class="tx-gray-500 mg-b-0">Password</label>
                        </div>
                        <input type="password" class="form-control" placeholder="Enter your password" 
                        required="required" name="password" id="password" data-parsley-length="[4,25]">
                     </div>
                     <div class="form-group tx-left">
                        <div class="d-flex justify-content-between mg-b-5">
                           <label class="tx-gray-500 mg-b-0">ConfirmPassword</label>
                        </div>
                        <input type="password" class="form-control" placeholder="Re-enter password"
                         required="required" name="confirmPassword" data-parsley-equalto="#password" id="confirmPassword">
                     </div>
                     <button type="submit" class="btn btn-brand btn-block">Register</button>
                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                     </form>
                     <div class="tx-13 mg-t-20 tx-center tx-gray-500">Already have an account? <a href="login" class="tx-semibold">Sign In</a></div>
                     <c:if test="${signUpError ne null}">
                     <div class="tx-13 mg-t-20 tx-center tx-semibold" style="color:red;">${signUpError }</div>
                     </c:if>
                  </div>
               </div>
            </div>
         </div>
      </div>

<script src="${pageContext.request.contextPath }/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/static/js/parsley.js"></script>
<script src="${pageContext.request.contextPath }/static/js/jquery.slimscroll.min.js"></script>	  
</body>
<script type="text/javascript">
$(function(){
	'use strict';
	$('#signUpFrm').parsley();
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	window.ParsleyValidator.addValidator('checkemail',{
		validateString: function(value)	{
			return $.ajax({
				url: 'validateEmail',
				method: 'POST',
				data: {email:value},
				beforeSend: function(xhr)	{
					xhr.setRequestHeader(header, token);
				},
				success: function(data)	{
					return false;
				}
			});
		}
	});
	window.ParsleyValidator.addValidator('checkuname',{
		validateString: function(value)	{
			return $.ajax({
				url: 'validateUname',
				method: 'POST',
				data: {uname:value},
				beforeSend: function(xhr)	{
					xhr.setRequestHeader(header, token);
				},
				success: function(data)	{
					return data;
				}
			});
		}
	});
});
</script>
</html>