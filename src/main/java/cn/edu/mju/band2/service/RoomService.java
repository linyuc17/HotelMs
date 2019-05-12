package cn.edu.mju.band2.service;

import cn.edu.mju.band2.po.Room;
import cn.edu.mju.band2.utils.Page;

public interface RoomService {
    public Page<Room> findRoomList(Integer page, Integer rows, String roomNumber, String roomType, String roomStatus);
    public void addRoom(Room room);
    public Room findRoomById(Integer id);
    public void updateRoom(Room room);
    public void deleteRooms(Integer[] ids);
    public void updateRoomStatus(Room room);
}
