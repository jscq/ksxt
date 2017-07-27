<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<%@include file="/common/common.jsp" %>
	<script type="text/javascript" src="<%=basePath%>/resources/js/ksxt/subject/subject.js"></script>
</head>
<body style="background-color: #fff">
	<div class="wrap_form_middle_right">
	<div class="adjust_box" style="height:320px;">
	<div class="box_inner">
	
	<form class="registerform" id="registerForm" method="post">
	
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="parameterName" id="parameterName" value="${_csrf.parameterName}" />
		<input type="hidden" name="token" id="token" value="${_csrf.token}" />
		
		<div class="cell">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
		        	<th style="width:15%;"><span style="color: red;">*</span>题库名称：</th>
		            <td style="width:35%;"><input type="text" id="itemBankName" name="itemBank.itemBankName" onblur="verifyItemBankName()" class="form_text" maxlength="25" reg="Require" tip="请填写题库名称"/></td>
		       </tr> 
		       <tr>
		        	<th>题库图标：</th>
		            <td><input type="text" name="itemBank.icon" id="icon" class="form_text" maxlength="25"  reg="Require" tip="请填写专业编码"/></td>
		       </tr>
		       <tr>
		        	<th>状态：</th>
		            <td>
		            	<select name="itemBank.itemBankStatus" style="width:90%">
	             			<option value="">--请选择--</option>
	             			<c:forEach items="${listCode}" var="itemBankStatus" >  
				       	 		<option value="${itemBankStatus.codeValue}">--${itemBankStatus.codeName}--</option>
				       		</c:forEach>  
	             		</select>
		            </td>
		       </tr>
		       <tr>
		       		<th>题库说明：</th>
		            <td><input type="text" name="itemBank.remark"  class="form_text" maxlength="100" /></td>
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