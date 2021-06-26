package com.ssm.entity;

public class Data {
	private int dataID;
	private int tuserID;
	private int minutes;
	private int assists;
	private int goals;
	private int tackles;
	private int clear;
	private int fouls;
	private int pass;

	public int getDataID() {
		return dataID;
	}

	public void setDataID(int dataID) {
		this.dataID = dataID;
	}

	public int getTuserID() {
		return tuserID;
	}

	public void setTuserID(int tuserID) {
		this.tuserID = tuserID;
	}

	public int getMinutes() {
		return minutes;
	}

	public void setMinutes(int minutes) {
		this.minutes = minutes;
	}

	public int getAssists() {
		return assists;
	}

	public void setAssists(int assists) {
		this.assists = assists;
	}

	public int getGoals() {
		return goals;
	}

	public void setGoals(int goals) {
		this.goals = goals;
	}

	public int getTackles() {
		return tackles;
	}

	public void setTackles(int tackles) {
		this.tackles = tackles;
	}

	public int getClear() {
		return clear;
	}

	public void setClear(int clear) {
		this.clear = clear;
	}

	public int getFouls() {
		return fouls;
	}

	public void setFouls(int fouls) {
		this.fouls = fouls;
	}

	public int getPass() {
		return pass;
	}

	public void setPass(int pass) {
		this.pass = pass;
	}

}
