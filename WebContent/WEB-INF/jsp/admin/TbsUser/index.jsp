<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">


	var dept_id=""
	function init(id,name){
		dept_id = id;
		$('#tbsUserGrid').datagrid('options').pageNumber=1;
		$('#tbsUserGrid').datagrid('reload',{"dept_id":id});
		
	}

	//Add and Edit
	function tbsUserGridAddAndEdit(title, url, type) {
		if (type == 1) { //edit
			var rows = $('#tbsUserGrid').datagrid('getSelections');
			if (rows.length != 1) {
				$.messager.alert('消息', '请钩择一行数据!', 'info');
				return;
			}
		}
		$('<div/>').dialog({
			href : '${demoPath}admin/TbsUser/baseDlg.html',
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
					tbsUserGridSubmit(url);
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
					$('#tbsUserFm').form('clear');
					$('#tbsUserJoinTbsRole').combogrid({
						url : '${demoPath}admin/TbsRole/data.html?t='+ Math.random(),
						panelWidth : 460,
						textField : 'name',
						frozenColumns : [ [ {field : 'ck',checkbox : true}] ],
						columns:[ [  
				                {field:'id',title:'主键',width:100},
				                {field:'name',title:'角色',width:100},
				                {field:'text',title:'权限名称',width:100},
				                {field:'createTime',title:'创建时间',width:130}
				        ] ]
					});
				} else {    // 编辑
					var rows = $('#tbsUserGrid').datagrid('getSelections');
					if (rows.length == 1) {
						$.getJSON('${demoPath}admin/TbsUser/password.html?type=1&password='+rows[0].password,function(data){
							$('#tbsUserFm').form('load', rows[0]);
							$('#tbsUserFm').form('load',{password:data.msg});
						});
						$('#tbsUserJoinTbsRole').combogrid({
							url : '${demoPath}admin/TbsRole/data.html?userId='+rows[0].id,
							panelWidth : 460,
							textField : 'name',
							frozenColumns : [ [ {field : 'ck',checkbox : true}] ],
							columns:[ [  
						            {field:'id',title:'主键',width:100},
						            {field:'name',title:'角色',width:100},
						            {field:'text',title:'权限名称',width:100},
						            {field:'createTime',title:'创建时间',width:130}
						    ] ],
						    onLoadSuccess:function(data){
						    	$.getJSON('${demoPath}admin/TbsRoleUser/data.html?userId='+rows[0].id,function(data){
						    		var roleUserRows=data.rows;
						    		var g = $('#tbsUserJoinTbsRole').combogrid('grid');	// get datagrid object
									var roleRows= g.datagrid('getRows');
							    	if(roleRows.length>0 && roleUserRows.length>0){
							    		for(var i=0;i<roleRows.length;i++){
							    			for(var r=0;r<roleUserRows.length;r++){
								    			 if(roleRows[i].id==roleUserRows[r].roleId){
								    				 g.datagrid('checkRow',i);
								    			 }
								    		}
								    	}
							    	}
						    	});
						    }
						});

					} else {
						$.messager.alert('消息', '请钩择一行数据!', 'info');
					}
				}
			}
		});
	}
	
	//Del
	function tbsUserGridDel() {
		var rows = $('#tbsUserGrid').datagrid('getSelections');
		if (rows.length > 0) {
		    var ids = '';
			for ( var i = 0; i < rows.length; i++) {
						ids += 'ids=' + rows[i].id + '&';
			}
			ids = ids.substring(0, ids.length - 1);
			var url = '${demoPath}admin/TbsUser/del.html?' + ids;
			$.messager.confirm('Confirm','确定要删除选择的数据吗?', function(r) {
				if (r) {
				    $.get(url, function(result){
						if (result.success){ 
							$('#tbsUserGrid').datagrid('reload');
							$('#tbsUserGrid').datagrid('clearSelections');
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
	function tbsUserGridReload() {
		$('#tbsUserGrid').datagrid('options').pageNumber=1;
		$('#tbsUserGrid').datagrid('reload',{});
	}
	
	//tbsUserGridSubmit  submit
	function tbsUserGridSubmit(url) {
	    $('#tbsUserFm').form('submit',{  
	        url: url,  
	        onSubmit: function(){  
	            return $(this).form('validate');  
	        },  
	        success: function(result){  
	            var result = eval('('+result+')');  
	            if (result.success){  
	                $('#tbsUserDlg').dialog('close');      // close the dialog 
					$('#tbsUserGrid').datagrid('reload');    // reload the user data
	            } else {  
	            	$.messager.show({ title: 'Error',msg: result.msg }); 
	            }  
	        }  
	    });
	}
	
	
	//导出
	function tbsUserGridExport(){
		window.location="${demoPath}admin/TbsUser/export.html";
	}
	
	//导入
	function tbsUserGridImport(){
		$('<div/>').dialog({
			href : '${demoPath}admin/TbsUser/importDlg.html',
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
			var username = $('#username').val();
			var obj = {"username":username,searchType:1,"dept_id":dept_id}
			$('#tbsUserGrid').datagrid('options').pageNumber=1;
			$('#tbsUserGrid').datagrid('reload',obj);
	    });

	    $('#tbsUserGrid').datagrid({
			url:'${demoPath}admin/TbsUser/data.html',
			frozenColumns : [ [ {field : 'ck',checkbox : true}] ],
			columns:[ [  

			{field:'id',title:'主键',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'dept_id',title:'部门',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},	
			
			{field:'username',title:'用户名',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'password',title:'密码',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'createTime',title:'时间',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'isAdmin',title:'权限类型',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
				if(value=='0'){
			    	value='超级管理员';
			    }
				if(value=='1'){
			    	value='授权管理员';
			    }
			    return value;
			}},			

			{field:'sex',title:'性别',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
				if(value=='1'){
			    	value='男';
			    }
				if(value=='2'){
			    	value='女';
			    }
			    return value;
			}}	,	
			{field:'telephone',title:'电话号码',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}}		
			] ],
			toolbar:'#tbsUserGridToolbar'

	    });
	    $('#tbsUserGrid').datagrid('load', {});
	});
</script>

    <!-- 部门树-->
<div class="easyui-layout" style="width: 100%; height: 100%;">
	<div data-options="region:'west',split:true,isonCls:'icon-save',
			                 tools:[{
			                     iconCls : 'icon-reload',
			                     handler : function() {
			                        $('#depttree').tree('reload');
			                     }
			                 }]" title="部门" style="width:194px;">
		     <div title="test">
			             <ul id="depttree" class="easyui-tree" data-options="
								url:'${demoPath}/admin/TbsDepartMent/json.html', 
								onSelect : function(node) {
								   init(node.id,node.text);
								}
							" ></ul>
			             
	    </div>
	</div>
	
	
	<!-- 用户管理-->
	<div data-options="region:'center',title:'用户管理',iconCls:'icon-ok'">

		<!-- 查询条件-->
		<div id="search" class="easyui-panel" title="查询"
			style="padding: 10px;" data-options="collapsible:true">
			<table>
				<tr>
					<td>
						<label>
							用户名:
						</label>
					</td>
					<td>
						<input id="username" name="username" class="easyui-validatebox"
							type="text" />
					</td>
					<td>
						<a id="btn" href="javascript:void(0)" class="easyui-linkbutton"
							data-options="iconCls:'icon-search'">查询</a>
					</td>
				</tr>
			</table>
		</div>

		<!-- 数据列表-->
		<div data-options="region:'center',border : false">

			<!-- 工具按钮 -->
			<div id="tbsUserGridToolbar">
				<div style="margin-bottom: 5px">
					<c:forEach items="${buttons}" var="button">
			         ${button}
			    </c:forEach>
				</div>
			</div>
			<!-- 数据列表 -->
			<table id="tbsUserGrid"></table>
		</div>
	</div>
</div>
