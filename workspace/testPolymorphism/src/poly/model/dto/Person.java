package poly.model.dto;
//dto(Data Transfer Object) == vo(Value Object) == do(domain object) == entity == bean
//값(data)을 저장하는 목적의 클래스

//작성규칙 : 
//1. 반드시 캡슐화할 것 : 모든 필드가 private 할 것
//2. 기본생성자와 매개변수 있는 생성자를 가지고 있어야 함
//3. 모든 필드에 대한 getter and setter 가 있어야 함
//4. toString(), equals() 등에 대한 오버라이딩 해야 함(선택사항)
//5. 반드시 직렬화할 것 : 네트워크 입출력을 위해 첵체 인스턴스를 1바이트 크기로 일렬로 나열하는 것
//		=> 직렬화 처리는 java.io.Serializable 인터페이스를 상속받으면 됨
public class Person implements java.io.Serializable {
	//Field
	private String name;
	private int age;
	private char gender;
	private String email;
	private String phone;
	
	//Constructor
	public Person() {}
	
	public Person(String name, int age, char gender, String email, String phone) {
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
	}
	
	//setters and getters
	public void setName(String name) {
		this.name = name;
	}
	
	public void setAge(int age) {
		this.age = age;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public int getAge() {
		return age;
	}

	@Override
	public String toString() {
		return "Person [name=" + name + ", age=" + age + ", gender=" + gender + ", email=" + email + ", phone=" + phone
				+ "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (this.getClass() != obj.getClass())
			return false;
		
		//후손이 가진 필드르 다루려면, 부모타입에서 후손타입으로 형변환해야 함 : DownCasting
		// (후손클래스명)부모타입레퍼런스
		Person other = (Person)obj;
		return this.name.equals(other.name) && this.age == other.age 
				&& this.gender == other.gender && this.email.equals(other.email)
				&& this.phone.equals(other.phone);
	}

	//부모의 접근제한자보다 더 넓은 범위의 것으로 변경 가능함
	// public > protected > default(package private) > private
	//부모가 가진 예외 갯수를 줄일 수 있음 : 0개까지 가능
	@Override
	public Object clone() {		
		return new Person(this.name, this.age, this.gender, this.email, this.phone);
	}	
	
}






