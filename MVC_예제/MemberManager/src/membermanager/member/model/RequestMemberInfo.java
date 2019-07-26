package membermanager.member.model;


// 만든이유 ---> usebean 액션태그를 사용할 수 없기때문에 그 대신에 사용할 클래스를 만듬.
public class RequestMemberInfo {
	
	private String uId;
	private String uPw;
	private String uName;
	private String uPhoto;
	
	public RequestMemberInfo() {}
	
	public RequestMemberInfo(String uId, String uPw, String uName, String uPhoto) {
		this.uId = uId;
		this.uPw = uPw;
		this.uName = uName;
		this.uPhoto = uPhoto;
	}

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

	public String getuPhoto() {
		return uPhoto;
	}

	public void setuPhoto(String uPhoto) {
		this.uPhoto = uPhoto;
	}

	@Override
	public String toString() {
		return "RequestMemberInfor [uId=" + uId + ", uPw=" + uPw + ", uName=" + uName + ", uPhoto=" + uPhoto + "]";
	}
	
	public MemberInfo toMemberInfo() {
		return new MemberInfo(uId, uPw, uName, uPhoto);
	}
	
	
	
	
	
	

}