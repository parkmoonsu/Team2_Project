package kr.or.bus.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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
@Service
public class RoutePathService {


		@Autowired
		private SqlSession sqlsession;

			
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

