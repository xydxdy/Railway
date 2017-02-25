
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
					admin สามารถเพิ่มตู้รถไฟได้ที่นี่
				</small>
			</h1>
		</div>
		<!-- /.page-header -->
		<form method="post" action="insertCar">
			<!-- ขบวนรถ : <select name="rid">
				<c:forEach items="${railways}" var="item">
					<option value="${item.RID}">ขบวน:${item.RID}
						(${item.SNameTha}- ${item.DNameTha})</option>
				</c:forEach>
			</select> <br> ประเภทรถไฟ <select name="carType">
				<option value="1">ตู้นั่ง</option>
				<option value="2">ตู้นอน</option>
			</select><br> ราคาต่อที่นั่ง/เตียง<input type="number" name="price">
			<input type="hidden" name="action" value="insert"> <input
				type="submit" value="เพิ่มขบวนรถ"><br> -->
			<div class="row">

				<div class="col-xs-12 col-sm-9">

					<div class="profile-user-info">
						<div class="profile-info-row">
							<div class="profile-info-name">ขบวนรถ</div>

							<div class="profile-info-value">
								<span><select name="rid">
										<c:forEach items="${railways}" var="item">
											<option value="${item.RID}">ขบวน:${item.RID}
												(${item.SNameTha}- ${item.DNameTha})</option>
										</c:forEach>
								</select> </span>
							</div>
						</div>

						<div class="profile-info-row">
							<div class="profile-info-name">ประเภทรถไฟ</div>

							<div class="profile-info-value">
								<span><select name="carType">
				<option value="1">ตู้นั่ง</option>
				<option value="2">ตู้นอน</option>
			</select></span>
							</div>
						</div>

						<div class="profile-info-row">
							<div class="profile-info-name">ราคาต่อที่นั่ง/เตียง</div>

							<div class="profile-info-value">
								<span><input type="number" name="price"></span>
							</div>
						</div>


						<input type="hidden" name="action" value="insert"> 
						<div class="profile-info-row">
							<div class="profile-info-name"></div>

							<div class="profile-info-value">
								<span><input class="btn btn-primary" type="submit"
									value="เพิ่มตู้รถ"></span>
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