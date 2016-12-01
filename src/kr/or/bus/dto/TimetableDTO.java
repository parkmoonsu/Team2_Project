package kr.or.bus.dto;

import java.util.Arrays;
import java.util.List;

public class TimetableDTO {
private SelectDistinctDTO selectdistinctdto;
private String[] o_time;
public SelectDistinctDTO getSelectdistinctdto() {
	return selectdistinctdto;
}
public void setSelectdistinctdto(SelectDistinctDTO selectdistinctdto) {
	this.selectdistinctdto = selectdistinctdto;
}


public String[] getO_time() {
	return o_time;
}
public void setO_time(String[] o_time) {
	this.o_time = o_time;
}
@Override
public String toString() {
	return "TimetableDTO [selectdistinctdto=" + selectdistinctdto + ", o_time=" + Arrays.toString(o_time) + "]";
}



}
