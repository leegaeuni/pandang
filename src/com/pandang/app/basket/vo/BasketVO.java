package com.pandang.app.basket.vo;


//select store_file_system_name,
//ts.store_title , ts.store_price 
//from tbl_store ts join tbl_store_file tsf 
//on ts.store_number = tsf.store_number 
//order by ts.store_number desc 

public class BasketVO {
	private String storeFileSystemName;
	private String storeTitle;
	private int storePrice;
	
	public BasketVO() {
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

	@Override
	public String toString() {
		return "BasketVO [storeFileSystemName=" + storeFileSystemName + ", storeTitle=" + storeTitle + ", storePrice="
				+ storePrice + "]";
	}

	
}
