package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ContentsDAOInter {
  /**
   * 등록
   * @param contentsVO
   * @return
   */
  public int create(ContentsVO contentsVO);
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 검색 + 페이징 목록
   * @param map
   * @return
   */
  public List<ContentsVO> list_by_bookno_search_paging(HashMap<String, Object> map);
  
  /**
   * 조회
   * @param contentsno
   * @return
   */
  public ContentsVO read(int contentsno);
  
}






