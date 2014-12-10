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
<script type="text/javascript">

    var sid="";
    var sname="";
    function init(id,name){
    	if(id!="-1"){
    		sid=id;
        	sname=name;
        	$('#TbsDepartMentGrid').datagrid('reload',{
        		pid: id
        	});
    	}else{
    		sid="";
        	sname="";
    		$('#TbsDepartMentGrid').datagrid('reload',{
        		pid: ''
        	});
        }
    	
    }
	//Add and Edit
	function testGridAddAndEdit(title, url, type) {
		if (type == 1) { //edit
			var rows = $('#TbsDepartMentGrid').datagrid('getSelections');
			if (rows.length != 1) {
				$.messager.alert('消息', '请钩择一行数据!', 'info');
				return;
			}
		}
		$('<div/>').dialog({
			href : '${demoPath}admin/TbsDepartMent/baseDlg.html',
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
					testGridSubmit(url);
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
				if (type == 0) {
					//$('#testFm').form('clear');
					//赋值--左边树
					$('#testFm').form('load',{pid:sid});
					$('#testFm').form('load',{pname:sname});
				} else {
					var rows = $('#TbsDepartMentGrid').datagrid('getSelections');
					if (rows.length == 1) {
						$('#testFm').form('load', rows[0]);
					} else {
						$.messager.alert('消息', '请钩择一行数据!', 'info');
					}
				}
			}
		});
	}
	
	//Del
	function testGridDel() {
		var rows = $('#TbsDepartMentGrid').datagrid('getSelections');
		if (rows.length > 0) {
		    var ids = '';
			for ( var i = 0; i < rows.length; i++) {
						ids += 'ids=' + rows[i].id + '&';
			}
			ids = ids.substring(0, ids.length - 1);
			var url = '${demoPath}admin/TbsDepartMent/del.html?' + ids;
			$.messager.confirm('Confirm','确定要删除选择的数据吗?', function(r) {
				if (r) {
				    $.get(url, function(result){
						if (result.success){ 
							$('#TbsDepartMentGrid').datagrid('reload');
							$('#TbsDepartMentGrid').datagrid('clearSelections');
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
	function testGridReload() {
		$('#TbsDepartMentGrid').datagrid('options').pageNumber=1;
		$('#TbsDepartMentGrid').datagrid('reload',{});
	}
	
	//testGridSubmit  submit
	function testGridSubmit(url) {
		var demoPath = ${demoPath};
	    $('#testFm').form('submit',{  
	        url: demoPath+url,  
	        onSubmit: function(){  
	            return $(this).form('validate');  
	        },  
	        success: function(result){  
	            var result = eval('('+result+')');  
	            if (result.success){  
	                $('#testDlg').dialog('close');      // close the dialog 
					$('#TbsDepartMentGrid').datagrid('reload');    // reload the user data
					$('#depttree').tree('reload');
	            } else {   
	            	$.messager.show({ title: 'Error',msg: result.msg }); 
	            }  
	        }  
	    });
	}
	
	//高级搜索 del row
	function testSearchRemove(curr) {
		if ($(curr).closest('table').find('tr').size() > 2) {
			$(curr).closest('tr').remove();
		} else {
			alert('该行不允许删除');
		}
	}
	
	//高级查询
	function testSearch() {
		$('<div/>').dialog({
			href : '${demoPath}admin/TbsDepartMent/searchDlg.html',
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
					$('#TbsDepartMentGrid').datagrid('options').pageNumber=1;
					$('#TbsDepartMentGrid').datagrid('reload',serializeObjectEx($('#testSearchFm')));
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
	function testGridExport(){
		window.location="${demoPath}admin/TbsDepartMent/export.html";
		//var panel=$('#tbcTempGrid').datagrid('getPanel');
		//var options=panel.panel('options');
		//alert(options.method);
		//console.dir(options);
	}
	
	//导入
	function testGridImport(){
		$('<div/>').dialog({
			href : '${demoPath}admin/TbsDepartMent/importDlg.html',
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
			var data1 = $('#name').val();
			var obj = {"name":data1,searchType:1}
			$('#TbsDepartMentGrid').datagrid('options').pageNumber=1;
			$('#TbsDepartMentGrid').datagrid('reload',obj);
	    });
	    
	    
	    $('#TbsDepartMentGrid').datagrid({
			url:'${demoPath}admin/TbsDepartMent/data.html',
			frozenColumns : [ [ {field : 'ck',checkbox : true}] ],
			columns:[ [  
			{field:'id',title:'部门id',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
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
			] ],
			toolbar:'#TbsDepartMentGridToolbar'
	    });
	    $('#TbsDepartMentGrid').datagrid('load', {});
	});
</script> 
 </head>
<body id="body" class="easyui-layout">
   <div class="easyui-layout" style="width:100%;height:100%;">
		<div data-options="region:'west',split:true,isonCls:'icon-save',
			                 tools:[{
			                     iconCls : 'icon-reload',
			                     handler : function() {
			                        $('#depttree').tree('reload');
			                     }
			                 }]" title="部门管理" style="width:194px;">
               <div title="TbsDepartMent">
              <ul id="depttree" class="easyui-tree" data-options="
					url:'${demoPath}/admin/TbsDepartMent/json.html', 
					onSelect : function(node) {
					   init(node.id,node.text);
					}
				"/>
             </div>
		</div>
		<div data-options="region:'center',title:'部门管理',iconCls:'icon-ok'">
		      <!-- 查询条件-->
			<div  class="easyui-panel" title="查询"
				style="padding: 10px;" data-options="collapsible:true">
				<table>
					<tr>
						<td>
							<label>
								部门名称:
							</label>
						</td>
						<td>
							<input id="name" name="name" class="easyui-validatebox"
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
			<div id="TbsDepartMentGridToolbar">
				<div style="margin-bottom:5px">
					<c:forEach items="${buttons}" var="button">
				         ${button}
				    </c:forEach>
			    </div>
			</div>
			<!-- datagrid toolbar -->
			<table id="TbsDepartMentGrid"  class="easyui-datagrid"></table>
		</div>
	</div>
    
</body>
</html>
