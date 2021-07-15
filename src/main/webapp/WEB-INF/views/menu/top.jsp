<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<DIV class='container_main'>

  <DIV class='main_header'>  
    <div class='logo'>   
    <A class='menu_link'  href='/' ><img src="/css/image/hello.png" alt="My Image"></A>
    </div><!-- logo -->  
    <div class="login_menu">
        
         <c:choose>
        <c:when test="${sessionScope.id == null}"> <%-- 로그인 안 한 경 우 --%>
          <span><a href='/member/login.do' >로그인</A></span> |  &nbsp;
          <span><a href="/member/create.do">회원가입</a></span>  

        </c:when>
        <c:otherwise>
        
        
   
          ${sessionScope.id } <span><A class='menu_link'  href='/member/logout.do' >로그아웃</A></span> &nbsp;
         <a href='/member/read.do?memberno=${memberno }'>회원정보관리</a><span class='top_menu_sep'> </span>&nbsp;
         <span><a href="#">마이페이지</a></span> &nbsp;
         
         <c:choose>
            <c:when test="${grade >= 1 and grade <= 10}"> <span><A class='menu_link'  href='/member/list.do' >회원목록</A></span>  &nbsp;</c:when>    
           </c:choose>
        </c:otherwise>
      </c:choose> 
      <span><a href="/cart/list_by_memberno.do">주문/장바구니</a></span>  &nbsp;
      <span><a href="/myroom/list_by_memberno.do">보관함</a></span>  &nbsp;
      <span><a href="../faq/service_home.do">고객센터</a></span>
      
     
    </div><!-- login_menu --> 
    
     <div class="search">
      <div class="search_input">
        <input type="text" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" placeholder="검색어 입력">
       </div>
       <div class="button_wrap">
        <a class="button" href="#"></a>
       </div>
     </div>
     
    
  </DIV><!-- main_header -->
 
  <div class="main_gnb">
    <ul class="menu">

      <li class="menu1"><a class="menu_link" href="#">국내도서</a>
        <ul class="submenu">
          <li><a href="#">sub1-1</a></li>
          <li><a href="#">sub1-2</a></li>
        </ul>      
      </li>
      <li class="menu"><a class="menu_link" href="#">해외도서</a>
        <ul class="submenu">
          <li><a href="#">sub2-1</a></li>
          <li><a href="#">sub2-2</a></li>
        </ul>
       </li>
      <li class="menu"><a href="#">e-book</a></li>
      
      
      
       
         
   <c:set var="grade" value="${sessionScope.grade}" />
  

    <c:choose>
      <c:when test="${grade >= 1 and grade <= 10}"><li class="menu"><span><A href='/event/list_search.do' >이벤트</A></span></li></c:when>    
      <c:when test="${grade >= 11 or grade == null}"><li class="menu"><span><A href='/event/list_grid.do' >이벤트</A></span></li></c:when>
    </c:choose>  
   

      
      

    </ul> 
  </div>
    
  </DIV><!-- container_main -->

<%--내용--%>

 <DIV class='content'>