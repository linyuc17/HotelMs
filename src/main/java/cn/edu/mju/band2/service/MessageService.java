package cn.edu.mju.band2.service;

import cn.edu.mju.band2.po.Message;
import cn.edu.mju.band2.utils.Page;

public interface MessageService {
    public Page<Message> findMessageList(Integer page, Integer rows);
    public void addMessage(Message room);
    public Message findMessageById(Integer id);
    public void updateMessage(Message room);
    public void deleteMessages(Integer[] ids);
    public void deleteMessage(Integer id);
    public void likeMessage(Message message);
}
