package cn.edu.mju.band2.dao;

import cn.edu.mju.band2.po.Message;

import java.util.List;

public interface MessageDao {
    public List<Message> selectMessageList(Message message);
    public Integer selectMessageListCount(Message message);
    public void addMessage(Message message);
    public Message findMessageById(Integer id);
    public void updateMessage(Message message);
    public void deleteMessages(Integer[] ids);
    public void deleteMessage(Integer id);
    public void likeMessage(Message message);
}
