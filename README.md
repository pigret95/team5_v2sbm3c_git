# team5_v2sbm3c_git
### 1) Project Subject

MariaDB기반 모델링을 토대로 Spring Boot 기반 동작하는 도서 판매 및 구입 Website를 제작한다.
### 2) Main Function

● 테이블은 총 12개로 '도서 그룹', '도서', '컨텐츠', '회원', '장바구니', '보관함','주문상세','주문_결제','질문 답변 관리','이벤트','공지사항','자주묻는질문','faq질문그룹'이 존재한다.

● '도서 그룹' 테이블은 대분류로 역사/소설/과학/외국어 등에 대한 그룹 생성 기능을 제공한다.

● '도서' 테이블은 중분류로 대분류에 해당하는 개별 스터디에 대한 생성 기능을 제공한다. '도서 그룹'의 하위테이블로 참조관계를 갖고있다.

● '컨텐츠' 테이블은 소분류로 등록된 개별 도서에 도서 정보,저자,가격,포인트 등을 등록하는 기능을한다. '도서'의 하위테이블로 참조관계를 갖고있다.

● '회원' 테이블은 회원가입 및 로그인 기능을 제공하며 이름, 아이디, 패스워드, 이메일, 주소, 회원이미지 등의 데이터를 입력할 수있다.

● 테이블 간의 참조관계 및 제약조건 설정을 통해 무결성을 유지시켰다.

● index 화면과 각각의 View는 CDN 방식의 BootStrap과 css를 활용해 UI의 접근성을 상승시켰다.

● '도서 그룹'과 '도서' 등록 및 수정 삭제 시 Spring Controller와 AJAX 통신, JQuery를 사용해 메모리 사용을 절감하였다.

● '컨텐츠'와 '회원' 레코드 등록 시 id 및 이메일 등에 대한 유효성 검사를 위해 AJAX 통신과 JQuery가 사용됐다.



### 3) Technology

O/S : Windows 10

Language : JAVA (JDK1.8.0_281)

DBMS : MySQL, MariaDB

Web Application Server : boot DEVTOOLS

Framework : Spring Boot 2.4.3, Mybatis 3.4.1, BootStrap 3.4.1, JQuery

Technology : JDBC, HTML5, CSS, EL, Javascript, JSON, JSP, AJAX

Tools : STS4, Amateras UML, Amateras ERD, SQLdeveloper

![KakaoTalk_20210727_222938881](https://user-images.githubusercontent.com/42789806/127164795-a0d9b218-abe6-4af1-a20d-8f19af245f64.png)

