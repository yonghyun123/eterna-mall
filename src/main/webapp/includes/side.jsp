<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
          <div class="col-md-3 order-1 mb-5 mb-md-0">
            <div class="border p-4 rounded mb-4">
              <h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
              <ul class="list-unstyled mb-0" id="sexL">
              <!-- to.용현 url 정리 수정 요망!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  from.희진 -->
                <li class="mb-1"><a href="/product.mall?sex=남성" class="d-flex"><span>남성</span></a></li>
                <li class="mb-1"><a href="/product.mall?sex=여성" class="d-flex"><span>여성</span> </a></li>
                <li class="mb-1"><a href="/product.mall?sex=공용" class="d-flex"><span>공용</span> </a></li>
              </ul>
            </div>

      <form action="/conditions.mall" method="post">
            <div class="border p-4 rounded mb-4">
              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">가격</h3>
                <div id="slider-range" class="border-primary"></div>
                <input type="text" name="text" id="amount" class="form-control border-0 pl-0 bg-white" disabled="" />
                <input type="hidden" name="minAmount" id="minAmount">
                <input type="hidden" name="maxAmount" id="maxAmount">                
              </div>

              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">나이</h3>
                <label for="s_sm" class="d-flex">
                <!-- 동적으로 체크박스 뿌리기 -->
                  <input type="checkbox" id="s_sm" class="mr-2 mt-1" value="10" name="ages"> <span class="text-black">10대</span>
                </label>
                <label for="s_sm" class="d-flex">
                  <input type="checkbox" id="s_sm" class="mr-2 mt-1" value="20" name="ages"> <span class="text-black">20대</span>
                </label>
                <label for="s_sm" class="d-flex">
                  <input type="checkbox" id="s_sm" class="mr-2 mt-1" value="30" name="ages"> <span class="text-black">30대</span>
                </label>
                <label for="s_sm" class="d-flex">
                  <input type="checkbox" id="s_sm" class="mr-2 mt-1" value="40" name="ages"> <span class="text-black">40대</span>
                </label>
              </div>

              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">피부 타입</h3>
                           
                <label for="s_lg" class="d-flex">
                  <input type="radio" id="s_lg" class="mr-2 mt-1" value="건성" name="type"> <span class="text-black">건성</span>
                </label>
                <label for="s_lg" class="d-flex">
                  <input type="radio" id="s_lg" class="mr-2 mt-1" value="지성" name="type"> <span class="text-black">지성</span>
                </label>
                <label for="s_lg" class="d-flex">
                  <input type="radio" id="s_lg" class="mr-2 mt-1" value="복합성" name="type"> <span class="text-black">복합성</span>
                </label>
              </div>
              <input type="submit" class="buy-now btn btn-sm btn-primary" value="SEARCH">
            </div>
            </form>
          </div>
          
