package practice2;

public class AscCategory implements java.util.Comparator {
	@Override
	public int compare(Object o1, Object o2) {
		Book b1 = (Book) o1;
		Book b2 = (Book) o2;
		return b1.getCategory() - b2.getCategory(); // 카테고리 오름차순 정렬
	}
}
