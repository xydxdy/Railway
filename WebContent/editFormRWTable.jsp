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
				Edit railway <small> <i
					class="ace-icon fa fa-angle-double-right"></i> admin สามารรถแก้ไขเที่ยวรถได้ที่นี่
				</small>
			</h1>
		</div>
		<!-- /.page-header -->
		<!-- RAILWAY TABLE START-->
		<form action="EDRailwaytable" method="post">
			<div class="widget-box">
				<div class="widget-header widget-header-flat">
					<h4 class="widget-title">แก้ไขเที่ยวรถ</h4>
				</div>
				<div class="widget-body">
					<div class="widget-main no-padding">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>ขบวนที่ ${railway.RID }</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>ต้นทาง</th>
									<th>ปลายทาง</th>
								</tr>
								<tr>
									<td><select name="sourceID" onselect="">
											<c:forEach items="${stations}" var="item">
												<option value="${item.SID}">${item.SNameTha}
													(${item.SNameEng})</option>
											</c:forEach>
									</select></td>
									<td><select name="destID" onselect="">
											<c:forEach items="${stations}" var="item">
												<option value="${item.SID}">${item.SNameTha}
													(${item.SNameEng})</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<th>เวลาออกเดินทาง</th>
									<th>เวลาถึงปลายทาง</th>
								</tr>
								<tr>
									<td><input type="time" name="deptime"/></td>
									<td><input type="time" name="arrtime"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<input type="hidden" name="action" value="edit">
			<input type="hidden" name="rid" value="${railway.RID}">
			<button type="submit">Submit</button>
		</form>
		<!-- RAILWAY TABLE STOP-->

	</layout:put>
</layout:extends>