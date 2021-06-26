package com.ssm.framework.commonUtil;

public class MenuUtil {
	private boolean assessmentstaff;
	private boolean assessmentcoach;
	private boolean assessmentplayer;
	private boolean commentsstaff;
	private boolean commentscoach;
	private boolean commentsplayer;

	@Override
	public String toString() {
		return "MenuUtil [assessmentstaff=" + assessmentstaff + ", assessmentcoach=" + assessmentcoach
				+ ", assessmentplayer=" + assessmentplayer + ", commentsstaff=" + commentsstaff + ", commentscoach="
				+ commentscoach + ", commentsplayer=" + commentsplayer + "]";
	}

	public boolean isAssessmentstaff() {
		return assessmentstaff;
	}

	public void setAssessmentstaff(boolean assessmentstaff) {
		this.assessmentstaff = assessmentstaff;
	}

	public boolean isAssessmentcoach() {
		return assessmentcoach;
	}

	public void setAssessmentcoach(boolean assessmentcoach) {
		this.assessmentcoach = assessmentcoach;
	}

	public boolean isAssessmentplayer() {
		return assessmentplayer;
	}

	public void setAssessmentplayer(boolean assessmentplayer) {
		this.assessmentplayer = assessmentplayer;
	}

	public boolean isCommentsstaff() {
		return commentsstaff;
	}

	public void setCommentsstaff(boolean commentsstaff) {
		this.commentsstaff = commentsstaff;
	}

	public boolean isCommentscoach() {
		return commentscoach;
	}

	public void setCommentscoach(boolean commentscoach) {
		this.commentscoach = commentscoach;
	}

	public boolean isCommentsplayer() {
		return commentsplayer;
	}

	public void setCommentsplayer(boolean commentsplayer) {
		this.commentsplayer = commentsplayer;
	}

}
