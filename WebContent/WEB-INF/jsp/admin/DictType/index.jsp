<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">

$(function(){
    $('#btn').bind('click', function(){
		var treeid = $('#treeid').val();
		var obj = {"treeid":treeid,searchType:1}
		$('#DictTypeGrid').datagrid('options').pageNumber=1;
		$('#DictTypeGrid').datagrid('reload',obj);
    });
});
	//Add and Edit
	function DictTypeGridAddAndEdit(title, url, type) {
		if (type == 1) { //edit
			var rows = $('#DictTypeGrid').datagrid('getSelections');
			if (rows.length != 1) {
				$.messager.alert('消息', '请钩择一行数据!', 'info');
				return;
			}
		}
		$('<div/>').dialog({
			href : '${demoPath}admin/DictType/baseDlg.html',
			modal : true,
			title : title,
			top : '15%',
			left : '30%',
			width : 600,
			resizable:true,
			buttons : [ {
				text : '确定',
				iconCls : 'icon-ok',
				handler : function() {
					DictTypeGridSubmit(url);
					$(this).closest('.window-body').dialog('destroy');
				}
			}, {
				text : '取消',
				iconCls : 'icon-cancel',
				handler : function() {
					$(this).closest('.window-body').dialog('destroy');
				}
			} ],
			onClose : function() {
				$(this).dialog('destroy');
			},
			onLoad : function() {
				if (type == 0) {    //新增
					$('#DictTypeFm').form('clear');
				} else {    // 编辑
					var rows = $('#DictTypeGrid').datagrid('getSelections');
					if (rows.length == 1) {
						$('#DictTypeFm').form('load', rows[0]);
					} else {
						$.messager.alert('消息', '请钩择一行数据!', 'info');
					}
				}
			}
		});
	}
	
	//Del
	function DictTypeGridDel() {
		var rows = $('#DictTypeGrid').datagrid('getSelections');
		if (rows.length > 0) {
		    var ids = '';
			for ( var i = 0; i < rows.length; i++) {
						ids += 'ids=' + rows[i].id + '&';
			}
			ids = ids.substring(0, ids.length - 1);
			var url = '${demoPath}admin/DictType/del.html?' + ids;
			$.messager.confirm('Confirm','确定要删除选择的数据吗?', function(r) {
				if (r) {
				    $.get(url, function(result){
						if (result.success){ 
							$('#DictTypeGrid').datagrid('reload');
							$('#DictTypeGrid').datagrid('clearSelections');
						} else {  
						    $.messager.show({ title: 'Error', msg : result.msg }); 
						} 
				    }, 'json');
				}
			});
		} else {
			$.messager.alert('消息', '请选择要删除的数据!','info');
		}
	}
	
	//Reload
	function DictTypeGridReload() {
		$('#DictTypeGrid').datagrid('options').pageNumber=1;
		$('#DictTypeGrid').datagrid('reload',{});
	}
	
	//DictTypeGridSubmit  submit
	function DictTypeGridSubmit(url) {
	    $('#DictTypeFm').form('submit',{  
	        url: url,  
	        onSubmit: function(){  
	            return $(this).form('validate');  
	        },  
	        success: function(result){  
	            var result = eval('('+result+')');  
	            if (result.success){  
	                $('#DictType').dialog('close');      // close the dialog 
					$('#DictTypeGrid').datagrid('reload');    // reload the user data
	            } else {  
	            	$.messager.show({ title: 'Error',msg: result.msg }); 
	            }  
	        }  
	    });
	}
	
	//高级搜索 del row
	function tbsUserSearchRemove(curr) {
		if ($(curr).closest('table').find('tr').size() > 2) {
			$(curr).closest('tr').remove();
		} else {
			alert('该行不允许删除');
		}
	}
	
	//高级查询
	function tbsUserSearch() {
		$('<div/>').dialog({
			href : '${demoPath}admin/DictType/searchDlg.html',
			modal : true,
			title : '高级查询',
			top : 120,
			width : 480,
			buttons : [ {
				text : '增加一行',
				iconCls : 'icon-add',
				handler : function() {
					var currObj = $(this).closest('.panel').find('table');
					currObj.find('tr:last').clone().appendTo(currObj);
					//currObj.find('tr:last td *[disabled]').removeAttr("disabled");
				}
			}, {
				text : '确定',
				iconCls : 'icon-ok',
				handler : function() {
					$('#DictTypeGrid').datagrid('options').pageNumber=1;
					$('#DictTypeGrid').datagrid('reload',serializeObjectEx($('#tbsUserSearchFm')));
				}
			}, {
				text : '取消',
				iconCls : 'icon-cancel',
				handler : function() {
					$(this).closest('.window-body').dialog('destroy');
				}
			} ],
			onClose : function() {
				$(this).dialog('destroy');
			}
		});
	}
	
	//导出
	function DictTypeGridExport(){
		window.location="${demoPath}admin/DictType/export.html";
		//var panel=$('#tbcTempGrid').datagrid('getPanel');
		//var options=panel.panel('options');
		//alert(options.method);
		//console.dir(options);
	}
	
	//导入
	function DictTypeGridImport(){
		$('<div/>').dialog({
			href : '${demoPath}admin/DictType/importDlg.html',
			modal : true,
			title : '导入',
			top : '15%',
			left : '30%',
			width : 600,
			height: 300,
			resizable:true,
			buttons : [ {
				text : '确定',
				iconCls : 'icon-ok',
				handler : function() {
					//$(this).closest('.window-body').dialog('destroy');
				}
			}, {
				text : '取消',
				iconCls : 'icon-cancel',
				handler : function() {
					$(this).closest('.window-body').dialog('destroy');
				}
			} ],
			onClose : function() {
				$(this).dialog('destroy');
			},
			onLoad : function() {
				
			}
		});
	}
	
</script>
    

	<!-- 中  datagrid-->
    <div data-options="region:'center',border : false">
          <!-- 查询条件-->
		<div id="search" class="easyui-panel" title="查询"
			style="padding: 10px;" data-options="collapsible:true">
			<table>
				<tr>
					<td>
						<label>
							数据类型:
						</label>
					</td>
					<td>
						<input id="treeid" name="treeid" class="easyui-validatebox"
							type="text" />
					</td>
					<td>
						<a id="btn" href="javascript:void(0)" class="easyui-linkbutton"
							data-options="iconCls:'icon-search'">查询</a>
					</td>
				</tr>
			</table>
		</div>
		<!-- datagrid toolbar -->
		<table id="DictTypeGrid"  class="easyui-datagrid" data-options="	
			url:'${demoPath}admin/DictType/data.html',
			frozenColumns : [ [ {field : 'ck',checkbox : true}] ],
			columns:[ [  
			{field:'id',title:'主键',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			
			{field:'treeid',title:'数据类型',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			
			{field:'name',title:'类型名字',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			
			{field:'des',title:'类型描述',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}}
			] ],
			toolbar:'#DictTypeGridToolbar'
		"/>
		
		<!-- datagrid toolbar -->
		<div id="DictTypeGridToolbar">
			<div style="margin-bottom:5px">
				<c:forEach items="${buttons}" var="button">
			         ${button}
			    </c:forEach>
				<%-- 
				<a href="javascript:void(0)" onclick="javascript:DictTypeGridAddAndEdit('添加  tbsUser','${demoPath}admin/DictType/add.html',0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a>
				<a href="javascript:void(0)" onclick="javascript:DictTypeGridAddAndEdit('修改  tbsUser','${demoPath}admin/DictType/save.html',1)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'">编辑 </a>  
				<a href="javascript:void(0)" onclick="javascript:DictTypeGridDel()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'">删除</a>
				<a href="javascript:void(0)" onclick="javascript:DictTypeGridReload()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">刷新</a>
				<a href="javascript:void(0)" onclick="javascript:DictTypeGridExport()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">导出</a>
				<a href="javascript:void(0)" onclick="javascript:DictTypeGridImport()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">导入</a>
				
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-undo'">后退</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-redo'">前进</a>
				--%>
				<!-- DictTypeGridToolbarSearch -->
				<!-- <input class="easyui-searchbox" data-options="
					menu :'#DictTypeGridToolbarSearch',
					prompt :'模糊查询',
					searcher : function(value,name){
						var str='{searchType:1,'+name+':\''+value+'\'}';
				        var obj = eval('('+str+')');
				        $('#DictTypeGrid').datagrid('options').pageNumber=1;
						$('#DictTypeGrid').datagrid('reload',obj);
					}
				"/> -->
				<!-- <div id="DictTypeGridToolbarSearch">
				  <div name="name">类型名字</div>
				</div> -->
		</div>
	</div>
<!--  <div>-->