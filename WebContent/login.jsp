<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<%@ page import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main</title>
<meta charset="utf-8" />
<title>ระบบฐานข้อมูลทะเบียนครุภัณฑ์คอมพิวเตอร์ผ่านเว็บไซต์</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="bootstrap/_assets/css/bootstrap.css" />
<link rel="stylesheet" href="bootstrap/_assets/css/font-awesome.css" />
<!-- page specific plugin styles -->
<link rel="stylesheet" href="bootstrap/_assets/css/datepicker.css" />
<!-- text fonts -->
<link rel="stylesheet" href="bootstrap/_assets/css/ace-fonts.css" />
<!-- ace styles -->
<link rel="stylesheet" href="bootstrap/_assets/css/ace.css"
	class="ace-main-stylesheet" id="main-ace-style" />
<!-- ace settings handler -->

<script src="bootstrap/_assets/js/ace-extra.js"></script>
</head>

<body class="login-layout light-login">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1 class="blue">
								<i class="ace-icon fa fa-desktop green"></i> Reilway Ticket<br>
								ระบบจองตั๋วรถไฟออนไลน์<br>

							</h1>
							<h4 class="blue" id="id-company-text">&copy; Company Name</h4>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="ace-icon fa fa-lock green"></i> Please Enter Your
											Information
										</h4>

										<div class="space-6"></div>



										<c:if test="${Auth=='error' }">
											<div class="alert alert-danger">Invalid username or
												password.</div>
										</c:if>


										<form action="login" method="post">
											<input type="hidden" name="action" value="doLogin" />
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" name="username" class="form-control"
														placeholder="Username" required /> <i
														class="ace-icon fa fa-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" name="password" class="form-control"
														placeholder="Password" required /> <i
														class="ace-icon fa fa-lock"></i>
												</span>
												</label>

												<div class="space"></div>

												<div class="clearfix">
													<!--  <label class="inline"> <input type="checkbox"
														class="ace" name="remember" value="1" /> <span
														class="lbl"> Remember Me</span>
													</label>
													-->

													<button type="submit"
														class="pull-right btn btn-sm btn-primary btn-block">
														<i class="ace-icon fa fa-key"></i> <span
															class="bigger-110">Login</span>
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>

									</div>
									<!-- /.widget-main -->


									<div class="toolbar clearfix">
										<div>
											<a href="#" data-target="#forgot-box"
												class="forgot-password-link"> <i
												class="ace-icon fa fa-arrow-left"></i> I forgot my password
											</a>
										</div>

										<div>
											<a href="#" data-target="#signup-box"
												class="user-signup-link"> I want to register <i
												class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div>

								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.login-box -->


							<div id="forgot-box" class="forgot-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header red lighter bigger">
											<i class="ace-icon fa fa-key"></i> Retrieve Password
										</h4>

										<div class="space-6"></div>
										<p>Enter your email and to receive instructions</p>

										<form>
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="email" class="form-control" placeholder="Email" />
														<i class="ace-icon fa fa-envelope"></i>
												</span>
												</label>

												<div class="clearfix">
													<button type="button"
														class="width-35 pull-right btn btn-sm btn-danger">
														<i class="ace-icon fa fa-lightbulb-o"></i> <span
															class="bigger-110">Send Me!</span>
													</button>
												</div>
											</fieldset>
										</form>
									</div>
									<!-- /.widget-main -->
									<div class="toolbar center">
										<a href="#" data-target="#login-box"
											class="back-to-login-link"> Back to login <i
											class="ace-icon fa fa-arrow-right"></i>
										</a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.forgot-box -->

							<div id="signup-box" class="signup-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="ace-icon fa fa-users blue"></i> New User
											Registration
										</h4>

										<div class="space-6"></div>
										<p>Enter your details to begin:</p>

										<form action="register" method="post">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" name="idNo" class="form-control"
														placeholder="Identification Number" required="required"/> <i
														class="ace-icon fa fa-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right" >
														<input type="email" class="form-control" name="myemail"
														placeholder="Email" required="required"/> <i class="ace-icon fa fa-envelope"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" name="password" class="form-control"
														placeholder="Password" required="required"/> <i class="ace-icon fa fa-lock"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" name="cpassword" class="form-control"
														placeholder="Repeat password" required="required"/> <i
														class="ace-icon fa fa-retweet"></i>
												</span></label> <label class="block clearfix"> <span
														class="block input-icon input-icon-right"> <input
															type="text" name="fname" class="form-control"
															placeholder="First Name" required="required"/> <i
															class="ace-icon fa fa-user"></i>
													</span> </label><label class="block clearfix"> <span
															class="block input-icon input-icon-right"> <input
																type="text" name="lname" class="form-control"
																placeholder="Last Name" required="required"/> <i
																class="ace-icon fa fa-user"></i>
														</span></label> <label class="block clearfix"> <span
															class="block input-icon input-icon-right"> <input
																type="text" name="address" class="form-control"
																placeholder="Address" required="required"/> <i
																class="ace-icon fa fa-user"></i>
														</span></label><label class="block clearfix"> 

															<span class="block input-icon input-icon-right">
																	<input type="text" name="tel" class="form-control"
																	placeholder="Telphone" /> <i
																	class="ace-icon fa fa-user"></i>
															</span>
														</label> <input type="hidden" name="action" value="register">
															<!-- 
												<label class="block"> <input type="checkbox"
													class="ace" /> <span class="lbl"> I accept the <a
														href="#">User Agreement</a>
												</span>
												</label>
												-->
															<div class="space-24"></div>

															<div class="clearfix">
																<button type="reset"
																	class="width-30 pull-left btn btn-sm">
																	<i class="ace-icon fa fa-refresh"></i> <span
																		class="bigger-110">Reset</span>
																</button>
																<button type="submit" action="register"
																	class="width-65 pull-right btn btn-sm btn-success">
																	<span class="bigger-110">Register</span> <i
																		class="ace-icon fa fa-arrow-right icon-on-right"></i>
																</button>
															</div>
											</fieldset>
										</form>
									</div>

									<div class="toolbar center">
										<a href="#" data-target="#login-box"
											class="back-to-login-link"> <i
											class="ace-icon fa fa-arrow-left"></i> Back to login
										</a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.signup-box -->

						</div>
						<!-- /.position-relative -->

					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="space-16"></div>

			<center class="bigger-125">
				DATABASE MANAGEMENT SYSTEM AND DATABASE DESIGN
322238	 <br>  Khon Kaen University Mittraphap Rd.,
				Muang District, Khon Kaen 40002, THAILAND<br>
			</center>
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<!--[if !IE]> -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='bootstrap/_assets/js/jquery.js'>"
								+ "<"+"/script>");
	</script>

	<script type="text/javascript">
		if ('ontouchstart' in document.documentElement)
			document
					.write("<script src='bootstrap/_assets/js/jquery.mobile.custom.js'>"
							+ "<"+"/script>");
	</script>

	<script type="text/javascript">
		jQuery(function($) {
			$(document).on('click', '.toolbar a[data-target]', function(e) {
				e.preventDefault();
				var target = $(this).data('target');
				$('.widget-box.visible').removeClass('visible');//hide others
				$(target).addClass('visible');//show target
			});
		});

		//you don't need this, just used for changing background
		jQuery(function($) {
			$('#btn-login-dark').on('click', function(e) {
				$('body').attr('class', 'login-layout');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'blue');

				e.preventDefault();
			});
			$('#btn-login-light').on('click', function(e) {
				$('body').attr('class', 'login-layout light-login');
				$('#id-text2').attr('class', 'grey');
				$('#id-company-text').attr('class', 'blue');

				e.preventDefault();
			});
			$('#btn-login-blur').on('click', function(e) {
				$('body').attr('class', 'login-layout blur-login');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'light-blue');

				e.preventDefault();
			});

		});
	</script>
</body>
</html>