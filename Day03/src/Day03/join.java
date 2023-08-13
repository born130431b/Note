package Day03;

// 자바빈스 : 웹에서 사용할 데이터를 정의하고, 입출력에 사용할 수 있는 클래스
// 작성 규칙이 있음
// 1. 필드는 private
// 2. 메서드는 public
// 3. 기본 생성자 필수!!

// *생성자를 작성하면, 자바 컴파일러가 기본생성자를 만들어 주지 않음


public class join {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String[] hobby;
	

	
	// Access 메서드 : private 맴버에 접근할 수 있는 메서드
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String[] getHobby() {
		return hobby;
	}

	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}
	
	// 배열같은 경우는 메서드로 만들어서 사용하면 편리
	public String hobbys() {
		String result = "";
		
		for (int i = 0; i < hobby.length;i++) {
			result += hobby[i] + " ";
		}
		return result;
	}
	
	
	
}
