<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 弹出框 tbsUserDlg -->
<div id="DictType">
	<form id="DictTypeFm" method="post">
		<table>
			<tr>
				<td><label> 主键: </label></td>
    			<td >
					<input name="id" class="easyui-validatebox"  readonly="readonly" />
				</td>

				<td><label> 数据类型: </label></td>
    			<td >
				<input name="treeid" class="easyui-validatebox" type="text" />
				</td>
	 		</tr>
	        <tr>
				<td><label> 类型名字: </label></td>
    			<td >
				<input name="name" class="easyui-validatebox" type="text" />
				</td>

				<td><label> 类型描述: </label></td>
    			<td >
				<input name="des"  class="easyui-validatebox"/>
				</td>
	 		</tr>
		</table>
	</form>
</div>