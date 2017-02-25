<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<%@ page import="model.*"%>
<%="55"%>
<layout:extends name="main.jsp">
	<layout:put block="body">
		<div class="page-header">
			<h1>
				Booking <small> <i class="ace-icon fa fa-angle-double-right"></i>
					เลือกที่นั่ง และ วันในการเดินทาง
				</small>
			</h1>
		</div>
		<!-- /.page-header -->

		<script>
	function change(type){	
		document.getElementById("selected").value = type;
		console.log(type);
	}
		</script>
		<h2 class="danger lighter smaller">รถไฟขบวนที่ ${car[0].RID} :: (
			${station} )</h2>
		<form action="booking" method="Post">
			<div class="col-sm-6">
				<h3 class="green lighter">
					<i class="ace-icon fa fa-calendar-o smaller-90"></i> Datepicker
				</h3>

				<div class="row">
					<div class="col-xs-6">
						<div class="input-group input-group-sm">
							<!-- <script type="text/javascript">
							function test01(){
								alert(document.getElementById("datepicker").value)
							}
						</script> -->
							<!-- <input type="text" id="datepicker" name="dategg" class="form-control" required/> -->
							<!-- <input type="button" onclick="test01()"/> -->
							<input type="date" name="dategg" required><span class="input-group-addon"><i class="ace-icon fa fa-calendar"></i>
							
						</div>
					</div>
				</div>
			</div>
			<!-- ./span -->
			<div class="col-sm-12">
				<div class="widget-box widget-color-purple">
					<div class="widget-header">
						<h5 class="widget-title bigger lighter">
							<i class="ace-icon fa fa-laptop"></i> เลือกคันรถ
						</h5>
					</div>
					<div class="widget-body">
						<div class="widget-main no-padding">
							<table class="table table-striped table-bordered table-hover">
								<thead class="thin-border-bottom">
									<tr>
										<th width="2"><i class="ace-icon fa fa-circle"></i></th>
										<th><i class="ace-icon fa fa-car"> เลขที่ตู้</i></th>
										<th><i class="ace-icon fa fa-clock-o"> ประเภทตู้</i></th>
										<th><i class="ace-icon fa fa-clock-o"> ราคา</i></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${car}" var="item">
										<tr>
											<td><input type="radio" name="cid" value="${item.carNo}"
												onClick="change(${item.carType})"></td>
											<td>${item.carNo}</td>
											<td><c:if test="${item.carType==1}">ตู้นั่ง</c:if> <c:if
													test="${item.carType==2}">ตู้นอน</c:if></td>
											<td>${item.price}</td>
										</tr>
									</c:forEach>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td><input class="btn btn-primary pull-right"
											type="submit" value="เลือกที่นั่ง"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="rid" value="${car[0].RID}"> <input
				type="hidden" name="cartype" id="selected"> <input
				type="hidden" value="book" name="action">


		</form>

	</layout:put>

</layout:extends>