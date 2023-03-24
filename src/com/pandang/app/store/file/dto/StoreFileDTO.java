package com.pandang.app.store.file.dto;

public class StoreFileDTO {
	private String storeFileSystemName;
	private String storeFileOriginalName;
	private int storeNumber;
	
	public StoreFileDTO() {}

	public String getStoreFileSystemName() {
		return storeFileSystemName;
	}

	public void setStoreFileSystemName(String storeFileSystemName) {
		this.storeFileSystemName = storeFileSystemName;
	}

	public String getStoreFileOriginalName() {
		return storeFileOriginalName;
	}

	public void setStoreFileOriginalName(String storeFileOriginalName) {
		this.storeFileOriginalName = storeFileOriginalName;
	}

	public int getStoreNumber() {
		return storeNumber;
	}

	public void setStoreNumber(int storeNumber) {
		this.storeNumber = storeNumber;
	}

	@Override
	public String toString() {
		return "StoreFileDTO [storeFileSystemName=" + storeFileSystemName + ", storeFileOriginalName="
				+ storeFileOriginalName + ", storeNumber=" + storeNumber + "]";
	}

	
	
}
