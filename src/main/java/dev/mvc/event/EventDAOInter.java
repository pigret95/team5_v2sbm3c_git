package dev.mvc.event;

import java.util.HashMap;
import java.util.List;

public interface EventDAOInter {
  /*
   * ���
   */
  public int create(EventVO eventVO);
  /*
   * ���
   */
  public List<EventVO> list();
  /*
   * �˻�
   */
  public List<EventVO> list_search(HashMap<String, Object> hashMap);
  /*
   * �˻� ����
   */
  public int search_count(HashMap<String, Object> hashMap);
/*
 * ��ȸ
 */
  public EventVO read(int eventno);
  /*
   * ����
   */
  public int update(EventVO eventVO);
  /*
   * ����
   */
  public int delete(int eventno);
}
