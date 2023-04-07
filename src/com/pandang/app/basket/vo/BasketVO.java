package com.pandang.app.basket.vo;


//select m.member_number , s.store_number , sf.store_file_system_name ,
//s.store_title , s.store_price , b.basket_cnt
//from tbl_member m join tbl_basket b on m.member_number = #{memberNumber}
//and m.member_number = b.member_number
//join tbl_store s on b.store_number = s.store_number
//left outer join tbl_store_file sf
//on s.store_number = sf.store_number ;

public class BasketVO {
	private int memberNumber;
	private int storeNumber;
	private String storeFileSystemName; 
	private String storeTitle;
	private int storePrice;
	private int basketCnt;
	
	public BasketVO() {}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public int getStoreNumber() {
		return storeNumber;
	}

	public void setStoreNumber(int storeNumber) {
		this.storeNumber = storeNumber;
	}

	public String getStoreFileSystemName() {
		return storeFileSystemName;
	}

	public void setStoreFileSystemName(String storeFileSystemName) {
		this.storeFileSystemName = storeFileSystemName;
	}

	public String getStoreTitle() {
		return storeTitle;
	}

	public void setStoreTitle(String storeTitle) {
		this.storeTitle = storeTitle;
	}

	public int getStorePrice() {
		return storePrice;
	}

	public void setStorePrice(int storePrice) {
		this.storePrice = storePrice;
	}

	public int getBasketCnt() {
		return basketCnt;
	}

	public void setBasketCnt(int basketCnt) {
		this.basketCnt = basketCnt;
	}

	@Override
	public String toString() {
		return "BasketVO [memberNumber=" + memberNumber + ", storeNumber=" + storeNumber + ", storeFileSystemName="
				+ storeFileSystemName + ", storeTitle=" + storeTitle + ", storePrice=" + storePrice + ", basketCnt="
				+ basketCnt + "]";
	}
}