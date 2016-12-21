/*
*	@FileName : busSingleRouteRead.java
*	@Project	: KosBus
*	@Date	: 2016. 11.25
*	@Author	: 김지현
*	@Discription : 버스노선 읽어오는 페이지 Service
*/


package kr.or.bus.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.or.bus.dao.BusLocationInfoDAO;
import kr.or.bus.dao.RouteDAO;
import kr.or.bus.dto.BusLocationInfoDTO;
import kr.or.bus.dto.RouteDTO;
import kr.or.bus.dto.RoutePathDTO;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;
import nu.xom.*;
@Service
public class RoutePathService {


		@Autowired
		private SqlSession sqlsession;
			
			//공공데이터로 부터 원본 노선을 insert한다
			public void routeInsert(HttpServletRequest request , HttpServletResponse response) throws IOException{
				String r_num = request.getParameter("r_num");
				RouteDAO routedao = sqlsession.getMapper(RouteDAO.class);
				RouteDTO routedto = routedao.routeidSearch(r_num);
				RoutePathDTO routepath = null;
				System.out.println("노선id잘나오냐"+routedto.getR_id());
				
				JSONObject jsonmaps = null;
				StringBuilder urlBuilder = new StringBuilder("http://ws.bus.go.kr/api/rest/busRouteInfo/getRoutePath"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=058in59%2BNLwfE3cT76LhIzkAAy2rb6zIQALV3UFT4T8qcZ4oIcYFtMfw75Hvs7H2nbjhZ8hT66mmVaWbzdbltg%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("busRouteId","UTF-8") + "=" + URLEncoder.encode(routedto.getR_id(), "UTF-8")); /*노선ID*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("999", "UTF-8")); /*검색건수*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/xml");
		        //System.out.println("Response code: " + conn.getResponseCode());
		        BufferedReader rd;
		        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        } else {
		            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		        }
		        StringBuilder sb = new StringBuilder();
		        String line;
		        while ((line = rd.readLine()) != null) {
		            sb.append(line);
		        }
		        rd.close();
		        conn.disconnect();
		        
		        //System.out.println(sb.toString());
		        jsonmaps = (JSONObject)new XMLSerializer().read(sb.toString());
		        
		        //System.out.println(jsonmaps);
		        
		        JSONArray jsonlist = (JSONArray) jsonmaps.get("msgBody");
		        
		        System.out.println(jsonlist);
		        
		        //"gpsX":"126.9278660041","gpsY":"37.3309699673","no":"1"
		        
		        int i=0;
		        int jsonsize = jsonlist.size();
		        routepath = new RoutePathDTO();
		        while(i<jsonsize){
		        	System.out.println(jsonlist.getJSONObject(i).get("gpsX").toString());
		        	System.out.println(jsonlist.getJSONObject(i).get("gpsY").toString());
		        	System.out.println(jsonlist.getJSONObject(i).get("no").toString());
		        	System.out.println(r_num);
		        	
		        	routepath.setR_num(r_num);
		        	routepath.setR_order(jsonlist.getJSONObject(i).get("no").toString());
		        	routepath.setR_x(jsonlist.getJSONObject(i).get("gpsX").toString());
		        	routepath.setR_y(jsonlist.getJSONObject(i).get("gpsY").toString());
		        	
		        	routedao.insertOrgRoute(routepath);
		        	System.out.println("경로저장?? "+i);
		        	i++;
		        	
		        }
		        System.out.println("노선경로 저장 다됨?");
		        
			}
			
			//원본 노선경로 읽어옴
			public void busSingleRouteRead(HttpServletRequest request , HttpServletResponse response) throws IOException{
				String datalist =  request.getParameter("data");
	    		System.out.println(datalist);
	    		RouteDAO dao = sqlsession.getMapper(RouteDAO.class);
	    		
	    		JSONArray jsondata = JSONArray.fromObject(datalist);
	    		System.out.println(jsondata);
	    		
	    		RoutePathDTO dto = new RoutePathDTO();
	    		int i=0;
	    		
	    		int jsonsize = jsondata.size();
	    		while(i<jsonsize){
	    			System.out.println(i);
	    			System.out.println(jsondata.getJSONObject(i));
	    			dto.setR_num(jsondata.getJSONObject(i).get("r_num").toString());
	    			dto.setR_x(jsondata.getJSONObject(i).get("r_x").toString());
	    			dto.setR_y(jsondata.getJSONObject(i).get("r_y").toString());
	    			dto.setR_order(String.valueOf(i));
	    			dao.InsertRoute(dto);
	    			i++;
	    		}					       
		        System.out.println("다됌");		        		     
			}	
			
			public List<RouteDTO> Selectpath(String r_num) throws IOException{						
				List<RouteDTO> dto=null;
				RouteDAO dao = null;

	            	dao = sqlsession.getMapper(RouteDAO.class);
	            	dto = dao.routeidselect(r_num);
	            		
	            	return dto;
	            															
			}
			
			//수정 노선경로 불러오기 서비스
			public List<RoutePathDTO> selectEditPath(String r_num){
				RouteDAO dao = sqlsession.getMapper(RouteDAO.class);				
				return dao.editRouteRead(r_num);				
			}
			
			//버스 시뮬레이션 과 매칭되는 버스 
			public List<BusLocationInfoDTO> simulation(String r_num){
				BusLocationInfoDAO locationdao = sqlsession.getMapper(BusLocationInfoDAO.class);				
				return locationdao.simulationdata(r_num);				
			}
				
	}

