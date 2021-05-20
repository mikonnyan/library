package core.po;

public class BookLog {
    private Integer id;
    private Integer user_code;
    private Integer usercode;
    private String isbn;
    private String start_time;  //借阅时间
    private String borrowtime;
    private String returntime;  //到期时间
    private String state;       //逾期状态
    private String operation;   //操作类型
    private Integer start;      // 起始行
    private Integer rows;       // 所取行数
    private String title;       //书籍名称
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
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


    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getBorrowtime() {
        return borrowtime;
    }

    public void setBorrowtime(String borrowtime) {
        this.borrowtime = borrowtime;
    }

    public String getReturntime() {
        return returntime;
    }

    public void setReturntime(String returntime) {
        this.returntime = returntime;
    }

    public Integer getUser_code() {
        return user_code;
    }

    public void setUser_code(Integer user_code) {
        this.user_code = user_code;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String tital) {
        this.title = tital;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public Integer getUsercode() {
        return usercode;
    }

    public void setUsercode(Integer usercode) {
        this.usercode = usercode;
    }
}
