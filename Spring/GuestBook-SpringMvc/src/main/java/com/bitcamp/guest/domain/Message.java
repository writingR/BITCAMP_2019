    
package com.bitcamp.guest.domain;

public class Message {
	
	private int id;
	private String guestName;
	private String password;
	private String message;
	
	
	public Message() {}
	
	
	
	
	
	public Message(int id, String guestName, String password, String message) {		
		this.id = id;
		this.guestName = guestName;
		this.password = password;
		this.message = message;
	}





	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGuestName() {
		return guestName;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public boolean hasPassword() {
		return password != null && !password.isEmpty();
	}
	
	// 삭제시에 비밀번호 비교
	public boolean matchPassword(String pw) {
		return hasPassword() && password.equals(pw);
	}

	
	
	
	
	
	
	
	
	
	
	
}