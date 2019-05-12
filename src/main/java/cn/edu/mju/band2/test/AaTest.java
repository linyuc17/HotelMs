package cn.edu.mju.band2.test;
import cn.edu.mju.band2.dao.RoomDao;
import cn.edu.mju.band2.po.Room;
import cn.edu.mju.band2.service.RoomService;
import cn.edu.mju.band2.utils.Page;
import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class AaTest {
    public static void aaacl(String[] args){}
    @Test
    public void Test(){
        /*ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        RoomDao roomDao = applicationContext.getBean(RoomDao.class);
        Room room1 = new Room();
        List<Room> room = roomDao.selectRoomList(room1);
        for(Room room2 : room){
            System.out.println(room2);
        }*/
        /*RoomService roomService = applicationContext.getBean(RoomService.class);
        Page<Room> rooms = roomService.findRoomList(1, 2, "", "40", "43");
        for(Room room : rooms.getRows()){
            System.out.println(room);
        }*/
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        System.out.println(df.format(day));
        String date = df.format(day);
        System.out.println(date);
    }
}
