package kr.or.bus.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import kr.or.bus.dao.BusDataDAO;
import kr.or.bus.dao.BusLocationInfoDAO;
import kr.or.bus.dao.BusStopDAO;
import kr.or.bus.dao.RouteDAO;
import kr.or.bus.dao.RouteStopDAO;
import kr.or.bus.dao.StopDAO;
import kr.or.bus.dto.BusDTO;
import kr.or.bus.dto.BusLocationInfoDTO;
import kr.or.bus.dto.BusStopDTO;
import kr.or.bus.dto.RouteDTO;
import kr.or.bus.dto.RouteStopDTO;
import kr.or.bus.dto.StopDTO;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;
import nu.xom.*;

@Service
public class BusStopManageService {
	@Autowired
	private SqlSession sqlsession;
	
	//버스정류장 원본 좌표를 파일로부터 읽어온다.
	//버스 정류장 원본 좌표를 파일로부터 읽어온다.
	
	/*public void busStopOriginalRead(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out=null;
		
        String busno = request.getParameter("busNo");
        System.out.println(busno);
        if(busno.equals("all")){
        	JSONObject obs1 = busStopOrgRead(5623 ,request,response);
        	JSONObject obs2 = busStopOrgRead(702 ,request,response);
        	JSONObject obs3 = busStopOrgRead(6501 ,request,response);
        	JSONObject obs4 = busStopOrgRead(9000 ,request,response);
        	
        	ArrayList<JSONObject> obss = new ArrayList<JSONObject>();
        	obss.add(obs1);
        	obss.add(obs2);
        	obss.add(obs3);
        	obss.add(obs4);
        	
        	out = response.getWriter();
        	out.print(obss);
        }else if(!busno.equals("all")){
        	busStopOrgRead(busno ,request ,response );
        }
	}*/
	
	//읽은 데이터가 1개일경우
	/*public void busStopOrgRead(String busno , HttpServletRequest request, HttpServletResponse response){
		System.out.println("너타냐");
		FileReader fr = null;
        BufferedReader br = null;
        PrintWriter out=null;
        String maps = null;
        
        String path = request.getServletContext().getRealPath("/busstop/"+busno+".xml");
		try{
        	fr = new FileReader(path);
        	br = new BufferedReader(fr);	        	
        	String line = "";
            for(int i=0; (line = br.readLine())!=null;i++){
                maps+=line.replaceAll("\\p{Space}","");           
            }
       
            System.out.println("버스정류장 좌표를 파일로 부터  읽어왔습니다.");
        	response.setCharacterEncoding("UTF-8");
        	out = response.getWriter();
        	System.out.println(maps);        	
        	JSONObject jsonmaps = (JSONObject)new XMLSerializer().read(maps.replace("null",""));
        	out.print(jsonmaps);
        	
        }catch(Exception e){
        	System.out.println(e.getMessage());
        }finally{
        	try {
        		br.close();
        		fr.close();
        	} catch (IOException e) {
        		System.out.println(e.getMessage());
        	}
        }
	}*/
	
	//읽을 데이터가 4개일경우
	/*public JSONObject busStopOrgRead(int busno, HttpServletRequest request ,HttpServletResponse response){
		FileReader fr = null;
        BufferedReader br = null;
       
        String maps = null;
        JSONObject jsonmaps = null;
        String path = request.getServletContext().getRealPath("/busstop/"+busno+".xml");
		try{
        	fr = new FileReader(path);
        	br = new BufferedReader(fr);	        	
        	String line = "";
            for(int i=0; (line = br.readLine())!=null;i++){
                maps+=line.replaceAll("\\p{Space}","");           
            }
        
            System.out.println("버스정류장 좌표를 파일로 부터  읽어왔습니다.");
        	response.setCharacterEncoding("UTF-8");
        	
        	System.out.println(maps);        	
        	jsonmaps = (JSONObject)new XMLSerializer().read(maps.replace("null",""));      	
        	
        }catch(Exception e){
        	System.out.println(e.getMessage());
        }finally{
        	try {
        		br.close();
        		fr.close();
        	} catch (IOException e) {
        		System.out.println(e.getMessage());
        	}
        }
		return jsonmaps;
	}
	//버스 원본 경로를 파일로부터 읽어온다.
	public void busRouteRead(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out=null;
        String busno = request.getParameter("busNo");
        System.out.println(busno);
        System.out.println("멀티 경로");
        
        	if(busno.equals("all")){
            	JSONObject obs1 = busOrgRouteRead(5623 ,request, response);
            	JSONObject obs2 = busOrgRouteRead(6501 ,request, response);
            	JSONObject obs3 = busOrgRouteRead(702 ,request, response);
            	JSONObject obs4 = busOrgRouteRead(9000 ,request, response);
            	
            	ArrayList<JSONObject> obss = new ArrayList<JSONObject>();
            	obss.add(obs1);
            	obss.add(obs2);
            	obss.add(obs3);
            	obss.add(obs4);
            	
            	out = response.getWriter();
            	out.print(obss);
            }else if(!busno.equals("all")){
            	busOrgRouteRead(busno ,request, response);
            }
        
	}*/
	
	//읽은 데이터가 1개일경우
	/*public void busOrgRouteRead(String busno ,HttpServletRequest request, HttpServletResponse response){
		System.out.println("너타냐");
		FileReader fr = null;
        BufferedReader br = null;
        PrintWriter out=null;
        String maps = null;
        String path = request.getServletContext().getRealPath("/busstop/"+busno+"route.xml");
		try{
        	fr = new FileReader(path);
        	br = new BufferedReader(fr);	        	
        	String line = "";
            for(int i=0; (line = br.readLine())!=null;i++){
                maps+=line.replaceAll("\\p{Space}","");           
            }
       
            System.out.println("버스정류장 좌표를 파일로 부터  읽어왔습니다.");
        	response.setCharacterEncoding("UTF-8");
        	out = response.getWriter();
        	//System.out.println(maps);        	
        	JSONObject jsonmaps = (JSONObject)new XMLSerializer().read(maps.replace("null",""));
        	out.print(jsonmaps);
        	
        }catch(Exception e){
        	System.out.println(e.getMessage());
        }finally{
        	try {
        		br.close();
        		fr.close();
        	} catch (IOException e) {
        		System.out.println(e.getMessage());
        	}
        }
	}*/
	
	//읽을 데이터가 4개일경우
		/*public JSONObject busOrgRouteRead(int busno, HttpServletRequest request, HttpServletResponse response){
			FileReader fr = null;
			BufferedReader br = null;
       
			String maps = null;
			JSONObject jsonmaps = null;
			 String path = request.getServletContext().getRealPath("/busstop/"+busno+"route.xml");
			try{
	        	fr = new FileReader(path);
	        	br = new BufferedReader(fr);	        	
	        	String line = "";
	            for(int i=0; (line = br.readLine())!=null;i++){
	                maps+=line.replaceAll("\\p{Space}","");           
	            }
	       
	            System.out.println("버스정류장 좌표를 파일로 부터  읽어왔습니다.");
	        	response.setCharacterEncoding("UTF-8");
	        	
	        	System.out.println(maps);        	
	        	jsonmaps = (JSONObject)new XMLSerializer().read(maps.replace("null",""));      	
	        	
	        }catch(Exception e){
	        	System.out.println(e.getMessage());
	        }finally{
	        	try {
	        		br.close();
	        		fr.close();
	        	} catch (IOException e) {
	        		System.out.println(e.getMessage());
	        	}
	        }
		return jsonmaps;
	}*/
	
		//버스 원본 경로를 디비 로부터  route id select 해서 공공데이터에서 버스 경로를 가져온다.	
		public void busRouteCall(String r_num,RouteDTO dto, HttpServletRequest request, HttpServletResponse response) throws IOException{						
			PrintWriter out=null;			
			RouteDAO dao = null;
			
			if(r_num.equals("all")){				
            	JSONObject obs1 = busMultiRouteRead("5623" , dto, request, response);
            	JSONObject obs2 = busMultiRouteRead("6702" , dto, request, response);
            	JSONObject obs3 = busMultiRouteRead("143", dto, request, response);
            	JSONObject obs4 = busMultiRouteRead("3030안양", dto, request, response);
            	
            	ArrayList<JSONObject> obss = new ArrayList<JSONObject>();
            	obss.add(obs1);
            	obss.add(obs2);
            	obss.add(obs3);
            	obss.add(obs4);
            	
            	out = response.getWriter();
            	out.print(obss);
            	
            }else if(!r_num.equals("all")){
            	dao = sqlsession.getMapper(RouteDAO.class);
            	dto = dao.routeidSearch(r_num);
            	busSingleRouteRead(dto ,request, response);
            }																
		}
		
		//읽은 데이터가 1개일경우
		public void busSingleRouteRead(RouteDTO dto ,HttpServletRequest request, HttpServletResponse response) throws IOException{
			PrintWriter out = response.getWriter();
			JSONObject jsonmaps = null;
			StringBuilder urlBuilder = new StringBuilder("http://ws.bus.go.kr/api/rest/busRouteInfo/getRoutePath"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=058in59%2BNLwfE3cT76LhIzkAAy2rb6zIQALV3UFT4T8qcZ4oIcYFtMfw75Hvs7H2nbjhZ8hT66mmVaWbzdbltg%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("busRouteId","UTF-8") + "=" + URLEncoder.encode(dto.getR_id(), "UTF-8")); /*노선ID*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("999", "UTF-8")); /*검색건수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
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
	        
	        System.out.println(sb.toString());
	        jsonmaps = (JSONObject)new XMLSerializer().read(sb.toString());
	        out.print(jsonmaps);
		}
		
		//읽을 데이터가 4개일경우
		public JSONObject busMultiRouteRead(String r_num, RouteDTO dto,HttpServletRequest request, HttpServletResponse response) throws IOException{
			RouteDAO dao = sqlsession.getMapper(RouteDAO.class);
			String id = null;
			if(r_num.equals("5623")){
				dto = dao.routeidSearch("5623");
				id = dto.getR_id();
			}
			else if(r_num.equals("6702")){
				dto = dao.routeidSearch("6702");
				id = dto.getR_id();				
			}
			else if(r_num.equals("143")){
				dto = dao.routeidSearch("143");
				id = dto.getR_id();
			}
			else if(r_num.equals("3030안양")){
				dto = dao.routeidSearch("3030안양");
				id = dto.getR_id();		
			}
			
			System.out.println("id?????" + id);
			
			JSONObject jsonmaps = null;
			StringBuilder urlBuilder = new StringBuilder("http://ws.bus.go.kr/api/rest/busRouteInfo/getRoutePath"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=058in59%2BNLwfE3cT76LhIzkAAy2rb6zIQALV3UFT4T8qcZ4oIcYFtMfw75Hvs7H2nbjhZ8hT66mmVaWbzdbltg%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("busRouteId","UTF-8") + "=" + URLEncoder.encode(id, "UTF-8")); /*노선ID*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("999", "UTF-8")); /*검색건수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
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
	        
			return jsonmaps;
		}	
	

	//수정된 버스정류장 좌표를 저장한다.
	/*public void busStoplocationEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		FileWriter fw = null;
	    BufferedWriter bw = null;
	    String map = request.getParameter("kml");
	
		String busno = request.getParameter("busNo");
		System.out.println(map);
		System.out.println(busno);
		System.out.println("되냐");
		String path = request.getServletContext().getRealPath("/busstop/"+busno+".json");        
	    try{
	        fw = new FileWriter(path);
	        bw = new BufferedWriter(fw);
	            
	        bw.write(map);
	        bw.newLine();	            	       
	    }catch(Exception e){
	        System.out.println(e.getMessage());
	    }finally{
	        try {           	
	            bw.close();
	            fw.close();
	 
	        } catch (IOException e) {
	            System.out.println(e.getMessage());
	        }
	    }	      	  
	    System.out.println("지도 좌표가 저장되었습니다.");
	}*/

	//수정된 버스정류장 좌표를 파일로 부터 읽어오는 함수.
	/*public void busStoplocationEditRead(HttpServletRequest request ,HttpServletResponse response) throws Exception {
		
		String busno = request.getParameter("busNo");
		FileReader fr = null;
		BufferedReader br = null;
		PrintWriter out=null;
		String maps = null;
		String path = request.getServletContext().getRealPath("/busstop/"+busno+".json");
		try{
			fr = new FileReader(path);
			br = new BufferedReader(fr);	        	
			String line = "";
		
		for(int i=0; (line = br.readLine())!=null;i++){
	        maps+=line.replaceAll("\\p{Space}","");           
	    }
		
	    System.out.println("버스정류장 좌표를 파일로 부터  읽어왔습니다.");
	    System.out.println("maps 에 담기냐? "+maps);
	               
		response.setCharacterEncoding("UTF-8");
		out = response.getWriter();
		out.print(maps.replace("null",""));
	    }catch(Exception e){
	    	System.out.println(e.getMessage());
	    }finally{
	    	try {
	    		br.close();
	    		fr.close();
	    	} catch (IOException e) {
	    		System.out.println(e.getMessage());
	    	}
	    }
	}*/

//실시간 위치 추적
	public void busLocationSearch(String r_num, RouteDTO dto, HttpServletRequest request , HttpServletResponse response) throws IOException{			
		PrintWriter out=null;
		JSONObject jsonmaps = null;
		JSONArray jsonlist = null;
		JSONObject jsonno = null;
		
		response.setCharacterEncoding("UTF-8");
		out = response.getWriter();
		ArrayList<JSONObject> locations = null;
		/*
		 	route id
		 	
			5623  100100279   - 116005219
			6702   100100573   - 122071125
			6501  234001163   - 234000043
			9000  234000002   - 234000145 
			
			
			에 해당하는 차량 id가 아래에 입력되어야함.
		*/		
		if(r_num.equals("all")){
			
			JSONObject locations1 = multiLocationSearch(request , response, dto, "5623");
			JSONObject locations2 = multiLocationSearch(request , response, dto, "6702");
			JSONObject locations3 = multiLocationSearch(request , response, dto, "9000광주");
			JSONObject locations4 = multiLocationSearch(request , response, dto, "6501광주");
			
			locations = new ArrayList<JSONObject>();
			locations.add(locations1);
			locations.add(locations2);
			locations.add(locations3);
			locations.add(locations4);
			
			out.print(locations);
			
		}else if(!r_num.equals("all")){
			System.out.println("버스번호? "+r_num);
			System.out.println("버스하나만 조회");
			
			RouteDAO dao = sqlsession.getMapper(RouteDAO.class);		
			System.out.println(dao.routeidSearch(r_num));		
			dto = dao.routeidSearch(r_num);		
			
			
			String venid = venidSearch(dto,r_num);				
			LocationSearch(request , response, venid);
		}
	}
	
	public JSONObject multiLocationSearch(HttpServletRequest request , HttpServletResponse response, RouteDTO dto, String r_num) throws IOException{
		String venid = null;
		
		RouteDAO dao = sqlsession.getMapper(RouteDAO.class);
		if(r_num.equals("5623")){
			dto = dao.routeidSearch(r_num);
			venid = venidSearch(dto, r_num);
		}else if(r_num.equals("6702")){
			dto = dao.routeidSearch(r_num);
			venid = venidSearch(dto, r_num);
		}else if(r_num.equals("3030안양")){
			dto = dao.routeidSearch(r_num);
			venid = venidSearch(dto, r_num);
		}else if(r_num.equals("6501광주")){
			dto = dao.routeidSearch(r_num);
			venid = venidSearch(dto, r_num);
		}
		
		
		
		System.out.println("멀티위치추적되냐");				
		JSONObject jsonmaps = null;
		StringBuilder urlBuilder = new StringBuilder("http://ws.bus.go.kr/api/rest/buspos/getBusPosByVehId"); //URL
	    urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=058in59%2BNLwfE3cT76LhIzkAAy2rb6zIQALV3UFT4T8qcZ4oIcYFtMfw75Hvs7H2nbjhZ8hT66mmVaWbzdbltg%3D%3D"); //Service Key
	    urlBuilder.append("&" + URLEncoder.encode("vehId","UTF-8") + "=" + URLEncoder.encode(venid, "UTF-8")); //버스ID
	    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("999", "UTF-8")); //검색건수
	    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //페이지 번호
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
	        
	    System.out.println(sb.toString()); 
		System.out.println("실시간 위치추적");
		System.out.println(sb.toString());
		jsonmaps = (JSONObject)new XMLSerializer().read(sb.toString());
		
		return jsonmaps;
	}
	
	public void LocationSearch(HttpServletRequest request , HttpServletResponse response, String venid) throws IOException{
		System.out.println("너하나만 타냐");
			
		PrintWriter out=null;
		JSONObject jsonmaps = null;
		JSONArray jsonlist = null;
		JSONObject jsonno = null;
		
		StringBuilder urlBuilder = new StringBuilder("http://ws.bus.go.kr/api/rest/buspos/getBusPosByVehId"); //URL
	    urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=058in59%2BNLwfE3cT76LhIzkAAy2rb6zIQALV3UFT4T8qcZ4oIcYFtMfw75Hvs7H2nbjhZ8hT66mmVaWbzdbltg%3D%3D"); //Service Key
	    urlBuilder.append("&" + URLEncoder.encode("vehId","UTF-8") + "=" + URLEncoder.encode(venid, "UTF-8")); //버스ID
	    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("999", "UTF-8")); //검색건수
	    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //페이지 번호
	    URL url = new URL(urlBuilder.toString());
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Content-type", "application/xml");
	    System.out.println("Response code: " + conn.getResponseCode());
	        
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
	        
	    System.out.println(sb.toString());
	    response.setCharacterEncoding("UTF-8");    
		out = response.getWriter();
		System.out.println("실시간 위치추적");
		System.out.println(sb.toString());
		jsonmaps = (JSONObject)new XMLSerializer().read(sb.toString());
		
		jsonno = jsonmaps;
		
		System.out.println("시발"+jsonno);
		System.out.println(jsonno.get("msgBody"));
		jsonno = (JSONObject) jsonno.get("msgBody");
		jsonno = (JSONObject) jsonno.get("itemList");
		System.out.println("차량번호 가져왔냐???"+jsonno.get("plainNo"));
		
		BusLocationInfoDAO buslocationinfodao = sqlsession.getMapper(BusLocationInfoDAO.class);
		
		BusLocationInfoDTO buslocationinfodto = buslocationinfodao.SearchRider(jsonno.get("plainNo").toString());		
		System.out.println(buslocationinfodto);
		jsonlist = JSONArray.fromObject(jsonmaps);
					
		jsonlist.add(1, buslocationinfodto);
		out.print(jsonlist);
	}
	
	//뷰에서 r_num 을 받아서 공공데이터로 보낸뒤 결과값 route_id 를 디비에 저장시키는 함수. 
	public void routeidInfoSearch(String r_num,RouteDTO dto, StopDTO stopdto, RouteStopDTO routestopdto, HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println(r_num);
		JSONObject jsonmaps = null;
		JSONArray jsonlist= null;
		JSON se = null;
		PrintWriter out = null;
		response.setCharacterEncoding("UTF-8");
		out = response.getWriter();
		
		StringBuilder urlBuilder = new StringBuilder("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=058in59%2BNLwfE3cT76LhIzkAAy2rb6zIQALV3UFT4T8qcZ4oIcYFtMfw75Hvs7H2nbjhZ8hT66mmVaWbzdbltg%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("strSrch","UTF-8") + "=" + URLEncoder.encode(r_num, "UTF-8")); /*검색할 노선번호*/
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
        jsonmaps = JSONObject.fromObject(new XMLSerializer().read(sb.toString()));
		System.out.println("시발 되냐" + jsonmaps.get("msgBody"));
        
		//jsonmaps.getJSONArray("itemList");
		
		/*시발 되냐{"comMsgHeader":[],"msgHeader":{"headerCd":"0","headerMsg":"정상적으로 처리되었습니다.","itemCount":"0"},
		 * "msgBody":[
		 * {"busRouteId":"100100022","busRouteNm":"143","corpNm":"대진여객  02-916-2678","edStationNm":"개포동","firstBusTm":"20161205040000","firstLowTm":"","lastBusTm":"20161205221000","lastBusYn":" ","lastLowTm":"20150717215600","length":"62.32","routeType":"3","stStationNm":"정릉","term":"7"},
		 * {"busRouteId":"100100158","busRouteNm":"1143","corpNm":"삼화상운  02-936-5569","edStationNm":"서울의료원","firstBusTm":"20161205050000","firstLowTm":"","lastBusTm":"20161205233000","lastBusYn":" ","lastLowTm":"","length":"25.056","routeType":"4","stStationNm":"중계본동","term":"13"}
		 * ]}*/
		
		se= (JSON) jsonmaps.get("msgBody");
		
		
		if(se.isArray()){
			System.out.println("배열이다 시발");
			jsonlist = (JSONArray) se;
			System.out.println(jsonlist);
			System.out.println(jsonlist.getJSONObject(0).get("busRouteNm").toString());
			System.out.println(jsonlist.getJSONObject(0).get("busRouteId").toString());
	        System.out.println(jsonlist.getJSONObject(0).get("firstBusTm").toString());
	        System.out.println(jsonlist.getJSONObject(0).get("lastBusTm").toString());
	        System.out.println(jsonlist.getJSONObject(0).get("term").toString());
	        System.out.println(jsonlist.getJSONObject(0).get("routeType").toString());
	        
	        dto.setR_num(jsonlist.getJSONObject(0).get("busRouteNm").toString());
	        dto.setR_id(jsonlist.getJSONObject(0).get("busRouteId").toString());
	        dto.setR_start(jsonlist.getJSONObject(0).get("firstBusTm").toString());
	        dto.setR_last(jsonlist.getJSONObject(0).get("lastBusTm").toString());
	        dto.setR_interval(jsonlist.getJSONObject(0).get("term").toString());
	        dto.setBd_num(jsonlist.getJSONObject(0).get("routeType").toString());
	        
	        System.out.println(dto);
	        
		}else{
			System.out.println("그냥 객체야 시발");
			jsonmaps = (JSONObject) se;
			System.out.println(se);
			jsonmaps = (JSONObject) jsonmaps.get("itemList");
			System.out.println(jsonmaps.get("busRouteNm").toString());
			System.out.println(jsonmaps.get("firstBusTm").toString());
			System.out.println(jsonmaps.get("lastBusTm").toString());
			System.out.println(jsonmaps.get("term").toString());
			System.out.println(jsonmaps.get("busRouteId").toString());
			System.out.println(jsonmaps.get("routeType").toString());
			
			dto.setR_num(jsonmaps.get("busRouteNm").toString());
	        dto.setR_start(jsonmaps.get("firstBusTm").toString());
	        dto.setR_last(jsonmaps.get("lastBusTm").toString());
	        dto.setR_interval(jsonmaps.get("term").toString());
	        dto.setR_id(jsonmaps.get("busRouteId").toString());
	        dto.setBd_num(jsonmaps.get("routeType").toString());
	        System.out.println(dto);
		}		    
        
        
       /*3:간선, 4:지선, 5:순환, 6:광역*/
               
        int routecheck = 0;
        RouteDAO routedao = sqlsession.getMapper(RouteDAO.class);
        
        try{
        	 routecheck = routedao.routeDataCheck(dto);
        }catch(Exception e){
        	System.out.println(e.getMessage());
        }
        
        int result=0;
        if(routecheck == 0){
        	result = routedao.routeInsertData(dto);
        }
        
        if(result == 1){
        	System.out.println("route 입력성공");        	
        	busStopSearch(dto, stopdto, routestopdto, request, response);
        	out.print("저장 성공!");
        }else{
        	System.out.println("route 입력 실패");
        	out.print("중복 노선번호 또는 지원하지 않는 노선번호입니다. 서울시 버스를 참고해주세요");
        }
	}
	
	//버스 정류장 좌표를 찍어주기 위해  route id검색
	public void busStopRoadSearch(String r_num,RouteDTO dto, BusStopDTO busstopdto, HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println(r_num);
		PrintWriter out=null;
		response.setCharacterEncoding("UTF-8");		
		out = response.getWriter();		
		JSONArray jsonmaps = null;		
		RouteDAO dao = sqlsession.getMapper(RouteDAO.class);		
		BusStopDAO busstopdao = sqlsession.getMapper(BusStopDAO.class);

		if(r_num.equals("all")){
			List<BusStopDTO> busstoplist = new ArrayList<>();
			//busStopRoadAllSearch("5623", dto, busstopdto, request, response);
			busstoplist.addAll(0, busStopRoadAllSearch("5623", dto, busstopdto, request, response));
			//busStopRoadAllSearch("6702", dto, busstopdto, request, response);
			busstoplist.addAll(1, busStopRoadAllSearch("6702", dto, busstopdto, request, response));
			//busStopRoadAllSearch("3500포천", dto, busstopdto, request, response);
			busstoplist.addAll(2, busStopRoadAllSearch("3030안양", dto, busstopdto, request, response));
			//busStopRoadAllSearch("6501광주", dto, busstopdto, request, response);
			busstoplist.addAll(3, busStopRoadAllSearch("143", dto, busstopdto, request, response));
			jsonmaps = JSONArray.fromObject(busstoplist);
			out.print(jsonmaps);
			
		}else if(!r_num.equals("all")){
			dto = dao.routeidSearch(r_num);
			System.out.println(dto.getR_id());
						
			List<BusStopDTO> busstoplist =  busstopdao.makeBusStop(dto.getR_id());
			
			jsonmaps = JSONArray.fromObject(busstoplist);
			out.print(jsonmaps);
		}
	}
	
	//버스 정류장 전체 조회
	public List<BusStopDTO> busStopRoadAllSearch(String r_num,RouteDTO dto, BusStopDTO busstopdto, HttpServletRequest request, HttpServletResponse response) throws IOException{						
		System.out.println(r_num);
		
		RouteDAO dao = sqlsession.getMapper(RouteDAO.class);		
		
		System.out.println(dao.routeidSearch(r_num));				
					
		dto = dao.routeidSearch(r_num);
		System.out.println(dto.getR_id());
		
		BusStopDAO busstopdao = sqlsession.getMapper(BusStopDAO.class);
		
		List<BusStopDTO> busstoplist =  busstopdao.makeBusStop(dto.getR_id());					
		
		return busstoplist;
	}
	
	//공공데이터에서 받아온 정류장 정보들을 디비에 저장하는 함수
	public void busStopSearch(RouteDTO dto, StopDTO stopdto, RouteStopDTO routestopdto, HttpServletRequest request ,HttpServletResponse response) throws IOException{
		System.out.println("r_id");
		System.out.println(dto.getR_id());		
		request.setCharacterEncoding("UTF-8");	
		JSONObject jsonmaps = null;
	    
		StringBuilder urlBuilder = new StringBuilder("http://ws.bus.go.kr/api/rest/busRouteInfo/getStaionByRoute"); //URL
	    urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=058in59%2BNLwfE3cT76LhIzkAAy2rb6zIQALV3UFT4T8qcZ4oIcYFtMfw75Hvs7H2nbjhZ8hT66mmVaWbzdbltg%3D%3D"); //Service Key
	    urlBuilder.append("&" + URLEncoder.encode("busRouteId","UTF-8") + "=" + URLEncoder.encode(dto.getR_id(), "UTF-8")); //노선ID
	    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("999", "UTF-8")); //검색건수
	    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //페이지 번호
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
	    
	    JSONArray jsonarray = JSONArray.fromObject(jsonmaps.get("msgBody"));
	    
	    int stopcheck = 0;
	    int stopinsertcheck = 0;
	    
	    int routestopinsertcheck =0;
	    int routestopcheck = 0;
	    
	    int jsons =  jsonarray.size();
	        
	    int j=0;
	    
	    long start = System.currentTimeMillis(); // 시작시간 
		System.out.println("저장 시작시간:"+start);
		
	    while(j<jsons){
	    	
	    	//stop 테이블에 insert 할것
	    	//System.out.println(jsonarray.getJSONObject(i).get("stationNm")); //정류장 이름
	    	//System.out.println(jsonarray.getJSONObject(i).get("stationNo")); //정류장 고유번호
	    	//System.out.println(jsonarray.getJSONObject(i).get("gpsX")); //x좌표
	    	//System.out.println(jsonarray.getJSONObject(i).get("gpsY")); //y좌표
	    	
	    	stopdto.setS_name(jsonarray.getJSONObject(j).get("stationNm").toString());
	    	stopdto.setS_num(jsonarray.getJSONObject(j).get("stationNo").toString());
	    	stopdto.setS_x(jsonarray.getJSONObject(j).get("gpsX").toString());
	    	stopdto.setS_y(jsonarray.getJSONObject(j).get("gpsY").toString());
	    	
	    	//중복체크작업
	    	StopDAO stopdao = sqlsession.getMapper(StopDAO.class);
	    	stopcheck = stopdao.selectS_NUM(stopdto);
	    	
	    	if(stopcheck == 0){
	    		stopinsertcheck = stopdao.insertStopData(stopdto);	    		
	    	}
	    	j++;
	    }
	    int k=0;
	    while(k<jsons){
	    	//routestop테이블에 insert할것
	    	//System.out.println(jsonarray.getJSONObject(i).get("busRouteNm")); //노선번호(5623)
	    	//System.out.println(jsonarray.getJSONObject(i).get("busRouteId")); //노선id
	    	//System.out.println(jsonarray.getJSONObject(i).get("stationNo")); //정류장 고유번호
	    	//System.out.println(jsonarray.getJSONObject(i).get("seq")); //정차순서
	    	//System.out.println(jsonarray.getJSONObject(i).get("beginTm")); //첫차
	    	//System.out.println(jsonarray.getJSONObject(i).get("lastTm")); //막차
	    	
	    	routestopdto.setR_num(jsonarray.getJSONObject(k).get("busRouteNm").toString());
	    	routestopdto.setR_id(jsonarray.getJSONObject(k).get("busRouteId").toString());
	    	routestopdto.setS_num(jsonarray.getJSONObject(k).get("stationNo").toString());
	    	routestopdto.setRs_order(jsonarray.getJSONObject(k).get("seq").toString());
	    	routestopdto.setRs_start(jsonarray.getJSONObject(k).get("beginTm").toString());
	    	routestopdto.setRs_end(jsonarray.getJSONObject(k).get("lastTm").toString());  
	    	
	    	System.out.println("r_num"+routestopdto.getR_num());
	    	System.out.println(routestopdto.getR_id());
	    	System.out.println(routestopdto.getS_num());
	    	System.out.println(routestopdto.getRs_order());
	    	System.out.println(routestopdto.getRs_start());
	    	System.out.println(routestopdto.getRs_end());
	    	
	    	//중복체크 작업
	    	RouteStopDAO routestopdao = sqlsession.getMapper(RouteStopDAO.class);
	    	//routestopcheck =  routestopdao.insertRouteStopCheck(routestopdto);
	    		
	    	
	    	System.out.println("되냐1");    		
	    	routestopinsertcheck = routestopdao.insertRouteStopData(routestopdto);
	    	
	    	k++;
	    }
	    
	    	long end = System.currentTimeMillis();  //종료시간
	    	System.out.println("종료시간:"+end);
	    	//종료-시작=실행시간		
	  		System.out.println("실행시간? "+(end-start)+" milliseconds");
	    
	    if(stopinsertcheck ==1){
    		System.out.println("Stop 입력성공");
    	}else{
    		System.out.println("Stop 입력실패");
    	}	
	    
	    if(routestopinsertcheck ==1){
    		System.out.println("RouteStop 입력성공");
    	}else{
    		System.out.println("RouteStop입력실패");
    	}
	   
	}
	
	public List<RouteDTO> routeList(){
		RouteDAO routedao = sqlsession.getMapper(RouteDAO.class);
		
		List<RouteDTO> list = routedao.getRouteNum();
		return list;
		
	}
	
	public String venidSearch(RouteDTO dto, String r_num) throws IOException{
		System.out.println("노선id???"+dto.getR_id());
		JSONObject jsonmaps = null;
		StringBuilder urlBuilder = new StringBuilder("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=058in59%2BNLwfE3cT76LhIzkAAy2rb6zIQALV3UFT4T8qcZ4oIcYFtMfw75Hvs7H2nbjhZ8hT66mmVaWbzdbltg%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("busRouteId","UTF-8") + "=" + URLEncoder.encode(dto.getR_id(), "UTF-8")); /*노선ID*/
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
        System.out.println("너왜안되냐"+jsonmaps);
        
        JSONArray jsonlist = jsonmaps.getJSONArray("msgBody");
        System.out.println("너된다??"+jsonlist);
        
        System.out.println("차량 id 뽑았다"+jsonlist.getJSONObject(0).get("vehId"));
        
        String venid = (String) jsonlist.getJSONObject(0).get("vehId");
        String busno = (String) jsonlist.getJSONObject(0).get("plainNo");
        System.out.println("차량id string 에 담았고"+venid);
        
        BusDTO busdto = new BusDTO();
        busdto.setB_vehiclenum(busno);
        busdto.setR_num(r_num);
        
        BusDataDAO busdao = sqlsession.getMapper(BusDataDAO.class);
        int check = busdao.busnoCheck(busdto);
        int insertcheck = 0;
        if(check == 0){
        	System.out.println("차량번호 중복없음");
        	insertcheck = busdao.insertBusno(busdto);
        }else{
        	System.out.println("차량번호 중복데이터임");
        }
        
        if(insertcheck ==1){
        	System.out.println("입력완료");
        }else{
        	System.out.println("입력실패");
        }
        
        
		return venid;
	}
	
}
