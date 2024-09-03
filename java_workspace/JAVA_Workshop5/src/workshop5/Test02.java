package workshop5;

public class Test02 {
    public static void main(String[] args) {
       
        double salary = Double.parseDouble(args[0]);
        
        // Compony 객체 생성
        Compony company = new Compony(salary);
        
        // 각 금액 계산
        double annualIncome = company.getIncome();
        double afterTaxIncome = company.getAfterTaxIncome();
        double annualBonus = company.getBonus();
        double afterTaxBonus = company.getAfterTaxBonus();
        double totalAfterTax = afterTaxIncome + afterTaxBonus;
        
        // 결과 출력
        System.out.println("연 기본급 합: " + annualIncome + " 세후: " + afterTaxIncome);
        System.out.println("연 보너스 합: " + annualBonus + " 세후: " + afterTaxBonus);
        System.out.println("연 지급액 합: " + totalAfterTax);
    }
}