<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <c:set var="contentsno" value="${contentsVO.contentsno }" />
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Book Word</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 

 $(function() {
   CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값 
 });
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
  <DIV class='title_line'>
    <A href="../bookgrp/list.do" class='title_link'>도서 그룹</A> > <A
      href="../book/list_by_bookgrpno.do?bookgrpno=${bookgrpVO.bookgrpno }"
      class='title_link'>${bookgrpVO.grpname }</A> > <A
      href="./list_by_bookno_search_paging.do?bookno=${bookVO.bookno }" class='title_link'>${bookVO.bookname }</A>
  </DIV>

<DIV class='content_body'>
 <DIV style="text-align: left;">
        <ASIDE class="aside_right">
    <A href="./create.do?bookno=${bookVO.bookno }&bookgrpno=${bookVO.bookgrpno }">등록</A>
        <span class='menu_divide'>│</span> <A
          href="javascript:location.reload();">새로고침</A> 
          <span class='menu_divide' >│</span>
    <A href="./update_text.do?contentsno=${contentsno}&now_page=${param.now_page }">수정</A>
    <span class='menu_divide' >│</span>
    <A href="./update_file.do?contentsno=${contentsno}&now_page=${param.now_page }">파일 수정</A>  
  </ASIDE> 
    </DIV>
 <DIV style="text-align: right; clear: both;">
      <form name='frm' id='frm' method='get'
        action='./list_by_bookno_search_paging.do'>
        <input type='hidden' name='bookno' value='${bookVO.bookno }'>
        <c:choose>
          <c:when test="${param.word != '' }">
            <%-- 검색하는 경우 --%>
            <input type='text' name='word' id='word'
              value='${param.word }' style='width: 20%;'>
          </c:when>
          <c:otherwise>
            <%-- 검색하지 않는 경우 --%>
            <input type='text' name='word' id='word' value=''
              style='width: 20%;'>
          </c:otherwise>
        </c:choose>
        <button type='submit'>검색</button>
        <c:if test="${param.word.length() > 0 }">
          <button type='button'
            onclick="location.href='./list_by_bookno_search_paging.do?bookno=${bookVO.bookno}&now_page=${param.now_page }&word='">검색
            취소</button>
        </c:if>
      </form>
    </DIV>
  
  <DIV class='menu_line'></DIV>
  
   <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <c:set var="file1saved" value="${contentsVO.file1saved.toLowerCase() }" />
        <c:set var="title" value="${contentsVO.title }" />
        <c:if test="${file1saved.endsWith('jpg') || file1saved.endsWith('png') || file1saved.endsWith('gif')}">
          <DIV style="width: 50%; float: left; margin-right: 10px;">
            <IMG src="/contents/storage/${contentsVO.file1saved }" style="width: 50%;">
          </DIV>
          <DIV style="width: 47%; height: 260px; float: left; margin-right: 10px;">
            <span style="font-size: 1.5em; font-weight: bold;">${title }</span><br>
          </DIV> 
        </c:if> 
     
        <DIV>${contentsVO.content }</DIV>
                  
      </li>
      <li class="li_none">
        <DIV style='text-decoration: none;'>
          검색어(키워드): ${contentsVO.word }
        </DIV>
      </li>
      <li class="li_none">
        <DIV>
          <c:if test="${contentsVO.file1.trim().length() > 0 }">
             첨부 파일: <A href='/download?dir=/contents/storage&filename=${contentsVO.file1saved}&downname=${contentsVO.file1}'>${contentsVO.file1}
             </A> (${contentsVO.size1_label})  </c:if>
        </DIV>
      </li>   
    </ul>
  </fieldset>
 
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
