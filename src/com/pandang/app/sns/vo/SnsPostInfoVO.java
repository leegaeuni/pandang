package com.pandang.app.sns.vo;

//select ts.sns_title, ts.sns_date, ts.sns_view_cnt, count(tsl.sns_number) as like_cnt
//from tbl_sns ts 
//left join tbl_sns_like tsl 
//on ts.sns_number = tsl.sns_number
//where ts.member_number = 1
//group by ts.sns_number, ts.sns_title, ts.sns_date, ts.sns_view_cnt;

public class SnsPostInfoVO {
	
	private String snsTitle;
	private String snsDate;
	private int snsViewCnt;
	private int likeCnt;
	private int snsNumber;
	
	public int getSnsNumber() {
		return snsNumber;
	}

	public void setSnsNumber(int snsNumber) {
		this.snsNumber = snsNumber;
	}

	public SnsPostInfoVO() {
		// TODO Auto-generated constructor stub
	}
	
	public String getSnsTitle() {
		return snsTitle;
	}

	public void setSnsTitle(String snsTitle) {
		this.snsTitle = snsTitle;
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

	
	@Override
	public String toString() {
		return "SnsPostInfoVO [snsTitle=" + snsTitle + ", snsDate=" + snsDate + ", snsViewCnt=" + snsViewCnt
				+ ", likeCnt=" + likeCnt + ", snsNumber=" + snsNumber + "]";
	}
	
	
	

}
