<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	  <meta charset="ISO-8859-1">
      <meta charset="utf-8">
      <meta http-equiv="x-ua-compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="keyword" content="">
      <meta name="author"  content=""/>
      <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css"/>
      <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css"/>
      <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/font-awesome.min.css"/>
      <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/themify.css"/>
      <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/flag-icon.min.css"/>
      <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/app.min.css"/>
      <link rel="icon" href="${pageContext.request.contextPath }/static/images/favicon.ico" type="image/x-icon">
	  <title>Sign in</title>
</head>
<body>
<div class="ht-100v text-center">
         <div class="row pd-0 mg-0">
            <div class="col-lg-6 bg-gradient hidden-sm">
               <div class="ht-100v d-flex">
                  <div class="align-self-center">
                     <img src="${pageContext.request.contextPath }/static/images/logo-sm.png" class="img-fluid" alt="">
                     <h3 class="tx-20 tx-semibold tx-gray-100 pd-t-50">JOIN OUR GREAT COMMUNITY</h3>
                     <p class="pd-y-15 pd-x-10 pd-md-x-100 tx-gray-200">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
                     <a href="aut-signup.html" class="btn btn-outline-primary"><span class="tx-gray-200">Get An Account</span></a>
                  </div>
               </div>
            </div>
            <div class="col-lg-6 bg-light">
               <div class="ht-100v d-flex align-items-center justify-content-center">
                  <div class="">
                  	 <h3 class="tx-dark mg-b-5 tx-left">Sign In</h3>
                     <p class="tx-gray-500 tx-15 mg-b-40">Welcome back! Please signin to continue.</p>
                     <form action="login" method="POST" id="frm">
                     <div class="form-group tx-left">
                        <label class="tx-gray-500 mg-b-5">UserName</label>
                        <input type="text" class="form-control" placeholder="Enter your username" name="username">
                     </div>
                     <div class="form-group">
                        <div class="d-flex justify-content-between mg-b-5">
                           <label class="tx-gray-500 mg-b-0">Password</label>
                           <a href="#" class="tx-13 mg-b-0 tx-semibold">Forgot password?</a>
                        </div>
                        <input type="password" class="form-control" placeholder="Enter your password" name="password">
                     </div>
                     <button type="submit" class="btn btn-brand btn-block">Sign in</button>
                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                  	</form>
                     <div class="tx-13 mg-t-20 tx-center tx-gray-500">Don't have an account? <a href="register" class="tx-dark tx-semibold">Create an Account</a></div>
                    <c:if test="${logout ne null}">
                     <div class="tx-13 mg-t-20 tx-center tx-semibold" style="color:green;">${logout }</div>	
                     </c:if>
                     <c:if test="${error ne null}">
                     <div class="tx-13 mg-t-20 tx-center tx-semibold" style="color:red;">${error }</div>	
                     </c:if>
                     <c:if test="${timeout ne null}">
                     <div class="tx-13 mg-t-20 tx-center tx-semibold" style="color:red;">${timeout }</div>	
                     </c:if>
                     <c:if test="${invalid ne null}">
                     <div class="tx-13 mg-t-20 tx-center tx-semibold" style="color:red;">${invalid }</div>	
                     </c:if>
                     <c:if test="${signup ne null}">
                     <div class="tx-13 mg-t-20 tx-center tx-semibold" style="color:green;">${signup }</div>	
                     </c:if>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <script src="${pageContext.request.contextPath }/static/js/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath }/static/js/jquery.slimscroll.min.js"></script>	  
      <script src="${pageContext.request.contextPath }/static/js/app.js"></script>
</body>
</html>