/*
*	@FileName : RouteDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.26
*	@Author	: 김용현
*	@Discription :Route table DTO
*/
package kr.or.bus.dto;

public class RouteDTO {
   
   String r_num; //노선번호
   String g_num; //차고지 번호
   String r_start; //차고지 기준 첫차시간
   String r_last; //차고지 기준 막차시간
   String r_interval; //배차간격(분)
   String r_id; //노선 id
   String bd_num; //버스타입
   
 
public String getR_num() {
      return r_num;
   }
   public void setR_num(String r_num) {
      this.r_num = r_num;
   }
   public String getG_num() {
      return g_num;
   }
   public void setG_num(String g_num) {
      this.g_num = g_num;
   }
   public String getR_start() {
      return r_start;
   }
   public void setR_start(String r_start) {
      this.r_start = r_start;
   }
   public String getR_last() {
      return r_last;
   }
   public void setR_last(String r_last) {
      this.r_last = r_last;
   }
   public String getR_interval() {
      return r_interval;
   }
   public void setR_interval(String r_interval) {
      this.r_interval = r_interval;
   }
   public String getR_id() {
      return r_id;
   }
   public void setR_id(String r_id) {
      this.r_id = r_id;
   }
   public String getBd_num() {
      return bd_num;
   }
   public void setBd_num(String bd_num) {
      this.bd_num = bd_num;
   }
   
   
   @Override
   public String toString() {
   	return "RouteDTO [r_num=" + r_num + ", g_num=" + g_num + ", r_start=" + r_start + ", r_last=" + r_last
   			+ ", r_interval=" + r_interval + ", r_id=" + r_id + ", bd_num=" + bd_num + "]";
   }
}