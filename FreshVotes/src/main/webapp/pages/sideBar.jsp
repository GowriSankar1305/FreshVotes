<div class="page-sidebar">
            <div class="logo">
               <a class="logo-img" href="index.html">		
               <img class="desktop-logo" src="${pageContext.request.contextPath }/static/images/logo.png" alt="">
               <img class="small-logo" src="${pageContext.request.contextPath }/static/images/small-logo.png" alt="">
               </a>			
               <a id="sidebar-toggle-button-close"><i class="wd-20" data-feather="x"></i> </a>
            </div>
            <!-- Sidebar Menu Start -->
            <div class="page-sidebar-inner">
               <div class="page-sidebar-menu">
                  <ul class="accordion-menu">
                     <li class="mg-l-20-force mg-t-25-force menu-navigation">Navigation</li>
                     <li>
                        <a href="#"><i data-feather="home"></i>
                        <span>Dashboard</span><i class="accordion-icon fa fa-angle-left"></i></a>
                        <ul class="sub-menu">
                           <li><a href="${pageContext.request.contextPath }/user/create-product">CreateProduct</a></li>
                           <li><a href="#">Analytics</a></li>
                           <li><a href="#">Cryptocurrency</a></li>
                           <li><a href="#">Helpdesk</a></li>
                           <li><a href="#">Project</a></li>
                        </ul>
                     </li>
                  </ul>
               </div>
            </div>
            <!--/ Sidebar Menu End -->
 
            <!-- Sidebar Footer Start -->
            <div class="sidebar-footer">									
               <a class="pull-left" href="#" data-toggle="tooltip" data-placement="top" data-original-title="Profile">
               <i data-feather="user" class="wd-16"></i></a>									
               <a class="pull-left " href="#" data-toggle="tooltip" data-placement="top" data-original-title="Mailbox">
               <i data-feather="mail" class="wd-16"></i></a>
               <a class="pull-left" href="#" data-toggle="tooltip" data-placement="top" data-original-title="Lockscreen">
               <i data-feather="lock" class="wd-16"></i></a>
               <a class="pull-left" href="javascript:document.getElementById('logOutFrm').submit();" data-toggle="tooltip" data-placement="top" data-original-title="Sing Out">
               <i data-feather="log-out" class="wd-16"></i></a>
               <form action="logout" method="POST" id="logOutFrm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			   </form>
            </div>
            <!--/ Sidebar Footer End -->
         </div>