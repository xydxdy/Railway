<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<%@ page import="model.*"%>
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
				<td><a href="EDRailwaytable?action=editForm&rid=${list.RID}">
						<i class="fa fa-fw fa-pencil bigger-130 green"></i>
				</a></td>
				<td><a href="EDRailwaytable?action=delete&rid=${list.RID}"
					class="js-delete"> <i
						class="fa fa-fw fa-trash-o bigger-130 red"></i>
				</a></td>
			</c:if>
			<c:if test="${sessionScope.type=='user' }">
				<td>
					<form action="booking" method="post">
						<input type="hidden" name="rid" value="${list.RID}"> <input
							type="hidden" name="action" value="pre"> <input
							type="hidden" name="station"
							value="${list.SNameTha}-${list.DNameTha}">
						<button type="submit" class="btn btn-xs btn-inverse">จองที่นั่ง</button>
					</form>
				</td>
			</c:if>

			<c:set var="i" value="${i+1}" />
		</tr>

	</c:forEach>

</tbody>