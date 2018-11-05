package kr.or.kosta.eterna.category.domain;

public class Category {
	/**카테고리 식별자*/
	private int categoryId;
	/** 카테고리 타입*/
	private String categoryType;
	
	public Category() {
		super();
	}
	

	public Category(int categoryId, String categoryType) {
		super();
		this.categoryId = categoryId;
		this.categoryType = categoryType;
	}


	public int getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}


	public String getCategoryType() {
		return categoryType;
	}


	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}


	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryType=" + categoryType +"]";
	}
}
