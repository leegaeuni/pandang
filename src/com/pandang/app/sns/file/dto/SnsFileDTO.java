package com.pandang.app.sns.file.dto;

public class SnsFileDTO {
	private String snsFileSystemName;
	private String snsFileOriginalName;
	private int snsNumber;
	
	public SnsFileDTO() {}
	
	public String getSnsFileSystemName() {
		return snsFileSystemName;
	}
	public void setSnsFileSystemName(String snsFileSystemName) {
		this.snsFileSystemName = snsFileSystemName;
	}
	public String getSnsFileOriginalName() {
		return snsFileOriginalName;
	}
	public void setSnsFileOriginalName(String snsFileOriginalName) {
		this.snsFileOriginalName = snsFileOriginalName;
	}
	public int getSnsNumber() {
		return snsNumber;
	}
	public void setSnsNumber(int snsNumber) {
		this.snsNumber = snsNumber;
	}

	@Override
	public String toString() {
		return "SnsFileDTO [snsFileSystemName=" + snsFileSystemName + ", snsFileOriginalName=" + snsFileOriginalName
				+ ", snsNumber=" + snsNumber + "]";
	}

	
	
}
