package com.pandang.app.report.store.dto;

public class ReportStoreDTO {
	private int reportNumber;
	private String reportTitle;
	private String reportContent;
	private String reportDate;
	private int reportMemberNumber;
	private int reportStoreNumber;
	
	public ReportStoreDTO() {}

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

	@Override
	public String toString() {
		return "ReportStoreDTO [reportNumber=" + reportNumber + ", reportTitle=" + reportTitle + ", reportContent="
				+ reportContent + ", reportDate=" + reportDate + ", reportMemberNumber=" + reportMemberNumber
				+ ", reportStoreNumber=" + reportStoreNumber + "]";
	}

		
	
}
