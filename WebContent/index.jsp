<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<%@ page import="model.*"%>
<layout:extends name="main.jsp">
	<layout:put block="body">
	<script>
	function passValue(){
		var s=document.getElementById("sourceStation").value;
		var d=document.getElementById("destinationStation").value;
		$.ajax({
			type: "POST" ,
			url:"ajax" , //ใส่ url หน้าที่จะส่ง
			cache: false ,
			data: "sid="+s+"&did="+d, //ชื่อตัวแปรประเภทที่=ประเภท&ชื่อตัวแปรที่นั่งที่เลือก=ค่าที่นั่ง1,2,..
			success: function(msg){
				document.getElementById("ss").innerHTML=msg;
			}
		});
	}
	</script>
		<!-- /section:settings.box -->
		<div class="page-header">
			<h1>
				Railway list <small> <i
					class="ace-icon fa fa-angle-double-right"></i> ตารางแสดงรอบรถไฟ
				</small>
			</h1>
		</div>
		<!-- /.page-header -->
		<div class="col-sm-8">
			<h5 class="header smaller lighter green">select raiway</h5>
			<p></p>
			<div class="btn-toolbar">
				<i class="ace-icon fa fa-cloud-upload"> ต้นทาง</i> 
				<select name="sourceStation" onchange="passValue()" id="sourceStation">
				<option value="0">ทั้งหมด</option>
					<c:forEach items="${stations}" var="item">
						<option value="${item.SID}">${item.SNameTha}
							(${item.SNameEng})</option>
					</c:forEach>
				</select> <i class="ace-icon fa fa-cloud-download"> ปลายทาง</i> <select onchange="passValue()"
					name="destinationStation" id="destinationStation">
					<option value="0">ทั้งหมด</option>
					<c:forEach items="${stations}" var="item">
						<option value="${item.SID}">${item.SNameTha}
							(${item.SNameEng})</option>
					</c:forEach>
				</select>

			</div>

			<h3 class="header smaller lighter green"></h3>
		</div>
		<c:if test="${sessionScope.type=='admin' }">
			<div class="col-sm-2 pull-right">
				<h5 class="header smaller lighter blue">เพิ่มรอบรถไฟ</h5>
				<a href="insertRailway" class="btn btn-primary pull-right"><i
					class="fa fa-plus"></i> Add</a>
			</div>
		</c:if>



		<!-- /.page-header -->
		<div class="col-xs-12 col-sm-12 widget-container-col">
			<div class="widget-box widget-color-red">
				<div class="widget-header">
					<h5 class="widget-title bigger lighter">
						<i class="ace-icon glyphicon glyphicon-list"></i> ตารางรถไฟ
					</h5>
				</div>
				<div class="widget-body">
					<div class="widget-main no-padding">
						<table id="ss" class="table table-striped table-bordered table-hover">
							<thead class="thin-border-bottom">
								<tr>
									<th width="2"><i class="ace-icon fa fa-circle"></i></th>
									<th><i class="ace-icon fa fa-car"> เลขที่ขบวน</i></th>
									<th><i class="ace-icon fa fa-cloud-upload"> ต้นทาง</i></th>
									<th><i class="ace-icon fa fa-clock-o"> เวลาออกเดินทาง</i></th>
									<th><i class="ace-icon fa fa-cloud-download"> ปลายทาง</i></th>
									<th><i class="ace-icon fa fa-clock-o"> เวลาถึงปลายทาง</i></th>
									<c:if test="${sessionScope.type=='admin' }">
										<th width="1"></th>
										<th width="1"></th>
									</c:if>
									<c:if test="${sessionScope.type=='user' }">
										<th width="1"></th>
									</c:if>
								</tr>
							</thead>

							<tbody>
								<c:set var="i" value="0" />
								<c:forEach items="${lists}" var="list">
									<tr>
										<td>${i+1}</td>
										<td>${list.RID}</td>
										<td>${list.SNameTha}</td>
										<td>${list.deptime}</td>
										<td>${list.DNameTha}</td>
										<td>${list.arrtime}</td>
										<c:if test="${sessionScope.type=='admin' }">
											<td><a
												href="EDRailwaytable?action=editForm&rid=${list.RID}"> <i
													class="fa fa-fw fa-pencil bigger-130 green"></i>
											</a></td>
											<td><a
												href="EDRailwaytable?action=delete&rid=${list.RID}"
												class="js-delete"> <i
													class="fa fa-fw fa-trash-o bigger-130 red"></i>
											</a></td>
										</c:if>
										<c:if test="${sessionScope.type=='user' }">
											<td>
												<form action="booking" method="post">
													<input type="hidden" name="rid" value="${list.RID}">
													<input type="hidden" name="action" value="pre"> <input
														type="hidden" name="station"
														value="${list.SNameTha}-${list.DNameTha}"> <button type="submit" class="btn btn-xs btn-inverse">จองที่นั่ง</button>
												</form>
											</td>
										</c:if>

										<c:set var="i" value="${i+1}" />
									</tr>
									
								</c:forEach>
								
							</tbody>
						</table>
					
					</div>
				</div>
			</div>
		</div>

		<!-------------------------------------------------------->

		<!-- RAILWAY TABLE STOP-->
	</layout:put>
</layout:extends>