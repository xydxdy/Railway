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
				Admin <small> <i class="ace-icon fa fa-angle-double-right"></i>
					admin สามารถเพื่มขบวนรถไฟได้ที่นี่
				</small>
			</h1>
		</div>
		<!-- /.page-header -->

		<form method="post" action="insertRailway">
		<!-- 	RID <input type="number" name="rid" pattern="" required><br>

			สถานีต้นทาง<select name="sid" required>
				<option></option>
				<c:forEach items="${stations}" var="item">
					<option value="${item.SID}">${item.SNameTha}
						(${item.SNameEng})</option>
				</c:forEach>
			</select><br> สถานีปลายทาง<select name="did" required>
				<option></option>
				<c:forEach items="${stations}" var="item">
					<option value="${item.SID}">${item.SNameTha}
						(${item.SNameEng})</option>
				</c:forEach>
			</select><br> เวลาออกเดินทาง<input type="time" name="depTime" required><br>
			เวลาถึงปลายทาง<input type="time" name="arrTime" required><br>
			<input type="hidden" name="action" value="insert"> <input
				type="submit" value="เพิ่มขบวนรถ"> -->
		<div class="row">

				<div class="col-xs-12 col-sm-9">

					<div class="profile-user-info">
						<div class="profile-info-row">
							<div class="profile-info-name">เลขขบวนรถไฟ</div>

							<div class="profile-info-value">
								<span><input type="number" name="rid" pattern="" required>
								</span>
							</div>
						</div>

						<div class="profile-info-row">
							<div class="profile-info-name">สถานีต้นทาง</div>

							<div class="profile-info-value">
								<span><select name="sid" required>
										<option></option>
										<c:forEach items="${stations}" var="item">
											<option value="${item.SID}">${item.SNameTha}
												(${item.SNameEng})</option>
										</c:forEach>
								</select></span>
							</div>
						</div>

						<div class="profile-info-row">
							<div class="profile-info-name">สถานีปลายทาง</div>

							<div class="profile-info-value">
								<span><select name="did" required>
										<option></option>
										<c:forEach items="${stations}" var="item">
											<option value="${item.SID}">${item.SNameTha}
												(${item.SNameEng})</option>
										</c:forEach>
								</select></span>
							</div>
						</div>

						<div class="profile-info-row">
							<div class="profile-info-name">เวลาออกเดินทาง</div>

							<div class="profile-info-value">
								<span><input type="time" name="depTime" required></span>
							</div>
						</div>

						<div class="profile-info-row">
							<div class="profile-info-name">เวลาถึงปลายทาง</div>

							<div class="profile-info-value">
								<span><input type="time" name="arrTime" required></span>
							</div>
						</div>

						<input type="hidden" name="action" value="insert">

						<div class="profile-info-row">
							<div class="profile-info-name"></div>

							<div class="profile-info-value">
								<span> <input class="btn btn-primary" type="submit"
									value="เพิ่มขบวนรถ"></span>
							</div>
						</div>
					</div>


					<div class="hr hr-8 dotted"></div>

				</div>
				<!-- /.col -->
		</div>
		</form>

	</layout:put>
</layout:extends>