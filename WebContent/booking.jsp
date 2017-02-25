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
					เลือกที่นั่งของโบกี้นี้
				</small>
			</h1>
		</div>
		<!-- /.page-header -->
						<jsp:include page="bookingfac.jsp">
							<jsp:param name="ticket" value="${ticket}" />
							<jsp:param name="type" value="${cartype}" />
							<jsp:param name="carno" value="${carno}" />
							<jsp:param name="date" value="${date}" />
						</jsp:include>
	</layout:put>
</layout:extends>