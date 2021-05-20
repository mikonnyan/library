package core.po;
//import java.io.Serializable;

/**
 * 用户持久化类
 */
public class User {
//	private static final long serialVersionUID = 1L;
	private Integer user_id;      //用户id 
	private Integer user_code;     //用户账号
	private String user_name;     //用户名称
	private String user_password; //用户密码
	private Integer user_state;   //用户状态
	private Integer user_level;	  //用户等级
	private Integer user_over;	  //用户是否逾期
	private Integer start;      // 起始行
	private Integer rows;       // 所取行数
    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", user_code=" + user_code +
                ", user_name='" + user_name + '\'' +
                ", user_password='" + user_password + '\'' +
                ", user_state=" + user_state +
                ", user_level=" + user_level +
                ", user_over=" + user_over +
                '}';
    }

	public User(Integer user_id, Integer user_code, String user_name, String user_password, Integer user_state, Integer user_level, Integer user_over) {
		this.user_id = user_id;
		this.user_code = user_code;
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_state = user_state;
		this.user_level = user_level;
		this.user_over = user_over;
	}

	public User(Integer user_code, String user_password) {
		this.user_code = user_code;
		this.user_password = user_password;
	}

	public User(Integer start, Integer rows,Integer user_code) {
    	this.user_code = user_code;
		this.start = start;
		this.rows = rows;
	}

	public User() {
	}

	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getUser_code() {
		return user_code;
	}
	public void setUser_code(Integer user_code) {
		this.user_code = user_code;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public Integer getUser_state() {
		return user_state;
	}
	public void setUser_state(Integer user_state) {
		this.user_state = user_state;
	}
	public Boolean isRootUser(){
		Integer number=1;
		if (number.equals(user_level)){
			return true;
		}else{
			return false;
		}
	}



	public Integer getUser_level() {
		return user_level;
	}

	public void setUser_level(Integer user_level) {
		this.user_level = user_level;
	}

	public Integer getUser_over() {
		return user_over;
	}

	public void setUser_over(Integer user_over) {
		this.user_over = user_over;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}
}
