<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<%@include file="/common/common.jsp" %>
	<script type="text/javascript" src="<%=basePath%>/resources/js/edu/department/department.js"></script>
</head>
<body style="background-color: #fff">
	<div class="wrap_form_middle_right">
	<div class="adjust_box" style="height:420px;">
	<div class="box_inner">
	
	<form class="registerform" id="registerForm" method="post">
	
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="parameterName" id="parameterName" value="${_csrf.parameterName}" />
		<input type="hidden" name="token" id="token" value="${_csrf.token}" />
		
		<div class="cell">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
		        	<th style="width:15%;"><span style="color: red;">*</span>系部名称：</th>
		            <td style="width:35%;"><input type="text" id="departmentName" name="department.departmentName" class="form_text" maxlength="25" reg="Require" tip="请填写系部名称"/></td>
		       </tr> 
		       <tr>
		        	<th>系部编码：</th>
		            <td><input type="text" name="department.departmentCode" class="form_text" maxlength="25"/></td>
		       </tr>
		       <tr>
		       		<th>排序号：</th>
		            <td><input type="text" name="department.sn" class="form_text" reg="NullOrNum" tip="请填写数字格式的排序号" /></td>
		       </tr> 
		   	</table>
	   	</div>
	   	<div class="box_03">
	       	<div class="box_inner_03">
	       		<div class="btn_area_setl btn_area_bg">
	       			<a href="#" onclick="save('registerForm','${_csrf.parameterName}','${_csrf.token}')" class="btn_01">保存<b></b></a>
	   				<a href="#" onclick="window.parent.closeWinForm();" class="btn_01">取消<b></b></a>
	       		</div>
	       	</div>
	    </div>
	</form>
	
	</div>
	</div>
	</div>
</body>
</html>