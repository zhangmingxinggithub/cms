<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 弹出框 tbsRoleDlg -->
<div id="tbsRoleDlg">
	<form id="tbsRoleFm" method="post">
		<table>
			<tr>
				<td><label> 主键: </label></td>
				<td><input name="id" class="easyui-validatebox" /></td>

				<td><label> 角色: </label></td>
				<td><input name="name" class="easyui-validatebox" /></td>

	 		</tr>
	        <tr>
				<td><label> 所有权限: </label></td>
				<td><input name="text" class="easyui-validatebox" /></td>

				<td><label> 时间: </label></td>
				<td><input name="createTime" class="easyui-validatebox" /></td>

			</tr>

			<tr>
				<td><label> 授权设置: </label></td>
				<td colspan="3"><input id="roleAuthTree" name="roleAuthTree" size="57"/></td>
			</tr>
		</table>
	</form>
</div>