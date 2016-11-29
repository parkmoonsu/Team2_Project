package kr.or.bus.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;

@Service
public class RouteManageService {
	
	//노선좌표를 파일에 저장하는 함수
	public void routelocationSave(HttpServletRequest request , HttpServletResponse response){
		FileWriter fw = null;
        BufferedWriter bw = null;
        String map = request.getParameter("kml");
        System.out.println(map);
        
        System.out.println("되냐");
        
        String path = request.getServletContext().getRealPath("/route/route.json");
            
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
	}
	
	//버스 정류장 원본 좌표를 파일로부터 읽어온다.
		public void busStopPointRead(HttpServletRequest request, HttpServletResponse response) throws Exception {
			PrintWriter out=null;
			
	        String busno = request.getParameter("busNo");
	        System.out.println(busno);
	        if(busno.equals("all")){
	        	JSONObject obs1 = busStopOrgRead(5623 ,request,response);
	        	JSONObject obs2 = busStopOrgRead(6501 ,request,response);
	        	JSONObject obs3 = busStopOrgRead(702 ,request,response);
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
		}
		
		//읽은 데이터가 1개일경우
		public void busStopOrgRead(String busno , HttpServletRequest request, HttpServletResponse response){
			System.out.println("너타냐");
			FileReader fr = null;
	        BufferedReader br = null;
	        PrintWriter out=null;
	        String maps = null;
	        
	        String path = request.getServletContext().getRealPath("/route/"+busno+".xml");
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
		}
		
		//읽을 데이터가 4개일경우
		public JSONObject busStopOrgRead(int busno, HttpServletRequest request ,HttpServletResponse response){
			FileReader fr = null;
	        BufferedReader br = null;
	       
	        String maps = null;
	        JSONObject jsonmaps = null;
	        String path = request.getServletContext().getRealPath("/route/"+busno+".xml");
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
	
	//수정한 경로 좌표를 파일에 저장하는 함수
	public void routelocationEdit(HttpServletRequest request, HttpServletResponse response){
		
		FileWriter fw = null;
        BufferedWriter bw = null;
        String map = request.getParameter("kml");
        String busno = request.getParameter("busNo");
        System.out.println(map);
        
        System.out.println("되냐");
        
        String path = request.getServletContext().getRealPath("/route/"+busno+"StopSave.json");
            
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
	}
	
	//수정한 경로 좌표를 파일에서 읽어온다.
	public void routelocationEditRead(HttpServletRequest request, HttpServletResponse response){
		
		FileReader fr = null;
        BufferedReader br = null;
        PrintWriter out=null;
        String maps = null;
        String busno = request.getParameter("busNo");
        
        String path = request.getServletContext().getRealPath("/route/"+busno+"StopSave.json");
        try{
        	fr = new FileReader(path);
        	br = new BufferedReader(fr);	        	
        	String line = "";
        	
        	for(int i=0; (line = br.readLine())!=null;i++){
                maps+=line.replaceAll("\\p{Space}","");           
            }
        	
            System.out.println("지도 좌표를 파일로 부터  읽어왔습니다.");
        	System.out.println("얘는스트링"+maps);
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
	}
	
	//실시간 위치 추적
		public void busLocationSearch(HttpServletRequest request , HttpServletResponse response) throws IOException{	
			PrintWriter out=null;
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			/*
			 	route id
			 	
				100100279   - 116005219
				234001163   - 234000043
				100100573   - 122071130
				234000002   - 234000329 
				에 해당하는 차량 id가 아래에 입력되어야함.
			*/
			String busno = request.getParameter("busNo");
			if(busno.equals("all")){
				JSONObject locations1 = multiLocationSearch(request , response, "116005219");
				JSONObject locations2 = multiLocationSearch(request , response, "234000043");
				JSONObject locations3 = multiLocationSearch(request , response, "122071130");
				JSONObject locations4 = multiLocationSearch(request , response, "234000329");
				
				ArrayList<JSONObject> locations = new ArrayList<JSONObject>();
				locations.add(locations1);
				locations.add(locations2);
				locations.add(locations3);
				locations.add(locations4);
				
				out.print(locations);
				
			}else if(!busno.equals("all")){
				System.out.println("버스번호? "+busno);
				System.out.println("버스하나만 조회");
				LocationSearch(request , response, busno);
			}
		}
		
		public JSONObject multiLocationSearch(HttpServletRequest request , HttpServletResponse response, String venid) throws IOException{
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
			System.out.println("실시간 위치추적");
			System.out.println(sb.toString());
			jsonmaps = (JSONObject)new XMLSerializer().read(sb.toString());	
			return jsonmaps;
		}
		
		public void LocationSearch(HttpServletRequest request , HttpServletResponse response, String busno) throws IOException{
			System.out.println("너하나만 타냐");
			
			
			
			String venid = null;
			
			if(busno.equals("5623")){
				venid = "116005219";
			}else if(busno.equals("6501")){
				venid = "234000043";
			}else if(busno.equals("702")){
				venid = "122071130";
			}else if(busno.equals("9000")){
				venid = "234000329";
			}

			PrintWriter out=null;
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
			out.print(jsonmaps);
			
		}
}
