<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	        <!-- <tr>
				<td><label> ip: </label></td>
    			<td>
				    <input name="ip" class="easyui-validatebox" type="text"/>
				</td>

				<td><label> 次数: </label></td>
    			<td>
				<input name="count" class="easyui-validatebox" type="text" />
				</td>
	 		</tr> -->
	        <!-- <tr>
				<td><label> 锁定: </label></td>
    			<td >
				<input name="isLock" class="easyui-validatebox" type="text" />
				</td>

				<td><label> 锁定时间: </label></td>
    			<td >
				<input name="lockTime"  class="easyui-datetimebox"/>
				</td>
	 		</tr> -->
	        <tr>
				<!-- <td><label> 失败次数: </label></td>
    			<td >
				<input name="failCount" class="easyui-validatebox" type="text" />
				</td> -->
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
				
				
			</tr>

			<tr>
				<td><label> 角色: </label></td>
				<td colspan="3"><input id="tbsUserJoinTbsRole" name="roleId"  size="57"/></td>
			</tr>
		</table>
	</form>
</div>
