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
            <c:when test="${grade >= 1 or grade <= 10}"> <span><A class='menu_link'  href='/member/list.do' >회원목록</A></span>  &nbsp</c:when>    
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
    <li style="font-size:15px;"><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=1">소설</a></li>
    <br>
    <li style="font-size:15px;"><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=2">시/에세이</a></li>
    <br>
    <li style="font-size:15px;"><a class="menu_link" href="#">경제/경영</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=3">경영</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=4">경제</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=5">세무/회계</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=6">마케팅/광고</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=7">유통/창업</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=8">재테크/금융</a></li>
  </ul>
  
  <ul class="list">
    <li style="font-size:15px;">인문</li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=9">인문학일반</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=10">심리학</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=11">교육학</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=12">유아교육</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=13">철학</a></li>
    <br>
    <li style="font-size:15px;">자기계발</li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=14">성공/처세</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=15">자기능력계발</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=16">인간관계</a></li>
  </ul>
  <ul class="list">
    <li style="font-size:15px;">과학</li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=17">과학이론</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=18">수학</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=19">물리학</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=20">화학</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=21">생물학</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=22">지구과학</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=23">천문학</a></li>
  </ul>
  <ul class="list">
    <li style="font-size:15px;">기술/공학</li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=24">토목/건설</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=25">건축/인테리어</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=26">자동차/운전</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=27">기계</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=28">전기/전자</a></li>
    <br>
    <li style="font-size:15px;">자격증</li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=29">토익</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=30">컴퓨터</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=31">기능사</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=32">산업기사</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=33">기사</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=34">기타자격증</a></li>
    </ul>
    <ul class="list">
    <li style="font-size:15px;">IT</li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=35">IT일반</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=36">OS</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=37">네트워크</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=38">보안/해킹</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=39">데이터베이스</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=40">웹프로그래밍</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=41">프로그래밍/언어</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=42">모바일프로그래밍</a></li>
  </ul>
  <ul class="list">
    <li style="font-size:15px;">중/고등참고서</li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=43">고등학교</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=44">중학교</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=45">논술/면접</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=46">검정고시</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=47">EBS</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=48">올림피아드</a></li>
    <br>
    <li style="font-size:15px;">외국어</li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=49">영어</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=50">중국어</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=51">일본어</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=52">그 외 언어</a></li>
  </ul>
</div>

</li>
 <li><a class="menu_link" href="/">홈 </a></li>
 <c:choose>
      <c:when test="${grade >= 1 or grade <= 10}"><li ><A class='menu_link'  href='/event/list_search.do' >이벤트</A></li></c:when>    
      <c:when test="${grade >= 11 or grade == null}"><li><A class='menu_link'  href='/event/list_grid.do' >이벤트</A></li></c:when>
    </c:choose>  
</ul>

</DIV><!-- container_main -->

<%--내용--%>

 <DIV class='content'>