package practice2;

public class DescCategory implements java.util.Comparator {
	@Override
	public int compare(Object o1, Object o2) {
		Book b1 = (Book) o1;
		Book b2 = (Book) o2;
		return b2.getCategory() - b1.getCategory(); // 카테고리 내림차순 정렬
	}
}
