<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<%@include file="/common/common.jsp" %>
	<script type="text/javascript" src="<%=basePath%>/resources/js/edu/teacher/teacher.js"></script>
</head>
<body style="background-color: #fff">
	<div class="wrap_form_middle_right">
	<div class="adjust_box" style="height:395px;">
	<div class="box_inner">
		<form id="commissionerForm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="parameterName" id="parameterName" value="${_csrf.parameterName}" />
		<input type="hidden" name="token" id="token" value="${_csrf.token}" />
		<input type="hidden" id="memberUnitId" name="commissioner.memberUnit.id" value="${memberUnitId }"/>
		
		<input type='hidden' id='attachmentName' name='attachmentName'/>
		<input type='hidden' id='attachmentPath' name='attachmentPath'/>
		<input type='hidden' id='documentName' name='documentName' />
		
			<div class="cell">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
		        	<th width="12%"><span class="red">*</span>姓名：</th>
		            <td width="21%"><input type="text" id="commissionerName" name="commissioner.commissionerName" class="form_text" reg="Require" tip="请填写姓名" placeholder="请填写姓名" maxlength="25"/></td>
					
					<th width="12%">性别：</th>
		            <td width="21%">
	            		男<input type="radio" value="1" name="commissioner.gender" checked/>
						女<input type="radio" value="2" name="commissioner.gender" />
					</td>
		            <th width="12%" rowspan="4">照片：</th>
		            <td width="21%" rowspan="4" align="center">
		            	<span id="picSpan"></span>
		            	<span id="buttonSpan">
		            		<a href="javascript:showWinPic()" style="color:blue;">上传图片</a>
		            	</span>
		            </td>
		       </tr> 
		       <tr>
		      		<th width="12%">民族：</th>
		            <td width="21%">
						<input type="text" name="commissioner.nation" class="form_text" placeholder="请填写民族" maxlength="50" />
					</td>
					
		       		<th width="12%">出生年月：</th>
		            <td width="21%"><input class='Wdate' id="birthDate" name="commissioner.birthDate" type='text' class="form_text" placeholder="请选择出生年月" style="width:160px;" onClick='WdatePicker()' readonly="readonly"/></td>
		       </tr>
		       <tr>
		            <th width="12%">身份证号：</th>
		            <td width="21%"><input type="text" name="commissioner.idCard" class="form_text" reg="NullOrIdCard" tip="身份证号格式错误，请重新填写" placeholder="请填写身份证号码" maxlength="18"/></td>
		       
		       		<th width="12%">邮箱：</th>
		            <td width="21%"><input type="text" name="commissioner.email" class="form_text" reg="NullOrEmail" tip="邮箱格式错误，请重新填写" placeholder="请填写邮箱" maxlength="50"/></td>
		       </tr>
		       <tr>
		       		<th width="12%"><span class="red">*</span>手机号码：</th>
		            <td width="21%"><input type="text" name="commissioner.mobile" class="form_text" reg="Mobile" tip="请填写正确格式的手机号码" placeholder="请填写手机号" maxlength="20"/></td>
		            
		            <th width="12%">联系电话：</th>
		            <td width="21%"><input type="text" name="commissioner.phone" class="form_text" reg="NullOrPhone" tip="联系电话格式错误，请重新填写" placeholder="请填写联系电话" maxlength="20"/></td>
		       </tr>
		       <tr>
		       		<th width="12%">学历：</th>
		            <td width="21%">
						<select id="education" name="commissioner.education" class="form_text" placeholder="请选择学历"></select>
					</td>
					
		       		<th width="12%">政治面貌：</th>
		            <td width="21%">
						<select id="politicsStatus" name="commissioner.politicsStatus" class="form_text" placeholder="请选择政治面貌"></select>
					</td>
					
					<th width="12%">家庭地址：</th>
		            <td width="21%"><input type="text" name="commissioner.homeAddress" class="form_text" maxlength="100" placeholder="请填写详细家庭住址"/></td>
		       </tr>

		   	</table>
		   	</div>
		   	</form>
		   	<div class="box_03">
	        	<div class="box_inner_03">
	        		<div class="btn_area_setl btn_area_bg">
	        			<a href="#" onclick="saveCommissioner('commissionerForm','${_csrf.parameterName}','${_csrf.token}')" class="btn_01">保存教师信息<b></b></a>
	    				<a href="#" onclick="closeWinForm();" class="btn_01">取消<b></b></a>
	        		</div>
	        	</div>
	        </div>
		</div>
		</div>
	</div>
	
	<div id="showPic" class="easyui-window" style="width: 400px;height: 200px;text-align:center;padding-top:20px;">
		<form id='uploadForm' action='<%=basePath%>/uploadFile/uploadPicMethod?picPath=commissionerUploadPic&${_csrf.parameterName}=${_csrf.token}' method='POST' enctype='multipart/form-data'>
			<table class="cell" >
				<tr>
					<th style="text-align: left;" colspan="2">
						<span style="vertical-align:middle;color:red;">（图片格式如下：jpg、jpeg、gif、png、bmp，大小不超过5M）</span>
					</th>
				</tr>
				<tr>
					<th  style="width:25%;text-align: right;">上传图片：</th>
					<td  style="width:75%;">
						<input id='uploadId' name='file' type='file' style='width:100%;' onchange='savePic(this)'/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<script type="text/javascript">
		$(function(){
			//初始化学历下拉框
			initSelectCode('education','education');
			//初始化政治面貌下拉框
			initSelectCode('politicsStatus','politicsStatus');
		
			$('#showPic').window('close');
		});
	</script>
</body>
</html>