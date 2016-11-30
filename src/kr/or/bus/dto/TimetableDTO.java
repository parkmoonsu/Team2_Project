package kr.or.bus.dto;

import java.util.Arrays;

public class TimetableDTO {
private SelectDistinctDTO selectdistinctdto;
private java.sql.Time[] o_time;
public SelectDistinctDTO getSelectdistinctdto() {
	return selectdistinctdto;
}
public void setSelectdistinctdto(SelectDistinctDTO selectdistinctdto) {
	this.selectdistinctdto = selectdistinctdto;
}
public java.sql.Time[] getO_time() {
	return o_time;
}
public void setO_time(java.sql.Time[] o_time) {
	this.o_time = o_time;
}
@Override
public String toString() {
	return "TimetableDTO [selectdistinctdto=" + selectdistinctdto + ", o_time=" + Arrays.toString(o_time) + "]";
}


}
