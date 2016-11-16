package calendar;

import java.sql.Date;

/**
 * @author kosta
 *
 */
/**
 * @author kosta
 *
 */
/**
 * @author kosta
 *
 */
public class dto {
	String id;	
	String title;	
	String allDay;	
	Date sstart;	
	Date eend;	
	String url;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAllDay() {
		return allDay;
	}
	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}
	public Date getSstart() {
		return sstart;
	}
	public void setSstart(Date sstart) {
		this.sstart = sstart;
	}
	public Date getEend() {
		return eend;
	}
	public void setEend(Date eend) {
		this.eend = eend;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "dto [id=" + id + ", title=" + title + ", allDay=" + allDay + ", sstart=" + sstart + ", eend=" + eend
				+ ", url=" + url + "]";
	}
		
}
