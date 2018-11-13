package kr.or.kosta.eterna.admin.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.buy.dao.BuyDao;
import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.fileInfo.dao.FileInfoDao;
import kr.or.kosta.eterna.fileInfo.domain.FileInfo;
import kr.or.kosta.eterna.price.dao.PriceDao;
import kr.or.kosta.eterna.price.domain.Price;
import kr.or.kosta.eterna.product.dao.ProductDao;
import kr.or.kosta.eterna.product.domain.Product;
import kr.or.kosta.eterna.productImage.dao.ProductImageDao;
import kr.or.kosta.eterna.productImage.domain.ProductImage;
import kr.or.kosta.eterna.qna.dao.QnADao;
import kr.or.kosta.eterna.qna.domain.QnA;
import kr.or.kosta.eterna.review.dao.ReviewDao;
import kr.or.kosta.eterna.user.dao.UserDao;
import kr.or.kosta.eterna.user.dao.UserRcmdDao;
import kr.or.kosta.eterna.user.domain.User;
import kr.or.kosta.eterna.user.domain.UserRcmd;

public class AdminServiceImpl implements AdminService {

	private UserDao userDao;
	private UserRcmdDao userRcmdDao;
	private ProductDao productDao;
	private BuyDao buyDao;

	private ProductImageDao productImageDao;
	private FileInfoDao fileInfoDao;
	private PriceDao priceDao;

	private QnADao qnaDao;
	private ReviewDao reviewDao;

	public QnADao getQnaDao() {
		return qnaDao;
	}

	public void setQnaDao(QnADao qnaDao) {
		this.qnaDao = qnaDao;
	}

	public ReviewDao getReviewDao() {
		return reviewDao;
	}

	public void setReviewDao(ReviewDao reviewDao) {
		this.reviewDao = reviewDao;
	}

	public FileInfoDao getFileInfoDao() {
		return fileInfoDao;
	}

	public void setFileInfoDao(FileInfoDao fileInfoDao) {
		this.fileInfoDao = fileInfoDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public BuyDao getBuyDao() {
		return buyDao;
	}

	public void setBuyDao(BuyDao buyDao) {
		this.buyDao = buyDao;
	}

	public UserRcmdDao getUserRcmdDao() {
		return userRcmdDao;
	}

	public void setUserRcmdDao(UserRcmdDao userRcmdDao) {
		this.userRcmdDao = userRcmdDao;
	}

	public ProductImageDao getProductImageDao() {
		return productImageDao;
	}

	public void setProductImageDao(ProductImageDao productImageDao) {
		this.productImageDao = productImageDao;
	}

	public PriceDao getPriceDao() {
		return priceDao;
	}

	public void setPriceDao(PriceDao priceDao) {
		this.priceDao = priceDao;
	}

	@Override
	public List<Buy> showOrderListDetails(String id) throws Exception {
		List<Buy> buy = buyDao.showOrderDetail(id);
		return buy;
	}

	@Override
	public Map<String, Object> showUserListDetails(String userId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = userDao.read(userId);
		UserRcmd useRrcmd = userRcmdDao.read(userId);
		int cleansingCount = 0;
		int libCount = 0;
		int lotionCount = 0;
		int skinCount = 0;
		int sunCount = 0;
		if (useRrcmd != null) {
			cleansingCount = Integer.parseInt(useRrcmd.getCleansingCount());
			libCount = Integer.parseInt(useRrcmd.getLibCount());
			lotionCount = Integer.parseInt(useRrcmd.getLotionCount());
			skinCount = Integer.parseInt(useRrcmd.getSkinCount());
			sunCount = Integer.parseInt(useRrcmd.getSunCount());
		}
		Map<String, Integer> countMap = new HashMap<String, Integer>();
		countMap.put("클렌징", cleansingCount);
		countMap.put("립제품", libCount);
		countMap.put("로션", lotionCount);
		countMap.put("스킨", skinCount);
		countMap.put("선케어", sunCount);
		List<String> sortedKeyList = SortMap(countMap);
		map.put("user", user);
		map.put("sortedKeyList", sortedKeyList);
		return map;
	}

	/** count 수에 따라 정렬 */
	@SuppressWarnings("unchecked")
	private static List SortMap(Map map) {
		List<String> list = new ArrayList();
		list.addAll(map.keySet());
		Collections.sort(list, new Comparator() {
			public int compare(Object o1, Object o2) {
				Object v1 = map.get(o1);
				Object v2 = map.get(o2);
				return ((Comparable) v2).compareTo(v1);
			}
		});
		return list;
	}

	@Override
	public Map<String, Object> showStockListDetails(String productId) throws Exception {
		Product product = productDao.read(productId);
		List<ProductImage> imageList = productImageDao.imageAll(productId);
		System.out.println(imageList.size());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product", product);
		map.put("imageList", imageList);
		return map;
	}

	@Override
	public void registProduct(Map<String, Object> map) throws Exception {
		productDao.regist((Product) map.get("product"));

		FileInfo[] fileArray = (FileInfo[]) map.get("fileArray");
		for (FileInfo fileInfo : fileArray) {
			fileInfoDao.regist(fileInfo);
		}

		ProductImage[] imageArray = (ProductImage[]) map.get("imageArray");
		for (ProductImage productImage : imageArray) {
			productImageDao.regist(productImage);
		}

		priceDao.registProductPrice((Price) map.get("price"));
	}

	@Override
	public void updateStatus(String id, String orderFlag) throws Exception {
		buyDao.updateStatus(id, orderFlag);

	}

	@Override
	public int newOrder() throws Exception {
		return buyDao.newOrder();
	}

	@Override
	public int outOfStock() throws Exception {
		return productDao.outOfStock();
	}

	@Override
	public int newQnA() throws Exception {
		return qnaDao.newQnA();
	}

	@Override
	public int newUser() throws Exception {
		return userDao.newUser();
	}

	@Override
	public int newReview() throws Exception {
		return reviewDao.newReview();
	}

	@Override
	public void updateTier(String userId) throws Exception {
		int difference = userDao.differenceAmount(userId);
		if (difference < 0) {
			userDao.updateGrade(userId);
		}
	}

	@Override
	public void updateStock(String productDescription, String count) throws Exception {
		productDao.updateStock(productDescription, count);
	}

	

	@Override
	public void createComment(QnA qna) throws Exception {
		qnaDao.createComment(qna);
		qnaDao.updateFlag(qna.getId());
	}
}
