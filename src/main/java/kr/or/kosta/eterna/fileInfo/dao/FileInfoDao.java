package kr.or.kosta.eterna.fileInfo.dao;
import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.fileInfo.domain.FileInfo;
import kr.or.kosta.eterna.product.domain.Product;


/**
 * Product 인터페이스 선언
 * @author 권현우
 *
 */
public interface FileInfoDao {
	/**파일등록*/
	public void regist(FileInfo fileInfo) throws Exception;
	/**파일정보수정*/
	public void update(FileInfo fileInfo) throws Exception;
	/**파일삭제*/
	public void delete(String file_id) throws Exception;
	/**파일전체조회*/
	public List<FileInfo> fileListAll() throws Exception;
}
