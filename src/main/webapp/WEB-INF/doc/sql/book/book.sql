/**********************************/
/* Table Name: 도서 */
/**********************************/
DROP TABLE book;
CREATE TABLE book(
    bookno                            NUMBER(10)     NOT NULL    PRIMARY KEY,
    bookgrpno                         NUMBER(10)     NULL ,
    bookname                          VARCHAR2(50)     NOT NULL,
    rdate                             DATE     NOT NULL,
  FOREIGN KEY (bookgrpno) REFERENCES bookgrp (bookgrpno)
);

COMMENT ON TABLE book is '도서';
COMMENT ON COLUMN book.bookno is '종류번호';
COMMENT ON COLUMN book.bookgrpno is '도서 그룹 번호';
COMMENT ON COLUMN book.bookname is '종류명';
COMMENT ON COLUMN book.rdate is '등록일';


DROP SEQUENCE book_seq;  

CREATE SEQUENCE book_seq            -- 이부분부터만 실행
  START WITH 1           -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                  -- 2번은 메모리에서만 계산
  NOCYCLE;                 -- 다시 1부터 생성되는 것을 방지



INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 1, '소설', sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 2, '시/에세이',sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 3, '경영', sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 3, '경제',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 3, '세무/회계', sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 3, '마케팅/광고',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 3, '유통/창업', sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 3, '재테크/금융',sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 4, '인문학일반',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 4, '심리학',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 4, '교육학',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 4, '유아교육',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 4, '철학',sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 5, '성공/처세',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 5, '자기능력계발',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 5, '인간관계',sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 6, '과학이론',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 6, '수학',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 6, '물리학',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 6, '화학',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 6, '생물학',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 6, '지구과학',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 6, '천문학',sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 7, '토목/건설',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 7, '건축/인테리어',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 7, '자동차/운전',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 7, '기계',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 7, '전기/전자',sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 8, '토익',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 8, '컴퓨터',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 8, '기능사',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 8, '산업기사',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 8, '기사',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 8, '기타자격증',sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 9, 'IT일반',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 9, 'OS',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 9, '네트워크',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 9, '보안/해킹',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 9, '데이터베이스',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 9, '웹프로그래밍',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 9, '프로그래밍/언어',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 9, '모바일프로그래밍',sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 10, '고등학교',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 10, '중학교',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 10, '논술/면접',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 10, '검정고시',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 10, 'EBS',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 10, '올림피아드',sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 11, '영어',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 11, '중국어',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 11, '일본어',sysdate);
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 11, '그 외 언어',sysdate);

select *
from book;

commit;

SELECT * FROM v$version WHERE banner LIKE 'Oracle%';

-----------------------------------------------------------------------------
INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 1, '한국사', sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 2, '웹개발',sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 2, '소설',sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 4, '토익', sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 4, 'HSK', sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 4, 'TSC', sysdate);

--테이블 조인
SELECT   r.bookgrpno,b.bookno, r.grpname, r.seqno, b.bookname, b.rdate
FROM book b,bookgrp r
WHERE b.bookgrpno=r.bookgrpno
ORDER BY b.bookgrpno ASC;