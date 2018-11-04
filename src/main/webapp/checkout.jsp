<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Shoppers &mdash; Colorlib e-Commerce Template</title>
<meta charset="utf-8">
<meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
  href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet"
  href="https://use.fontawesome.com/releases/v5.4.2/css/all.css"
  integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns"
  crossorigin="anonymous">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/style.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/checkout.css">
<jsp:include page="/includes/header.jsp"></jsp:include>
</head>
<body>
  <div class="site-wrap">
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0">
            <a href="index.html">Home</a> <span class="mx-2 mb-0">/</span>
            <a href="cart.html">Cart</a> <span class="mx-2 mb-0">/</span>
            <strong class="text-black">Checkout</strong>
          </div>
        </div>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-md-7 text-center pt-4 cart-heading">
        <h2>Payment</h2>
      </div>
    </div>
  </div>
  <div class="cart-section">
    <div class="container">
      <div class="row mb-4">
        <div class="col-md-12">
          <div class="title">
            <h2>Product Information</h2>
          </div>
          <table class="cart-table">
            <thead>
              <tr>
                <th class="product-inform" colspan="5">Product
                  Information</th>
                <th class="product-quantity">Amount</th>
                <th class="product-price text-right">Total Price</th>
                <th class="product-remove"></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <!-- 상품 정보 -->
                <td class="product-inform" colspan="5"><img
                  src="images/cloth_2.jpg" alt="Image"
                  class="product-thumbnail">
                  <div class="product-text">
                    <div class="name">Top Up T-Shirts</div>
                    <div class="price">3,000원</div>
                  </div></td>
                <!-- 수량 -->
                <td class="product-quantity">
                  <div class="cart-button-group input-group">
                    <input type="text" class="form-control text-center"
                      value="1"
                      aria-label="Example text with button addon"
                      aria-describedby="button-addon1"
                      disabled="disabled">
                  </div>
                </td>
                <!-- 금액 -->
                <td class="product-price text-right">30,000원</td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="payment-section">
      <div class="container">
        <div class="row mb-4">
          <div class="col-md-12">
            <div class="title">
              <h2>Buyer Information</h2>
            </div>
            <table class="cart-table">
              <thead>
                <tr class="col-md-12">
                  <th>Name</th>
                  <td>서지원</td>
                </tr>
                <tr class="col-md-12">
                  <th>Phone</th>
                  <td>010-1234-1234</td>
                </tr>
                <tr class="col-md-12">
                  <th>E-mail</th>
                  <td>g1@gmail.com</td>
                </tr>
              </thead>
            </table>
          </div>
          <div class="col-md-12">
            <div class="title">
              <h2>Shipping Information</h2>
            </div>
            <table class="cart-table">
              <thead>
                <tr class="col-md-12">
                  <th>주소</th>
                  <td>
                  <div>
                  <div class="address"><input type="radio" value="현재주소" name="address"> 주문자 주소와 동일 </div>
                  <div class="address"><input type="radio" value="최근주소" name="address"> 최근주소 </div>
                  <div class="address"><input type="radio" value="새주소" name="address"> 새주소 </div></div>
                  <div><input type="text" class="form-control" id="address" name="address"></div>
                  </td>
                </tr>
                <tr class="col-md-12">
                  <th>수령인 이름</th>
                  <td><input type="text" class="form-control" id="name" name="name"></td>
                </tr>
                <tr class="col-md-12">
                  <th>휴대폰</th>
                  <td class=" phone"><input type="text" class="form-control" name="name" maxlength="11">
                  </td>
                </tr>
                <tr class="col-md-12">
                <th>배송요청사항</th>
                <td><textarea name="request" cols="30" rows="5" class="form-control" maxlength="50"></textarea>
                <div class="chk_bytes"><span>0</span>자 / 50자</div></td>
                </tr>
              </thead>
            </table>
          </div>
          <div class="col-md-8">
            <div class="title">
              <h2>Coupon / Point</h2>
            </div>
            <table class="cart-table">
              <thead>
                <tr class="col-md-12">
                  <th>쿠폰 적용</th>
                  <td>
                  <div><a href="#" class="btn btn-primary btn-sm">쿠폰 선택</a></div>
                  </td>
                </tr>
                <tr class="col-md-12">
                  <th>적립금 적용</th>
                  <td><div>사용가능 적립금 : <span>3,000</span> (원)</div>
                  <div class="address"><span>사용할 적립금 : </span><input type="text" class="form-control" id="name" name="name"><span>(원)</span> </div></td>
                </tr>
              </thead>
            </table>
          </div>
          <div class="col-md-8">
            <div class="title">
              <h2>Payment</h2>
            </div>
            <table class="cart-table">
              <thead>
                <tr class="col-md-12">
                  <th>일반결제</th>
                  <td>
                  <div class="address"><input type="radio" value="신용카드" name="generalPay"> 신용카드 </div>
                  <div class="address"><input type="radio" value="휴대폰" name="generalPay"> 휴대폰 </div>
                  </td>
                </tr>
                <tr class="col-md-12">
                  <th>Paynow 결제</th>
                  <td><div class="address"><input type="radio" value="신용카드" name="generalPay" > <img src="images/logo_paynow.png"></div>
                </tr>
                <tr class="col-md-12">
                  <th>PAYCO 결제</th>
                  <td><div class="address"><input type="radio" value="신용카드" name="generalPay"> <img src="images/logo_payco.png"> </div>
                </tr>  
                <tr class="col-md-12">
                  <th>에스크로 결제</th>
                  <td><div class="address"><input type="radio" value="신용카드" name="generalPay"> 계좌이체  </div>
                </tr>                                                               
              </thead>
            </table>
          </div>
                    <div class="col-md-8">
            <div class="title">
              <h2>개인정보 수집/제공</h2>
            </div>
            <table class="cart-table">
              <thead>
                <tr class="col-md-12">
                  <th>일반결제</th>
                  <td>
                  <div class="address"><input type="checkbox" value="신용카드" name="generalPay"> [필수] 개인정보 수집 및 이용 동의 </div>
                  </td>
                </tr>
              </thead>
            </table>
          </div>
        </div>
      </div>
      <div class="section">
        <div class="container">
          <div class="row">
            <div class="col-md-6 mb-5 mb-md-0">
              <h2 class="h3 mb-3 text-black">Details</h2>
              <div class="p-3 p-lg-5 border">
                <div class="form-group">
                  <label for="c_country" class="text-black">Country
                    <span class="text-danger">*</span>
                  </label> <select id="c_country" class="form-control">
                    <option value="1">Select a country</option>
                    <option value="2">bangladesh</option>
                    <option value="3">Algeria</option>
                    <option value="4">Afghanistan</option>
                    <option value="5">Ghana</option>
                    <option value="6">Albania</option>
                    <option value="7">Bahrain</option>
                    <option value="8">Colombia</option>
                    <option value="9">Dominican Republic</option>
                  </select>
                </div>
                <div class="form-group row">
                  <div class="col-md-6">
                    <label for="c_fname" class="text-black">First
                      Name <span class="text-danger">*</span>
                    </label> <input type="text" class="form-control"
                      id="c_fname" name="c_fname">
                  </div>
                  <div class="col-md-6">
                    <label for="c_lname" class="text-black">Last
                      Name <span class="text-danger">*</span>
                    </label> <input type="text" class="form-control"
                      id="c_lname" name="c_lname">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_companyname" class="text-black">Company
                      Name </label> <input type="text" class="form-control"
                      id="c_companyname" name="c_companyname">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_address" class="text-black">Address
                      <span class="text-danger">*</span>
                    </label> <input type="text" class="form-control"
                      id="c_address" name="c_address"
                      placeholder="Street address">
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control"
                    placeholder="Apartment, suite, unit etc. (optional)">
                </div>
                <div class="form-group row">
                  <div class="col-md-6">
                    <label for="c_state_country" class="text-black">State
                      / Country <span class="text-danger">*</span>
                    </label> <input type="text" class="form-control"
                      id="c_state_country" name="c_state_country">
                  </div>
                  <div class="col-md-6">
                    <label for="c_postal_zip" class="text-black">Posta
                      / Zip <span class="text-danger">*</span>
                    </label> <input type="text" class="form-control"
                      id="c_postal_zip" name="c_postal_zip">
                  </div>
                </div>
                <div class="form-group row mb-5">
                  <div class="col-md-6">
                    <label for="c_email_address" class="text-black">Email
                      Address <span class="text-danger">*</span>
                    </label> <input type="text" class="form-control"
                      id="c_email_address" name="c_email_address">
                  </div>
                  <div class="col-md-6">
                    <label for="c_phone" class="text-black">Phone
                      <span class="text-danger">*</span>
                    </label> <input type="text" class="form-control"
                      id="c_phone" name="c_phone"
                      placeholder="Phone Number">
                  </div>
                </div>
                <div class="form-group">
                  <label for="c_create_account" class="text-black"
                    data-toggle="collapse" href="#create_an_account"
                    role="button" aria-expanded="false"
                    aria-controls="create_an_account"><input
                    type="checkbox" value="1" id="c_create_account">
                    Create an account?</label>
                  <div class="collapse" id="create_an_account">
                    <div class="py-2">
                      <p class="mb-3">Create an account by entering
                        the information below. If you are a returning
                        customer please login at the top of the page.</p>
                      <div class="form-group">
                        <label for="c_account_password"
                          class="text-black">Account Password</label> <input
                          type="email" class="form-control"
                          id="c_account_password"
                          name="c_account_password" placeholder="">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="c_ship_different_address"
                    class="text-black" data-toggle="collapse"
                    href="#ship_different_address" role="button"
                    aria-expanded="false"
                    aria-controls="ship_different_address"><input
                    type="checkbox" value="1"
                    id="c_ship_different_address"> Ship To A
                    Different Address?</label>
                  <div class="collapse" id="ship_different_address">
                    <div class="py-2">
                      <div class="form-group">
                        <label for="c_diff_country" class="text-black">Country
                          <span class="text-danger">*</span>
                        </label> <select id="c_diff_country"
                          class="form-control">
                          <option value="1">Select a country</option>
                          <option value="2">bangladesh</option>
                          <option value="3">Algeria</option>
                          <option value="4">Afghanistan</option>
                          <option value="5">Ghana</option>
                          <option value="6">Albania</option>
                          <option value="7">Bahrain</option>
                          <option value="8">Colombia</option>
                          <option value="9">Dominican Republic</option>
                        </select>
                      </div>
                      <div class="form-group row">
                        <div class="col-md-6">
                          <label for="c_diff_fname" class="text-black">First
                            Name <span class="text-danger">*</span>
                          </label> <input type="text" class="form-control"
                            id="c_diff_fname" name="c_diff_fname">
                        </div>
                        <div class="col-md-6">
                          <label for="c_diff_lname" class="text-black">Last
                            Name <span class="text-danger">*</span>
                          </label> <input type="text" class="form-control"
                            id="c_diff_lname" name="c_diff_lname">
                        </div>
                      </div>
                      <div class="form-group row">
                        <div class="col-md-12">
                          <label for="c_diff_companyname"
                            class="text-black">Company Name </label> <input
                            type="text" class="form-control"
                            id="c_diff_companyname"
                            name="c_diff_companyname">
                        </div>
                      </div>
                      <div class="form-group row">
                        <div class="col-md-12">
                          <label for="c_diff_address" class="text-black">Address
                            <span class="text-danger">*</span>
                          </label> <input type="text" class="form-control"
                            id="c_diff_address" name="c_diff_address"
                            placeholder="Street address">
                        </div>
                      </div>
                      <div class="form-group">
                        <input type="text" class="form-control"
                          placeholder="Apartment, suite, unit etc. (optional)">
                      </div>
                      <div class="form-group row">
                        <div class="col-md-6">
                          <label for="c_diff_state_country"
                            class="text-black">State / Country <span
                            class="text-danger">*</span></label> <input
                            type="text" class="form-control"
                            id="c_diff_state_country"
                            name="c_diff_state_country">
                        </div>
                        <div class="col-md-6">
                          <label for="c_diff_postal_zip"
                            class="text-black">Posta / Zip <span
                            class="text-danger">*</span>
                          </label> <input type="text" class="form-control"
                            id="c_diff_postal_zip"
                            name="c_diff_postal_zip">
                        </div>
                      </div>
                      <div class="form-group row mb-5">
                        <div class="col-md-6">
                          <label for="c_diff_email_address"
                            class="text-black">Email Address <span
                            class="text-danger">*</span></label> <input
                            type="text" class="form-control"
                            id="c_diff_email_address"
                            name="c_diff_email_address">
                        </div>
                        <div class="col-md-6">
                          <label for="c_diff_phone" class="text-black">Phone
                            <span class="text-danger">*</span>
                          </label> <input type="text" class="form-control"
                            id="c_diff_phone" name="c_diff_phone"
                            placeholder="Phone Number">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="c_order_notes" class="text-black">Order
                    Notes</label>
                  <textarea name="c_order_notes" id="c_order_notes"
                    cols="30" rows="5" class="form-control"
                    placeholder="Write your notes here..."></textarea>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="row mb-5">
                <div class="col-md-12">
                  <h2 class="h3 mb-3 text-black">Coupon Code</h2>
                  <div class="p-3 p-lg-5 border">
                    <label for="c_code" class="text-black mb-3">Enter
                      your coupon code if you have one</label>
                    <div class="input-group w-75">
                      <input type="text" class="form-control"
                        id="c_code" placeholder="Coupon Code"
                        aria-label="Coupon Code"
                        aria-describedby="button-addon2">
                      <div class="input-group-append">
                        <button class="btn btn-primary btn-sm"
                          type="button" id="button-addon2">Apply</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row mb-5">
                <div class="col-md-12">
                  <h2 class="h3 mb-3 text-black">Your Order</h2>
                  <div class="p-3 p-lg-5 border">
                    <table class="table site-block-order-table mb-5">
                      <thead>
                        <th>Product</th>
                        <th>Total</th>
                      </thead>
                      <tbody>
                        <tr>
                          <td>Top Up T-Shirt <strong class="mx-2">x</strong>
                            1
                          </td>
                          <td>$250.00</td>
                        </tr>
                        <tr>
                          <td>Polo Shirt <strong class="mx-2">x</strong>
                            1
                          </td>
                          <td>$100.00</td>
                        </tr>
                        <tr>
                          <td class="text-black font-weight-bold"><strong>Cart
                              Subtotal</strong></td>
                          <td class="text-black">$350.00</td>
                        </tr>
                        <tr>
                          <td class="text-black font-weight-bold"><strong>Order
                              Total</strong></td>
                          <td class="text-black font-weight-bold"><strong>$350.00</strong></td>
                        </tr>
                      </tbody>
                    </table>
                    <div class="border p-3 mb-3">
                      <h3 class="h6 mb-0">
                        <a class="d-block" data-toggle="collapse"
                          href="#collapsebank" role="button"
                          aria-expanded="false"
                          aria-controls="collapsebank">Direct Bank
                          Transfer</a>
                      </h3>
                      <div class="collapse" id="collapsebank">
                        <div class="py-2">
                          <p class="mb-0">Make your payment directly
                            into our bank account. Please use your Order
                            ID as the payment reference. Your order
                            wonâ  t be shipped until the funds have
                            cleared in our account.</p>
                        </div>
                      </div>
                    </div>
                    <div class="border p-3 mb-3">
                      <h3 class="h6 mb-0">
                        <a class="d-block" data-toggle="collapse"
                          href="#collapsecheque" role="button"
                          aria-expanded="false"
                          aria-controls="collapsecheque">Cheque
                          Payment</a>
                      </h3>
                      <div class="collapse" id="collapsecheque">
                        <div class="py-2">
                          <p class="mb-0">Make your payment directly
                            into our bank account. Please use your Order
                            ID as the payment reference. Your order
                            wonâ  t be shipped until the funds have
                            cleared in our account.</p>
                        </div>
                      </div>
                    </div>
                    <div class="border p-3 mb-5">
                      <h3 class="h6 mb-0">
                        <a class="d-block" data-toggle="collapse"
                          href="#collapsepaypal" role="button"
                          aria-expanded="false"
                          aria-controls="collapsepaypal">Paypal</a>
                      </h3>
                      <div class="collapse" id="collapsepaypal">
                        <div class="py-2">
                          <p class="mb-0">Make your payment directly
                            into our bank account. Please use your Order
                            ID as the payment reference. Your order
                            wonâ  t be shipped until the funds have
                            cleared in our account.</p>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <button
                        class="btn btn-primary btn-lg py-3 btn-block"
                        onclick="window.location='thankyou.html'">Place
                        Order</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- </form> -->
      </div>
    </div>
    <jsp:include page="/includes/footer.jsp"></jsp:include>
  </div>
  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/main.js"></script>
</body>
</html>