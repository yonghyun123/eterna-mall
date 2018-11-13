

$(document).ready(function() {
	eventRegist();
})

function eventRegist() {
	$("#searchC").on("click", function() {
		searchByCondition();
	})
	
	var selector = document.querySelectorAll('.dropdown-item');
	selector.forEach(function(v) {
		v.addEventListener('click', function(e) {
			var select = $(this).text();
			$('#dropdownMenuOffset').html(select);
			$.ajax({
				url : "/selector.mall",
				type : "post",
				data : {
					select : select
				},
				dataType : "text",
				success : function(data) {
					var jsonListData = JSON.parse(data);
					listTemplate(jsonListData);
					toDetail();
					$('.pagination.custom_pagination').remove();
					paginating();
				}
			})

		})
	})
}

function searchByCondition() {
	
	var minAmount = document.getElementById("minAmount").value;
	var maxAmount = document.getElementById("maxAmount").value;
	var type = $(':input:radio[name=type]:checked').val();
	
	var originHtml = document.querySelector('#insertCondition');
	var newHtml = '';
	newHtml += "&nbsp;&nbsp" + minAmount+"원 ~ " + maxAmount+"원 > ";
	
	// 체크박스에 선택된 값들 배열에 담기
	var ageValues = [];
	$("input[name='ages']:checked").each(function(i) {
		newHtml += $(this).val()+"대 ";
		ageValues.push($(this).val());
	});
	if($("input[name='ages']:checked").val() != null){
		newHtml += " > ";
		}
	ageValues = JSON.stringify(ageValues);

	var productValues = [];
	$("input[name='productKind']:checked").each(function(i) {
		productValues.push($(this).val());
		newHtml += $(this).val()+" ";
	});
	if($("input[name='productKind']:checked").val() != null){
	newHtml += " > ";
	}
	productValues = JSON.stringify(productValues);

	if(type != null){
		newHtml += type+" > "
	}
	originHtml.innerHTML = newHtml;
	$.ajax({
		url : "/conditions.mall",
		type : "post",
		data : {
			ages : ageValues,
			productKind : productValues,
			minAmount : minAmount,
			maxAmount : maxAmount,
			type : type
		},
		dataType : "text",
		success : function(data) {
			var jsonListData = JSON.parse(data);
			$('#dropDown').empty();
			listTemplate(jsonListData);
			toDetail();
			$('.pagination.custom_pagination').remove();
			paginating();
		}
	})
}

function listTemplate(listData) {
	$('#insertUl').empty();
	var templateHtml = document.querySelector('#templateList').innerHTML;
	var originHtml = document.querySelector('#insertUl');
	var newHtml = '';
	if (listData.length == 0) {
		newHtml = "<li class='col-sm-6 col-lg-4 mb-4' data-aos='fade-up' style='margin-left: 35%'>검색결과가 존재하지 않습니다.</li>";
	} else {
		listData.forEach(function(v, i) {
			var price = v.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			newHtml += templateHtml.replace('{number}', i).replace(
					'{thumnail}', v.thumnail).replace('{productId}',
					v.productId).replace('{productBrand}', v.productBrand)
					.replace('{productDescription}', v.productDescription)
					.replace('{price}', price);
		});
	}
	originHtml.innerHTML = newHtml;

	$('#countS').empty();
	var templateHtml = document.querySelector('#templateCount').innerHTML;
	var originHtml = document.querySelector('#countS');
	var newHtml = '';
	listData.forEach(function(v, i) {
		newHtml = templateHtml.replace('{count}', v.count);
	});
	originHtml.innerHTML = newHtml;

}

function paginating(){
	var count = document.getElementById("count").value;
	var flag = '';
	if(count > 45){
		flag = 5;
	}else{
		flag = false;
	}
$('.product_info').paginathing({
	limitPagination : flag,
	perPage : 9,
	prevNext : true,
	firstLast : true,
	prevText : '&laquo;',
	nextText : '&raquo;',
	firstText : 'First',
	lastText : 'Last',
	firstClass : 'test_page',
	ulClass : 'pagination custom_pagination',
	liClass : 'test_page page',
	activeClass : 'active',
	disabledClass : 'disabled',
	insertAfter : '.product_info'
})}

function toDetail() {
	var imagesBtn = document.querySelectorAll('.images-btn');
	imagesBtn.forEach(function(v) {
		v.addEventListener('click', function(e) {
			$("#" + e.target.closest("form").id).submit();
		})
	})
}

toDetail();
paginating();

