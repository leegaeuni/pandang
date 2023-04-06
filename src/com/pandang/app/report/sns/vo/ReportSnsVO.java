package com.pandang.app.report.sns.vo;

public class ReportSnsVO {
	private int reportNumber;
	private String reportTitle;
	private String reportContent;
	private String reportDate;
	private int reportMemberNumber;
	private int reportSnsNumber;
	private String memberId;
	private String reportedMemberId;
	
	public ReportSnsVO() {}

	public int getReportNumber() {
		return reportNumber;
	}

	public void setReportNumber(int reportNumber) {
		this.reportNumber = reportNumber;
	}

	public String getReportTitle() {
		return reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	public int getReportMemberNumber() {
		return reportMemberNumber;
	}

	public void setReportMemberNumber(int reportMemberNumber) {
		this.reportMemberNumber = reportMemberNumber;
	}

	public int getReportSnsNumber() {
		return reportSnsNumber;
	}

	public void setReportSnsNumber(int reportSnsNumber) {
		this.reportSnsNumber = reportSnsNumber;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getReportedMemberId() {
		return reportedMemberId;
	}

	public void setReportedMemberId(String reportedMemberId) {
		this.reportedMemberId = reportedMemberId;
	}

	@Override
	public String toString() {
		return "ReportSnsVO [reportNumber=" + reportNumber + ", reportTitle=" + reportTitle + ", reportContent="
				+ reportContent + ", reportDate=" + reportDate + ", reportMemberNumber=" + reportMemberNumber
				+ ", reportSnsNumber=" + reportSnsNumber + ", memberId=" + memberId + ", reportedMemberId="
				+ reportedMemberId + "]";
	}

			
	

}
