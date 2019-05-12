package cn.edu.mju.band2.controller;

import cn.edu.mju.band2.po.Admin;
import cn.edu.mju.band2.po.Order;
import cn.edu.mju.band2.po.Room;
import cn.edu.mju.band2.po.User;
import cn.edu.mju.band2.service.OrderService;
import cn.edu.mju.band2.service.RoomService;
import cn.edu.mju.band2.utils.Page1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private RoomService roomService;
    @Autowired
    OrderService orderService;
    ModelAndView mav;
    Page1 page;
    Order order;

    @RequestMapping("/userOrder")
    public ModelAndView userOrderList(HttpServletRequest request) {
        mav = new ModelAndView();
        User user = (User) request.getSession().getAttribute("USER");
        // 判断用户是否登陆
        if (user == null) {
            mav.addObject("msg", "请重新登录");
            mav.setViewName("user/login");
            return mav;
        }
        // 获取用户ID，查询对应订单
        order = new Order();
        Integer userId = user.getUserId();
        order.setUserId(userId);
        // 获取前台传递的页面信息
        String pageNo = request.getParameter("page");
        String pageSize = request.getParameter("pageSize");
        String starRow = request.getParameter("starRow");
        String orderStatus = request.getParameter("orderStatus");
        page = new Page1();
        if (pageNo == null || pageNo.equals("")) {
            pageNo = "1";
        }
        if (pageSize == null || pageSize.equals("")) {
            pageSize = "10";
        }
        if (orderStatus != null && "" != orderStatus){
            order.setOrderStatus(Integer.valueOf(orderStatus));
        }

        // 设置分页大小，提交查询
        order.setRows(Integer.valueOf(pageSize));
        // 此处先后顺序不能换，否则逻辑错误导致报错
        page.setPageSize(Integer.valueOf(pageSize));
        Integer totalRows = orderService.selectOrderListCount(order);
        page.setTotalRows(totalRows);
        page.setPage(Integer.valueOf(pageNo));
        // 设置开始的行数与页大小
        if (starRow != null) {
            Integer start = Integer.valueOf(starRow);
            if (start > totalRows || start < 0) {
                start = page.getStartRow();
            }
            order.setStart(start);
        } else {
            order.setStart(page.getStartRow());
        }
        System.out.println(order);
        List<Order> userOrderList = orderService.selectOrderListByCondition(order);
        System.out.println(page);
        mav.addObject("page", page);
        mav.addObject("userOrderList", userOrderList);
        mav.addObject("order",order);
        mav.setViewName("order/userorder");
        return mav;
    }
    @RequestMapping("/list")
    public ModelAndView userList(HttpServletRequest request) {
        mav = new ModelAndView();
        Admin admin = (Admin) request.getSession().getAttribute("ADMIN");
        // 判断管理员是否登陆
        if (admin == null) {
            mav.addObject("msg", "请重新登录");
            mav.setViewName("/admin/login");
            return mav;
        }
        String pageNo = request.getParameter("page");
        String pageSize = request.getParameter("pageSize");
        String starRow = request.getParameter("starRow");
        String orderId = request.getParameter("orderId");
        String userId = request.getParameter("userId");
        String roomId = request.getParameter("roomId");
        String adminId = request.getParameter("adminId");
        String roomType = request.getParameter("roomType");
        String orderStatus = request.getParameter("orderStatus");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        System.out.println("日期范围："+startDate+"到"+endDate);
        order = new Order();
        // 新建页面，设置页号以及页大小;
        page = new Page1();
        if (!"".equals(startDate) &&  startDate != null){
            order.setStartDate(startDate);
        }
        if (!"".equals(endDate) &&  endDate != null){
            String endDate1 = endDate.substring(0,9);
            String endDate2 = String.valueOf(Integer.valueOf(endDate.substring(9,10))+1);
            String newEndDate = endDate1 + endDate2;
            order.setEndDate(newEndDate);
        }
        if (pageNo == null || "".equals(pageNo)) {
            pageNo = "1";
        }
        if (pageSize == null || "".equals(pageSize)) {
            pageSize = "10";
        }
        if (orderId != null && !"".equals(orderId)) {
            order.setOrderId(Integer.valueOf(orderId));
        }
        if (userId != null && !"".equals(userId)) {
            order.setUserId(Integer.valueOf(userId));
        }
        if (adminId != null && !"".equals(adminId)) {
            order.setAdminId(Integer.valueOf(adminId));
        }
        if (roomType != null && !"".equals(roomType)) {
            order.setRoomType(Integer.valueOf(roomType));
        }
        if (roomId != null && !"".equals(roomId)) {
            order.setRoomId(Integer.valueOf(roomId));
        }
        if (orderStatus != null && "" != orderStatus){
            order.setOrderStatus(Integer.valueOf(orderStatus));
        }
        // 位置不能换否则逻辑错误导致报错
        Integer totalRows = orderService.selectOrderListCount(order);
        page.setPageSize(Integer.valueOf(pageSize));
        page.setTotalRows(totalRows);
        page.setPage(Integer.valueOf(pageNo));
        // 设置开始的行数与页大小
        if (starRow != null) {
            Integer start = Integer.valueOf(starRow);
            if (start >= totalRows || start < 0) {
                start = 0;
            }
            order.setStart(start);
        } else {
            order.setStart(page.getStartRow());
        }
        order.setRows(page.getPageSize());
        List<Order> orderList = orderService.selectOrderListByCondition(order);
        page.setTotalRows(orderService.selectOrderListCount(order));
        mav.addObject("page", page);
        mav.addObject("orderList", orderList);
        order.setEndDate(endDate);
        mav.addObject("order", order);
        mav.setViewName("/order/list");
        return mav;
    }


    @RequestMapping("/delete")
    @ResponseBody
    public String orderDelete(HttpServletRequest request) {
        if (request.getParameterValues("deleteId") != null) {
            String[] deleteIdList = request.getParameterValues("deleteId");
            Integer[] idList = new Integer[deleteIdList.length];
            for (int i = 0; i < deleteIdList.length; i++) {
                Integer id = Integer.valueOf(deleteIdList[i]);
                idList[i] = id;
            }
            orderService.deleteOrder(idList);
            return "1";
        } else {
            String id = request.getParameter("id");
            Integer[] ids = new Integer[1];
            ids[0] = Integer.valueOf(id);
            orderService.deleteOrder(ids);
            return "1";
        }
    }
    @RequestMapping("/start")
    @ResponseBody
    public void orderStart(HttpServletRequest request) {
        String id = request.getParameter("id");
        System.out.println(id);
        order = new Order();
        order.setOrderId(Integer.valueOf(id));
        order.setOrderStatus(1);
        Admin admin = (Admin)request.getSession().getAttribute("ADMIN");
        order.setAdminId(admin.getAdmin_id());
        orderService.updateOrder(order);
    }

    @RequestMapping("/addOrder")
    @ResponseBody
    public String addOrder(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("USER");
        // 判断用户是否登陆
        if (user == null) {
            request.setAttribute("msg", "请重新登录");
            return "forward:user/login";
        }
        // 获取用户ID，查询对应订单
        order = new Order();
        order.setUserId(user.getUserId());
        String roomId = request.getParameter("roomId");
        String roomType = request.getParameter("roomType");
        System.out.println(roomId);
        System.out.println(roomType);
        if (roomId == null || "".equals(roomId) || roomType == null || "".equals(roomType)){
            return "0";
        }
        if ("单人经济房".equals(roomType)){
            roomType = "1";
        }else if ("双人标准房".equals(roomType)){
            roomType = "2";
        }else if ("商务豪华房".equals(roomType)){
            roomType = "3";
        }else{
            return "0";
        }
        order.setRoomId(Integer.valueOf(roomId));
        order.setRoomType(Integer.valueOf(roomType));
        Date date = new Date();
        Timestamp timestamp = new Timestamp(date.getTime());
        String s = timestamp.toString();
        StringBuffer sb = new StringBuffer();
        sb =  sb.append(s.substring(11,13)).append(s.substring(14,16))
                .append(s.substring(17,19)).append(s.substring(20,23));
        order.setOrderId(Integer.valueOf(sb.toString()));
        order.setOrderDate(timestamp);
        order.setOrderStatus(0);
        /*房间空闲状态修改*/
        Room room = new Room();
        room.setId(Integer.valueOf(roomId));
        room.setRoom_status("43");
        this.roomService.updateRoomStatus(room);
        if (!orderService.addOrder(order)){
            return "0";
        }
        return "1";
    }
}
