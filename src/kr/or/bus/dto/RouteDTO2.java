package kr.or.bus.dto;

public class RouteDTO2 {
   
   String r_num; //노선번호
   String r_start; //차고지 기준 첫차시간
   String r_last; //차고지 기준 막차시간
   String r_interval; //배차간격(분)
   
   public String getR_num() {
      return r_num;
   }
   public void setR_num(String r_num) {
      this.r_num = r_num;
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
   
@Override
public String toString() {
	return "RouteDTO2 [r_num=" + r_num + ", r_start=" + r_start + ", r_last=" + r_last + ", r_interval=" + r_interval
			+ "]";
}
  
   
   
}