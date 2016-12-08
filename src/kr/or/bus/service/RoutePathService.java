package kr.or.bus.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.bus.dao.RouteDAO;
import kr.or.bus.dto.RouteDTO;
import kr.or.bus.dto.RoutePathDTO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;
@Service
public class RoutePathService {


		@Autowired
		private SqlSession sqlsession;

			
			//읽은 데이터가 1개일경우
			public void busSingleRouteRead(List<RoutePathDTO> data) throws IOException{
				RouteDAO dao = null;
				dao = sqlsession.getMapper(RouteDAO.class);
			
		        int i = 0;

		        
		        while(i<data.size()){
		        	String r_x=data.get(i).getR_x();
		        	String r_y=data.get(i).getR_y();
		        	String r_num=data.get(i).getR_num();
		        	int r_order=i;
		        	dao.InsertRoute(r_x,r_y,r_num,r_order);
		        	System.out.println(i);
		        	i++;
		        }
		        System.out.println("다됌");
		        
		        //dao.InsertRoute(r_num,r_x,r_y,r_order);
		        //out.print(jsonmaps);
			}	
			
			public List<RouteDTO> Selectpath(String r_num) throws IOException{						
				List<RouteDTO> dto=null;
				RouteDAO dao = null;

	            	dao = sqlsession.getMapper(RouteDAO.class);
	            	dto = dao.routeidselect(r_num);
	            		
	            	return dto;
	            															
			}
			
				
	}

