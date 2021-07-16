<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Book Word</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script type="text/javascript">
function recom_ajax(contentsno, status_count) {
  console.log("-> recom_" + status_count + ": " + $('#recom_' + status_count).html());  // A tag body      
  var params = "";
  // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
  params = 'contentsno=' + contentsno; // 공백이 값으로 있으면 안됨.

  // csrf 파라미터 추가
  // <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
  // params += '&${ _csrf.parameterName }=${ _csrf.token }';
  
  $.ajax(
    {
      url: '/contents/update_recom_ajax.do',
      type: 'post',  // get, post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 응답이 온경우
        var str = '';
        if (rdata.cnt == 1) {
          // $('#span_animation_' + status_count).hide();   // SPAN 태그에 animation 출력
          $('#recom_' + status_count).html('♥('+rdata.recom+')');     // A 태그에 animation 출력
        } else {
          // $('#span_animation_' + status_count).html("X");
          $('#recom_' + status_count).html('♥(X)');
        }
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        console.log(error);
      }
    }
  );  //  $.ajax END

  $('#recom_' + status_count).html("<img src='/contents/images/ani04.gif' style='width: 10%;'>");
  // $('#span_animation_' + status_count).css('text-align', 'center');
  // $('#span_animation_' + status_count).html("<img src='/contents/images/ani04.gif' style='width: 10%;'>");
  // $('#span_animation_' + status_count).show(); // 숨겨진 태그의 출력
    
}  

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
                  <c:choose> 
           <c:when test="${grade <= 10 }">
        <A
          href="./create.do?bookno=${bookVO.bookno }&bookgrpno=${bookVO.bookgrpno }">등록</A>
        <span class='menu_divide'>│</span>
          </c:when>
          </c:choose>
          <A
          href="javascript:location.reload();">새로고침</A>
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

    <table class="table table-striped" style='width: 100%;'>
          <colgroup>
            <c:choose> 
           <c:when test="${grade <= 10 }">
            <col style="width: 10%;"></col>
            <col style="width: 50%;"></col>
            <col style="width: 30%;"></col>
            <col style="width: 10%;"></col>
            </c:when>
                <c:otherwise>
                  <col style="width: 10%;"></col>
                    <col style="width: 60%;"></col>
                    <col style="width: 30%;"></col>
                </c:otherwise>
            </c:choose>
          </colgroup>
          <%-- table 컬럼 --%>
          <thead>
            <tr>
              <th style='text-align: center;'></th>
              <th style='text-align: center;'></th>
              <th style='text-align: center;'></th>
            </tr>
          </thead>

          <%-- table 내용 --%>
          <tbody>
            <c:forEach var="contentsVO" items="${list }" varStatus="status">
              <c:set var="contentsno" value="${contentsVO.contentsno }" />
              <c:set var="thumb1" value="${contentsVO.thumb1 }" />
              <c:set var="recom" value="${contentsVO.recom }" />
              
                <c:set var="price" value="${contentsVO.price }" />
                <c:set var="dc" value="${contentsVO.dc }" />
                <c:set var="saleprice" value="${contentsVO.saleprice }" />
                <c:set var="point" value="${contentsVO.point }" />
              <tr>
                <td style='vertical-align: middle; text-align: center;'>
                  <c:choose>
                    <c:when
                      test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                      <%-- /static/contents/storage/ --%>
                      <a href="./read.do?contentsno=${contentsno}&now_page=${param.now_page }"><IMG
                        src="/contents/storage/${thumb1 }"
                        style="width: 120px; height: 80px;"></a>
                    </c:when>
                    <c:otherwise>
                      <!-- 이미지가 아닌 일반 파일 -->
                ${contentsVO.file1}
              </c:otherwise>
                  </c:choose>
                </td>
                <td style='vertical-align: middle;'><a
                  href="./read.do?contentsno=${contentsno }&now_page=${param.now_page }">
                 <strong>${contentsVO.title }</strong>
                </a>
               <div style='font-size:30% '> ${contentsVO.writer } 지음/${contentsVO.publisher }/${contentsVO.rdate} </div>
                </td>
             <td style='vertical-align: middle; text-align: center;'>
            <del><fmt:formatNumber value="${price}" pattern="#,###" /></del><br>
            <span style="color: #FF0000; font-size: 1.2em;">${dc} %</span>
            <strong><fmt:formatNumber value="${saleprice}" pattern="#,###" /></strong><br>
            <span style="font-size: 0.8em;">포인트: <fmt:formatNumber value="${point}" pattern="#,###" /></span>
            <span><A id="recom_${status.count }" href="javascript:recom_ajax(${contentsno }, ${status.count })" class="recom_link">♥(${recom })</A></span>
     
            <br>
            <button type='button' id='btn_cart' class="btn btn-info" style='margin-bottom: 2px;'
                        onclick="cart_ajax(${contentsno })">장바 구니</button><br>
            <button type='button' id='btn_ordering' class="btn btn-info" 
                        onclick="cart_ajax(${contentsno })">바로 구매</button>  
          </td>
            <c:choose> 
           <c:when test="${grade <= 10 }">
                <td style='vertical-align: middle; text-align: center;'>
              
                  <A
                  href="./update_text.do?contentsno=${contentsno}&now_page=${param.now_page }"><span
                    class="glyphicon glyphicon-pencil"></span></A> <A
                  href="./delete.do?contentsno=${contentsno}&now_page=${param.now_page }"><span
                    class="glyphicon glyphicon-trash"></span></A>
                </td>
                </c:when>
                </c:choose>
              </tr>
            </c:forEach>

          </tbody>
          
    </table>
    
    <DIV class='bottom_menu'>${paging }</DIV>
  </DIV>


  <jsp:include page="../menu/bottom.jsp" />
</body>

</html>


