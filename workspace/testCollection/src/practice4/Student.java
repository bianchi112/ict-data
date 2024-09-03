package practice4;

public class Student {
	private int sno;
	private String sname;
	private int kor, eng, mat, tot, avg;

	// 기본 생성자
	public Student() {
	}

	// 매개변수 있는 생성자
	public Student(int sno, String sname, int kor, int eng, int mat) {
		this.sno = sno;
		this.sname = sname;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		this.tot = kor + eng + mat;
		this.avg = tot / 3;
	}

	// Getter and Setter methods
	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
		updateTotAvg();
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
		updateTotAvg();
	}

	public int getMat() {
		return mat;
	}

	public void setMat(int mat) {
		this.mat = mat;
		updateTotAvg();
	}

	public int getTot() {
		return tot;
	}

	public int getAvg() {
		return avg;
	}

	private void updateTotAvg() {
		this.tot = this.kor + this.eng + this.mat;
		this.avg = this.tot / 3;
	}

	@Override
	public String toString() {
		return "Student [sno=" + sno + ", sname=" + sname + ", kor=" + kor + ", eng=" + eng + ", mat=" + mat + ", tot="
				+ tot + ", avg=" + avg + "]";
	}
}
