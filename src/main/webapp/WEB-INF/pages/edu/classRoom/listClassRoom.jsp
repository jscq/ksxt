<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<%@include file="/common/common.jsp" %>
	<script type="text/javascript" src="<%=basePath%>/resources/js/edu/classRoom/classRoom.js"></script>
</head>
<body>
<!-- 防止CSRF攻击，必须在请求中添加 -->
<div style="overflow: auto">
<div id="tb" style="padding:2px 5px;" class="top_search">
	<form class="searchForm" id="searchForm" method="post">
		<div class="cell">
	       	<table border="0" cellpadding="0" cellspacing="0">
	           <tr>
	           	 <th width="10%">入学年份：</th>
	             <td width="23%">
					<select name="year" id="year" style="width:90%">
             			<option value="">--请选择--</option>
             		
             			<c:forEach items="${codeList}" var="code" >  
			       	 		<option value="${code.codeValue}">--${code.codeName}--</option>
			       		</c:forEach>  
             		
             		</select>
	             </td>
	             <th width="10%">系部名称：</th>
	             <td width="23%">
	             	<select name="major.department.id" id="departmentId" style="width:90%" onChange="changeMajor(this.value)">
             			<option value="">--请选择--</option>
             		
             			<c:forEach items="${departmentList}" var="department" >  
			       	 		<option value="${department.id}">--${department.departmentName}--</option>
			       		</c:forEach>  
             		
             		</select>
	             </td>
	           </tr>
	           <tr>
	           	 <th width="10%">专业名称：</th>
	             <td width="23%">
					<select name="major.id" id="majorSelect" style="width:90%">
             			<option value="">--请选择--</option>
             		</select>
	             </td>
	             <th width="10%">班级名称：</th>
	             <td width="23%"><input onkeydown="if(event.keyCode==13){event.keyCode=0;return false}" id="classRoomName" name="classRoom.classRoomName" class="form_text" maxlength="50"/></td>
	           </tr>
	       	</table>
     	</div>
		<ul>
			<li class="top_search_libtn">
				<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="searchClassRoom();">查询</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="resetSearchFrom(searchForm)">清空</a>
			</li>
		</ul>
	</form>
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="add('<%=basePath%>/classRoom/addClassRoomPage','添加班级信息',850,500)" plain="true">添加</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="edit();" plain="true">编辑</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="del('${_csrf.parameterName}','${_csrf.token}');" plain="true">删除</a>
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
		title:'班级管理', //标题
		method:'post',
		iconCls:'icon-search', //图标
		singleSelect:false, //多选
		height:winHeight, //高度
		fitColumns: true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
		striped: true, //奇偶行颜色不同
		cache: false,
		remoteSort: false,
		url:"<%=basePath%>/classRoom/listClassRoomJson?"+parameterName+"="+token+"&time="+new Date(), //数据来源
		queryParams:{
			'classRoom.year':$('#year').val(), // 入学年份
			'classRoom.major.department.id':$('#departmentId').val(), // 系部名称
			'classRoom.major.id':$('#majorSelect').val(), // 专业名称
			'classRoom.classRoomName':$('#classRoomName').val() // 班级名称
		}, //查询条件
		pagination:true, //显示分页
		rownumbers:true, //显示行号
		pageSize:10,
		pageList:[10,15,20],
		columns:[[
			{field:'ck',checkbox:true,width:'2%',styler:function(value,rowData,rowIndex){
				
				return "height:35px;";
			}}, //显示复选框
			{field:'year',title:'入学年份',width:'15%',sortable:true},
			{field:'departmentName',title:'系部名称',width:'15%',sortable:true},
			{field:'majorName',title:'专业名称',width:'15%',sortable:true},
			{field:'classRoomName',title:'班级名称',width:'15%',sortable:true},
			{field:'allName',title:'全称',width:'15%',sortable:true},
			{field:'createTime',title:'创建时间',width:'15%',sortable:true,formatter:formatterDateByM}
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