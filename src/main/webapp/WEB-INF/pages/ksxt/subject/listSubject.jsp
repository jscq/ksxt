<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<%@include file="/common/common.jsp" %>
	<script type="text/javascript" src="<%=basePath%>/resources/js/ksxt/subject/subject.js"></script>
</head>
<body>
<!-- 防止CSRF攻击，必须在请求中添加 -->
<div style="overflow: auto">
<div id="tb" style="padding:2px 5px;" class="top_search">
	<form class="searchForm" id="searchForm" method="post">
		<div class="cell">
	       	<table border="0" cellpadding="0" cellspacing="0">
	           <tr>
	           	 <th width="10%">试题名称：</th>
	             <td width="23%">
					<input onkeydown="if(event.keyCode==13){event.keyCode=0;return false}" type="text" id="itemBankName" name="itemBank.itemBankName" class="form_text" style="width:245px;"/>
	             </td>
	             
	           	 <th width="10%">所属题库：</th>  
	             <td width="23%">
	             	<select style="width:80%" id="itemBankStatus" name="itemBank.itemBankStatus">
	             		<option value="">--请选择--</option>
             			<c:forEach items="${listItemBank}" var="itemBank" > 
			       	 		<option value="${itemBank.id}">--${itemBank.itemBankName}--</option>
			       		</c:forEach> 
	             	</select>
	             </td>
	             
	             <th width="10%">试题类型：</th>
	             <td width="23%">
	             	<select style="width:80%" id="itemBankStatus" name="itemBank.itemBankStatus">
	             		<option value="">--请选择--</option>
             			<c:forEach items="${listSubjectType}" var="subjectType" >  
			       	 		<option value="${subjectType.codeValue}">--${subjectType.codeName}--</option>
			       		</c:forEach> 
	             	</select>
				 </td>
	           </tr>
	           
	            <tr>
	           	 <th width="10%">试题难度：</th>
	             <td width="23%">
					 <select style="width:80%" id="itemBankStatus" name="itemBank.itemBankStatus">
	             		<option value="">--请选择--</option>
             			<c:forEach items="${listSubjectDifficully}" var="subjectDifficully" >  
			       	 		<option value="${subjectDifficully.codeValue}">--${subjectDifficully.codeName}--</option>
			       		</c:forEach> 
	             	</select>	
	             </td>
	             
	           	 <th width="10%">试题状态：</th>  
	             <td width="23%">
	             	<select style="width:80%" id="itemBankStatus" name="itemBank.itemBankStatus">
	             		<option value="">--请选择--</option>
             			<c:forEach items="${listSubjectStatus}" var="subjectStatus" >  
			       	 		<option value="${subjectStatus.codeValue}">--${subjectStatus.codeName}--</option>
			       		</c:forEach> 
	             	</select>
	             </td>
	           </tr>
	           
	       	</table>
     	</div>
		<ul>
			<li class="top_search_libtn">
				<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="searchItemBank();">查询</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="resetSearchFrom(searchForm)">清空</a>
			</li>
		</ul>
	</form>
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="add('<%=basePath%>/itemBank/addItemBank','添加题库信息',550,400)" plain="true">添加</a>
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
		title:'试题管理', //标题
		method:'post',
		iconCls:'icon-search', //图标
		singleSelect:false, //多选
		height:winHeight, //高度
		fitColumns: true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
		striped: true, //奇偶行颜色不同
		cache: false,
		remoteSort: false,
		url:"<%=basePath%>/subject/listJson?"+parameterName+"="+token+"&time="+new Date(), //数据来源
		queryParams:{
			'itemBank.itemBankName':$('#itemBankName').val(), // 题库名称
			'itemBank.itemBankStatus':$('#itemBankStatus').val() // 题库状态
		}, //查询条件
		pagination:true, //显示分页
		rownumbers:true, //显示行号
		pageSize:10,
		pageList:[10,15,20],
		columns:[[
			{field:'ck',checkbox:true,width:'2%',styler:function(value,rowData,rowIndex){
				
				return "height:35px;";
			}}, //显示复选框
			{field:'itemBankName',title:'所属题库',width:'10%',sortable:true},
			{field:'subjectType',title:'试题类型',width:'10%',sortable:true},
			{field:'subjectDifficully',title:'试题难度',width:'10%',sortable:true},
			{field:'subjectStatus',title:'试题状态',width:'10%',sortable:true},
			{field:'subjectContent',title:'试题题干',width:'25%',sortable:true},
			{field:'createUser',title:'创建人',width:'10%',sortable:true},
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