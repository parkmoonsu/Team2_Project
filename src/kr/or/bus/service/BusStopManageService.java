package kr.or.bus.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import net.sf.json.JSONArray;

@Service
public class BusStopManageService {
	
	//버스정류장 원본 좌표를 파일로부터 읽어온다.
	public void busStopOriginalRead(HttpServletRequest request ,HttpServletResponse response) throws Exception {

		FileReader fr = null;
        BufferedReader br = null;
        PrintWriter out=null;
        String maps = null;      
        String path = request.getServletContext().getRealPath("/busstop/BusStop.json");
        try{
        	fr = new FileReader(path);
        	br = new BufferedReader(fr);
        	String line = "";
        	
        	for(int i=0; (line = br.readLine())!=null;i++){
                maps+=line.replaceAll("\\p{Space}","");           
            }
        	
            System.out.println("버스정류장 좌표를 파일로 부터  읽어왔습니다.");
            System.out.println("maps 에 담기냐? "+ maps);          
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
	
	//수정된 버스정류장 좌표를 저장한다.
	public void busStoplocationEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		FileWriter fw = null;
	    BufferedWriter bw = null;
	    String map = request.getParameter("kml");
	    System.out.println(map);
	        
	    System.out.println("되냐");
	    String path = request.getServletContext().getRealPath("/busstop/BusStopEdit.json");        
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
	
	//수정된 버스정류장 좌표를 파일로 부터 읽어오는 함수.
	public void busStoplocationEditRead(HttpServletRequest request ,HttpServletResponse response) throws Exception {

		FileReader fr = null;
        BufferedReader br = null;
        PrintWriter out=null;
        String maps = null;
       
        String path = request.getServletContext().getRealPath("/busstop/BusStopEdit.json");
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
	}

}
