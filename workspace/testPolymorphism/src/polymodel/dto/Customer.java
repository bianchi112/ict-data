package polymodel.dto;

public class Customer extends Person {
	//Field
	private String address;
	private double point;
	
	public Customer() {
		super();
	}

	public Customer(String address, double point) {
		super();
		this.address = address;
		this.point = point;
	}

	public Customer(String name, int age, char gender, String email, String phone,
			String address, double point) {
		super(name, age, gender, email, phone);
		this.address = address;
		this.point = point;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public double getPoint() {
		return point;
	}

	public void setPoint(double point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "Customer [address=" + address + ", point=" + point + ", getGender()=" + getGender() + ", getEmail()="
				+ getEmail() + ", getPhone()=" + getPhone() + ", getName()=" + getName() + ", getAge()=" + getAge()
				+ "]";
	}

	@Override
	public boolean equals(Object obj) {
		Customer other = (Customer)obj;
		return super.equals(obj) && this.address.equals(other.address) && this.point == other.point;
	}

	@Override
	public Object clone() {		
		return new Customer(this.getName(), this.getAge(), this.getGender(), this.getEmail(), 
				this.getPhone(), this.address, this.point);
	}	
	
}
