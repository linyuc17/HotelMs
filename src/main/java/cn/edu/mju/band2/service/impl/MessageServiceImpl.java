package cn.edu.mju.band2.service.impl;

import cn.edu.mju.band2.dao.MessageDao;
import cn.edu.mju.band2.po.Message;
import cn.edu.mju.band2.service.MessageService;
import cn.edu.mju.band2.utils.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class MessageServiceImpl implements MessageService {
    @Resource
    private MessageDao messageDao;
    public Page<Message> findMessageList(Integer page, Integer rows){
        //System.out.println("messageNumber="+messageNumber);
        Message message = new Message();
        /*if(StringUtils.isNotBlank(messageNumber)){
            message.setMessage_number(messageNumber);
        }
        if(StringUtils.isNotBlank(messageType)){
            message.setMessage_type(messageType);
            //System.out.println("job2=="+messageType);
        }
        if(StringUtils.isNotBlank(messageStatus)){
            message.setMessage_status(messageStatus);
        }*/
        //当前页
        message.setStart((page-1) * rows);
        message.setRows(rows);
        List<Message> messages = messageDao.selectMessageList(message);
        Integer count = messageDao.selectMessageListCount(message);
        Page<Message> result = new Page<>();
        result.setPage(page);
        result.setRows(messages);
        result.setSize(rows);
        result.setTotal(count);
        System.out.println(count);
        return  result;
    }
    public void addMessage(Message message){
        this.messageDao.addMessage(message);
    }
    public Message findMessageById(Integer id){
        Message message  = this.messageDao.findMessageById(id);
        return message;
    }
    public void updateMessage(Message message){
        this.messageDao.updateMessage(message);
    }
    public void deleteMessages(Integer[] ids){
        this.messageDao.deleteMessages(ids);
    }
    public void deleteMessage(Integer id){
        this.messageDao.deleteMessage(id);
    }
    public void likeMessage(Message message){
        this.messageDao.likeMessage(message);
    }
}
