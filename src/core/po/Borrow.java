package core.po;

public class Borrow {
    private String time;            //借阅时间
    private Integer usercode;       //读者卡号
    private String isbn;            //图书isbn码
    private String returntime;      //到期时间
    private String state;           //操作类型
    private Integer nownumber;      //在馆图书数量
    private Integer total_borrow;   //图书总借阅量
    private String title;           //图书名称
    private Integer id;             //编号



    public Borrow(String time, Integer usercode, String isbn) {
        this.time = time;
        this.usercode = usercode;
        this.isbn = isbn;
    }

    public Borrow(String time, Integer usercode, String isbn, String returntime) {
        this.time = time;
        this.usercode = usercode;
        this.isbn = isbn;
        this.returntime = returntime;
    }

    public Borrow() {

    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getUsercode() {
        return usercode;
    }

    public void setUsercode(Integer usercode) {
        this.usercode = usercode;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getReturntime() {
        return returntime;
    }

    public void setReturntime(String returntime) {
        this.returntime = returntime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Integer getTotal_borrow() {
        return total_borrow;
    }

    public void setTotal_borrow(Integer total_borrow) {
        this.total_borrow = total_borrow;
    }

    public Integer getNownumber() {
        return nownumber;
    }

    public void setNownumber(Integer nownumber) {
        this.nownumber = nownumber;
    }
}
