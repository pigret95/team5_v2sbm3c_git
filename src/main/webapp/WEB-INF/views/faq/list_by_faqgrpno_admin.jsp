<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <c:set var="faqgrpno" value="${faqVO.faqgrpno }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Book</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
</script>
</head> 
<body>
<jsp:include page="../menu/top.jsp" />
  <DIV class='content_body'>

    <DIV class='title_line'>
      자주 묻는 질문 >
      <c:if test="${param.faqgrpno == 1 }">
   주문/결제
 </c:if>
      <c:if test="${param.faqgrpno == 2 }">
   배송/수령일 안내
 </c:if>
      <c:if test="${param.faqgrpno == 3 }">
   반품/교환/환불
 </c:if>
      <c:if test="${param.faqgrpno == 4 }">
   도서/상품
 </c:if>
      <c:if test="${param.faqgrpno == 5 }">
   서비스
 </c:if>
 <c:if test="${param.faqgrpno == 6 }">
   기타
 </c:if>

      <ASIDE class="aside_right">
        <span><A class='menu_link'
              href='/faq/service_home.do'>고객센터</A></span>  &nbsp
        <c:choose>
          <c:when test="${grade >= 1 or grade <= 10}">
            <span><A class='menu_link'
              href='/faq/create.do?faqgrpno=${param.faqgrpno }'>등록</A></span>  &nbsp</c:when>
        </c:choose>
      </ASIDE>
    </DIV><!-- title_line -->

    <DIV class="side_menu">
  1:1문의
  
    <c:choose>
      <c:when test="${grade >= 1 or grade <= 10}">
      <ul><div style="border-bottom:1px solid #666666; margin-top:5px; text-align:center;">관리자 전용 faq</div>
     <li class="side_menu_admin"><span><A class='menu_link'  href="/faq/list_by_faqgrpno_admin.do?faqgrpno=1">주문/결제</A></span></li>
     <li class="side_menu_admin"><span><A class='menu_link'  href="/faq/list_by_faqgrpno_admin.do?faqgrpno=2">배송/수령일 안내</A></span></li>
      <li class="side_menu_admin"><span><A class='menu_link'  href="/faq/list_by_faqgrpno_admin.do?faqgrpno=3">반품/교환/환불</A></span></li>
      <li class="side_menu_admin"><span><A class='menu_link'  href="/faq/list_by_faqgrpno_admin.do?faqgrpno=4">도서/상품</A></span></li>
      <li class="side_menu_admin"><span><A class='menu_link'  href="/faq/list_by_faqgrpno_admin.do?faqgrpno=5">서비스</A></span></li></ul>
      
      <ul><div style="border-bottom:1px solid #666666; margin-top:5px; text-align:center;">관리자 전용 공지사항</div>
     <li class="side_menu_admin"><span><A class='menu_link'  href="/notice/list_admin.do">공지사항</A></span></li>
     
      
      </c:when>    
    </c:choose> 
</DIV>

    <DIV class="main">
      <DIV class="table table-hover table-bordered"
        style="margin-bottom: 15px;">
        <TABLE>
          <colgroup>
            <col style="width: 25%">
            <col style="width: 25%">
            <col style="width: 25%">
            <col style="width: 25%">
          </colgroup>
          <TR>
            <TH class="text-center" rowspan=2>주요 FAQ ></TH>
            <TH class="text-center"><a class="menu_link"
              href="/faq/list_by_faqgrpno_admin.do?faqgrpno=1">주문/결제</a></TH>
            <TH class="text-center"><a class="menu_link"
              href="/faq/list_by_faqgrpno_admin.do?faqgrpno=2">배송/수령일 안내</a></TH>
            <TH class="text-center"><a class="menu_link"
              href="/faq/list_by_faqgrpno_admin.do?faqgrpno=3">반품/교환/환불</a></TH>
          </TR>
          <TR>
            <TH class="text-center"><a class="menu_link"
              href="/faq/list_by_faqgrpno_admin.do?faqgrpno=4">도서/상품</a></TH>
            <TH class="text-center"><a class="menu_link"
              href="/faq/list_by_faqgrpno_admin.do?faqgrpno=5">서비스</a></TH>
            <TH class="text-center"><a class="menu_link"
              href="/faq/list_by_faqgrpno_admin.do?faqgrpno=6">기타</a></TH>
          </TR>
        </TABLE>
      </DIV>


      <TABLE class="table  table-hover table-bordered">
        <colgroup>
          <col style='width: 80%;' />
          <col style='width: 20%;' />
        </colgroup>

        <thead>
          <TR>
            <TH class="text-center">질문</TH>
            <TH class="text-center">수정/삭제</TH>
          </TR>
        </thead>

        <tbody>
          <c:forEach var="faqVO" items="${list}">
            <c:set var="faqgrpno" value="${faqVO.faqgrpno }" />
            <c:set var="faqno" value="${faqVO.faqno }" />
            <c:set var="title" value="${faqVO.title }" />
            <TR>
              <TD><a class="menu_link"
                href="./read.do?faqgrpno=${faqgrpno }&faqno=${faqno}">${title }</a></TD>
              <TD class="text-center"><A
                href="./update.do?faqgrpno=${faqgrpno }&faqno=${faqno }"
                title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
                <A
                href="./delete.do?faqgrpno=${faqgrpno }&faqno=${faqno }"
                title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
              </TD>
            </TR>
          </c:forEach>
        </tbody>
      </TABLE>
    </DIV><!-- main -->

  </DIV><!-- content_body -->
  <jsp:include page="../menu/bottom.jsp" />
</body>
</html>
 