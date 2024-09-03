package workshop5;

public class Test01 {
    public static void main(String[] args) {       

        String inputString = args[0];
        
        // 문자열을 문자 배열로 변환
        char[] charArray = inputString.toCharArray();
        
        // 문자 배열을 역순으로 출력
        for (int i = charArray.length - 1; i >= 0; i--) {
            System.out.print(charArray[i]);
        }
        
        // 개행 문자 출력
        System.out.println();
    }
}
