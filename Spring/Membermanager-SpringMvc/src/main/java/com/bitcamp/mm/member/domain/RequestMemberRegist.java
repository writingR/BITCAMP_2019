package com.bitcamp.mm.member.domain;

import org.springframework.web.multipart.MultipartFile;

public class RequestMemberRegist {

	private String uId;
	private String uPw;
	private String uName;
	private MultipartFile uPhoto;

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getuPw() {
		return uPw;
	}

	public void setuPw(String uPw) {
		this.uPw = uPw;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public MultipartFile getuPhoto() {
		return uPhoto;
	}

	public void setuPhoto(MultipartFile uPhoto) {
		this.uPhoto = uPhoto;
	}

	@Override
	public String toString() {
		return "RequestMemberRegist [uId=" + uId + ", uPw=" + uPw + ", uName=" + uName + ", uPhoto=" + uPhoto.getOriginalFilename() + "]";
	}
	
	public MemberInfo toMemberInfo() {
		
		MemberInfo info = new MemberInfo();
		info.setuId(uId);
		info.setuName(uName);
		info.setuPw(uPw);
		
		return info;
		
	}
	
	
	
	
	
	
	
	
	
	

}