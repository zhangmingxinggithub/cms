<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 弹出框 tbsUserDlg -->
<div id="tbsUserDlg">
	<form id="tbsUserFm" method="post">
		<table>
			<tr>
				<td><label> 主键: </label></td>
				<td><input name="id" class="easyui-validatebox" /></td>

				<td><label> 用户名: </label></td>
				<td><input name="username" class="easyui-validatebox" /></td>

	 		</tr>
	        <tr>
				<td><label> 密码: </label></td>
				<td><input name="password" class="easyui-validatebox" /></td>

				<td><label> 时间: </label></td>
				<td><input name="createTime" class="easyui-validatebox" /></td>

	 		</tr>
	        <tr>
				<td><label> ip: </label></td>
				<td><input name="ip" class="easyui-validatebox" /></td>

				<td><label> 次数: </label></td>
				<td><input name="count" class="easyui-validatebox" /></td>

	 		</tr>
	        <tr>
				<td><label> 锁定: </label></td>
				<td><input name="isLock" class="easyui-validatebox" /></td>

				<td><label> 锁定时间: </label></td>
				<td><input name="lockTime" class="easyui-validatebox" /></td>

	 		</tr>
	        <tr>
				<td><label> 失败次数: </label></td>
				<td><input name="failCount" class="easyui-validatebox" /></td>

				<td><label> 权限类型: </label></td>
				<td>
				    <select name="isAdmin">
				       <option value="0">超级管理员</option>
				       <option value="1" selected="selected">授权管理员</option>
				    </select>
				</td>
			</tr>

			<tr>
				<td><label> 角色: </label></td>
				<td colspan="3"><input id="tbsUserJoinTbsRole" name="roleId"  size="57"/></td>
			</tr>
		</table>
	</form>
</div>