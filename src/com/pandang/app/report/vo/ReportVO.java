package com.pandang.app.report.vo;

public class ReportVO {
	private int reportNumber;
	private String reportTitle;
	private String reportContent;
	private String reportDate;
	private int reportMemberNumber;
	private int reportStoreNumber;
	private int reportSnsNumber;
	private String memberId;
	
	public ReportVO() {}

	int getReportNumber() {
		return reportNumber;
	}

	void setReportNumber(int reportNumber) {
		this.reportNumber = reportNumber;
	}

	String getReportTitle() {
		return reportTitle;
	}

	void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	String getReportContent() {
		return reportContent;
	}

	void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	String getReportDate() {
		return reportDate;
	}

	void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	int getReportMemberNumber() {
		return reportMemberNumber;
	}

	void setReportMemberNumber(int reportMemberNumber) {
		this.reportMemberNumber = reportMemberNumber;
	}

	int getReportStoreNumber() {
		return reportStoreNumber;
	}

	void setReportStoreNumber(int reportStoreNumber) {
		this.reportStoreNumber = reportStoreNumber;
	}

	int getReportSnsNumber() {
		return reportSnsNumber;
	}

	void setReportSnsNumber(int reportSnsNumber) {
		this.reportSnsNumber = reportSnsNumber;
	}

	String getMemberId() {
		return memberId;
	}

	void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "ReportVO [reportNumber=" + reportNumber + ", reportTitle=" + reportTitle + ", reportContent="
				+ reportContent + ", reportDate=" + reportDate + ", reportMemberNumber=" + reportMemberNumber
				+ ", reportStoreNumber=" + reportStoreNumber + ", reportSnsNumber=" + reportSnsNumber + ", memberId="
				+ memberId + "]";
	}

		
	

}
