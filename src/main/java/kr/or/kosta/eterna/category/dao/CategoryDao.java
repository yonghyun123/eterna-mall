package kr.or.kosta.eterna.category.dao;
import java.util.List;

import kr.or.kosta.eterna.category.domain.Category;
import kr.or.kosta.eterna.price.domain.Price;


/**
 * Product 인터페이스 선언
 * @author 권현우
 *
 */
public interface CategoryDao {
	/**제품가격등록*/
	public void registCategory(Category category) throws Exception;
	/**제품가격수정*/
	public void updateCategory(Category category) throws Exception;
	/**제품가격삭제*/
	public void deleteCategory(String categoryId) throws Exception;
	/**제품가격전체조회*/
	public List<Category> categoryListAll() throws Exception;
}
