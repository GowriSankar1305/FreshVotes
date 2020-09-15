<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keyword" content="">
<meta name="author"  content=""/>
<title>User's Dashboard</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/prism-vs.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css"/>
<link rel="icon" href="${pageContext.request.contextPath }/static/images/favicon.ico" type="image/x-icon">
</head>
<body>
<div class="page-container">
<%@include file="sideBar.jsp" %>
	<div class="page-content">
	<%@ include file="header.jsp" %>
		<div class="page-inner">
			<div class="wrapper">
				<div class="mg-y-30">
					<h4>Create a Product</h4>
					<div class="col-md-12 col-lg-12">
                        <div class="card mg-b-30">
                           <div class="card-header">
                              <div class="d-flex justify-content-between align-items-center">
                                 <div>
                                    <h6 class="card-header-title tx-13 mb-0">Product Creation Form</h6>
                                 </div>
                                 <div class="text-right">
                                    <div class="d-flex">
                                       <a href="#" class="mr-3"><i class="ti-reload"></i></a>
                                       <div class="dropdown" data-toggle="dropdown">
                                          <a href="#"><i class="ti-more-alt"></i></a>
                                          <div class="dropdown-menu dropdown-menu-right">
											  <a href="#" class="dropdown-item"><i data-feather="info" class="wd-16 mr-2"></i>View Details</a>
											  <a href="#" class="dropdown-item"><i data-feather="share" class="wd-16 mr-2"></i>Share</a>
											  <a href="#" class="dropdown-item"><i data-feather="download" class="wd-16 mr-2"></i>Download</a>
											  <a href="#" class="dropdown-item"><i data-feather="copy" class="wd-16 mr-2"></i>Copy to</a>
											  <a href="#" class="dropdown-item"><i data-feather="folder" class="wd-16 mr-2"></i>Move to</a>
											  <a href="#" class="dropdown-item"><i data-feather="edit" class="wd-16 mr-2"></i>Rename</a>
											  <a href="#" class="dropdown-item"><i data-feather="trash" class="wd-16 mr-2"></i>Delete</a>
										  </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <form action="${pageContext.request.contextPath }/user/save-product" method="POST" id="productFrm">
                           <div class="card-body">
                              <div class="row">
                                 <div class="col-lg">
                                    <input class="form-control form-control-sm" placeholder="Product Name" 
                                    name="productName" type="text" required="required" data-parsley-pattern="^[A-Za-z0-9 ]{4,25}$">
                                 </div>
                                 <div class="col-lg mg-t-10 mg-lg-t-0">
                                    <button class="btn btn-primary" type="submit" id="submitBtn">Submit form</button>
                                 </div>
                              </div>
                           </div>
                           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                           </form>
                           
                        </div>
                     </div>
                     
                     <!-- Listing of products -->
                     <div class="col-md-12 col-lg-12">
                        <div class="card mg-b-30">
                           <div class="card-header">
                              <div class="d-flex justify-content-between align-items-center">
                                 <div>
                                    <h6 class="card-header-title tx-13 mb-0">Products List</h6>
                                 </div>
                                 <div class="text-right">
                                    <div class="d-flex">
                                       <a href="#" class="mr-3"><i class="ti-reload"></i></a>
                                       <div class="dropdown" data-toggle="dropdown">
                                          <a href="#"><i class="ti-more-alt"></i></a>
                                          <div class="dropdown-menu dropdown-menu-right">
											  <a href="#" class="dropdown-item"><i data-feather="info" class="wd-16 mr-2"></i>View Details</a>
											  <a href="#" class="dropdown-item"><i data-feather="share" class="wd-16 mr-2"></i>Share</a>
											  <a href="#" class="dropdown-item"><i data-feather="download" class="wd-16 mr-2"></i>Download</a>
											  <a href="#" class="dropdown-item"><i data-feather="copy" class="wd-16 mr-2"></i>Copy to</a>
											  <a href="#" class="dropdown-item"><i data-feather="folder" class="wd-16 mr-2"></i>Move to</a>
											  <a href="#" class="dropdown-item"><i data-feather="edit" class="wd-16 mr-2"></i>Rename</a>
											  <a href="#" class="dropdown-item"><i data-feather="trash" class="wd-16 mr-2"></i>Delete</a>
										  </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="card-body pd-0">
                              <table class="table">
                                 <thead>
                                    <tr>
                                       <th>S.no</th>
                                       <th>ProductId</th>
                                       <th>ProductName</th>
                                       <th>PublishedStatus</th>
                                       <th>User</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <c:choose>
                                    <c:when test="${products ne null}">
                                    <c:forEach items="${products }" var="prod" varStatus="index">
                                    <tr>
                                       <th scope="row">${index.count }</th>
                                       <td>${prod.id }</td>
                                       <td>${prod.productName }</td>
                                       <td>${prod.isPublished }</td>
                                       <td>${prod.user.name }</td>
                                    </tr>
                                    </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                    <tr>
                                    	<td colspan="4" align="center">No Data found</td>
                                    </tr>
                                    </c:otherwise>
                                    </c:choose>
                                 </tbody>
                              </table>
                           </div>
                        </div>
                     </div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath }/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/static/js/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath }/static/js/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath }/static/js/popper.js"></script>
<script src="${pageContext.request.contextPath }/static/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath }/static/js/feather.min.js"></script>
<script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/static/js/pace.min.js"></script>
<script src="${pageContext.request.contextPath }/static/js/highlight.min.js"></script>
<script src="${pageContext.request.contextPath }/static/js/prism.js"></script>
<script src="${pageContext.request.contextPath }/static/js/app.js"></script>
<script src="${pageContext.request.contextPath }/static/js/avesta.js"></script>
<script src="${pageContext.request.contextPath }/static/js/parsley.js"></script>
<script type="text/javascript">
$(function(){
	$('#productFrm').parsley().on('form:submit',function(instance){
		$('#submitBtn').attr('disabled',true);
		$('#submitBtn').html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>Loading...')
		return true;
	});
})
</script>
</body>
</html>