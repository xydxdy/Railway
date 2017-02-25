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
				Booking <small> <i class="ace-icon fa fa-angle-double-right"></i>
					คุณสามารถพิมพ์ใบจ่ายเงินได้ที่นี่
				</small>
			</h1>
		</div>
		<!-- /.page-header -->


		<!-- PAY IN STOP-->
		<div id="printableArea">
			<div class="widget-box">

				<c:if test="${sessionScope.type=='user' }">
					<div class="widget-header widget-header-flat">
						<h4 class="widget-title">ใบชำระเงิน (จองตั๋วรถไฟออนไลน์)</h4>
					</div>
				</c:if>
				<c:if test="${sessionScope.type=='admin' }">
					<div class="widget-header widget-header-flat">
					<h4 class="widget-title">ตั๋วรถไฟ</h4>
				</div>
				</c:if>
				<div class="widget-body">
					<div class="widget-main no-padding">

						<table class="table table-bordered">

							<thead>
								<tr>
									<th>รหัสการจอง : ${blist.bookingID }</th>
									<th>วันที่เดินทาง : ${blist.bookingDate }</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>ต้นทาง : ${t[0].SNameTha} (${t[0].SNameEng})</td>
									<td>ปลายทาง : ${t[0].DNameTha} (${t[0].DNameEng})</td>
								</tr>
								<tr>
									<td>เวลาออกเดินทาง : ${t[0].deptime}</td>
									<td>เวลาถึงปลายทาง : ${t[0].arrtime}</td>
								</tr>
								<tr>
									<td>ชื่อผู้จอง : ${blist.FName } ${blist.LName }</td>
									<td>วัน/เวลาที่จอง : ${blist.time }</td>
								</tr>
								<tr>
									<td>ขบวน: ${t[0].RID}</td>
									<td>คันที่ : ${t[0].carNo}</td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>

			<div class="widget-box">
				<div>
					<h5 align="center">รายละเอียดตั๋ว</h5>
				</div>
				<div class="widget-body">
					<div class="widget-main no-padding">
						<table class="table table-bordered">
							<c:set var="i" value="0" />
							<c:forEach items="${tlist}" var="list">
								<tr>
									<td width="1">${i+1 }</td>
									<td>รหัสตั๋ว : ${list.ticketID }</td>
									<td>เลขที่นั่ง : ${list.seat }</td>
									<td>ราคา : ${list.price } บาท</td>
									<c:set var="i" value="${i+1}" />
								</tr>
							</c:forEach>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td><b>ราคารวม ${blist.price } บาท</b></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<br>
			<c:if test="${sessionScope.type=='user' }">
				<div>ผู้รับเงิน .............................</div>
			</c:if>
			<c:if test="${sessionScope.type=='admin' }">
				<div></div>
			</c:if>
		</div>
		<!--PAY IN STOP-->
		<br>
		<c:if test="${sessionScope.type=='admin' }">
			<div align="center">
				<input type="button" onclick="printDiv('printableArea')"
					value="พิมพ์ตั๋ว" />
			</div>
		</c:if>
		<c:if test="${sessionScope.type=='user' }">
			<div align="center">
				<input type="button" onclick="printDiv('printableArea')"
					value="พิมพ์ใบชำระเงิน" />
			</div>
		</c:if>


		<script>
			function printDiv(divName) {
				var printContents = document.getElementById(divName).innerHTML;
				var originalContents = document.body.innerHTML;

				document.body.innerHTML = printContents;

				window.print();

				document.body.innerHTML = originalContents;
			}
		</script>

	</layout:put>
</layout:extends>