package com.ssm.entity;

public class Formation {
	private int formationID;
	private String forward;
	private String center;
	private String back;
	private String coachname;
	private String status;

	public int getFormationID() {
		return formationID;
	}

	public void setFormationID(int formationID) {
		this.formationID = formationID;
	}

	public String getForward() {
		return forward;
	}

	public void setForward(String forward) {
		this.forward = forward;
	}

	public String getCenter() {
		return center;
	}

	public void setCenter(String center) {
		this.center = center;
	}

	public String getBack() {
		return back;
	}

	public void setBack(String back) {
		this.back = back;
	}

	public String getCoachname() {
		return coachname;
	}

	public void setCoachname(String coachname) {
		this.coachname = coachname;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
