<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="path.jsp"%>
<title>this is myjsp templates</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="This is my page" />
<!-- easyui  start -->
<script type="text/javascript" src="${demoPath}static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${demoPath}static/js/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="${demoPath}static/js/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${demoPath}static/js/easyui/themes/icon.css" />
<!-- easyui end -->
<script type="text/javascript">
	window.onload = function() {
		//...
	}
	$(function() {
		$("#submitForm").bind('click', function() {
			$.messager.progress();
			$('#ff').form('submit', {
			    url : '${demoPath}admin/login.html?t='+Math.random()+'&userAgent='+navigator.userAgent,
				onSubmit: function(){
					var isValid = $(this).form('validate');
					if (!isValid){
						$.messager.progress('close');	
					}
					return isValid;	
				},
				success : function(data) {
					$.messager.progress('close');
					var result=eval('('+data+')');
					if(result.success){
						window.location.href='${demoPath}admin/index.html';
						return;
					}
					if(result.state==1){
						//error,question,info,warning
						$.messager.alert('操作提示', result.msg, 'info');
						return;
					}
					if(result.state==2){
						$.messager.alert('操作提示', result.msg, 'info');
					    var url = '${demoPath}admin/verifyCode.html?t=' + Math.random();
			            $('#verifyCode').attr('src', url);
			            return;
					}
				}
			});
		});
		$("#clearForm").bind('click', function() {
			$('#ff').form('clear');
		});
		$("#verifyClick").bind('click', function() {
			var url = '${demoPath}admin/verifyCode.html?t=' + Math.random();
			$('#verifyCode').attr('src', url);
		});
		$("#rollBack").bind('click',function(){
			$.ajax({
				url:'${demoPath}admin/rollBack.html',
				dataType :'json',
			    beforeSend: function(){  
			        $.messager.progress() 
			    },
			    complete: function(){  
			        $.messager.progress('close'); 
			    },
			    success : function(data) { 
			    	$.messager.alert("操作提示", data.msg);
			    }
			});
		});
	});
</script>
<style type="text/css">
body {
	font-family: Verdana, Geneva, sans-serif;
	font-size: 12px;
}

input {
	width: 140px;
	height: 20px;
	background-color: #FFF;
	border: #999 1px solid;
}
</style>
</head>
<body
	style="background-image: url('${demoPath}static/image/log_bg.gif');background-repeat: repeat-x;">
	<div align="center">
		<div style="height: 188px;"></div>
		<div
			style="padding:3px 2px;font-weight:bold;font-size: 22px;font-family: '微软雅黑','黑体';color: #C33436;">欢迎登录后台管理系统</div>
		<div
			style="margin-top: 37px;height: 185px;width: 372px;background-image: url('${demoPath}static/image/log_con_bg.gif');">
			<form id="ff" method="post">
				<div style="height: 10px;"></div>
				<div style="margin-top: 15px;">
					<label for="name">用户名：</label> <input class="easyui-validatebox"
						data-options="required:true" type="text" name="username" value="admin"
						missingMessage="用户名不能为空"></input>
				</div>
				<div style="margin-top: 15px;">
					<label for="name">密<span style="margin-left:12px;">码：</span>
					</label> <input class="easyui-validatebox" data-options="required:true"
						type="password" name="password" value="admin" missingMessage="密码不能为空"></input>
				</div>
				<div style="margin-top: 15px;">
					<div style="width: 194px;" align="left">
						<label for="name">验证码：</label> 
						<input class="easyui-validatebox" type="text" name="verifyCode" style="width:60px;" value=""/> 
						<span style="margin-left: 2px;" /> 
						<a style="text-align: center;" id="verifyClick" title="点击 刷新?" href="javascript:void(0);"> 
						<img style="width:65px;height:22px;" align="absmiddle" id="verifyCode" src="${demoPath}admin/verifyCode.html" /> </a>
					</div>
				</div>
				<div style="margin-top: 15px;">
				   <div align="center">
					<a id="submitForm" href="javascript:void(0)"
						class="easyui-linkbutton">登 录</a> 
					<span style="margin-left:10px;"></span>
					<a id="clearForm" href="javascript:void(0)"
						class="easyui-linkbutton">重 置</a>
					</div>
					<%--<div align="right" style="float: right;margin-top: -24px;margin-right: 5px;">
						<a id="rollBack" class="easyui-linkbutton" data-options="toggle:true"
						 href="javascript:void(0)" >数据库还原</a>
					</div>
				--%></div>
			</form>
		</div>
	</div>
</body>
</html>