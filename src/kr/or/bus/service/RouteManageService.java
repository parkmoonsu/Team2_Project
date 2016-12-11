/*
*	@FileName : RouteManageService.java
*	@Project	: KosBus
*	@Date	: 2016. 11.26
*	@Author	: 김지현
*	@Discription : 버스노선 관리 페이지 Service
*/

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

import kr.or.bus.dao.RouteDAO;
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
   	
   	public List<StopDTO> routeRead(HttpServletRequest request, HttpServletResponse response){
   		
   		RouteDAO dao = sqlsession.getMapper(RouteDAO.class);

   		List<StopDTO> list=dao.routeRead();

		return list;
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
	public String getRandomRnum(){//4자리 랜덤 값 뽑기
		int r_num;
		r_num = (int)(Math.random()*10000+1000);
		if(r_num>10000){
			r_num -= 10000;
		}
		if(r_num<1000){
			r_num += 1000;
		}
		return String.valueOf(r_num);
	}
	public void addStopInfo(String r_num,String s_num, String s_name, String rs_order, String s_x, String s_y,Model model){
		RouteStopDAO dao = sqlsession.getMapper(RouteStopDAO.class);
		String alert;
		StopDTO sdto = new StopDTO();
		System.out.println(r_num + "/" + s_num + "/" + s_name + "/" + rs_order + "/" + s_x +"/"+ s_y);
		sdto.setS_num(s_num);
		sdto.setS_name(s_name);
		sdto.setS_x(s_x);
		sdto.setS_y(s_y);
		System.out.println(sdto.toString());
		int result = dao.addStopInfo(sdto);
		System.out.println("result"+result);
		if (result > 0) {
			System.out.println("이거 뭐에요");
			System.out.println(r_num);
			System.out.println(rs_order);
			RouteStopDTO rsdto = dao.getRouteStopInfo(r_num, rs_order); //해당 값이 안나올 가능성이 크지?
			System.out.println(rsdto.getR_num());
			if(rsdto.getR_num()==null){
				System.out.println("이거 떠야해!!");
			}
			System.out.println("여기가 에러인 것이다");	
			System.out.println(rsdto.toString());
			System.out.println("여기는 안나올 것이다");
			rsdto.setS_num(s_num);
			//5401 39 55555
			//5401 39 55554

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
	//정류장 번호 유효성 체크
	public int checkStopNum(String s_num){
		RouteStopDAO dao = sqlsession.getMapper(RouteStopDAO.class);
		int result = dao.checkStopNum(s_num);
		return result;
	}
	//노선 번호 유효성 체크
	public int checkRouteNum(String r_num){
		RouteStopDAO dao = sqlsession.getMapper(RouteStopDAO.class);
		int result = dao.checkRouteNum(r_num);
		return result;
	}
	//저장된 노선별 경로 불러오기
	public List<RouteStopJoinStopDTO> getRouteStopInfoList(String r_num){
		RouteStopDAO dao = sqlsession.getMapper(RouteStopDAO.class);
		List<RouteStopJoinStopDTO> rssdto = dao.getRouteStopInfoList(r_num);
		return rssdto;
	}
	
	public void routeUpdate(int rs_order, String s_num, String r_num){
		RouteStopDAO dao = sqlsession.getMapper(RouteStopDAO.class);

		dao.routeUpdate(rs_order, r_num);

		dao.routeUpdate2(rs_order, s_num);

	}

	//정류장 마커 삭제하기
	public void deleteStopRoute(String r_num, String s_num, String rs_order,Model model){
		RouteStopDAO dao = sqlsession.getMapper(RouteStopDAO.class);
		int result = 0;
		String alert = "";
		try{
			result = dao.deleteStopRoute(r_num, s_num); //routestop3에서 해당 정류장 정보 삭제하기
			System.out.println(result);
			if(result>0){
				result = dao.updateDeletedRouteStopInfo(r_num, rs_order);
				if(result>0){
					result = dao.getDuplicateStopNum(s_num);
					if(result>0){
						
					}else{
						result = dao.deleteStopInfo(s_num);
						if(result>0){
							alert = "정류장 삭제 처리 되었습니다.5";
						}else{
							alert = "정류장 삭제 처리에 오류가 생겼습니다.4";
						}
					}
					alert = "정류장 삭제 처리 되었습니다.3";
				}else{
					alert = "정류장 삭제 처리에 오류가 생겼습니다.2";
				}
			}else{
				alert = "정류장 삭제 처리에 오류가 생겼습니다.1";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		model.addAttribute("alert", alert);
	}
	//정류장 좌표 수정하기
	public void modifyStopPosition(String r_num,String s_num,String s_name, String s_x, String s_y, Model model){
		System.out.println("add r_num");
		System.out.println(r_num + s_num + s_name + s_x + s_y);
		
		//정류장 좌표가 바뀌면 새로운 정류장으로 인식해야함
		RouteStopDAO dao = sqlsession.getMapper(RouteStopDAO.class);
		int result = 0;
		String alert = "";
		String s_num1 = "";
		do{
			s_num1 = getRandomSnum();
			result = checkStopNum(s_num1);	
			System.out.println("몇 번 도는 거니?");
		}while(result>0);
		//바뀐 s_num, s_name을 stop table에 삽입
		StopDTO sdto = new StopDTO();
		sdto.setS_num(s_num1);
		sdto.setS_name(s_name);
		sdto.setS_x(s_x);
		sdto.setS_y(s_y);
		try{
			result = dao.addStopInfo(sdto);
			if(result>0){
				result = dao.updateRouteStopNewStop(s_num1, s_num, r_num);
				if(result>0){
					alert = "새로운 정류장을 생성하셨습니다.";
				}else{
					alert = "정류장 생성에 실패하셨습니다.";
				}
			}else{//stop table 삽입 실패
				alert = "정류장 생성에 실패하셨습니다.";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		model.addAttribute("alert", alert);
	}
	
	public List<RouteStopDTO> getRsOrderFromRs(String r_num){
		RouteStopDAO dao = sqlsession.getMapper(RouteStopDAO.class);
		List<RouteStopDTO> rslist = dao.getRsOrderfRsStop(r_num);
		return rslist;
	}
	
	//route테이블에 insert
	public void routeInsert(String r_num, String bd_num, String g_num){
		RouteStopDAO dao = sqlsession.getMapper(RouteStopDAO.class);
		dao.routeInsert(r_num, bd_num, g_num);
	}
	
	//routestop테이블에 insert
	public void routeStopInsert(String r_num, String s_num, String rsorder){
		RouteStopDAO dao = sqlsession.getMapper(RouteStopDAO.class);
		int rs_num=Integer.parseInt(rsorder);
		dao.routeStopInsert(r_num, s_num, rs_num);
	}
	
}