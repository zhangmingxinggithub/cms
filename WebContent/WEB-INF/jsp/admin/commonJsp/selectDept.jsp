<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
$(function(){
    $('#TbsDepartMentGrid').datagrid({
		url:'${demoPath}admin/TbsDepartMent/data.html',
		singleSelect:true,
		columns:[ [
		{field:'id',title:'',hidden:false,width:'35',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
		    return "<input type='radio' id='radio1' name='radio1' value="+row.id+"/>";
		}}	,
		{field:'name',title:'部门名称',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
		    return value;
		}},
		{field:'pname',title:'上级部门',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
		    return value;
		}}	
		,
		{field:'code',title:'部门代码',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
		    return value;
		}}
		,
		{field:'address',title:'部门地址',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
		    return value;
		}},
		{field:'des',title:'描述信息',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
		    return value;
		}}
		] ]

    });
    // 加载数据
    $('#TbsDepartMentGrid').datagrid('load', {});
});

</script>

<div class="easyui-layout" style="width: 100%; height: 100%;">
	<div data-options="region:'west',split:true,isonCls:'icon-save',
		                 tools:[{
		                     iconCls : 'icon-reload',
		                     handler : function() {
		                        $('#depttree1').tree('reload');
		                     }
		                 }]" title="部门管理" style="width:194px;">
	     <div title="TbsDepartMent">
             <ul id="depttree1" class="easyui-tree" data-options="
					url:'${demoPath}/admin/TbsDepartMent/json.html' ,
					onClick: function(node) {
					    $('#TbsDepartMentGrid').datagrid('options').pageNumber=1;
					    $('#TbsDepartMentGrid').datagrid('reload',{
			        		pid: node.id
			        	});}" />
		 </div>
	</div>
	<div data-options="region:'center',title:'部门',iconCls:'icon-ok'">
			<table id="TbsDepartMentGrid"/>
	</div>
</div>