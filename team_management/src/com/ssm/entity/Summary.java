package com.ssm.entity;

public class Summary {
	private int summaryID;
	private String years;
	private String days;
	private String title;
	private String content;

	public int getSummaryID() {
		return summaryID;
	}

	public void setSummaryID(int summaryID) {
		this.summaryID = summaryID;
	}

	public String getYears() {
		return years;
	}

	public void setYears(String years) {
		this.years = years;
	}

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
