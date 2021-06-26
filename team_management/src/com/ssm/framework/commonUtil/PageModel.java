package com.ssm.framework.commonUtil;

import java.util.List;

public class PageModel {
	private int currPage;
	private int totalRecords;
	private List<?> list;
	private int pageSize;

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * 页面
	 * 
	 * @return 获取总页面
	 */
	public int getTotalPage() {
		return (totalRecords + pageSize - 1) / pageSize;
	}

	/**
	 * 获取第一页
	 * 
	 * @return 第一页
	 */
	public int getFirstPage() {
		return 1;
	}

	/**
	 * 跳转到前一页
	 * 
	 * @return 前一页
	 */
	public int getPreviousPage() {
		return currPage <= 1 ? 1 : currPage - 1;
	}

	/**
	 * 跳转到下一页
	 * 
	 * @return 下一页
	 */
	public int getNextPage() {
		if (currPage >= getTotalPage()) {
			return getLastPage();
		}
		return currPage + 1;
	}

	/**
	 * 获取最后一页
	 * 
	 * @return 最后一页
	 */
	public int getLastPage() {
		// 页面总数
		return getTotalPage() <= 0 ? 1 : getTotalPage();
	}
}
