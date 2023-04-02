package com.pandang.app.hashtag.dto;

public class HashtagDTO {
	private int hashtagNumber;
	private String hashtagName;
	
	public HashtagDTO() {}
	
	public int getHashtagNumber() {
		return hashtagNumber;
	}
	public void setHashtagNumber(int hashtagNumber) {
		this.hashtagNumber = hashtagNumber;
	}
	public String getHashtagName() {
		return hashtagName;
	}
	public void setHashtagName(String hashtagName) {
		this.hashtagName = hashtagName;
	}

	@Override
	public String toString() {
		return "HashtagDTO [hashtagNumber=" + hashtagNumber + ", hashtagName=" + hashtagName + "]";
	}

	
	
}
