<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<%@include file="/common/common.jsp" %>
	<script type="text/javascript" src="<%=basePath%>/resources/js/edu/student/student.js"></script>
</head>
<body>
<!-- 防止CSRF攻击，必须在请求中添加 -->
<div style="overflow: auto">
<div id="tb" style="padding:2px 5px;" class="top_search">
	<form class="searchForm" id="searchForm" method="post">
		<div class="cell">
	       	<table border="0" cellpadding="0" cellspacing="0">
	           <tr>
	           	 <th width="10%">工号：</th>
	             <td width="23%">
					<input onkeydown="if(event.keyCode==13){event.keyCode=0;return false}" type="text" id="majorName" name="major.majorName" class="form_text" style="width:245px;"/>
	             </td>
	             
	             <th width="10%">姓名：</th>
	             <td width="23%"><input onkeydown="if(event.keyCode==13){event.keyCode=0;return false}" id="majorCode" name="major.majorCode" class="form_text" maxlength="50"/></td>
	           	 
	           	 <th width="10%">所属系部：</th>  
	             <td width="23%">
	             	<select style="width:80%" id="departmentId" name="major.department.id">
	             		<option value="">--请选择--</option>
	             		
	             		<c:forEach items="${departmentList}" var="department" >  
				       	 	<option value="${department.id}">--${department.departmentName}--</option>
				        </c:forEach>  
	             		
	             	</select>
	             </td>
	           </tr>
	       	</table>
     	</div>
		<ul>
			<li class="top_search_libtn">
				<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="searchTeacher();">查询</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="resetSearchFrom(searchForm)">清空</a>
			</li>
		</ul>
	</form>
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="add('<%=basePath%>/student/addStudentPage','添加学生',850,500)" plain="true">添加</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="edit();" plain="true">编辑</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="del('${_csrf.parameterName}','${_csrf.token}');" plain="true">删除</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="del('${_csrf.parameterName}','${_csrf.token}');" plain="true">导入</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="del('${_csrf.parameterName}','${_csrf.token}');" plain="true">导出</a>
</div>
<table id="dg"></table>
</div>
</body>
<script>
$(function(){
	
	//去除回车键
	document.onkeydown=function(evt){
		if(evt.keyCode ==13){
			return;
		}
	};
	
	var parameterName = '${_csrf.parameterName}';
	var token = '${_csrf.token}';
	var winHeight = $(window).height();
	$('#dg').datagrid({
		title:'学生管理', //标题
		method:'post',
		iconCls:'icon-search', //图标
		singleSelect:false, //多选
		height:winHeight, //高度
		fitColumns: true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
		striped: true, //奇偶行颜色不同
		cache: false,
		remoteSort: false,
		url:"<%=basePath%>/major/listMajorJson?"+parameterName+"="+token+"&time="+new Date(), //数据来源
		queryParams:{
			'major.majorName':$('#majorName').val(), // 专业名称
			'major.majorCode':$('#majorCode').val(), // 专业编码
			'major.department.id':$('#departmentId').val() // 系部
		}, //查询条件
		pagination:true, //显示分页
		rownumbers:true, //显示行号
		pageSize:10,
		pageList:[10,15,20],
		columns:[[
			{field:'ck',checkbox:true,width:'2%',styler:function(value,rowData,rowIndex){
				
				return "height:35px;";
			}}, //显示复选框
			{field:'majorName',title:'工号',width:'15%',sortable:true},
			{field:'majorCode',title:'真实姓名',width:'10%',sortable:true},
			{field:'departmentName',title:'性别',width:'10%',sortable:true},
			{field:'sn',title:'生日',width:'10%',sortable:true,formatter:formatterDateByM},
			{field:'sn',title:'联系电话',width:'10%',sortable:true},
			{field:'sn',title:'家庭地址',width:'20%',sortable:true},
			{field:'sn',title:'所属系部',width:'20%',sortable:true}
		]],
		toolbar:'#tb',
		onLoadSuccess:function(){
			$('#dg').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
		}
	});
});

$(window).resize(function(){
    $('#dg').datagrid('resize',{
    	width:'100%'
    });
});

</script>
</html>