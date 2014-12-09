<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">





var sid="";
var sname="";
function init(id,name){
	if(id!="-1"){
		sid=id;
    	sname=name;
    	$('#DictDataGrid').datagrid('reload',{
    		parentnodeid: id
    	});
	}else{
		sid="";
    	sname="";
		$('#DictDataGrid').datagrid('reload',{
			parentnodeid: ''
    	});
    }
	
}
	//Add and Edit
	function DictDataGridAddAndEdit(title, url, type) {
		if (type == 1) { //edit
			var rows = $('#DictDataGrid').datagrid('getSelections');
			if (rows.length != 1) {
				$.messager.alert('消息', '请钩择一行数据!', 'info');
				return;
			}
		}
		$('<div/>').dialog({
			href : '${demoPath}admin/DictData/baseDlg.html',
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
					DictDataGridSubmit(url);
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
					//$('#DictDataFm').form('clear');
					//赋值--左边树
					$('#DictDataFm').form('load',{parentnodeid:sid});
					$('#DictDataFm').form('load',{data2:sname});
					
				 	$('#DictDataJoinDictData').combogrid({
						url : '${demoPath}admin/DictType/data.html?t='+ Math.random(),
						panelWidth : 400,
						textField : 'name',
						idField:'treeid',
						multiple:false, //只能单选
						frozenColumns : [ [ {field : 'ck',checkbox : true}] ],
						columns:[ [  
				                //{field:'id',title:'主键',width:100},
				                {field:'treeid',title:'数据类型',width:150},
				                {field:'name',title:'数据名称',width:150}
				        ] ]
					});
				} else {    // 编辑
					var rows = $('#DictDataGrid').datagrid('getSelections');
					if (rows.length == 1) {
						 $('#DictDataJoinDictData').combogrid({
							url : '${demoPath}admin/DictType/data.html',
							panelWidth : 460,
							textField : 'name',
							idField:'treeid',
							multiple:false, //只能单选
							frozenColumns : [ [ {field : 'ck',checkbox : true}] ],
							columns:[ [  
						             //{field:'id',title:'主键',width:100},
					                {field:'treeid',title:'数据类型',width:150},
					                {field:'name',title:'数据名称',width:150}
						    ] ],
						    onLoadSuccess:function(data){
						    	 $.getJSON('${demoPath}admin/DictType/data.html?treeid='+rows[0].treeid,function(data){
						    		var roleUserRows=data.rows;
						    		var g = $('#DictDataJoinDictData').combogrid('grid');	// get datagrid object
									var roleRows= g.datagrid('getRows');
							    	if(roleRows.length>0 && roleUserRows.length>0){
							    		for(var i=0;i<roleRows.length;i++){
							    			for(var r=0;r<roleUserRows.length;r++){
								    			 if(roleRows[i].treeid==roleUserRows[r].treeid){
								    				 g.datagrid('checkRow',i);
								    			 }
								    		}
								    	}
							    	}
						    	}); 
						    }
						}); 
						 $('#DictDataFm').form('load', rows[0]);
					} else {
						$.messager.alert('消息', '请钩择一行数据!', 'info');
					}
				}
			}
		});
	}
	
	//Del
	function DictDataGridDel() {
		var rows = $('#DictDataGrid').datagrid('getSelections');
		if (rows.length > 0) {
		    var ids = '';
			for ( var i = 0; i < rows.length; i++) {
						ids += 'ids=' + rows[i].id + '&';
			}
			ids = ids.substring(0, ids.length - 1);
			var url = '${demoPath}admin/DictData/del.html?' + ids;
			$.messager.confirm('Confirm','确定要删除选择的数据吗?', function(r) {
				if (r) {
				    $.get(url, function(result){
						if (result.success){ 
							$('#DictDataGrid').datagrid('reload');
							$('#DictDataGrid').datagrid('clearSelections');
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
	function DictDataGridReload() {
		$('#DictDataGrid').datagrid('options').pageNumber=1;
		$('#DictDataGrid').datagrid('reload',{});
	}
	
	//DictDataGridSubmit  submit
	function DictDataGridSubmit(url) {
	    $('#DictDataFm').form('submit',{  
	        url: url,  
	        onSubmit: function(){  
	            return $(this).form('validate');  
	        },  
	        success: function(result){  
	            var result = eval('('+result+')');  
	            if (result.success){  
	                $('#DictDataDlg').dialog('close');      // close the dialog 
					$('#DictDataGrid').datagrid('reload');    // reload the user data
					$('#datatree').tree('reload');
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
			href : '${demoPath}admin/DictData/searchDlg.html',
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
					$('#DictDataGrid').datagrid('options').pageNumber=1;
					$('#DictDataGrid').datagrid('reload',serializeObjectEx($('#tbsUserSearchFm')));
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
	function DictDataGridExport(){
		window.location="${demoPath}admin/DictData/export.html";
		//var panel=$('#tbcTempGrid').datagrid('getPanel');
		//var options=panel.panel('options');
		//alert(options.method);
		//console.dir(options);
	}
	
	//导入
	function DictDataGridImport(){
		$('<div/>').dialog({
			href : '${demoPath}admin/DictData/importDlg.html',
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
	    $('#btn2').bind('click', function(){
			var data1 = $('#data1').val();
			var obj = {"data1":data1,searchType:1}
			$('#DictDataGrid').datagrid('options').pageNumber=1;
			$('#DictDataGrid').datagrid('reload',obj);
	    });
	    
	    $('#DictDataGrid').datagrid({
	    	url:'${demoPath}admin/DictData/data.html',
			frozenColumns : [ [ {field : 'ck',checkbox : true}] ],
			columns:[ [  
			{field:'treeid',title:'数据类型',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},
			{field:'nodeid',title:'本级节点',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},
			{field:'parentnodeid',title:'上级节点',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},
			{field:'code',title:'节点代码',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},
			{field:'data1',title:'节点名称',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},
			{field:'data2',title:'上级节点名称',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}}
			] ],
			toolbar:'#DictDataGridToolbar'
	    	
	    })
	});
	
</script>
    

	 <div class="easyui-layout" style="width:100%;height:100%;">
		<div data-options="region:'west',split:true,isonCls:'icon-save',
			                   tools:[{
			                     iconCls : 'icon-reload',
			                     handler : function() {
			                        $('#datatree').tree('reload');
			                        }
			                 }]" title="数据字典管理" style="width:194px;">
               <div title="test">
              <ul id="datatree" class="easyui-tree" data-options="
					url:'${demoPath}/admin/DictData/json.html', 
					onSelect : function(node) {
					   init(node.id,node.text);
					}"
				 ></ul>
             </div>
		</div>
		<div data-options="region:'center',title:'数据字典管理',iconCls:'icon-ok'">
		      <!-- 查询条件-->
			<div  class="easyui-panel" title="查询"
				style="padding: 10px;" data-options="collapsible:true">
				<table>
				<tr>
					<td>
						<label>
							节点名称:
						</label>
					</td>
					<td>
						<input id="data1" name="data1" class="easyui-validatebox"
							type="text" />
					</td>
					<td>
						<a id="btn2" href="javascript:void(0)" class="easyui-linkbutton"
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
			<table id="DictDataGrid"  class="easyui-datagrid"></table>
		</div>
	</div>
