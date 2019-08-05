package com.bitcamp.guest.domain;

public class RequestGuestWrite {

	private String guestName;
	private String password;
	private String message;

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

	@Override
	public String toString() {
		return "RequestGuestWrite [guestName=" + guestName + ", password=" + password + ", message=" + message + "]";
	}
	
	public Message toMessage() {
		
		Message message = new Message(0, guestName, password, this.message);
		return message;
		
		
	}
	
	
	


}