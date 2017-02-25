<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.*"%>

<div id="sidebar" class="sidebar responsive">
	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'fixed')
		} catch (e) {
		}
	</script>

	<div class="sidebar-shortcuts" id="sidebar-shortcuts">
		<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
			<a href="main" class="btn btn-success"> <i
				class="ace-icon fa fa-bars"></i>
			</a> <a href="overall" class="btn btn-info"> <i
				class="ace-icon fa fa-tachometer"></i>
			</a> <a href="calender" class="btn btn-warning"> <i
				class="ace-icon fa fa-map-marker"></i>
			</a> <a href="main" class="btn btn-danger"> <i
				class="ace-icon fa fa-file-o"></i>
			</a>

		</div>

		<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
			<span class="btn btn-success"></span> <span class="btn btn-info"></span>

			<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
		</div>
	</div>
	<!-- /.sidebar-shortcuts -->

	<ul class="nav nav-list">


		<li class="<c:if test="${Auth=='list'}">active</c:if>"><a
			href="main"><i class="menu-icon fa fa-bars"></i> <span
				class="menu-text"> Railway list </span></a> <b class="arrow"></b></li>

		<!-- <li class="<c:if test="${Auth=='overall'}">active</c:if>">
			<a href="overall"><i class="menu-icon fa fa-tachometer"></i> <span class="menu-text"> Overall view </span></a>
			<b class="arrow"></b>
		</li>-->

		<!--<li class="{{ Route::is('asset-types.*') ? 'active' : '' }}">
			<a href="{{ route('asset-types.index') }}"><i class="menu-icon fa fa-folder-o"></i> <span class="menu-text"> Asset Types </span></a>
			<b class="arrow"></b>
		</li>-->

		<li class="<c:if test="${Auth=='calender' }">active</c:if>"><a
			href="calender"><i class="menu-icon fa fa-map-marker"></i> <span
				class="menu-text"> Calender </span></a> <b class="arrow"></b></li>

		<li class="<c:if test="${Auth=='booking' }">active</c:if>"><a
			href="main"><i class="menu-icon fa fa-file-o"></i> <span
				class="menu-text"> Booking </span></a> <b class="arrow"></b></li>

		<li class="<c:if test="${Au=='user' }">active</c:if>"><c:if
				test="${sessionScope.name==null }">
				<a href="login">
			</c:if> <c:if test="${sessionScope.name!=null }">
				<a href="profile?action=profile">
			</c:if> <i class="menu-icon fa fa-users"></i> <span class="menu-text">
				Users </span></a> <b class="arrow"></b></li>


	</ul>
	<!-- /.nav-list -->

	<!-- #section:basics/sidebar.layout.minimize -->
	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i class="ace-icon fa fa-angle-double-left"
			data-icon1="ace-icon fa fa-angle-double-left"
			data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>
	
	<c:if test="${type=='admin' }">
	<ul class="nav nav-list">
		<li class=""><a
			href="main?action=send"><i class="menu-icon fa fa-credit-card"></i> <span
				class="menu-text"> Buy @Station </span></a> <b class="arrow"></b></li>
	
		<li class=""><a
			href="insertCar"><i class="menu-icon fa fa-credit-card"></i> <span
				class="menu-text"> Insert Car </span></a> <b class="arrow"></b></li>

		<li class=""><a
			href="insertRailway"><i class="menu-icon fa fa-credit-card"></i> <span
				class="menu-text"> Insert Railway </span></a> <b class="arrow"></b></li>

		<li class=""><a
			href="stationlist"><i class="menu-icon fa fa-credit-card"></i> <span
				class="menu-text"> Insert Station </span></a> <b class="arrow"></b></li>
		
		<li class=""><a
			href="pay"><i class="menu-icon fa fa-credit-card"></i> <span
				class="menu-text"> Pay </span></a> <b class="arrow"></b></li>
	
	</ul>
	</c:if>
	<!-- /section:basics/sidebar.layout.minimize -->
	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'collapsed')
		} catch (e) {
		}
	</script>
</div>