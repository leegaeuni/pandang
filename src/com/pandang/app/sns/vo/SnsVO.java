package com.pandang.app.sns.vo;

//select ts.sns_number, ts.sns_title, ts.sns_content, ts.sns_date, ts.sns_view_cnt,
//count(tsl.sns_number) as like_cnt, tsf.sns_file_system_name 
//from tbl_member tm 
//join tbl_sns ts on tm.member_number = ts.member_number 
//left join tbl_sns_like tsl on ts.sns_number  = tsl.sns_number 
//left join tbl_sns_file tsf on tsl.sns_number = tsf.sns_number 
//where tm.member_number = 1
//group by ts.sns_number, ts.sns_title, ts.sns_content, ts.sns_date, ts.sns_view_cnt, tsf.sns_file_system_name
//order by ts.sns_date desc;
public class SnsVO {
	private int snsNumber;
	private String snsTitle;
	private String snsContent;
	private String snsDate;
	private int snsViewCnt;
	private int likeCnt;
	private String snsFileSystemName;
	
	
	public SnsVO() {
		// TODO Auto-generated constructor stub
	}


	public int getSnsNumber() {
		return snsNumber;
	}


	public void setSnsNumber(int snsNumber) {
		this.snsNumber = snsNumber;
	}


	public String getSnsTitle() {
		return snsTitle;
	}


	public void setSnsTitle(String snsTitle) {
		this.snsTitle = snsTitle;
	}


	public String getSnsContent() {
		return snsContent;
	}


	public void setSnsContent(String snsContent) {
		this.snsContent = snsContent;
	}


	public String getSnsDate() {
		return snsDate;
	}


	public void setSnsDate(String snsDate) {
		this.snsDate = snsDate;
	}


	public int getSnsViewCnt() {
		return snsViewCnt;
	}


	public void setSnsViewCnt(int snsViewCnt) {
		this.snsViewCnt = snsViewCnt;
	}


	public int getLikeCnt() {
		return likeCnt;
	}


	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}


	public String getSnsFileSystemName() {
		return snsFileSystemName;
	}


	public void setSnsFileSystemName(String snsFileSystemName) {
		this.snsFileSystemName = snsFileSystemName;
	}


	@Override
	public String toString() {
		return "SnsVO [snsNumber=" + snsNumber + ", snsTitle=" + snsTitle + ", snsContent=" + snsContent + ", snsDate="
				+ snsDate + ", snsViewCnt=" + snsViewCnt + ", likeCnt=" + likeCnt + ", snsFileSystemName="
				+ snsFileSystemName + "]";
	}
	
	
	
	
	
	
	
}
