package workshop5;

public class Test05 {
    public static void main(String[] args) {
        String str = "LGcns";
        
        // 1) 대문자로 변환하여 출력 (LGCNS)
        System.out.println(str.toUpperCase());
        
        // 2) 소문자로 변환하여 출력 (lgcns)
        System.out.println(str.toLowerCase());
        
        // 3) 처음 두 글자만 대문자로 출력 (LG)
        System.out.println(str.substring(0, 2).toUpperCase());
        
        // 4) 마지막 세 글자 출력 (cns)
        System.out.println(str.substring(2));
    }
}
