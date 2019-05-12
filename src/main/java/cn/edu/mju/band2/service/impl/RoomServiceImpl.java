package cn.edu.mju.band2.service.impl;

import cn.edu.mju.band2.dao.RoomDao;
import cn.edu.mju.band2.po.Room;
import cn.edu.mju.band2.service.RoomService;
import cn.edu.mju.band2.utils.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service("RoomService")
public class RoomServiceImpl implements RoomService {
    @Resource
    private RoomDao roomDao;
    private Room room;

    public Page<Room> findRoomList(Integer page, Integer rows, String roomNumber, String roomType, String roomStatus){
        Room room = new Room();
        if(StringUtils.isNotBlank(roomNumber)){
            room.setRoom_number(roomNumber);
        }
        if(StringUtils.isNotBlank(roomType)){
            room.setRoom_type(roomType);
        }
        if(StringUtils.isNotBlank(roomStatus)){
            room.setRoom_status(roomStatus);
        }
        //当前页
        room.setStart((page-1) * rows);
        room.setRows(rows);
        List<Room> rooms = roomDao.selectRoomList(room);
        Integer count = roomDao.selectRoomListCount(room);
        Page<Room> result = new Page<>();
        result.setPage(page);
        result.setRows(rooms);
        result.setSize(rows);
        result.setTotal(count);
        return  result;
    }
    public void addRoom(Room room){
        this.roomDao.addRoom(room);
    }
    public Room findRoomById(Integer id){
        Room room  = this.roomDao.findRoomById(id);
        return room;
    }
    public void updateRoom(Room room){
        this.roomDao.updateRoom(room);
    }
    public void deleteRooms(Integer[] ids){
        this.roomDao.deleteRooms(ids);
    }
    public void updateRoomStatus(Room room){
        this.roomDao.updateRoomStatus(room);
    }
}
