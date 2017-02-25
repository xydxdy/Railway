<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<%@ page import="model.*"%>

<layout:extends name="main.jsp">
	<layout:put block="body">

		<!-- /section:settings.box -->
		<div class="page-header">
			<h1>
				User Profile Page <small> <i
					class="ace-icon fa fa-angle-double-right"></i> you can view and
					edit profile in this page.
				</small>
			</h1>
		</div>
		<!-- /.page-header -->

		<div class="row">
			<div class="col-xs-12">

				<div id="user-profile-2" class="user-profile">
					<div class="tabbable">
						<ul class="nav nav-tabs padding-18">
							<li class="active"><a data-toggle="tab" href="#home"> <i
									class="green ace-icon fa fa-user bigger-120"></i> Profile
							</a></li>

							<li><a data-toggle="tab" href="#friends"> <i
									class="blue ace-icon fa fa-users bigger-120"></i> Edit Profile
							</a></li>

							<li><a data-toggle="tab" href="#feed"> <i
									class="orange ace-icon fa fa-rss bigger-120"></i> Ticket
							</a></li>

						</ul>

						<div class="tab-content no-border padding-24">
							<div id="home" class="tab-pane in active">
								<div class="row">
									<div class="col-xs-12 col-sm-3 center">
										<span class="profile-picture"> <img
											class="editable img-responsive" alt="Alex's Avatar"
											id="avatar2" src="bootstrap/avatars/profile-pic.jpg" />
										</span>

										<div class="space space-4"></div>

										<button class="btn btn-sm btn-block btn-success">
											<i class="ace-icon fa fa-plus-circle bigger-120"></i> <span
												class="bigger-110">${profile.fname}</span>
										</button>

										<a href="mailto://${profile.email }"
											class="btn btn-sm btn-block btn-primary"> <i
											class="ace-icon fa fa-envelope-o bigger-110"></i> <span
											class="bigger-110">Send a message</span>
										</a>
									</div>
									<!-- /.col -->

									<div class="col-xs-12 col-sm-9">
										<h4 class="blue">
											<span class="middle">${profile.fname } ${profile.lname }</span>

											<span class="label label-purple arrowed-in-right"> <i
												class="ace-icon fa fa-circle smaller-80 align-middle"></i>
												${sessionScope.type }
											</span>
										</h4>

										<div class="profile-user-info">
											<div class="profile-info-row">
												<div class="profile-info-name">Username</div>

												<div class="profile-info-value">
													<span>${profile.fname }</span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">Location</div>

												<div class="profile-info-value">
													<i class="fa fa-map-marker light-orange bigger-110"></i> <span>${profile.address }</span>
													<span></span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">E-mail</div>

												<div class="profile-info-value">
													<span>${profile.email }</span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">Joined</div>

												<div class="profile-info-value">
													<span>${profile.date }</span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">Telephone</div>

												<div class="profile-info-value">
													<span>${profile.tel }</span>
												</div>
											</div>
										</div>

										<div class="hr hr-8 dotted"></div>

										<div class="profile-user-info">
											<div class="profile-info-row">
												<div class="profile-info-name">Website</div>

												<div class="profile-info-value">
													<a href="#" target="_blank">www.alexdoe.com</a>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">
													<i
														class="middle ace-icon fa fa-facebook-square bigger-150 blue"></i>
												</div>

												<div class="profile-info-value">
													<a href="#">Find me on Facebook</a>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">
													<i
														class="middle ace-icon fa fa-twitter-square bigger-150 light-blue"></i>
												</div>

												<div class="profile-info-value">
													<a href="#">Follow me on Twitter</a>
												</div>
											</div>
										</div>
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->

								<div class="space-20"></div>

								<div class="row">
									<div class="col-xs-12 col-sm-6">
										<div class="widget-box transparent">
											<div class="widget-header widget-header-small">
												<h4 class="widget-title smaller">
													<i class="ace-icon fa fa-check-square-o bigger-110"></i>
													Little About Me
												</h4>
											</div>

											<div class="widget-body">
												<div class="widget-main">
													<p>My job is mostly lorem ipsuming and dolor sit
														ameting as long as consectetur adipiscing elit.</p>
													<p>Sometimes quisque commodo massa gets in the way and
														sed ipsum porttitor facilisis.</p>
													<p>The best thing about my job is that vestibulum id
														ligula porta felis euismod and nullam quis risus eget urna
														mollis ornare.</p>
													<p>Thanks for visiting my profile.</p>
												</div>
											</div>
										</div>
									</div>

									<div class="col-xs-12 col-sm-6">
										<div class="widget-box transparent">
											<div
												class="widget-header widget-header-small header-color-blue2">
												<h4 class="widget-title smaller">
													<i class="ace-icon fa fa-lightbulb-o bigger-120"></i> My
													Skills
												</h4>
											</div>

											<div class="widget-body">
												<div class="widget-main padding-16">
													<div class="clearfix">
														<div class="grid3 center">
															<!-- #section:plugins/charts.easypiechart -->
															<div class="easy-pie-chart percentage" data-percent="45"
																data-color="#CA5952">
																<span class="percent">45</span>%
															</div>

															<!-- /section:plugins/charts.easypiechart -->
															<div class="space-2"></div>
															Graphic Design
														</div>

														<div class="grid3 center">
															<div class="center easy-pie-chart percentage"
																data-percent="90" data-color="#59A84B">
																<span class="percent">90</span>%
															</div>

															<div class="space-2"></div>
															HTML5 & CSS3
														</div>

														<div class="grid3 center">
															<div class="center easy-pie-chart percentage"
																data-percent="80" data-color="#9585BF">
																<span class="percent">80</span>%
															</div>

															<div class="space-2"></div>
															Javascript/jQuery
														</div>
													</div>

													<div class="hr hr-16"></div>

													<!-- #section:pages/profile.skill-progress -->
													<div class="profile-skills">
														<div class="progress">
															<div class="progress-bar progress-bar-warning"
																style="width: 100%">
																<span class="pull-left">Database</span> <span
																	class="pull-right">100%</span>
															</div>
														</div>
														<div class="progress">
															<div class="progress-bar" style="width: 80%">
																<span class="pull-left">HTML5 & CSS3</span> <span
																	class="pull-right">80%</span>
															</div>
														</div>

														<div class="progress">
															<div class="progress-bar progress-bar-success"
																style="width: 72%">
																<span class="pull-left">Javascript & jQuery</span> <span
																	class="pull-right">72%</span>
															</div>
														</div>

														<div class="progress">
															<div class="progress-bar progress-bar-purple"
																style="width: 70%">
																<span class="pull-left">JSP & MySQL</span> <span
																	class="pull-right">70%</span>
															</div>
														</div>

														<div class="progress">
															<div class="progress-bar progress-bar-danger"
																style="width: 38%">
																<span class="pull-left">Photoshop</span> <span
																	class="pull-right">38%</span>
															</div>
														</div>
													</div>

													<!-- /section:pages/profile.skill-progress -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /#home -->

							<div id="feed" class="tab-pane">
								<div class="profile-feed row">
									<div class="col-sm-6">
										<i>ชำระเงินแล้ว</i>
										<c:set var="i" value="0"></c:set>

										<c:forEach items="${booklist }" var="blist">
											<c:if test="${blist.status=='1' }">
												<div class="profile-activity clearfix">
													<div>
														<i
															class="pull-left thumbicon fa fa-check btn-success no-hover"></i>
														<a class="user" href="profile?action=profile">รหัสการจอง
															${blist.bookingID }</a> ต้นทาง ${tic[i].SNameTha }ปลายทาง
														${tic[i].DNameTha }
														<c:set var="i" value="${i+1}" />
														<div class="time">
															<i class="ace-icon fa fa-clock-o bigger-110">
																รถออกเดินทาง ${blist.bookingDate }</i>
														</div>
													</div>
													<!-- 
											<div class="tools action-buttons">
												<a href="#" class="blue"> <i
													class="ace-icon fa fa-pencil bigger-125"></i>
												</a> <a href="#" class="red"> <i
													class="ace-icon fa fa-times bigger-125"></i>
												</a>
											</div> -->
												</div>
											</c:if>
										</c:forEach>
									</div>
									<!-- /.col -->

									<div class="col-sm-6">
										<i>รอการชำระเงิน</i>
										<c:forEach items="${booklist }" var="blist">
											<c:if test="${blist.status=='0' }">
												<div class="profile-activity clearfix">
													<a href="payin?action=pay&booking=${blist.bookingID }">
														<div>
															<i
																class="pull-left thumbicon fa fa-pencil-square-o btn-pink no-hover"></i>
															<a class="user" href="profile?action=profile">รหัสการจอง
																${blist.bookingID }</a> ต้นทาง ${tic[i].SNameTha }ปลายทาง
															${tic[i].DNameTha }
															<c:set var="i" value="${i+1}" />
															<div class="time">
																<i class="ace-icon fa fa-clock-o bigger-110">
																	รถออกเดินทาง ${blist.bookingDate }</i>
															</div>
														</div>
													</a>
												</div>
											</c:if>
										</c:forEach>
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->

								<div class="space-12"></div>

								<div class="center">
									<button type="button"
										class="btn btn-sm btn-primary btn-white btn-round">
										<i class="ace-icon fa fa-rss bigger-150 middle orange2"></i> <span
											class="bigger-110">View more activities</span> <i
											class="icon-on-right ace-icon fa fa-arrow-right"></i>
									</button>
								</div>
							</div>
							<!-- /#feed -->

							<div id="friends" class="tab-pane">
								<!-- #section:pages/profile.friends -->
								<div class="row">
									<div class="col-xs-12 col-sm-3 center">
										<span class="profile-picture"> <img
											class="editable img-responsive" alt="Alex's Avatar"
											id="avatar2" src="bootstrap/avatars/profile-pic.jpg" />
										</span>

										<div class="space space-4"></div>

										<button class="btn btn-sm btn-block btn-success">
											<i class="ace-icon fa fa-plus-circle bigger-120"></i> <span
												class="bigger-110">${profile.fname}</span>
										</button>

										<a href="mailto://${profile.email }"
											class="btn btn-sm btn-block btn-primary"> <i
											class="ace-icon fa fa-envelope-o bigger-110"></i> <span
											class="bigger-110">Send a message</span>
										</a>
									</div>
									<!-- /.col -->

									<div class="col-xs-12 col-sm-9">
										<h2 class="blue">
											<span class="middle">Edit Profile</span>

										</h2>
										<form action="profile" method="post">
											<input type="hidden" name="action" value="edit" /> <input
												type="hidden" name="userID" value="${profile.userID }" />
											<div class="profile-user-info">


												<div class="profile-info-row">
													<div class="profile-info-name">Identification</div>

													<div class="profile-info-value">
														<label class="block clearfix"> <span
															class="block input-icon input-icon-right"> <input
																type="text" name="idNo" class="form-control"
																value="${profile.IDNo }" required /> <i
																class="ace-icon fa fa-envelope"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="profile-info-row">
													<div class="profile-info-name">E-mail</div>

													<div class="profile-info-value">
														<label class="block clearfix"> <span
															class="block input-icon input-icon-right"> <input
																type="text" name="email" class="form-control"
																value="${profile.email }" required /> <i
																class="ace-icon fa fa-envelope"></i>
														</span>
														</label>
													</div>
												</div>

												<div class="profile-info-row">
													<div class="profile-info-name">First name</div>

													<div class="profile-info-value">
														<label class="block clearfix"> <span
															class="block input-icon input-icon-right"> <input
																type="text" name="fname" class="form-control"
																value="${profile.fname }" required /> <i
																class="ace-icon fa  fa-cloud-download"></i>
														</span>
														</label>
													</div>
												</div>


												<div class="profile-info-row">
													<div class="profile-info-name">Last name</div>

													<div class="profile-info-value">
														<label class="block clearfix"> <span
															class="block input-icon input-icon-right"> <input
																type="text" name="lname" class="form-control"
																value="${profile.lname }" required /> <i
																class="ace-icon fa fa-cloud-upload"></i>
														</span>
														</label>
													</div>
												</div>

												<div class="profile-info-row">
													<div class="profile-info-name">Address</div>

													<div class="profile-info-value">
														<label class="block clearfix"> <span
															class="block input-icon input-icon-right"> <input
																type="text" name="address" class="form-control"
																value="${profile.address }" required /> <i
																class="ace-icon fa fa-map-marker"></i>
														</span>
														</label>
													</div>
												</div>

												<div class="profile-info-row">
													<div class="profile-info-name">Telephone</div>

													<div class="profile-info-value">
														<label class="block clearfix"> <span
															class="block input-icon input-icon-right"> <input
																type="text" name="tel" class="form-control"
																value="${profile.tel }" required /> <i
																class="ace-icon fa fa-comments"></i>
														</span>
														</label>
													</div>
												</div>


												<div class="profile-info-row">
													<div class="profile-info-name"></div>
													<div class="profile-info-value">
														<button type="submit" action="register"
															class="width-65 pull-right btn btn-sm btn-success">
															<span class="bigger-110">Register</span> <i
																class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
													</div>

												</div>
											</div>
										</form>

										<div class="hr hr-8 dotted"></div>

										<div class="profile-user-info">
											<div class="profile-info-row">
												<div class="profile-info-name">Website</div>

												<div class="profile-info-value">
													<a href="#" target="_blank">www.alexdoe.com</a>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">
													<i
														class="middle ace-icon fa fa-facebook-square bigger-150 blue"></i>
												</div>

												<div class="profile-info-value">
													<a href="#">Find me on Facebook</a>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">
													<i
														class="middle ace-icon fa fa-twitter-square bigger-150 light-blue"></i>
												</div>

												<div class="profile-info-value">
													<a href="#">Follow me on Twitter</a>
												</div>
											</div>
										</div>
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
							</div>
							<!-- /#friends -->

							<div id="pictures" class="tab-pane">
								<ul class="ace-thumbnails">
									<li><a href="#" data-rel="colorbox"> <img
											alt="150x150" src="../assets/images/gallery/thumb-1.jpg" />
											<div class="text">
												<div class="inner">Sample Caption on Hover</div>
											</div>
									</a>

										<div class="tools tools-bottom">
											<a href="#"> <i class="ace-icon fa fa-link"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
											</a>
										</div></li>

									<li><a href="#" data-rel="colorbox"> <img
											alt="150x150" src="../assets/images/gallery/thumb-2.jpg" />
											<div class="text">
												<div class="inner">Sample Caption on Hover</div>
											</div>
									</a>

										<div class="tools tools-bottom">
											<a href="#"> <i class="ace-icon fa fa-link"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
											</a>
										</div></li>

									<li><a href="#" data-rel="colorbox"> <img
											alt="150x150" src="../assets/images/gallery/thumb-3.jpg" />
											<div class="text">
												<div class="inner">Sample Caption on Hover</div>
											</div>
									</a>

										<div class="tools tools-bottom">
											<a href="#"> <i class="ace-icon fa fa-link"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
											</a>
										</div></li>

									<li><a href="#" data-rel="colorbox"> <img
											alt="150x150" src="../assets/images/gallery/thumb-4.jpg" />
											<div class="text">
												<div class="inner">Sample Caption on Hover</div>
											</div>
									</a>

										<div class="tools tools-bottom">
											<a href="#"> <i class="ace-icon fa fa-link"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
											</a>
										</div></li>

									<li><a href="#" data-rel="colorbox"> <img
											alt="150x150" src="../assets/images/gallery/thumb-5.jpg" />
											<div class="text">
												<div class="inner">Sample Caption on Hover</div>
											</div>
									</a>

										<div class="tools tools-bottom">
											<a href="#"> <i class="ace-icon fa fa-link"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
											</a>
										</div></li>

									<li><a href="#" data-rel="colorbox"> <img
											alt="150x150" src="../assets/images/gallery/thumb-6.jpg" />
											<div class="text">
												<div class="inner">Sample Caption on Hover</div>
											</div>
									</a>

										<div class="tools tools-bottom">
											<a href="#"> <i class="ace-icon fa fa-link"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
											</a>
										</div></li>

									<li><a href="#" data-rel="colorbox"> <img
											alt="150x150" src="../assets/images/gallery/thumb-1.jpg" />
											<div class="text">
												<div class="inner">Sample Caption on Hover</div>
											</div>
									</a>

										<div class="tools tools-bottom">
											<a href="#"> <i class="ace-icon fa fa-link"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
											</a>
										</div></li>

									<li><a href="#" data-rel="colorbox"> <img
											alt="150x150" src="../assets/images/gallery/thumb-2.jpg" />
											<div class="text">
												<div class="inner">Sample Caption on Hover</div>
											</div>
									</a>

										<div class="tools tools-bottom">
											<a href="#"> <i class="ace-icon fa fa-link"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
											</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
											</a>
										</div></li>
								</ul>
							</div>
							<!-- /#pictures -->
						</div>
					</div>
				</div>


			</div>
		</div>

	</layout:put>
</layout:extends>