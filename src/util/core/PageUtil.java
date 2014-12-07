package util.core;

/**
 * 
 * <br>
 * <b>功能：</b>分页实现<br>
 * <b>作者：</b>Wolf<br>
 * <b>日期：</b> 2013-5-10 <br>
 * <b>版权所有：<b>版权所有(C) 2011，QQ 405645010<br>
 */
public class PageUtil {

	private Integer pageId = 1; // 当前页
	private Integer rowCount = 0; // 总行数
	private Integer pageSize = 10; // 页大小
	private Integer pageCount = 0; // 总页数
	private Integer pageOffset = 0;// 当前页起始记录
	private Integer pageTail = 0; // 当前页到达的记录
	private String queryCondition; //自定义条件
	private String andCondition; // 条件
	private String orderByCondition; // 排序
	private boolean paging=false; //默认分页
	private boolean like=false;   //默认模糊查询

	public boolean getLike() {
		return like;
	}

	public void setLike(boolean like) {
		this.like = like;
	}
	
	public boolean getPaging() {
		return paging;
	}

	public void setPaging(boolean paging) {
		this.paging = paging;
	}

	public void splitPageInstance() {
		if (pageSize < 1 || null == pageSize) {
			pageSize = 10;
		}
		// 总页数=(总记录数+每页行数-1)/每页行数
		pageCount = (rowCount + pageSize - 1) / pageSize;
		// 当前页大于总页数
		if (pageId > pageCount) {
			pageId = pageCount;
		}
		// 防止 pageOffset 小于 0
		pageOffset = ((pageId - 1) * pageSize);
		if (pageOffset < 0)
			pageOffset = 0;
	}

	public String getLimit() {
		return " limit " + pageOffset + "," + pageSize;
	}

	public String getAndCondition() {
		return andCondition == null ? "" : " AND " + andCondition;
	}

	public String getOrderByCondition() {
		return orderByCondition == null ? "" : " order by " + orderByCondition;
	}

	public String getAllConditionAndLimit() {
		return getQueryCondition()+getAndCondition() + getOrderByCondition() + getLimit();
	}

	// GET AND SET
	
	public Integer getPageId() {
		return pageId;
	}

	public String getQueryCondition() {
		return queryCondition;
	}

	public void setQueryCondition(String queryCondition) {
		this.queryCondition = queryCondition;
	}


	public void setAndCondition(String andCondition) {
		this.andCondition = andCondition;
	}

	public void setOrderByCondition(String orderByCondition) {
		this.orderByCondition = orderByCondition;
	}

	public void setPageId(Integer pageId) {
		this.pageId = pageId;
	}

	public Integer getRowCount() {
		return rowCount;
	}

	public void setRowCount(Integer rowCount) {
		this.rowCount = rowCount;
		splitPageInstance();
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public Integer getPageOffset() {
		return pageOffset;
	}

	public void setPageOffset(Integer pageOffset) {
		this.pageOffset = pageOffset;
	}

	public Integer getPageTail() {
		return pageTail;
	}

	public void setPageTail(Integer pageTail) {
		this.pageTail = pageTail;
	}
	
	
	public static void pageConfig(PageParams pageParams, PageUtil pageUtil)
	{
		if (pageParams.getPage() != null) {
			try {
				pageUtil.setPageId(Integer.parseInt(pageParams.getPage())); // 当前页
			} catch (Exception e) {
			}
		}
		if (pageParams.getRows() != null) {
			try {
				pageUtil.setPageSize(Integer.parseInt(pageParams.getRows()));// 显示X条
			} catch (Exception e) {
			}
		}
		if (pageParams.getSort() != null) {
			try {
				pageUtil.setOrderByCondition(pageParams.getSort()); // 排序字段名称
			} catch (Exception e) {
			}
		}
	}

	public static void main(String[] args) {
		PageUtil pageUtil = new PageUtil();
		pageUtil.setPageId(2);
		pageUtil.setPageSize(2);
		pageUtil.setRowCount(10);
		System.out.println(pageUtil.getLimit());
		System.out.println(pageUtil.getPageCount());
	}
}
