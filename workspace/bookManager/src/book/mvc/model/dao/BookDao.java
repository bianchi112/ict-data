package book.mvc.model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import book.mvc.model.vo.Book;
import common.JDBCTemp;

public class BookDao {

	// 도서 추가
	public int insertBook(Book b) {
		String query = "INSERT INTO Book VALUES(seq_bid.NEXTVAL, ?, ?, ?, ?, ?)";
		try (Connection conn = JDBCTemp.getInstance().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getAuthor());
			pstmt.setString(3, b.getPublisher());
			pstmt.setDate(4, b.getPublishDate());
			pstmt.setDouble(5, b.getPrice());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 도서 수정
	public int updateBook(Book b) {
		String query = "UPDATE Book SET title=?, author=?, publisher=?, publish_date=?, price=? WHERE book_id=?";
		try (Connection conn = JDBCTemp.getInstance().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getAuthor());
			pstmt.setString(3, b.getPublisher());
			pstmt.setDate(4, b.getPublishDate());
			pstmt.setDouble(5, b.getPrice());
			pstmt.setInt(6, b.getBookId());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 도서 삭제
	public int deleteBook(int bookId) {
		String query = "DELETE FROM Book WHERE book_id=?";
		try (Connection conn = JDBCTemp.getInstance().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {
			pstmt.setInt(1, bookId);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 모든 도서 조회
	public ArrayList<Book> selectAllBooks() {
		ArrayList<Book> list = new ArrayList<>();
		String query = "SELECT * FROM Book";
		try (Connection conn = JDBCTemp.getInstance().getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rset = stmt.executeQuery(query)) {
			while (rset.next()) {
				Book b = new Book(rset.getInt("book_id"), rset.getString("title"), rset.getString("author"),
						rset.getString("publisher"), rset.getDate("publish_date"), rset.getDouble("price"));
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 책 제목으로 도서 조회
	public ArrayList<Book> searchBookTitle(String bookTitle) {
		ArrayList<Book> list = new ArrayList<>();
		String query = "SELECT * FROM Book WHERE title LIKE ?";
		try (Connection conn = JDBCTemp.getInstance().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {
			pstmt.setString(1, "%" + bookTitle + "%");
			try (ResultSet rset = pstmt.executeQuery()) {
				while (rset.next()) {
					Book b = new Book(rset.getInt("book_id"), rset.getString("title"), rset.getString("author"),
							rset.getString("publisher"), rset.getDate("publish_date"), rset.getDouble("price"));
					list.add(b);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 책 아이디로 도서 조회
	public Book selectBook(int bookId) {
		Book b = null;
		String query = "SELECT * FROM Book WHERE book_id=?";
		try (Connection conn = JDBCTemp.getInstance().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {
			pstmt.setInt(1, bookId);
			try (ResultSet rset = pstmt.executeQuery()) {
				if (rset.next()) {
					b = new Book(rset.getInt("book_id"), rset.getString("title"), rset.getString("author"),
							rset.getString("publisher"), rset.getDate("publish_date"), rset.getDouble("price"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;
	}
}
