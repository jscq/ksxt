<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<%@include file="/common/common.jsp" %>
	<script type="text/javascript" src="<%=basePath%>/resources/js/edu/department/department.js"></script>
</head>
<body style="background-color: #fff">
	
	<div class="wrap_form_middle_right">
	<div class="adjust_box" style="height:425px;">
	<div class="box_inner">
	
	<form class="registerform" id="registerForm" method="post">
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="parameterName" id="parameterName" value="${_csrf.parameterName}" />
	<input type="hidden" name="token" id="token" value="${_csrf.token}" />
	<input type="hidden" id="id" value="${department.id }" name="department.id" />
	<input type="hidden" id="hiddenDepartmentName" value="${department.departmentName }" name="hiddenDepartmentName" />
		
		<div class="cell">
			<table border="0" cellpadding="0" cellspacing="0">
		       <tr>
		        	<th><span style="color: red;">*</span>功能名称：</th>
		            <td><input type="text" id="departmentName" value="${department.departmentName }" name="department.departmentName" class="form_text" maxlength="25" reg="Require" tip="请填写系部名称" /></td>
		       </tr> 
		       <tr>
		        	<th>功能编码：</th>
		            <td><input type="text" value="${department.departmentCode }" name="department.departmentCode" class="form_text" maxlength="25"/></td>
		       </tr>
		       <tr>
		       		<th>排序号：</th>
		            <td><input type="text" value="${department.sn }" name="department.sn" class="form_text"  reg="NullOrNum" tip="请填写数字格式的排序号" /></td>
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