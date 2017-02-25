<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<%@ page import="model.*"%>
<layout:extends name="main.jsp">
	<layout:put block="body">
	<c:if test="${sessionScope.type!='admin'}">
	<c:redirect url="main"/>
	</c:if>
			
			<!-- /section:settings.box -->
		<div class="page-header">
			<h1>
				Admin <small> <i
					class="ace-icon fa fa-angle-double-right"></i>
					อัพเดทการจ่ายเงิน
				</small>
			</h1>
		</div>
		<form method="post" action="pay">
			<input type="text" name="bookingID" placeholder="TicketID">
			<input type="hidden" name="action" value="search">
			<input class="btn btn-sm btn-grey" type="submit" value="ค้นหา"><br>
		</form>
		<div class="widget-box widget-color-red">
			<div class="widget-header widget-header-flat">
				<i class="ace-icon glyphicon glyphicon-list"></i> <h4 class="widget-title"> สถานการจ่ายเงิน </h4>
			</div>
			<div class="widget-body">
				<div class="widget-main no-padding">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width="1">#</th>
								<th>รหัสตั๋ว</th>
								<th>เวลาที่จอง</th>
								<th>ชื่อผู้จอง</th>
								<th>สถานะ</th>
								<th>ราคารวม</th>
								<th class=""></th>
							</tr>
						</thead>
						<tbody>
							<c:set var="i" value="0" />
							<c:forEach items="${booking}" var="list">
								<tr>
									<td>${i+1}</td>
									<td>${list.bookingID}</td>
									<td>${list.time}</td>
									<td>${list.FName} ${list.LName}</td>
									<td>
									<c:if test="${list.status==0}">ยังไม่จ่าย</c:if>
									<c:if test="${list.status==1}">จ่ายแล้ว</c:if>
									<c:if test="${list.status==2}">ซื้อที่สถานี</c:if>
									</td>
									<td>
								${list.price}
									</td>
									<td><c:if test="${list.status==0}">
									<form action="pay" METHOD="POST	">
									<input type="hidden" name="bookingID" value="${list.bookingID}">
									<input type="hidden" name="action" value="update">
									<input class="btn btn-minier btn-danger" type="submit" value="Unpaid">
									</form>
									</c:if>
									<c:if test="${list.status==1}">
									<button class="btn btn-minier disabled btn-info">paid</button>
									</c:if>
									<c:if test="${list.status==2}">
									<button class="btn btn-minier disabled btn-info">buy at Station</button>
									</c:if>
									</td>
									<c:set var="i" value="${i+1}" />
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</layout:put>
</layout:extends>