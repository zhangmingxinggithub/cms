<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	//Add and Edit
	function tbsHttpRequestGridAddAndEdit(title, url, type) {
		if (type == 1) { //edit
			var rows = $('#tbsHttpRequestGrid').datagrid('getSelections');
			if (rows.length != 1) {
				$.messager.alert('消息', '请钩择一行数据!', 'info');
				return;
			}
		}
		$('<div/>').dialog({
			href : '${demoPath}admin/TbsHttpRequest/baseDlg.html',
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
					tbsHttpRequestGridSubmit(url);
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
					$('#tbsHttpRequestFm').form('clear');
				} else {
					var rows = $('#tbsHttpRequestGrid').datagrid('getSelections');
					if (rows.length == 1) {
						$('#tbsHttpRequestFm').form('load', rows[0]);
					} else {
						$.messager.alert('消息', '请钩择一行数据!', 'info');
					}
				}
			}
		});
	}
	
	//Del
	function tbsHttpRequestGridDel() {
		var rows = $('#tbsHttpRequestGrid').datagrid('getSelections');
		if (rows.length > 0) {
		    var ids = '';
			for ( var i = 0; i < rows.length; i++) {
						ids += 'ids=' + rows[i].id + '&';
			}
			ids = ids.substring(0, ids.length - 1);
			var url = '${demoPath}admin/TbsHttpRequest/del.html?' + ids;
			$.messager.confirm('Confirm','确定要删除选择的数据吗?', function(r) {
				if (r) {
				    $.get(url, function(result){
						if (result.success){ 
							$('#tbsHttpRequestGrid').datagrid('reload');
							$('#tbsHttpRequestGrid').datagrid('clearSelections');
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
	function tbsHttpRequestGridReload() {
		$('#tbsHttpRequestGrid').datagrid('options').pageNumber=1;
		$('#tbsHttpRequestGrid').datagrid('reload',{});
	}
	
	//tbsHttpRequestGridSubmit  submit
	function tbsHttpRequestGridSubmit(url) {
	    $('#tbsHttpRequestFm').form('submit',{  
	        url: url,  
	        onSubmit: function(){  
	            return $(this).form('validate');  
	        },  
	        success: function(result){  
	            var result = eval('('+result+')');  
	            if (result.success){  
	                $('#tbsHttpRequestDlg').dialog('close');      // close the dialog 
					$('#tbsHttpRequestGrid').datagrid('reload');    // reload the user data
	            } else {  
	            	$.messager.show({ title: 'Error',msg: result.msg }); 
	            }  
	        }  
	    });
	}
	
	//高级搜索 del row
	function tbsHttpRequestSearchRemove(curr) {
		if ($(curr).closest('table').find('tr').size() > 2) {
			$(curr).closest('tr').remove();
		} else {
			alert('该行不允许删除');
		}
	}
	
	//高级查询
	function tbsHttpRequestSearch() {
		$('<div/>').dialog({
			href : '${demoPath}admin/TbsHttpRequest/searchDlg.html',
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
					$('#tbsHttpRequestGrid').datagrid('options').pageNumber=1;
					$('#tbsHttpRequestGrid').datagrid('reload',serializeObjectEx($('#tbsHttpRequestSearchFm')));
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
	function tbsHttpRequestGridExport(){
		window.location="${demoPath}admin/TbsHttpRequest/export.html";
		//var panel=$('#tbcTempGrid').datagrid('getPanel');
		//var options=panel.panel('options');
		//alert(options.method);
		//console.dir(options);
	}
	
	//导入
	function tbsHttpRequestGridImport(){
		$('<div/>').dialog({
			href : '${demoPath}admin/TbsHttpRequest/importDlg.html',
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
	
	//设置
	function tbsHttpRequestSet(row){
		      $("<div/>").dialog({
		            height : $(window).height()-150,
		            width : $(window).width()-450,
		            href : "${demoPath}admin/TbsHttpRequest/httpIndex.html?t="+Math.random(),
					cache: false,
					resizable:true,
					modal : true,
					title : '采集设置',
					onClose : function() {
						$(this).dialog('destroy');
					},
					onLoad : function(){
					     var obj = $('#tbTbsHttpRequest').datagrid('getRows')[row];
					     $('#httpClientForm').form('load',obj);
					     $('#httpClientForm1').form('load',obj);
					     $('#httpClientForm2').form('load',obj);
					}
				});
	}
</script>
    

	<!-- 中  datagrid-->
    <div data-options="region:'center',border : false">
		<!-- datagrid toolbar -->
		<table id="tbsHttpRequestGrid"  class="easyui-datagrid"  data-options="	
			url:'${demoPath}admin/TbsHttpRequest/data.html',
			frozenColumns : [ [ {field : 'ck',checkbox : true}] ],
			columns:[ [  
		 	{field:'Action',title:'操作',formatter: function(value,row,index){
				var html='<a href=\'javascript:void(0)\' onClick=\'tbsHttpRequestSet('+index+')\'>规则</a>';
				return html;
			 }},

			{field:'id',title:'序列号',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'name',title:'名称',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'header',title:'请求头信息(JSON格式)',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'firstPage',title:'所有分类地址',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'encoding',title:'编码',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'listName',title:'列表过滤',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'regexs',title:'jquery表达式',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'arrtSplit',title:'属性',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'inserts',title:'入库语句',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'listUrlRegex',title:'请求属性',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'listUrlTest',title:'测试行数',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'listPageId',title:'开始页',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'listSplitUrlChar',title:'横中线分割符',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'listSplitUrl',title:'分页表达式',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'listRegexs',title:'jquery表达式',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'listAttrSplit',title:'属性',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'listInserts',title:'入库语句',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'contUrlRegex',title:'URL表达式',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'contUrlTest',title:'测试Url',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'contRegexs',title:'选择器',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'contAttrSplit',title:'熟悉',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'contInserts',title:'入库表达式',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}},			

			{field:'createTime',title:'时间',hidden:false,width:'135',halign:'center',align:'center',sortable:'true', formatter: function(value,row,index){
			    return value;
			}}			
			] ],
			toolbar:'#tbsHttpRequestGridToolbar'
		"/>
		
		<!-- datagrid toolbar -->
		<div id="tbsHttpRequestGridToolbar">
			<div style="margin-bottom:5px">
				<c:forEach items="${buttons}" var="button">
			         ${button}
			    </c:forEach>
				<%-- 
				<a href="javascript:void(0)" onclick="javascript:tbsHttpRequestGridAddAndEdit('添加  tbsHttpRequest','${demoPath}admin/TbsHttpRequest/add.html',0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a>
				<a href="javascript:void(0)" onclick="javascript:tbsHttpRequestGridAddAndEdit('修改  tbsHttpRequest','${demoPath}admin/TbsHttpRequest/save.html',1)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'">编辑 </a>  
				<a href="javascript:void(0)" onclick="javascript:tbsHttpRequestGridDel()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'">删除</a>
				<a href="javascript:void(0)" onclick="javascript:tbsHttpRequestGridReload()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">刷新</a>
				<a href="javascript:void(0)" onclick="javascript:tbsHttpRequestGridExport()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">导出</a>
				<a href="javascript:void(0)" onclick="javascript:tbsHttpRequestGridImport()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">导入</a>
				
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-undo'">后退</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-redo'">前进</a>
				--%>
				<!-- tbsHttpRequestGridToolbarSearch -->
				<input class="easyui-searchbox" data-options="
					menu :'#tbsHttpRequestGridToolbarSearch',
					prompt :'模糊查询',
					searcher : function(value,name){
						var str='{searchType:1,'+name+':\''+value+'\'}';
				        var obj = eval('('+str+')');
				        $('#tbsHttpRequestGrid').datagrid('options').pageNumber=1;
						$('#tbsHttpRequestGrid').datagrid('reload',obj);
					}
				"/>
				<div id="tbsHttpRequestGridToolbarSearch">
					<div name="id">序列号</div>
					<div name="name">名称</div>
					<div name="header">请求头信息(JSON格式)</div>
					<div name="firstPage">所有分类地址</div>
					<div name="encoding">编码</div>
					<div name="listName">列表过滤</div>
					<div name="regexs">jquery表达式</div>
					<div name="arrtSplit">属性</div>
					<div name="inserts">入库语句</div>
					<div name="listUrlRegex">请求属性</div>
					<div name="listUrlTest">测试行数</div>
					<div name="listPageId">开始页</div>
					<div name="listSplitUrlChar">横中线分割符</div>
					<div name="listSplitUrl">分页表达式</div>
					<div name="listRegexs">jquery表达式</div>
					<div name="listAttrSplit">属性</div>
					<div name="listInserts">入库语句</div>
					<div name="contUrlRegex">URL表达式</div>
					<div name="contUrlTest">测试Url</div>
					<div name="contRegexs">选择器</div>
					<div name="contAttrSplit">熟悉</div>
					<div name="contInserts">入库表达式</div>
					<div name="createTime">时间</div>
				</div>
				<a href="javascript:void(0)" onclick="javascript:tbsHttpRequestSearch()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">高级查询</a>
			</div>
		</div>
	</div>
<!--  <div>-->