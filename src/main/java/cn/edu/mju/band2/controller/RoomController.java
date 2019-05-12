package cn.edu.mju.band2.controller;

import cn.edu.mju.band2.dao.BaseDictMapper;
import cn.edu.mju.band2.po.BaseDict;
import cn.edu.mju.band2.po.Room;
import cn.edu.mju.band2.service.RoomService;
import cn.edu.mju.band2.utils.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
public class RoomController {
    @Resource
    private RoomService roomService;
    @Resource
    private BaseDictMapper baseDictMapper;

    //@Value("${room.jobs.type}")
    private String TYPE_TYPE = "010";
    //@Value("${room.phone.type}")
    private String STATUS_TYPE = "011";
    /*@RequestMapping("/room/list")
    public String toRoomList(){
        return "room/list";
    }*/

    @RequestMapping("/roomList")
    public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5")Integer rows,
                       String roomNumber, String roomType, String roomStatus, Model model){
        model.addAttribute("rows",rows);
        Page<Room> rooms = roomService.findRoomList(page, rows, roomNumber, roomType, roomStatus);
        model.addAttribute("page", rooms);
        /*for(Room room : rooms.getRows()){
            System.out.println(room);
        }*/
        List<BaseDict> typeType = baseDictMapper.selectBaseDictByTypeCode(TYPE_TYPE);
        List<BaseDict> statusType = baseDictMapper.selectBaseDictByTypeCode(STATUS_TYPE);
        model.addAttribute("count",rooms.getTotal());
        model.addAttribute("typeType", typeType);
        model.addAttribute("statusType", statusType);
        model.addAttribute("roomNumber", roomNumber);
        model.addAttribute("roomType", roomType);
        model.addAttribute("roomStatus", roomStatus);
        return "room/list";
    }
    @RequestMapping("/addRoom")
    public String addRoom(Model model){
        String url = "saveRoom";
        model.addAttribute("url", url);
        return "room/au";
    }
    @RequestMapping("saveRoom")
    public String handleFormUpload(Room room, HttpServletRequest request){
        String sqlPath = null;
        if(!room.getFile().isEmpty()){
            String dirPath = request.getServletContext().getRealPath("/upload/room/");
            //String Contextpath = request.getServletContext().getContextPath();
            File filePath = new File(dirPath);
            if(!filePath.exists()){
                filePath.mkdirs();
            }
            String NewFilename = room.getRoom_number() + "_"+ UUID.randomUUID() + ".jpg";
            try{
                room.getFile().transferTo(new File(dirPath + NewFilename));
                sqlPath = "\\upload\\room\\" + NewFilename;
                room.setRoom_photo(sqlPath);
                roomService.addRoom(room);
            }catch(Exception e){
                e.printStackTrace();
                return "admin/error";
            }
            return "redirect:roomList";
        }else{
            return "admin/error";
        }
    }
    @RequestMapping("/editRoom")
    public String editRoom(Integer id, Model model){
        Room room = this.roomService.findRoomById(id);
        model.addAttribute("room", room);
        String url = "updateRoom";
        model.addAttribute("url", url);
        return "room/au";
    }
    @RequestMapping("/updateRoom")
    public String updateRoom(@Validated Room room, HttpServletRequest request){
        String sqlPath = null;
        if(!room.getFile().isEmpty()){
            String dirPath = request.getServletContext().getRealPath("/upload/room/");
            //String Contextpath = request.getServletContext().getContextPath();
            File filePath = new File(dirPath);
            if(!filePath.exists()){
                filePath.mkdirs();
            }
            String NewFilename = room.getRoom_number() + "_"+ UUID.randomUUID() + ".jpg";
            try{
                room.getFile().transferTo(new File(dirPath + NewFilename));
                sqlPath = "\\upload\\room\\" + NewFilename;
                room.setRoom_photo(sqlPath);
                roomService.updateRoom(room);
            }catch(Exception e){
                e.printStackTrace();
                return "admin/error";
            }
            return "redirect:roomList";
        }else{
            return "admin/error";
        }
    }
    @RequestMapping("deleteRooms")
    public String deleteRooms(Integer[] ids){
        this.roomService.deleteRooms(ids);
        return "room/list";
    }
    @RequestMapping("toUserIndex")
    public String toUserIndex(){
        return "user/index";
    }
    @RequestMapping("toAdminIndex")
    public String toAdminIndex(){
        return "admin/index";
    }
    @RequestMapping("toAdminWelcome")
    public String toAdminWelcome(){
        return "admin/welcome";
    }
    @RequestMapping("toUserWelcome")
    public String toUserWelcome(){
        return "user/welcome";
    }

    @RequestMapping("bookRoomList")
    public String bookRoomList(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5")Integer rows,
                       String roomNumber, String roomType, Model model){
        String roomStatus = "44";//空闲
        model.addAttribute("rows",rows);
        Page<Room> rooms = roomService.findRoomList(page, rows, roomNumber, roomType, roomStatus);
        model.addAttribute("page", rooms);
        List<BaseDict> typeType = baseDictMapper.selectBaseDictByTypeCode(TYPE_TYPE);
        List<BaseDict> statusType = baseDictMapper.selectBaseDictByTypeCode(STATUS_TYPE);
        model.addAttribute("count",rooms.getTotal());
        model.addAttribute("typeType", typeType);
        model.addAttribute("statusType", statusType);
        model.addAttribute("roomNumber", roomNumber);
        model.addAttribute("roomType", roomType);
        model.addAttribute("roomStatus", roomStatus);
        return "room/bookroom";
    }
}
