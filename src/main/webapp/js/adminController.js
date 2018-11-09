/**
 * 
 */
   $(document).ready(function(){
      $('.nav-item').click(function(){
         callUserController(this);
      });
      
   });
   /**관리 btn click Action*/
   function callUserController(value){
      var content = $('#content-wrapper');
      content.empty();
      switch(value.id){
      case 'salesMngBtn' :
         location.href="/admin/manage/adminSaleManage.jsp";break;
      case 'userMngBtn' :
         location.href="/admin/userlist.mall";break;
      case 'orderMngBtn' :
         location.href="/admin/orderlist.mall";break;
      case 'stockMngBtn' :
         location.href="/admin/stocklist.mall";break;
      case 'reviewMngBtn' :
         location.href="/admin/reviewlist.mall";break;
      case 'qnaMngBtn' :
         location.href="/admin/qnalist.mall";break;      
      }
   }