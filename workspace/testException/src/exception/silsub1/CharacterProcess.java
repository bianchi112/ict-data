package exception.silsub1;

public class CharacterProcess {
	public CharacterProcess() {}
	
	public int countAlpha(String s) throws CharCheckException {
		//전달된 문자열에서 영문자가 몇개인지 카운트해서 리턴
		//단, 공백문자가 있으면 CharCheckException 발생 
		//		=> 에러메시지 : "체크할 문자열 안에 공백 포함할 수 없습니다."
		int count = 0;
		for(int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			//if(Character.isAlphabetic(c)) {
			if((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')) {
				count++;
			}
			if(Character.isSpaceChar(c)) {
				throw new CharCheckException("체크할 문자열 안에 공백 포함할 수 없습니다.");
			}
		}
		return count;
	}
}
