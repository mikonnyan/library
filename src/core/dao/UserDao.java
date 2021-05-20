package core.dao;

import core.po.Repasswd;
import core.po.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户DAO层接口
 */
public interface UserDao {
    /**
     * 通过账号和密码查询用户
     */
    public User findUser(User user);            //通过用户名和密码查找用户
    //创建用户
    public  int creatUser(User user);
    public User isHaveUser(@Param("usercode") Integer usercode);
    public Integer findUserId(@Param("usercode") String usercode);
    public void  changePasswd(Repasswd repasswd);   //更改密码
    public String showPasswd(Repasswd repasswd);    //查看密码是否修改成功
    public List<User> findUserByUserList(User user);      //通过用户卡号查询用户列表
    User findUserByUsercode(Integer user_code);           //通过用户卡号查询用户信息
    Integer selectUserCount(Integer user_code);        //查询读者借出书籍总数目
    Integer userUpDate(User user);                     //更新用户数据
    Integer deleteUser(Integer user_code);              //删除用户
}
