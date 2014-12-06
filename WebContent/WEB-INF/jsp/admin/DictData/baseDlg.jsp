<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 弹出框 tbsUserDlg -->
<div id="DictDataDlg">
	<form id="DictDataFm" method="post">
		<table>
		    <tr>
				<td><label> 主键: </label></td>
    			<td colspan="3">
					<input name="id" class="easyui-validatebox"  readonly="readonly"  size="57"/>
				</td>
	 		</tr>
	 		<tr>
				<td><label> 数据类型: </label></td>
				<td colspan="3"><input id="DictDataJoinDictData"  name="treeid"  size="57"/></td>
			</tr>
			<tr>

				<td><label> 上级节点: </label></td>
    			<td >
				<input name="parentnodeid" class="easyui-validatebox" type="text" readonly="readonly" />
				</td>
				<td><label> 上级节点名称: </label></td>
    			<td >
				<input name="data2" class="easyui-validatebox" type="text" readonly="readonly" />
				</td>
	 		</tr>
	        <tr>
				<td><label> 本节点: </label></td>
    			<td >
				<input name="nodeid" class="easyui-validatebox" type="text" />
				</td>
                <td><label> 节点名称: </label></td>
    			<td >
				<input name="data1"  class="easyui-validatebox"/>
				</td>
	 		</tr>
	 		 <tr>
				<td><label> 节点代码: </label></td>
    			<td >
				<input name="code"  class="easyui-validatebox"/>
				</td>
				<td><label> 排序号: </label></td>
    			<td >
				<input name="orders" class="easyui-validatebox" type="text" />
				</td>
	 		</tr>
		</table>
	</form>
</div>
