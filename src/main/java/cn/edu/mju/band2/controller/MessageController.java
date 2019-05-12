package cn.edu.mju.band2.controller;

import cn.edu.mju.band2.dao.BaseDictMapper;
import cn.edu.mju.band2.po.Admin;
import cn.edu.mju.band2.po.Message;
import cn.edu.mju.band2.po.User;
import cn.edu.mju.band2.service.MessageService;
import cn.edu.mju.band2.utils.Page;
import com.mysql.cj.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Controller
public class MessageController {
    @Resource
    private MessageService messageService;
    @Resource
    private BaseDictMapper baseDictMapper;

    //@Value("${message.jobs.type}")
    private String TYPE_TYPE = "010";
    //@Value("${message.phone.type}")
    private String STATUS_TYPE = "011";
    /*@RequestMapping("/message-list")
    public String toMessageList(){
        return "message-list";
    }*/

    @RequestMapping("/messageList")
    public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "3")Integer rows, Model model){
        Page<Message> messages = messageService.findMessageList(page, rows);
        model.addAttribute("page", messages);
        for(Message message : messages.getRows()){
            System.out.println(message);
        }
        model.addAttribute("count",messages.getTotal());
        model.addAttribute("listShow","tab-pane active");
        model.addAttribute("writeShow","tab-pane fade");
        return "message/list";
    }
    @RequestMapping("/addMessage")
    public String addMessage(Model model){
        String url = "saveMessage";
        model.addAttribute("url", url);
        return "message/au";
    }
    @RequestMapping("saveMessage")
    public String handleFormUpload(Message message, HttpServletRequest request){
        System.out.println("这里！");
        String sqlPath = null;
        if(!message.getFile().isEmpty()){
            String dirPath = request.getServletContext().getRealPath("/upload/message/");
            String Contextpath = request.getServletContext().getContextPath();
            File filePath = new File(dirPath);
            if(!filePath.exists()){
                filePath.mkdirs();
            }
            String NewFilename = message.getMessage_username() + "_"+ UUID.randomUUID() + ".jpg";
            try{
                message.getFile().transferTo(new File(dirPath + NewFilename));
                sqlPath = Contextpath + "\\upload\\message\\" + NewFilename;
                message.setMessage_content_photo(sqlPath);
                if(request.getSession().getAttribute("USER") != null){
                    User user = (User)request.getSession().getAttribute("USER");
                    message.setMessage_username(user.getUserName());
                    message.setMessage_user_photo(user.getUserPhoto());
                }else if(request.getSession().getAttribute("ADMIN") != null){
                    Admin admin = (Admin)request.getSession().getAttribute("ADMIN");
                    message.setMessage_username(admin.getAdmin_name());
                    message.setMessage_user_photo(admin.getAdmin_photo());
                }else{
                    return "admin/error";
                }
                Date day=new Date();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                message.setMessage_date(df.format(day));
                message.setMessage_like(1);
                System.out.println(message.getMessage_like());
                messageService.addMessage(message);
            }catch(Exception e){
                e.printStackTrace();
                return "admin/error";
            }
            return "redirect:messageList";
        }else{
            return "admin/error";
        }
    }
    @RequestMapping("/editMessage")
    public String editMessage(Integer id, Model model){
        Message message = this.messageService.findMessageById(id);
        model.addAttribute("message", message);
        String url = "updateMessage";
        model.addAttribute("url", url);
        return "message-au";
    }
    @RequestMapping("/updateMessage")
    public String updateMessage(Message message, HttpServletRequest request){
        String sqlPath = null;
        if(!message.getFile().isEmpty()){
            String dirPath = request.getServletContext().getRealPath("/upload/message/");
            String Contextpath = request.getServletContext().getContextPath();
            File filePath = new File(dirPath);
            if(!filePath.exists()){
                filePath.mkdirs();
            }
            String NewFilename = message.getMessage_username() + "_"+ UUID.randomUUID() + ".jpg";
            try{
                message.getFile().transferTo(new File(dirPath + NewFilename));
                sqlPath = Contextpath + "\\upload\\message\\" + NewFilename;
                message.setMessage_user_photo(sqlPath);
                messageService.updateMessage(message);
            }catch(Exception e){
                e.printStackTrace();
                return "admin/error";
            }
            return "redirect:message-list";
        }else{
            return "admin/error";
        }
    }
    @RequestMapping("deleteMessages")
    public String deleteMessages(Integer[] ids){
        this.messageService.deleteMessages(ids);
        return "message/list";
    }
    @RequestMapping("deleteMessage")
    public String deleteMessages(Integer id){
        this.messageService.deleteMessage(id);
        return "redirect:messageList";
    }
    @RequestMapping("toWriteMessage")
    public String updateClass(Model model){
        model.addAttribute("writeShow","tab-pane active");
        model.addAttribute("listShow","tab-pane fade");
        return "message/list";
    }
    @RequestMapping("likeMessage")
    public String likeMessage(Integer id, Integer num){
        num+=1;
        Message message = new Message(id, num);
        this.messageService.likeMessage(message);
        return "redirect:messageList";
    }
}
