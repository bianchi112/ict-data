package poly.model.dto;

public class Student extends Person {
	//Field
	private int sno;  //학생번호
	private String major;  //전공학과
	private double score;  //점수	
	
	//Constructor
	public Student() {
		super();
	}

	public Student(int sno, String major, double score) {
		super();
		this.sno = sno;
		this.major = major;
		this.score = score;
	}

	public Student(String name, int age, char gender, String email, String phone, 
			int sno, String major, double score) {
		super(name, age, gender, email, phone);
		this.sno = sno;
		this.major = major;
		this.score = score;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Student [sno=" + sno + ", major=" + major + ", score=" + score + ", getGender()=" + getGender()
				+ ", getEmail()=" + getEmail() + ", getPhone()=" + getPhone() + ", getName()=" + getName()
				+ ", getAge()=" + getAge() + "]";
	}

	@Override
	public boolean equals(Object obj) {
		Student other = (Student)obj;
		return super.equals(obj) && this.sno == other.sno && this.major.equals(other.major)
				&& this.score == other.score;
	}

	@Override
	public Object clone() {		
		return new Student(this.getName(), this.getAge(), this.getGender(), 
				this.getEmail(), this.getPhone(), this.sno, this.major, this.score);
	}	
	
}
