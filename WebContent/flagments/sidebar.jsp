<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.*" %>

<div id="sidebar" class="sidebar responsive">
	<script type="text/javascript">
		try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
	</script>

	<div class="sidebar-shortcuts" id="sidebar-shortcuts">
		<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
			<a href="{{ route('assets.index') }}" class="btn btn-success">
				<i class="ace-icon fa fa-bars"></i>
			</a>

			<a href="{{ route('asset-types.index') }}" class="btn btn-info">
				<i class="ace-icon fa fa-folder-o"></i>
			</a>

			<a href="{{ route('locations.index') }}" class="btn btn-warning">
				<i class="ace-icon fa fa-map-marker"></i>
			</a>

			<a href="{{ route('reports.index') }}" class="btn btn-danger">
				<i class="ace-icon fa fa-file-o"></i>
			</a>

		</div>

		<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
			<span class="btn btn-success"></span>

			<span class="btn btn-info"></span>

			<span class="btn btn-warning"></span>

			<span class="btn btn-danger"></span>
		</div>
	</div><!-- /.sidebar-shortcuts -->

	<ul class="nav nav-list">
		<li class="{{ Route::is('dashboard.*') ? 'active' : '' }}">
			<a href="#"><i class="menu-icon fa fa-tachometer"></i> <span class="menu-text"> ภาพรวม </span></a>
			<b class="arrow"></b>
		</li>

		<li class="{{ Route::is('assets.*') ? 'active' : '' }}">
			<a href="{{ route('assets.index') }}"><i class="menu-icon fa fa-bars"></i> <span class="menu-text"> Assets </span></a>
			<b class="arrow"></b>
		</li>

		<li class="{{ Route::is('asset-types.*') ? 'active' : '' }}">
			<a href="{{ route('asset-types.index') }}"><i class="menu-icon fa fa-folder-o"></i> <span class="menu-text"> Asset Types </span></a>
			<b class="arrow"></b>
		</li>

		<li class="{{ Route::is('locations.*') ? 'active' : '' }}">
			<a href="{{ route('locations.index') }}"><i class="menu-icon fa fa-map-marker"></i> <span class="menu-text"> Locations </span></a>
			<b class="arrow"></b>
		</li>

		<li class="{{ Route::is('reports.*') ? 'active' : '' }}">
			<a href="{{ route('reports.index') }}"><i class="menu-icon fa fa-file-o"></i> <span class="menu-text"> Report </span></a>
			<b class="arrow"></b>
		</li>

		<li class="{{ Route::is('users.*') ? 'active' : '' }}">
			<a href="{{ route('users.index') }}"><i class="menu-icon fa fa-users"></i> <span class="menu-text"> Users </span></a>
			<b class="arrow"></b>
		</li>
	</ul><!-- /.nav-list -->

	<!-- #section:basics/sidebar.layout.minimize -->
	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>

	<!-- /section:basics/sidebar.layout.minimize -->
	<script type="text/javascript">
		try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
	</script>
</div>