package core.service;


import core.po.Repasswd;
import core.po.User;
import utils.Page;

/**
 * 用户setvice层接口
 */

public interface UserService {
    //通过账号和密码查询用户
    public User findUser(Integer usercode, String password);
    public User addUser(User user);
    public boolean isHaveUser(Integer usercode);
//    public Integer findUserId(Integer usercode);
    public String changePasswd(Repasswd repasswd);
    public Page<User> findUserListByUsercode(Integer page, Integer rows,
                                         Integer usercode);      //通过用户卡号查询用户列表
    public User findUserByUsercode(Integer usercode);      //通过用户卡号查询用户
    public int userUpDate(User user);           //更新用户信息

    public int deleteUser(Integer user_code);          //删除用户
}