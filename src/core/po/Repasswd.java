package core.po;

public class Repasswd {
    private Integer user_code;
    private String newPasswd;
    private String user_password;

    public Repasswd(Integer user_code, String newPasswd, String user_password) {
        this.user_code = user_code;
        this.newPasswd = newPasswd;
        this.user_password = user_password;
    }

    public Repasswd() {
    }

    public Integer getUser_code() {
        return user_code;
    }

    public void setUser_code(Integer user_code) {
        this.user_code = user_code;
    }

    public String getNewPasswd() {
        return newPasswd;
    }

    public void setNewPasswd(String newPasswd) {
        this.newPasswd = newPasswd;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }
}
