<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 弹出框 tbcListTempDlg -->
<div id="tbcListTempDlg">
	<form id="tbcListTempFm" method="post">
		<table>
			<tr>
				<td><label> id: </label></td>
				<td><input name="id" class="easyui-validatebox" /></td>

				<td><label> href: </label></td>
				<td><input name="href" class="easyui-validatebox" /></td>

	 		</tr>
	        <tr>
				<td><label> type: </label></td>
				<td><input name="type" class="easyui-validatebox" /></td>

				<td><label> text: </label></td>
				<td><input name="text" class="easyui-validatebox" /></td>

	 		</tr>
	        <tr>
				<td><label> 时间: </label></td>
				<td><input name="createTime" class="easyui-validatebox" /></td>

			</tr>

		</table>
	</form>
</div>