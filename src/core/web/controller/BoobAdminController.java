package core.web.controller;

import core.po.Book;
import core.po.BookLog;
import core.po.Repasswd;
import core.service.BookLogService;
import core.service.BookService;
import core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.Page;

import javax.servlet.http.HttpSession;

@Controller
public class BoobAdminController {
    @Autowired
    private BookService bookService;
    @Autowired
    private UserService userService;
    @Autowired
    private BookLogService bookLogService;

    /**
     * 跳转到密码更改
     */
    @RequestMapping("/bookadministratorrepasswd.action")
    public String tobookadministratorrepasswd(){
        return "bookadministrator_repasswd";
    }
    @RequestMapping("/bookadministrarrepasswd.action")
    public String bookadministrarrepasswd(String newPasswd, String user_password, Model model, HttpSession session){
        Integer userId = (Integer) session.getAttribute("userId");
        System.out.println("userId:"+userId);
        System.out.println("新密码:"+newPasswd);
        System.out.println("旧密码:"+user_password);
        Repasswd repasswd = new Repasswd(userId,newPasswd,user_password);
        userService.changePasswd(repasswd);
        session.setAttribute("msg","密码更改成功");
        return "redirect:toBookAdmin.action";
    }
    /**
     * 查询图书借还记录列表
     */
    @RequestMapping("/booklog.action")
    public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,Model model){
        //条件查询所有客户
        Page<BookLog> bookLogs = bookLogService.findBookLogList(page, rows);
        model.addAttribute("page",bookLogs);
//        model.addAttribute("id",id);
//        model.addAttribute("flname",flname);
        return "bookadministrator_BorrowLog";
    }
    /**
     * 删除图书记录
     */
    @RequestMapping("/booklogdelete.action")
    @ResponseBody
    public String booklogdelete(Integer id){
        int rows = bookLogService.deleteBookLog(id);
        System.out.println("删除操作执行完毕");
        if (rows>0){
            return "OK";
        }else{
            return "FALL";
        }
    }
}
