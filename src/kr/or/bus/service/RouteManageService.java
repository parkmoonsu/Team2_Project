package kr.or.bus.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.or.bus.dao.BusStopDAO;
import kr.or.bus.dao.RouteStopDAO;
import kr.or.bus.dto.RouteStopDTO;
import kr.or.bus.dto.RouteStopJoinStopDTO;
import kr.or.bus.dto.StopDTO;

@Service
public class RouteManageService {
	@Autowired
	private SqlSession sqlsession;
	//노선좌표를 파일에 저장하는 함수
	public void routelocationSave(HttpServletRequest request , HttpServletResponse response){
      FileWriter fw = null;
        BufferedWriter bw = null;
        String map = request.getParameter("kml");
        String busno = request.getParameter("busNo");
        System.out.println(map);
        System.out.println("ok");
        String path = request.getServletContext().getRealPath("/route/"+busno+".json");
            
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
        
        String path = request.getServletContext().getRealPath("/route/"+busno+".json");
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
   	
   	public String getRandomSnum(){//5자리 랜덤 값 뽑기
		int s_num;
		s_num = (int)(Math.random()*100000+10000);
		if(s_num>100000){
			s_num -= 100000;
		}
		if(s_num<10000){
			s_num += 10000;
		}
		return String.valueOf(s_num);
	}
	public void addStopInfo(String r_num,String s_num, String s_name, String rs_order, String s_x, String s_y,Model model){
		RouteStopDAO dao = sqlsession.getMapper(RouteStopDAO.class);
		String alert;
		StopDTO sdto = new StopDTO();
		sdto.setS_num(s_num);
		sdto.setS_name(s_name);
		sdto.setS_x(s_x);
		sdto.setS_y(s_y);
		System.out.println(sdto.toString());
		int result = dao.addStopInfo(sdto);
		if (result > 0) {
			RouteStopDTO rsdto = dao.getRouteStopInfo(r_num, rs_order);
			rsdto.setS_num(s_num);
			int result1 = dao.addRouteStopInfo(rsdto);
			if (result1 > 0) {
				int result2 = dao.updateRouteStopInfo(r_num, rs_order, s_num);
				if (result2 > 0) {
					alert = "정류장 생성에 성공했습니다.";
				} else {
					alert = "정류장 생성에 실패 했습니다.";
				}
			} else {
				alert = "정류장 생성에 실패 했습니다.";
			}
		} else {
			alert = "정류장 생성에 실패 했습니다.";
		}
		model.addAttribute("alert", alert);
	}
	public int checkStopNum(String s_num){
		RouteStopDAO dao = sqlsession.getMapper(RouteStopDAO.class);
		int result = dao.checkStopNum(s_num);
		return result;
	}
	
	public List<RouteStopJoinStopDTO> getRouteStopInfoList(String r_num){
		RouteStopDAO dao = sqlsession.getMapper(RouteStopDAO.class);
		List<RouteStopJoinStopDTO> rssdto = dao.getRouteStopInfoList(r_num);
		return rssdto;
	}
}