<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
</head>
<body>

	<div class="page-wrapper">
		<div class="page-inner">			
			 <div class="page-content-wrapper">
			<tiles:insertAttribute name="header" ignore="true" />
			<tiles:insertAttribute name="body" ignore="true" />
			<tiles:insertAttribute name="footer" ignore="true" />
			</div>
		</div>
	</div>
	
	</body>
</html>