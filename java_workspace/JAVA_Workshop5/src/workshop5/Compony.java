package workshop5;

public class Compony {
    private double salary;
    private double annualIncome;
    private double bonus;
    private double afterTaxBonus;
    
    // 기본 생성자
    public Compony() {
        this.salary = 0;
    }
    
    // 1개의 클래스 변수를 받는 생성자
    public Compony(double salary) {
        this.salary = salary;
    }
    
    // 연 기본급의 합을 계산하여 리턴
    public double getIncome() {
        return this.salary * 12;
    }
    
    // 연 기본급의 합에서 세금을 공제한 금액을 리턴
    public double getAfterTaxIncome() {
        double annualIncome = getIncome();
        return annualIncome * 0.90; // 10% 세금 공제
    }
    
    // 연 보너스의 합을 계산하여 리턴
    public double getBonus() {
        return this.salary * 0.20 * 4; // 분기별로 20% 보너스, 4분기
    }
    
    // 연 보너스의 합에서 세금을 공제한 금액을 리턴
    public double getAfterTaxBonus() {
        double annualBonus = getBonus();
        return annualBonus * 0.945; // 5.5% 세금 공제
    }
}
