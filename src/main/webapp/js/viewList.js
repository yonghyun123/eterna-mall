$(document).ready(function() {
	eventRegist();
	var pagingSize;
	 Cpage = 0;   // 현재 페이지
	    // 원하는 페이지 사이즈로 조정하세용
	chkRecent(1);
	console.log(Cpage);
	$(".btn_next").on('click',function(){
	chkRecent(Cpage + 1);
	console.log(Cpage);
	return;
	});
	$(".btn_prev").on('click',function(){
	chkRecent(Cpage - 1);
	console.log(Cpage);
	return;
	});
});
function eventRegist(){

};

function removeRecentItem(itemname){

	var itemID = getCookie("recentView");
	console.log(itemID);
	var totcount = itemID.split('@').length-1;

	console.log(totcount);
	if(totcount == 2){
		document.cookie = "recentView=;path=/";
		chkRecent(Cpage);
		return;
	}
		
	itemID = itemID.replace(itemname+"@","");			

	setCookie("recentView",itemID);

	chkRecent(Cpage);
}

function setCookie(cname, cvalue) {
    document.cookie = cname + "=" + cvalue + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function chkRecent(a){
	var pagingSize = 2;
	var itemID = getCookie("recentView");
	$("#right_zzim ul").html('');    // 일단 Ul 내용 지우기...
	if(itemID){
		var totcount = itemID.split('@').length-2;   //
		var totpage = Math.ceil(totcount / pagingSize) *1;
		Cpage = (totpage >= a )? a:1;
		Cpage = (Cpage <1)? totpage:Cpage;
		var start = (Cpage-1) * pagingSize + 1;    
		for (i = start ; i <= start+(pagingSize-1) ;i++){
		var  thisItem = itemID.split('@')[i];
			if(thisItem){
				var itemId = thisItem.split('#')[0];
				var itemDes = thisItem.split("#")[1].replace(/\*/g," ");
				var itemImg = thisItem.split('#')[2];
			$("#right_zzim ul").append('<li><a href="/detail.mall?productId='+itemId+'" target="_top"><img src="/images/'+itemImg+'" border="0"  width="75" height="75"><p>'+itemDes+'</p></a><div class="detail"><a href="#" onclick="removeRecentItem(\''+thisItem+'\');" class="btn_delete">삭제</a></div></li>')

			}

		}
		$("#paging").show();

	}else{

		$("#right_zzim ul").append('<p class="noData">최근 본 상품이<br> 없습니다.</p>');

		$("#paging").hide();$("#recentCnt").text('');

	}

	updateRecentPage(totcount, Cpage);
}

function updateRecentPage(totcount,Cpage){ 
	var pagingSize = 2;//  
	$("#recentCnt").text(totcount);  //
	$("#totalPageCount").text("/"+Math.ceil((totcount / pagingSize) *1)); 
	if(Math.ceil((totcount / pagingSize) *1) < Cpage){
	$("#currentPage").text(Math.ceil((totcount / pagingSize) *1));
	}else{
	$("#currentPage").text(Cpage);  //
	}
}