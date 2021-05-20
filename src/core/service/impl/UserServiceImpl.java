package core.service.impl;

import core.dao.UserDao;
import core.po.Repasswd;
import core.po.User;
import core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import utils.Page;

import java.util.List;

/**
 * 用户service层接口实现类
 */
@Service("userService")
@Transactional  //事物注解
public class UserServiceImpl implements UserService {
    //注入UserDao
    @Autowired
    private UserDao userDao;
    @Override
    public User findUser(Integer usercode, String password) {
        User user = new User(usercode,password);
        return userDao.findUser(user);
    }

    @Override
    public User addUser(User user) {
        this.userDao.creatUser(user);
        return null;
    }

    @Override
    //有数据返回true，无数据返回false
    public boolean isHaveUser(Integer usercode) {
        User user1=this.userDao.isHaveUser(usercode);
        if (user1!=null){
            System.out.println("返回数据，已注册");
            return true;
        }
        System.out.println("返回数据，未注册");
        return false;
    }

//    @Override
//    public Integer findUserId(Integer usercode) {
//        Integer id = userDao.findUserId(usercode);
//        return id;
//    }


    /**
     * 更改密码
     */
    @Override
    public String changePasswd(Repasswd repasswd) {
        userDao.changePasswd(repasswd);
        System.out.println("密码更改完毕");
        String nowPasswd = userDao.showPasswd(repasswd);
        System.out.println("当前密码为:"+nowPasswd);
        return nowPasswd;
    }

    @Override
    public Page<User> findUserListByUsercode(Integer page, Integer rows,
                                         Integer usercode) {
        User user = new User(page,rows,usercode);
        //设置当前页
        user.setStart((page-1)*rows);
        //每页数
        user.setRows(rows);
        //查询图书列表
        List<User> users = userDao.findUserByUserList(user);
        //查询图书的总记录数
        Integer count = userDao.selectUserCount(usercode);
        //创建Page返回对象
        Page<User> result = new Page<User>();
        result.setPage(page);
        result.setRows(users);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    @Override
    public User findUserByUsercode(Integer usercode) {
        return  userDao.findUserByUsercode(usercode);
    }

    @Override
    public int userUpDate(User user) {
        System.out.println("更改数据"+user.toString());
        return userDao.userUpDate(user);
    }

    @Override
    public int deleteUser(Integer user_code) {
        return userDao.deleteUser(user_code);
    }

}
