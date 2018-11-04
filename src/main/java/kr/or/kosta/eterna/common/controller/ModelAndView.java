package kr.or.kosta.eterna.common.controller;

import java.util.HashMap;
import java.util.Map;

/** 모델 및 뷰 패스 저장을 위한 Wrapper 클래스 */
public class ModelAndView{
	private String view;//view의 path
	private Map<String, Object> model; //여러개의 데이터를 저장하는 map
	
	public ModelAndView() {
		model = new HashMap<String, Object>();
	}
	public ModelAndView(String view, Map<String, Object> model) {
		this.view = view;
		this.model = model;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	public Map<String, Object> getModel() {
		return model;
	}
	public void setModel(Map<String, Object> model) {
		this.model = model;
	}
	/**bussiness Method 맵에 데이터를 추가하는 메서드 */
	public void addObject(String key, Object value){
		model.put(key, value);
	}
	
	@Override
	public String toString() {
		return "ModelAndView [view=" + view + ", model=" + model + "]";
	}
}