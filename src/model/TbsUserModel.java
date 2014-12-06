package model;

import java.sql.Timestamp;

public class TbsUserModel extends BaseModel {

    private String id; //主键
    private String username; //用户名
    private String password; //密码
    private Timestamp createTime; //时间
    private String ip; //ip
    private Integer count; //次数
    private Integer isLock; //锁定
    private Timestamp lockTime; //锁定时间
    private Integer failCount; //失败次数
    private Integer isAdmin; //权限类型
    
    private String sex; // 性别（1：表示男，2：表示女）
    private String telephone;  // 电话号码
    private String address;    // 家庭地址
    private String family_tel;  // 亲情号码
    private String birth_place; // 出生地址
    private String social_num;  // 社保号
    private String account_num; // 银行卡号
    private String status; //员工状态（1：在职，0：离职）
    private Timestamp entry_time; //入职日期
    private Timestamp quit_time; // 离职日期；
    private Timestamp lastlogin_time; //最后登录时间
    
    
    
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>主键<br>
	 * <b>作者：</b;>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @return id
	 */
		
	public String getId(){
	   return id;
	}
	/**
	 * 
	 * <br>
	 * <b>功能：</b>主键<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @param id
	 */
	public void setId(String id){
	   this.id=id;
	}
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>用户名<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @return username
	 */
		
	public String getUsername(){
	   return username;
	}
	/**
	 * 
	 * <br>
	 * <b>功能：</b>用户名<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @param username
	 */
	public void setUsername(String username){
	   this.username=username;
	}
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>密码<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @return password
	 */
		
	public String getPassword(){
	   return password;
	}
	/**
	 * 
	 * <br>
	 * <b>功能：</b>密码<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @param password
	 */
	public void setPassword(String password){
	   this.password=password;
	}
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>时间<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @return createTime
	 */
	@com.alibaba.fastjson.annotation.JSONField(format="yyyy-MM-dd HH:mm:ss")	
	public java.sql.Timestamp getCreateTime(){
	   return createTime;
	}
	/**
	 * 
	 * <br>
	 * <b>功能：</b>时间<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @param createTime
	 */
	public void setCreateTime(java.sql.Timestamp createTime){
	   this.createTime=createTime;
	}
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>ip<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @return ip
	 */
		
	public String getIp(){
	   return ip;
	}
	/**
	 * 
	 * <br>
	 * <b>功能：</b>ip<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @param ip
	 */
	public void setIp(String ip){
	   this.ip=ip;
	}
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>次数<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @return count
	 */
		
	public Integer getCount(){
	   return count;
	}
	/**
	 * 
	 * <br>
	 * <b>功能：</b>次数<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @param count
	 */
	public void setCount(Integer count){
	   this.count=count;
	}
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>锁定<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @return isLock
	 */
		
	public Integer getIsLock(){
	   return isLock;
	}
	/**
	 * 
	 * <br>
	 * <b>功能：</b>锁定<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @param isLock
	 */
	public void setIsLock(Integer isLock){
	   this.isLock=isLock;
	}
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>锁定时间<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @return lockTime
	 */
	@com.alibaba.fastjson.annotation.JSONField(format="yyyy-MM-dd HH:mm:ss")	
	public java.sql.Timestamp getLockTime(){
	   return lockTime;
	}
	/**
	 * 
	 * <br>
	 * <b>功能：</b>锁定时间<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @param lockTime
	 */
	public void setLockTime(java.sql.Timestamp lockTime){
	   this.lockTime=lockTime;
	}
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>失败次数<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @return failCount
	 */
		
	public Integer getFailCount(){
	   return failCount;
	}
	/**
	 * 
	 * <br>
	 * <b>功能：</b>失败次数<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @param failCount
	 */
	public void setFailCount(Integer failCount){
	   this.failCount=failCount;
	}
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>权限类型<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @return isAdmin
	 */
		
	public Integer getIsAdmin(){
	   return isAdmin;
	}
	/**
	 * 
	 * <br>
	 * <b>功能：</b>权限类型<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @param isAdmin
	 */
	public void setIsAdmin(Integer isAdmin){
	   this.isAdmin=isAdmin;
	}
    
	/**
	 * 
	 * <br>
	 * <b>功能：</b>重写<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-26 <br>
	 * @return
	 */
    public String toString(){
	  return com.alibaba.fastjson.JSON.toJSONString(this);
	  // return ${SQL.toString}
    }
    
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getFamily_tel() {
		return family_tel;
	}
	public void setFamily_tel(String familyTel) {
		family_tel = familyTel;
	}
	public String getBirth_place() {
		return birth_place;
	}
	public void setBirth_place(String birthPlace) {
		birth_place = birthPlace;
	}
	public String getSocial_num() {
		return social_num;
	}
	public void setSocial_num(String socialNum) {
		social_num = socialNum;
	}
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String accountNum) {
		account_num = accountNum;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@com.alibaba.fastjson.annotation.JSONField(format="yyyy-MM-dd HH:mm:ss")	
	public Timestamp getEntry_time() {
		return entry_time;
	}
	public void setEntry_time(Timestamp entryTime) {
		entry_time = entryTime;
	}
	@com.alibaba.fastjson.annotation.JSONField(format="yyyy-MM-dd HH:mm:ss")	
	public Timestamp getQuit_time() {
		return quit_time;
	}
	public void setQuit_time(Timestamp quitTime) {
		quit_time = quitTime;
	}
	@com.alibaba.fastjson.annotation.JSONField(format="yyyy-MM-dd HH:mm:ss")	
	public Timestamp getLastlogin_time() {
		return lastlogin_time;
	}
	public void setLastlogin_time(Timestamp lastloginTime) {
		lastlogin_time = lastloginTime;
	}
	
	///////////////////////////增加/////////////////////////
	
   

}
