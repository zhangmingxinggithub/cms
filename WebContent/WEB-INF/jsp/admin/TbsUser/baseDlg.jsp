<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
function selectDept()
{
	$('<div/>').dialog({
	    title: '选择部门',
	    width: 700,
	    height: 430,
	    closed: false,
	    cache: false,
	    href: '${demoPath}admin/common/selectDept.html',
	    modal: true	,		
	    buttons : [ {
			text : '确定',
			iconCls : 'icon-ok',
			handler : function() {
				setDept();
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
		}
	});
}
function setDept()
{
	var rows = $('#TbsDepartMentGrid').datagrid('getSelections');
	if(rows.length == 1)
	{
		$('#dept').val(rows[0].name);
		$('#dept_id').val(rows[0].id);
	}
	else
	{
	}
}
</script>
<!-- 弹出框 tbsUserDlg -->
<div id="tbsUserDlg">
	<form id="tbsUserFm" method="post">
		<table>
			<tr>
				<td><label> 主键: </label></td>
    			<td >
					<input name="id" class="easyui-validatebox"  readonly="readonly" />
				</td>

				<td><label> 用户名: </label></td>
    			<td >
				<input name="username" class="easyui-validatebox" type="text" />
				</td>
	 		</tr>
	        <tr>
				<td><label> 密码: </label></td>
    			<td >
				<input name="password" class="easyui-validatebox" type="text" />
				</td>

				<td><label> 时间: </label></td>
    			<td >
				<input name="createTime"  class="easyui-datetimebox"/>
				</td>
	 		</tr>
	        <tr>
                <td><label> 家庭地址: </label></td>
    			<td >
				<input name="address" class="easyui-validatebox" type="text" />
				</td>
				<td><label> 权限类型: </label></td>
    			<td >
					<select name="isAdmin" >
							<option value="0"  > 超级管理员 </option>
							<option value="1"  > 授权管理员 </option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td><label> 性别: </label></td>
    			<td>
					<select name="sex" >
							<option value="1"  > 男 </option>
							<option value="2"  > 女</option>
					</select>
				</td>
				
				<td><label> 电话号码: </label></td>
    			<td >
				    <input name="telephone" class="easyui-validatebox" type="text" />
				</td>
			</tr>
			<tr>
				<td><label> 亲情号码: </label></td>
    			<td>
                     <input name="family_tel" class="easyui-validatebox" type="text" />
				</td>
				
				<td><label> 出生地址: </label></td>
    			<td >
				<input name="birth_place" class="easyui-validatebox" type="text" />
				</td>
			</tr>
			<tr>
				<td><label> 社保号: </label></td>
    			<td>
                     <input name="social_num" class="easyui-validatebox" type="text" />
				</td>
				
				<td><label> 银行卡号: </label></td>
    			<td >
				<input name="account_num" class="easyui-validatebox" type="text" />
				</td>
			</tr>
			<tr>
				<td><label> 员工状态: </label></td>
    			<td>
                   <select name="status" >
							<option value="1"  > 在职 </option>
							<option value="2"  > 离职 </option>
					</select>
				</td>
				<td><label> 部门: </label></td>
    			<td>
    			     <input id="dept_id" name="dept_id" type="hidden"   />
                     <input id="dept" name="dept_name" class="easyui-validatebox" type="text" onClick="selectDept();"  />
				</td>
				
			</tr>

			<tr>
				<td><label> 角色: </label></td>
				<td colspan="3"><input id="tbsUserJoinTbsRole" name="roleId"  size="57"/></td>
			</tr>
		</table>
	</form>
</div>
