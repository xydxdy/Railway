<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8" />
<title>Railway-Ticket</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="bootstrap/_assets/css/bootstrap.css" />
<link rel="stylesheet" href="bootstrap/_assets/css/font-awesome.css" />
<!-- page specific plugin styles -->
<link rel="stylesheet" href="bootstrap/_assets/css/datepicker.css" />
<!-- text fonts -->
<link rel="stylesheet" href="bootstrap/_assets/css/ace-fonts.css" />
<link rel="stylesheet" href="bootstrap/_assets/css/jquery-ui.custom.css" />
<link rel="stylesheet" href="bootstrap/_assets/css/fullcalendar.css" />
<!-- ace styles -->
<link rel="stylesheet" href="bootstrap/_assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
<!-- ace settings handler -->

<script src="bootstrap/_assets/js/ace-extra.js"></script>
</head>

<body class="no-skin">

	<div id="navbar" class="navbar navbar-default">
		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="navbar-container container" id="navbar-container">
			<!-- #section:basics/sidebar.mobile.toggle -->
			<button type="button" class="navbar-toggle menu-toggler pull-left"
				id="menu-toggler" data-target="#sidebar">
				<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

			<!-- /section:basics/sidebar.mobile.toggle -->
			<div class="navbar-header pull-left">
				<!-- #section:basics/navbar.layout.brand -->
				<a href="main" class="navbar-brand"> <small>
						<i class="glyphicon glyphicon-road"></i>
						  Railway-Ticket
				</small>
				</a>

				<!-- /section:basics/navbar.layout.brand -->

				<!-- #section:basics/navbar.toggle -->

				<!-- /section:basics/navbar.toggle -->
			</div>

			<!-- #section:basics/navbar.dropdown -->
			
			<jsp:include page="navbarNoti.jsp"/>
			
			<!--  <div class="navbar-buttons navbar-header pull-right"
				role="navigation">
				<ul class="nav ace-nav">
					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <img class="nav-user-photo"
							src="bootstrap/_assets/avatars/avatar2.png" alt="Jason's Photo" /> <span
							class="user-info"> <small>Hello,</small> {{{
								Auth::user()->name }}}
						</span> <i class="ace-icon fa fa-caret-down"></i>
					</a>

						<ul
							class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">

							<li><a href=""> 
							<i class="ace-icon fa fa-power-off"></i> Logout
							</a></li>
						</ul></li>
				</ul>
			</div>-->
			<!-- /section:basics/navbar.dropdown -->
		</div>
		<!-- /.navbar-container -->
	</div>
	
	
			<!-- /section:basics/navbar.layout -->
		<div class="main-container container" id="main-container">
			
			<jsp:include page="sidebar.jsp"/>

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
						
              				<layout:block name="body">
              				       					 	
       					 	</layout:block>
							<!-- PAGE CONTENT ENDS -->
						</div><!-- /.col -->
					</div><!-- /.row -->
				</div><!-- /.page-content -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->
		
	<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='bootstrap/_assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='/_assets/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='bootstrap/_assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="bootstrap/_assets/js/bootstrap.js"></script>

		<!-- page specific plugin scripts -->
		<script src="bootstrap/_assets/js/date-time/bootstrap-datepicker.js"></script>

		<!-- ace scripts -->
		<script src="bootstrap/_assets/js/ace/elements.scroller.js"></script>
		<script src="bootstrap/_assets/js/ace/elements.colorpicker.js"></script>
		<script src="bootstrap/_assets/js/ace/elements.fileinput.js"></script>
		<script src="bootstrap/_assets/js/ace/elements.typeahead.js"></script>
		<script src="bootstrap/_assets/js/ace/elements.wysiwyg.js"></script>
		<script src="bootstrap/_assets/js/ace/elements.spinner.js"></script>
		<script src="bootstrap/_assets/js/ace/elements.treeview.js"></script>
		<script src="bootstrap/_assets/js/ace/elements.wizard.js"></script>
		<script src="bootstrap/_assets/js/ace/elements.aside.js"></script>
		<script src="bootstrap/_assets/js/ace/ace.js"></script>
		<script src="bootstrap/_assets/js/ace/ace.ajax-content.js"></script>
		<script src="bootstrap/_assets/js/ace/ace.touch-drag.js"></script>
		<script src="bootstrap/_assets/js/ace/ace.sidebar.js"></script>
		<script src="bootstrap/_assets/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="bootstrap/_assets/js/ace/ace.submenu-hover.js"></script>
		<script src="bootstrap/_assets/js/ace/ace.widget-box.js"></script>
		<script src="bootstrap/_assets/js/ace/ace.settings.js"></script>
		<script src="bootstrap/_assets/js/ace/ace.settings-rtl.js"></script>
		<script src="bootstrap/_assets/js/ace/ace.settings-skin.js"></script>
		<script src="bootstrap/_assets/js/ace/ace.widget-on-reload.js"></script>
		<script src="bootstrap/_assets/js/ace/ace.searchbox-autocomplete.js"></script>

		<!-- inline scripts related to this page -->

		<!-- the following scripts are used in demo only for onpage help and you don't need them -->
		<!--
		<link rel="stylesheet" href="/_assets/css/ace.onpage-help.css" />
		<link rel="stylesheet" href="../docs/_assets/js/themes/sunburst.css" />

		<script type="text/javascript"> ace.vars['base'] = '..'; </script>
		<script src="/_assets/js/ace/elements.onpage-help.js"></script>
		<script src="/_assets/js/ace/ace.onpage-help.js"></script>
		<script src="../docs/_assets/js/rainbow.js"></script>
		<script src="../docs/_assets/js/language/generic.js"></script>
		<script src="../docs/_assets/js/language/html.js"></script>
		<script src="../docs/_assets/js/language/css.js"></script>
		<script src="../docs/_assets/js/language/javascript.js"></script>
		-->

		<script src="bootstrap/js/main.js"></script>
		
				<!-- inline scripts related to this page -->
		
	
</body>
</html>