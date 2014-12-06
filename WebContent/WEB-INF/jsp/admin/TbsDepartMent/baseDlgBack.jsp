<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 弹出框 testDlg -->
<div id="testDlg">
	<form id="testFm" method="post">
		<table>
			 <tr>
				<td><label> 上级部门: </label></td>
    			<td >
					<input name="pname"   class="easyui-validatebox" type="text" readonly="readonly" />
					<input  name="pid"    class="easyui-validatebox"  type="hidden" readonly="readonly" />
				</td>
			</tr>
			
			<tr>
				<td><label> 部门id: </label></td>
    			<td >
					<input name="id" class="easyui-validatebox"  readonly="readonly"  />
				</td>
			</tr>
			
			<tr>
				<td><label> 部门名称: </label></td>
    			<td >
					<input name="name" class="easyui-validatebox"  type="text" />
				</td>
			</tr>

		</table>
	</form>
</div>