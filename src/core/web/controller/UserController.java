package core.web.controller;


import core.po.Repasswd;
import core.po.Testdate;
import core.po.User;
import core.service.UserService;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.Page;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * 用户控制器类
 */
@Controller
public class UserController {
    //依赖注入
    @Autowired
    private UserService userService;
    /**
     * 用户登录
     */
    @RequestMapping(value = "/login.action",method =RequestMethod.POST)
    public String login(Integer usercode, String password, Model model, HttpSession session){
        //通过账号和密码查询用户
        User user = userService.findUser(usercode,password);
            if (user!=null){
            //将用户对象添加到Session
            session.setAttribute("USER_SESSION",user);
                session.setAttribute("usercode",user.getUser_code());
                session.setAttribute("userId",user.getUser_id());
                session.setAttribute("user_name",user.getUser_name());
                session.setAttribute("userLevel",user.getUser_level());
                Date date = new Date();
                SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
             if (user.getUser_level()==1){
                //跳转图书管理员登录界面
                return "bookadministrator";
            }else if (user.getUser_level()==0){
                 //跳转到读者页面
                return "book";
            }else if (user.getUser_level()==2){
                 //跳转到权限管理员界面
                 return "root";
             }
        }
        model.addAttribute("msg","账号或密码错误，请重新输入");
        return "login";
    }
    /**
     * 模拟其他类中跳转到用户管理页面的方法
     */
    @RequestMapping(value = "toBook.action")
    public  String toCustomer(Model model, HttpSession session){
        if (session.getAttribute("USER_SESSION")!=null){
            return "book";
        }
        return "login";
    }
    /**
     * 模拟其他类中跳转到图书管理员页面的方法
     */
    @RequestMapping(value = "/toBookAdmin.action")
    public  String toBookAdmin(Model model, HttpSession session){
    if (session.getAttribute("USER_SESSION")!=null){
        return "bookadministrator";
    }
    return "login";
}
    /**
     * 跳转到root页面的方法
     */
    @RequestMapping(value = "/toRoot.action")
    public  String toRoot(Model model, HttpSession session){
        if (session.getAttribute("USER_SESSION")!=null){
            return "root";
        }
        return "login";
    }
    /**
     * 退出登录
     */
    @RequestMapping("/logout.action")
    public String logout(HttpSession session){
        //清除session
        session.invalidate();
        //重定向到登录页面
        return "redirect:login.action";
    }
    /**
     * 向用户登录页面跳转
     */
    @RequestMapping(value = "/login.action",method = RequestMethod.GET)
    public String login(){
        return "login";
    }
    /**
     * 用户注册
     */
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(){
        return "register";
    }


    @RequestMapping(value = "/addregister",method = RequestMethod.POST)
    public String addregister(Integer usercode, String password,String username, Model model, HttpSession session){
        //判斷用戶名和密碼是否為空
        if (password.length()==0||usercode.equals("")){
            System.out.println("用户名或密码为空");
            model.addAttribute("msg","用户名或密码为空，请重新输入");
            return "register";
        }
        //通过账号和密码添加用户
        User user = new User();
        user.setUser_name(username);
        user.setUser_code(usercode);
        user.setUser_password(password);
        if (userService.isHaveUser(usercode)){
            System.out.println("用户名重复");
            model.addAttribute("msg","用户名重复，请重新输入");
            return "register";
        }else {
            userService.addUser(user);
            //将用户对象添加到Session
            session.setAttribute("USER_SESSION", user);
            //跳转到主页面
            return "redirect:login.action";
        }
    }
    @RequestMapping("/repasswd.action")
    public String torepasswd(){
        return "repasswd";
    }
    @RequestMapping("/changePasswd.action")
    public String torepasswd(String newPasswd, String user_password, Model model, HttpSession session){
        Integer usercode = (Integer) session.getAttribute("usercode");      //获取用户卡号
        Repasswd repasswd = new Repasswd(usercode,newPasswd,user_password);
        String nowPasswd = userService.changePasswd(repasswd);                  //更改密码
        if (repasswd.getNewPasswd().equals(nowPasswd)){                         //判断密码更改是否成功
            session.setAttribute("msg","密码更改成功");
        }else {
            session.setAttribute("msg","密码更改失败");
        }

        return "redirect:toBook.action";
    }
    @RequestMapping("/adminRePasswd.action")
    public String adminRePasswd(String newPasswd, String user_password, Model model, HttpSession session){
        Integer userId = (Integer) session.getAttribute("userId");      //获取用户卡号
        Repasswd repasswd = new Repasswd(userId,newPasswd,user_password);
        userService.changePasswd(repasswd);                           //更改密码
        session.setAttribute("msg","密码更改成功");
        return "redirect:/toBookAdmin.action";
    }
    @RequestMapping("/adminSetReaderNumber")
    public String adminSetReaderNumber(String usercode1 , HttpSession session){
        Integer usercode= Integer.valueOf(usercode1);
        String backURL = null;
        User user = new User();
        if (usercode!=null){
            user.setUser_code(usercode);
        }
        user=userService.findUserByUsercode(user.getUser_code());
        if (user==null){
            System.out.println(backURL);
            session.setAttribute("msg","输入用户账号错误");
            backURL="bookadministrator_SetReaderNumber";
        }else {
            System.out.println(backURL);
            session.setAttribute("usercode",user.getUser_code());
            backURL="bookadministrator_BorrowBook";
        }
        System.out.println(backURL);
        return backURL;
    }

    /**
     * 转到读者卡号输入页面
     */
    @RequestMapping("/tobookadministrator_SetReaderNumber")
    public String adminSetReaderNumber(HttpSession session){
        session.setAttribute("msg","");
        return "bookadministrator_SetReaderNumber";
    }
    /**
     * 转到用户还书页面
     */
    @RequestMapping("/tobookadministrator_ReturnBook")
    public String adminToReturnBook(){
        return "bookadministrator_ReturnBook";
    }
    /**
     *  查询用户信息列表
     */
    @RequestMapping("/findUserList")
    public String findUserList(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,
                               Integer usercode, Model model){
        Page<User> user = userService.findUserListByUsercode(page, rows, usercode);
        model.addAttribute("page",user);
        return "root";
    }
    @RequestMapping("/findUserByUsercode")
    @ResponseBody
    public User findUserByUsercode(Integer user_code){
        return userService.findUserByUsercode(user_code);
    }
    /**
     * 用户管理员更新用户信息
     */
    @RequestMapping("/userupdate.action")
    @ResponseBody
    public String bookupdate(User user){
        int rows = userService.userUpDate(user);      //更新用户信息
        if (rows>0){
            return "OK";        //用户信息更新成功
        }else{
            return "FALL";      //用户信息更新失败
        }
    }

    /**
     * 删除用户
     */
    @RequestMapping("/userdelete.action")
    @ResponseBody
    public String userdelete(Integer user_code){
        System.out.println(user_code);
        int rows = userService.deleteUser(user_code);
        System.out.println("删除操作执行完毕");
        if (rows>0){
            return "OK";
        }else{
            return "FALL";
        }
    }
}
