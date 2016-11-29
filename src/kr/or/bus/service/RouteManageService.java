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
   
public void routelocationRead(HttpServletRequest request, HttpServletResponse response){
      
      FileReader fr = null;
        BufferedReader br = null;
        PrintWriter out=null;
        String maps = null;  
        
        String path = request.getServletContext().getRealPath("/route/route.json");
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
   //수정한 경로 좌표를 파일에 저장하는 함수
   public void routelocationEdit(HttpServletRequest request, HttpServletResponse response){
      
      FileWriter fw = null;
        BufferedWriter bw = null;
        String map = request.getParameter("kml");
        System.out.println(map);
        
        System.out.println("되냐");
        
        String path = request.getServletContext().getRealPath("/route/routeEdit.json");
            
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
        
        String path = request.getServletContext().getRealPath("/route/routeEdit.json");
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
}