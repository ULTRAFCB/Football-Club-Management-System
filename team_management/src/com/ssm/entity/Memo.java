package com.ssm.entity;

public class Memo {
	private int memoID;
	private int tuserID;
	private String time;
	private String content;
	private String mark;

	public int getMemoID() {
		return memoID;
	}

	public void setMemoID(int memoID) {
		this.memoID = memoID;
	}

	public int getTuserID() {
		return tuserID;
	}

	public void setTuserID(int tuserID) {
		this.tuserID = tuserID;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

}
