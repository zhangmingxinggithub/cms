<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>人力资源管理系统</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="This is my page" />
<!-- easyui-->
<script type="text/javascript"
	src="${demoPath}static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="${demoPath}static/js/easyui/jquery.easyui.min.js"></script>
<link id="easyuiTheme" rel="stylesheet" type="text/css"
	href="${demoPath}static/js/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${demoPath}static/js/easyui/themes/icon.css" />
	
<!-- common-->
<script type="text/javascript" src="${demoPath}static/js/util.js"></script>
<script type="text/javascript">


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
	
	
	$(function(){
	    $('#btn').bind('click', function(){
			var treeid = $('#treeid').val();
			var obj = {"treeid":treeid,searchType:1}
			$('#DictTypeGrid').datagrid('options').pageNumber=1;
			$('#DictTypeGrid').datagrid('reload',obj);
	    });
	    
	    $('#DictTypeGrid').datagrid({
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
	    })
	});
</script>
</head>
<body id="body" class="easyui-layout">
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
		<div id="DictTypeGridToolbar">
			<div style="margin-bottom:5px">
				<c:forEach items="${buttons}" var="button">
			         ${button}
			    </c:forEach>
				</div>
		</div>
		<!-- datagrid toolbar -->
		<table id="DictTypeGrid"  class="easyui-datagrid"></table>
	</div>
	</body>
</html>
