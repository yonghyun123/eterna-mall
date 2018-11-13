<%@ page contentType="text/html; charset=utf-8"%>
<style>
</style>
<div class="container">
  <div class="card card-register mx-auto mt-5 modal fade" id="registModal">
    <div class="card-header">BrandNew</div>
    <div class="card-body">
      <form>
        <div class="form-group">
          <div class="form-row">
            <div class="input-group mb-0">
              <div class="col-md-10">
                <label>PRODUCTINFOMATION</label>
              </div>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="form-row">
            <div class="col-md-10">
              <div class="form-label-group">
                <input type="text" id="inputBrand" class="form-control"
                  placeholder="Brand" required="required"> <label
                  for="inputBrand">Brand</label>
              </div>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="form-row">
            <div class="col-md-9">
              <div class="form-label-group">
                <input type="text" id="inputProduct"
                  class="form-control" placeholder="Product Description"
                  required="required" autofocus="autofocus"> <label
                  for="inputProduct">Product Description</label>
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-label-group">
                <input type="text" id="productStock"
                  class="form-control" placeholder="Last name"
                  required="required"> <label for="productStock">Stock</label>
              </div>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="form-row">
            <div class="col-md-12">
              <div class="form-label-group">
                <input type="text" id="InputPrice" class="form-control"
                  placeholder="InputPrice" required="required">
                <label for="InputPrice">Price</label>
              </div>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="form-row">
            <div class="col-md-4">
              <div class="form-label-group">
                <select class="form-control" id="categorySelector">
                  <option value="" selected disabled hidden>Category</option>
                  <option value='1'>Lip</option>
                  <option value='0'>Clensing</option>
                  <option value='2'>Skin</option>
                  <option value='3'>Lotion</option>
                  <option value='4'>SunCare</option>
                </select>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-label-group">
                <select class="form-control" id="SexSelector">
                  <option value="" selected disabled hidden>Sex</option>
                  <option value='여성'>Female</option>
                  <option value='남성'>Male</option>
                </select>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-label-group">
                <select class="form-control" id="skintypeSelector">
                  <option value="" selected disabled hidden>SkinType</option>
                  <option>dry</option>
                  <option>oily</option>
                  <option>complex</option>
                </select>
              </div>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="form-row">
            <div class="col-md-5">
              <div class="form-label-group">
                <select class="form-control" id="minAgeSelector">
                  <option value="" selected disabled hidden>MinAge</option>
                  <option value='10'>10</option>
                  <option value='20'>20</option>
                  <option value='30'>30</option>
                  <option value='40'>40</option>
                  <option value='50'>50</option>
                </select>
              </div>
            </div>
            <div class="col-md-2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~</div>
             <div class="col-md-5">
              <select class="form-control" id="maxAgeSelector">
                <option value="" selected disabled hidden>MaxAge</option>
              </select>
            </div>
          </div>
        </div>
        
        <div class="form-group">
          <div class="form-row">
            <div class="input-group mb-0">
              <div class="col-md-10">
                <label>PRODUCTIMAGE</label>
              </div>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="form-row">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text">Thumbnail</span>
              </div>
              <div class="custom-file">
                <input type="file" class="custom-file-input"
                  id="inputThumnail"> <label
                  class="custom-file-label" for="inputThumnail">
                </label>
              </div>
            </div>
          </div>
        </div>

        <div class="form-group">
          <div class="form-row">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text">Main</span>
              </div>
              <div class="custom-file">
                <input type="file" class="custom-file-input"
                  id="inputMainImg"> <label
                  class="custom-file-label" for="inputMainImg">
                </label>
              </div>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="form-row">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text">Side</span>
              </div>
              <div class="custom-file">
                <input type="file" class="custom-file-input"
                  id="inputSideImg"> <label
                  class="custom-file-label" for="inputSideImg">
                </label>
              </div>
            </div>
          </div>
        </div>
        <div class="card-footer">
          <button type="button" class="btn btn-default"
            id="registProduct">SAVE</button>
          <button type="button" class="btn btn-default"
            data-dismiss="modal">Close</button>
        </div>
        <div id="snackbar">상품 등록 완료</div>
    </div>
  </div>
</div>
