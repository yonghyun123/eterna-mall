package kr.or.kosta.eterna.review.service;

import java.util.List;

import kr.or.kosta.eterna.review.dao.ReviewDao;
import kr.or.kosta.eterna.review.domain.Review;

public class ReviewServiceImpl implements ReviewService {
	
	private ReviewDao reviewDao;
	
	public ReviewDao getReviewDao() {
		return reviewDao;
	}

	public void setReviewDao(ReviewDao reviewDao) {
		this.reviewDao = reviewDao;
	}

	@Override
	public void create(Review review) throws Exception {
		reviewDao.create(review);
	}

	@Override
	public List<Review> listItem(String productId) throws Exception {
		return reviewDao.listItem(productId);
	}

	@Override
	public List<Review> myReviewList(String userId) throws Exception {
		return reviewDao.myReviewList(userId);
	}

	@Override
	public List<Review> listAll() throws Exception {
		return reviewDao.listAll();
	}


}
