package kr.or.bus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.RouteStopCopyJoinStopDTO;
import kr.or.bus.dto.RouteStopJoinStopDTO;
import kr.or.bus.service.RouteManageService;

@Controller
public class RouteManageController {
	@Autowired
	RouteManageService routeManageSerivce;
	
	@Autowired
	private View jsonview;
	@RequestMapping(value="/route.admin",method=RequestMethod.GET)
	public String routePageOpen(){
		return "routemanage/RouteManage";	
	}
	//현재 불러오기 버튼이 두개지만.. 추후 하나로 통합할예정.
	
	//파일의 마커 좌표 저장
	@RequestMapping(value="/routeSave.admin",method=RequestMethod.GET)
	public void routeSave(HttpServletRequest request , HttpServletResponse response) throws Exception{
		routeManageSerivce.routelocationSave(request , response);
	}
		
	//수정된 마커 좌표 불러오기
	@RequestMapping(value="/routeEditRead.admin",method=RequestMethod.GET)
	public void routeEditRead(HttpServletRequest request , HttpServletResponse response) throws Exception{
		routeManageSerivce.routelocationEditRead(request , response);
	}
	//정류장 번호 자동 생성 함수
		@RequestMapping(value="/getrandomsnum.admin",method=RequestMethod.POST)
		public View getRandomSnum(Model model){
			int result;
			String s_num;
			do{
				s_num = routeManageSerivce.getRandomSnum();
				result = routeManageSerivce.checkStopNum(s_num);	
				System.out.println("몇 번 도는 거니?");
			}while(result>0);
			model.addAttribute("s_num", s_num);
			return jsonview;
		}
		//DB에서 정류장 정차 순서 바꿔주는 함수(정류장 추가)
		@RequestMapping(value="/editordernumber.admin",method=RequestMethod.POST)
		public View editordernum(String r_num,String s_num, String s_name, String rs_order, String s_x, String s_y,Model model){
			System.out.println("r_num"+r_num);
			System.out.println("rs_order"+rs_order);
			routeManageSerivce.addStopInfo(r_num, s_num, s_name, rs_order, s_x, s_y, model);
			List<RouteStopJoinStopDTO> rssdto = routeManageSerivce.getRouteStopInfoList(r_num);
			model.addAttribute("rssdto", rssdto);
			return jsonview;
		}

		
	    //추가
	    @RequestMapping(value="/routeRead.admin",method=RequestMethod.POST)
	    public View routeRead(HttpServletRequest request , HttpServletResponse response, Model model) throws Exception{

	        List<RouteStopCopyJoinStopDTO> list=routeManageSerivce.routeRead(request , response);

	        model.addAttribute("list", list);
	        return jsonview;
	    }
	    
	    @RequestMapping(value="/routeUpdate.admin",method=RequestMethod.POST)
	    public View routeUpdate(String rsorder, String snum, String rnum) throws Exception{
	    	int rs_order=Integer.parseInt(rsorder);
	    	String s_num=snum;
	    	String r_num=rnum;
	    	
	    	routeManageSerivce.routeUpdate(rs_order, s_num, r_num);
	    	System.out.println("여길 타긴 하냐?");
	    	return jsonview;
	    }


		@RequestMapping(value="/deleteroutestop.admin",method=RequestMethod.POST)
		public View deletestopandroutestop(String r_num, String s_num, String rs_order, Model model){
			System.out.println("r_num"+r_num);
			System.out.println("s_num"+s_num);
			System.out.println("rs_order"+rs_order);
			routeManageSerivce.deleteStopRoute(r_num, s_num, rs_order, model);
			List<RouteStopJoinStopDTO> rssdto = routeManageSerivce.getRouteStopInfoList(r_num);
			model.addAttribute("rssdto", rssdto);
			return jsonview;
		}

}
