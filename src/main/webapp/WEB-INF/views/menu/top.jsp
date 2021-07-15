<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(document).ready(function(){
    $('.book').click(function(){
      if($('.book').hasClass('book')){
         $('.book').addClass('close').removeClass('book');
         $('.board').css('visibility', 'visible');
      }else if($('.close').hasClass('close')){
         $('.close').addClass('book').removeClass('close');  
         $('.board').css('visibility', 'hidden');
      }
    });
  });
</script>

<DIV class='container_main'>

  <DIV class='main_header'>  
    <div class='logo'>   
    <A class='menu_link'  href='/' ><img src="/css/image/image.png" alt="My Image"></A>
    </div><!-- logo -->  
    <div class="login_menu">
        
         <c:choose>
        <c:when test="${sessionScope.id == null}"> <%-- 로그인 안 한 경 우 --%>
          <span><A class='menu_link'  href='/member/login.do' >로그인</A></span> |  &nbsp
          <span><a class="menu_link" href="/member/create.do">회원가입</a></span>  

        </c:when>
        <c:otherwise>
          
          
       
        
        
          ${sessionScope.id } <span><A class='menu_link'  href='/member/logout.do' >로그아웃</A></span> &nbsp
         <span><a class="menu_link" href="#">마이페이지</a></span> &nbsp
         
         <c:choose>
            <c:when test="${grade >= 1 and grade <= 10}"> <span><A class='menu_link'  href='/member/list.do' >회원목록</A></span>  &nbsp</c:when>    
           </c:choose>
        </c:otherwise>
      </c:choose> 
      <span><a class="menu_link" href="#">주문</a></span>  &nbsp
      <span><a class="menu_link" href="#">장바구니</a></span>  &nbsp
      <span><a class="menu_link" href="../faq/service_home.do">고객센터</a></span>
      
     
    </div><!-- login_menu --> 
    
     <div class="search">
      <div class="search_input_main">
        <input type="text" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" placeholder="검색어 입력">
       </div>
       <div class="button_wrap">
        <a class="button" href="#"></a>
       </div>
     </div>
     
    
  </DIV><!-- main_header -->
 
<%--   <div class="main_gnb">
    <ul class="menu">

      <li class="menu1"><a class="menu_link" href="#">국내도서</a>
        <ul class="submenu">
          <li><a class="menu_link" href="#">sub1-1</a></li>
          <li><a class="menu_link" href="#">sub1-2</a></li>
        </ul>      
      </li>
      <li class="menu"><a class="menu_link" href="#">해외도서</a>
        <ul class="submenu">
          <li><a class="menu_link" href="#">sub2-1</a></li>
          <li><a class="menu_link" href="#">sub2-2</a></li>
        </ul>
       </li>
      <li class="menu"><a class="menu_link" href="#">e-book</a></li>
      
      
      
       
         
   <c:set var="grade" value="${sessionScope.grade}" />
  

    <c:choose>
      <c:when test="${grade >= 1 and grade <= 10}"><li class="menu"><span><A class='menu_link'  href='/event/list_search.do' >이벤트</A></span></li></c:when>    
      <c:when test="${grade >= 11 or grade == null}"><li class="menu"><span><A class='menu_link'  href='/event/list_grid.do' >이벤트</A></span></li></c:when>
    </c:choose>  
   
  
      
      

    </ul> 
  </div> --%>


<div>
    <ul class="menu">
       <li class="empty1"></li>
       <li><a class="book menu_link">도서 </a>

<div class="board">
  <ul class="list">
    <li>type1</li>
    <li><a class="menu_link" href="#">1-1</a></li>
    <li><a class="menu_link" href="#">1-2</a></li>
    <li><a class="menu_link" href="#">1-3</a></li>
    <li><a class="menu_link" href="#">1-4</a></li>

    <li>type2</li>
    <li><a class="menu_link" href="#">2-1</a></li>
    <li><a class="menu_link" href="#">2-2</a></li>
    <li><a class="menu_link" href="#">2-3</a></li>
    <li><a class="menu_link" href="#">2-4</a></li>
  </ul>
  
  <ul class="list">
     <li>type3</li>
    <li><a class="menu_link" href="#">3-1</a></li>
    <li><a class="menu_link" href="#">3-2</a></li>
    <li><a class="menu_link" href="#">3-3</a></li>
    <li><a class="menu_link" href="#">3-4</a></li>
    
    <li>type4</li>
    <li><a class="menu_link" href="#">4-1</a></li>
    <li><a class="menu_link" href="#">4-2</a></li>
    <li><a class="menu_link" href="#">4-3</a></li>
    <li><a class="menu_link" href="#">4-4</a></li>
  </ul>
  <ul class="list">
    <li>type5</li>
    <li><a class="menu_link" href="#">5-1</a></li>
    <li><a class="menu_link" href="#">5-2</a></li>
    <li><a class="menu_link" href="#">5-3</a></li>
    <li><a class="menu_link" href="#">5-4</a></li>
  </ul>
</div>

</li>
 <li><a class="menu_link" href="/">홈 </a></li>
 <c:choose>
      <c:when test="${grade >= 1 and grade <= 10}"><li ><A class='menu_link'  href='/event/list_search.do' >이벤트</A></li></c:when>    
      <c:when test="${grade >= 11 or grade == null}"><li><A class='menu_link'  href='/event/list_grid.do' >이벤트</A></li></c:when>
    </c:choose>  
</ul>

</DIV><!-- container_main -->

<%--내용--%>

 <DIV class='content'>