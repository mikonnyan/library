package core.po;

public class BookBorrowNumber {
    private String isbn;
    private Integer total_borrow;     //借阅次数
    private String title;   //图书名称
    private Integer start;      // 起始行
    private Integer rows;       // 所取行数


    public BookBorrowNumber(String isbn, Integer total_borrow, String title) {
        this.isbn = isbn;
        this.total_borrow = total_borrow;
        this.title = title;
    }


    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public Integer getTotal_borrow() {
        return total_borrow;
    }

    public void setTotal_borrow(Integer total_borrow) {
        this.total_borrow = total_borrow;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
    public void setStartsAndRows(Integer start,Integer rows) {
        this.rows = rows;
        this.start = start;
    }

    public BookBorrowNumber() {
    }
}
