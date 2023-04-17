package com.pandang.app.sns.vo;
//select ts.store_number , ts.store_title  as storeTitle, ts.store_date  as storeDate, ts.store_view_cnt  as storeViewCnt,
//count(tsl.store_number) as likeCnt
//from tbl_store ts
//left join tbl_store_like tsl
//on ts.store_number  = tsl.store_number 
//where ts.member_number = 1
//group by ts.store_number , ts.store_title , ts.store_date , ts.store_view_cnt 
//order by ts.store_date  desc;
public class SnsStoreVO {
	private int storeNumber;
	private String storeTitle;
	private String storeDate;
	private int storeViewCnt;
	private int likeCnt;
	private int memberNumber;
	
	
	public SnsStoreVO() {
		// TODO Auto-generated constructor stub
	}


	public int getStoreNumber() {
		return storeNumber;
	}


	public void setStoreNumber(int storeNumber) {
		this.storeNumber = storeNumber;
	}


	public String getStoreTitle() {
		return storeTitle;
	}


	public void setStoreTitle(String storeTitle) {
		this.storeTitle = storeTitle;
	}


	public String getStoreDate() {
		return storeDate;
	}


	public void setStoreDate(String storeDate) {
		this.storeDate = storeDate;
	}


	public int getStoreViewCnt() {
		return storeViewCnt;
	}


	public void setStoreViewCnt(int storeViewCnt) {
		this.storeViewCnt = storeViewCnt;
	}


	public int getLikeCnt() {
		return likeCnt;
	}


	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}


	public int getMemberNumber() {
		return memberNumber;
	}


	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}


	@Override
	public String toString() {
		return "SnsStoreVO [storeNumber=" + storeNumber + ", storeTitle=" + storeTitle + ", storeDate=" + storeDate
				+ ", storeViewCnt=" + storeViewCnt + ", likeCnt=" + likeCnt + ", memberNumber=" + memberNumber + "]";
	}
	
	
	
	
}
