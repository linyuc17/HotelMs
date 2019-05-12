package cn.edu.mju.band2.dao;

import cn.edu.mju.band2.po.Room;

import java.util.List;

public interface RoomDao {
    public List<Room> selectRoomList(Room room);
    public Integer selectRoomListCount(Room room);
    public void addRoom(Room room);
    public Room findRoomById(Integer id);
    public void updateRoom(Room room);
    public void updateRoomStatus(Room room);
    public void deleteRooms(Integer[] ids);
}
