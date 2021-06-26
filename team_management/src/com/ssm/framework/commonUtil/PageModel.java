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
	 * ҳ��
	 * 
	 * @return ��ȡ��ҳ��
	 */
	public int getTotalPage() {
		return (totalRecords + pageSize - 1) / pageSize;
	}

	/**
	 * ��ȡ��һҳ
	 * 
	 * @return ��һҳ
	 */
	public int getFirstPage() {
		return 1;
	}

	/**
	 * ��ת��ǰһҳ
	 * 
	 * @return ǰһҳ
	 */
	public int getPreviousPage() {
		return currPage <= 1 ? 1 : currPage - 1;
	}

	/**
	 * ��ת����һҳ
	 * 
	 * @return ��һҳ
	 */
	public int getNextPage() {
		if (currPage >= getTotalPage()) {
			return getLastPage();
		}
		return currPage + 1;
	}

	/**
	 * ��ȡ���һҳ
	 * 
	 * @return ���һҳ
	 */
	public int getLastPage() {
		// ҳ������
		return getTotalPage() <= 0 ? 1 : getTotalPage();
	}
}
