<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>

<div class="navbar-buttons navbar-header pull-right" role="navigation">
	<ul class="nav ace-nav">
	<c:if test="${sessionScoope.name!=null}">
		<li class="grey"><a data-toggle="dropdown"
			class="dropdown-toggle" href="#"> <i class="ace-icon fa fa-tasks"></i>
				<span class="badge badge-grey">4</span>
		</a>

			<ul
				class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
			
				<li class="dropdown-header"><i class="ace-icon fa fa-check"></i>
					4 Tasks to complete</li>

				<li class="dropdown-content">
					<ul class="dropdown-menu dropdown-navbar">
						<li><a href="#">
								<div class="clearfix">
									<span class="pull-left">Software Update</span> <span
										class="pull-right">65%</span>
								</div>

								<div class="progress progress-mini">
									<div style="width: 65%" class="progress-bar"></div>
								</div>
						</a></li>

						<li><a href="#">
								<div class="clearfix">
									<span class="pull-left">Hardware Upgrade</span> <span
										class="pull-right">35%</span>
								</div>

								<div class="progress progress-mini">
									<div style="width: 35%"
										class="progress-bar progress-bar-danger"></div>
								</div>
						</a></li>

						<li><a href="#">
								<div class="clearfix">
									<span class="pull-left">Unit Testing</span> <span
										class="pull-right">15%</span>
								</div>

								<div class="progress progress-mini">
									<div style="width: 15%"
										class="progress-bar progress-bar-warning"></div>
								</div>
						</a></li>

						<li><a href="#">
								<div class="clearfix">
									<span class="pull-left">Bug Fixes</span> <span
										class="pull-right">90%</span>
								</div>

								<div class="progress progress-mini progress-striped active">
									<div style="width: 90%"
										class="progress-bar progress-bar-success"></div>
								</div>
						</a></li>
					</ul>
				</li>

				<li class="dropdown-footer"><a href="#"> See tasks with
						details <i class="ace-icon fa fa-arrow-right"></i>
				</a></li>
			</ul></li>

		<li class="purple"><a data-toggle="dropdown"
			class="dropdown-toggle" href="#"> <i
				class="ace-icon fa fa-bell icon-animated-bell"></i> <span
				class="badge badge-important">8</span>
		</a>

			<ul
				class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
				<li class="dropdown-header"><i
					class="ace-icon fa fa-exclamation-triangle"></i> 8 Notifications</li>

				<li class="dropdown-content">
					<ul class="dropdown-menu dropdown-navbar navbar-pink">
						<li><a href="#">
								<div class="clearfix">
									<span class="pull-left"> <i
										class="btn btn-xs no-hover btn-pink fa fa-comment"></i> New
										Comments
									</span> <span class="pull-right badge badge-info">+12</span>
								</div>
						</a></li>

						<li><a href="#"> <i
								class="btn btn-xs btn-primary fa fa-user"></i> Bob just signed
								up as an editor ...
						</a></li>

						<li><a href="#">
								<div class="clearfix">
									<span class="pull-left"> <i
										class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>
										New Orders
									</span> <span class="pull-right badge badge-success">+8</span>
								</div>
						</a></li>

						<li><a href="#">
								<div class="clearfix">
									<span class="pull-left"> <i
										class="btn btn-xs no-hover btn-info fa fa-twitter"></i>
										Followers
									</span> <span class="pull-right badge badge-info">+11</span>
								</div>
						</a></li>
					</ul>
				</li>

				<li class="dropdown-footer"><a href="#"> See all
						notifications <i class="ace-icon fa fa-arrow-right"></i>
				</a></li>
			</ul></li>
			</c:if>
			
		<c:if test="${sessionScope.name==null }">
		<li class="light-orange"><a class="dropdown-toggle" href="login"> <i
				class="ace-icon fa fa-unlock icon-animated-bell"></i> <span>Sign-IN or Sign-UP</span>
		</a></li>
		</c:if>
		<c:if test="${sessionScope.name!=null }">
		<li class="light-orange"><a class="dropdown-toggle" href="logout?action=logout"> <i
				class="ace-icon fa fa-unlock icon-animated-bell"></i> <span>logout</span>
		</a></li>
		</c:if>
		
		<!-- #section:basics/navbar.user_menu -->
		<!-- /section:basics/navbar.user_menu -->
	</ul>
</div>