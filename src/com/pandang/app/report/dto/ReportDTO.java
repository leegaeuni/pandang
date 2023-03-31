package com.pandang.app.report.dto;

public class ReportDTO {
	private int reportNumber;
	private String reportTitle;
	private String reportContent;
	private String reportDate;
	private int reportMemberNumber;
	private int reportStoreNumber;
	private int reportSnsNumber;
	
	public ReportDTO() {}

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

	public int getReportStoreNumber() {
		return reportStoreNumber;
	}

	public void setReportStoreNumber(int reportStoreNumber) {
		this.reportStoreNumber = reportStoreNumber;
	}

	public int getReportSnsNumber() {
		return reportSnsNumber;
	}

	public void setReportSnsNumber(int reportSnsNumber) {
		this.reportSnsNumber = reportSnsNumber;
	}

	@Override
	public String toString() {
		return "ReportDTO [reportNumber=" + reportNumber + ", reportTitle=" + reportTitle + ", reportContent="
				+ reportContent + ", reportDate=" + reportDate + ", reportMemberNumber=" + reportMemberNumber
				+ ", reportStoreNumber=" + reportStoreNumber + ", reportSnsNumber=" + reportSnsNumber + "]";
	}
	
	
}
