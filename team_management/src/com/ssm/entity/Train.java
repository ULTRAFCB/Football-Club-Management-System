package com.ssm.entity;

public class Train {
	private int trainID;
	private int tuserID;
	private String time;
	private String content;
	private String coachname;
	private String coachdp;

	public int getTrainID() {
		return trainID;
	}

	public void setTrainID(int trainID) {
		this.trainID = trainID;
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

	public String getCoachname() {
		return coachname;
	}

	public void setCoachname(String coachname) {
		this.coachname = coachname;
	}

	public String getCoachdp() {
		return coachdp;
	}

	public void setCoachdp(String coachdp) {
		this.coachdp = coachdp;
	}

}
