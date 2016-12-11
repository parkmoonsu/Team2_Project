/*
*	@FileName : RouteManageController.java
*	@Project	: KosBus
*	@Date	: 2016. 11.20
*	@Author	: 김용현, 김지현
*	@Discription : 노선 관리 Controller
*/

package kr.or.bus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.BusLocationInfoDTO;
import kr.or.bus.dto.RouteDTO;
import kr.or.bus.dto.RoutePathDTO;
import kr.or.bus.dto.RouteStopJoinStopDTO;
import kr.or.bus.dto.StopDTO;
import kr.or.bus.service.BusStopManageService;
import kr.or.bus.service.RouteManageService;
import kr.or.bus.service.RoutePathService;

@Controller
public class RouteManageController {
	@Autowired
	RouteManageService routeManageSerivce;

	@Autowired
	BusStopManageService busStopManageService;
	
	@Autowired
	RoutePathService routepathservice;
	@Autowired
	private View jsonview;
	
	

		
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
			//List<RouteStopDTO> rslist = routeManageSerivce.getRsOrderFromRs(r_num);
			do{
				s_num = routeManageSerivce.getRandomSnum();
				result = routeManageSerivce.checkStopNum(s_num);	
				System.out.println("몇 번 도는 거니?");
			}while(result>0);
			model.addAttribute("s_num", s_num);
			//model.addAttribute("rslist",rslist);
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
		//마커 이동후 정류장 정보 변경
		@RequestMapping(value="/modifyroutestop.admin",method=RequestMethod.POST)
		public View modifyRouteStop(String r_num,String s_name,String s_num, String s_x, String s_y, Model model){
			System.out.println("s_x"+s_x);
			System.out.println("s_y"+s_y);
			System.out.println("s_num"+s_num);
			routeManageSerivce.modifyStopPosition(r_num, s_num, s_name, s_x, s_y, model);
			List<RouteStopJoinStopDTO> rssdto = routeManageSerivce.getRouteStopInfoList(r_num);
			model.addAttribute("rssdto", rssdto);
			return jsonview;
		}
		
		@RequestMapping(value="/cancelaftermodify.admin", method = RequestMethod.POST)
		public View getCancelAfterModify(String r_num, Model model){
			List<RouteStopJoinStopDTO> rssdto = routeManageSerivce.getRouteStopInfoList(r_num);
			model.addAttribute("rssdto", rssdto);
			return jsonview;
		}
		
		@RequestMapping(value="/getaftermodify.admin", method = RequestMethod.POST)
		public View getAfterModify(String r_num, Model model){
			List<RouteStopJoinStopDTO> rssdto = routeManageSerivce.getRouteStopInfoList(r_num);
			model.addAttribute("rssdto", rssdto);
			return jsonview;
		}
		
        //지현아 이것좀 그만 날려라
        @RequestMapping(value="/routeRead.admin",method=RequestMethod.POST)
        public View routeRead(HttpServletRequest request , HttpServletResponse response, Model model) throws Exception{

            List<StopDTO> list=routeManageSerivce.routeRead(request , response);

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
        
        @RequestMapping(value="/routeSave.admin",method=RequestMethod.GET)
    	public void routeSave(HttpServletRequest request , HttpServletResponse response) throws Exception{
    		routeManageSerivce.routelocationSave(request , response);
    	}
        
        
        //처음 데이터 가져오는 서비스(r_type)
    	@RequestMapping(value="/route.admin",method=RequestMethod.GET)
    	public String routePageOpen(Model map){
    		map.addAttribute("list", busStopManageService.routetype());
    		
    		return "routemanage/RouteManage";	
    	}
    	//(r_type)을 받아서 DB에 원본 insert 하는 서비스
    	@RequestMapping(value="/insertpath.admin",method=RequestMethod.GET)
    	public void insertpath(HttpServletRequest request , HttpServletResponse response) throws Exception{
    		System.out.println("컨트롤러 탄다잉");
    		String datalist =  request.getParameter("data");
    		System.out.println(datalist);
    		
    		routepathservice.busSingleRouteRead(request , response);
    		
    		System.out.println("여길 타긴 하냐?");
    	}
    	
    	 //있는 데이터 가져오는 서비스(r_type)
    	@RequestMapping(value="/RouteTypeEdit.admin",method=RequestMethod.GET)
    	public View routeEdit(Model map,String name){
    		System.out.println(name);
    		map.addAttribute("list", busStopManageService.routeEdit(name));
    		return jsonview;	
    	}
    	
    	

        //데이터 가져오기
        @RequestMapping(value="/selectpath.admin",method=RequestMethod.GET)
        public View Selectpath(String r_num,Model model) throws Exception{
        	List<RouteDTO> dto =routepathservice.Selectpath(r_num);
        	model.addAttribute("list", dto);
        	System.out.println("간다");
            return jsonview;
        }
        
        //수정된 노선경로 데이터 가져오기
        @RequestMapping(value="/editpath.admin",method=RequestMethod.GET)
        public View selectEditpath(String r_num, Model model){
        	List<RoutePathDTO> editlist = routepathservice.selectEditPath(r_num);
        	List<BusLocationInfoDTO> businfolist = routepathservice.simulation(r_num);
        	
        	model.addAttribute("editlist", editlist);
        	model.addAttribute("businfolist", businfolist);
			return jsonview;       	
        }
		
      //노선 번호 자동 생성 함수
  		@RequestMapping(value="/getrandomrnum.admin",method=RequestMethod.POST)
  		public View getRandomRnum(Model model){
  			int result;
  			String r_num;
  			do{
  				r_num = routeManageSerivce.getRandomRnum();
  				result = routeManageSerivce.checkRouteNum(r_num);	
  				System.out.println("몇 번 도는 거니?");
  			}while(result>0);
  			model.addAttribute("r_num", r_num);
  			//model.addAttribute("rslist",rslist);
  			return jsonview;
  		}
  		
  		//route 테이블에 노선 저장
  		@RequestMapping(value="/routeInsert.admin",method=RequestMethod.POST)
  		public View routeInsert(String r_num, String bd_num, String g_num, Model model){

      			routeManageSerivce.routeInsert(r_num, bd_num, g_num);
      			
				return jsonview;
      		}
      		
      		//routestop 테이블에 노선 저장
      		@RequestMapping(value="/routeStopInsert.admin",method=RequestMethod.POST)
      		public View routeStopInsert(String r_num, String s_num, String rs_order, Model model){

      			routeManageSerivce.routeStopInsert(r_num, s_num, rs_order);
      			
				return jsonview;
      		}

   	

}
