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
				Admin <small> <i
					class="ace-icon fa fa-angle-double-right"></i>
					admin สามารถเพิ่มสถานีรถไฟได้ที่นี่
				</small>
			</h1>
		</div>
		<!-- /.page-header -->
		<!-- PAGE CONTENT BEGINS -->
		<form action="Station">
			เลขสถานี : <input type="text" name="SID"> ชื่อสถานี (ไทย): <input
				type="text" name="SNameTha"> ชื่อสถานี (Eng): <input
				type="text" name="SNameEng"> <input type="submit"
				value="Submit"> <input type="hidden" name="action"
				value="insert_station">
		</form>
		<br>
		<div>
			<table class="table">
				<tr>
					<td>#</td>
					<td>เลขสถานี</td>
					<td>ชื่อสถานี</td>
					<td>Station name</td>
					<td></td>
				</tr>
				<c:set var="i" value="0"/>
				<c:forEach items="${list}" var="s">
					<c:set var="i" value="${i+1}"/>
					<tr>
						<td>${i }</td>
						<td>${s.SID }</td>
						<td>${s.SNameTha }</td>
						<td>${s.SNameEng }</td>
						<td><a href='Station?action=delete&id=${s.SID}'>ลบ</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!-- PAGE CONTENT ENDS -->

		</layout:put>
</layout:extends>
