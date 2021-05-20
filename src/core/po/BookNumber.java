package core.po;

/**
 * 图书数量
 */
public class BookNumber {
    private String isbn;
    private Integer number;
    private Integer nownumber;
    private Integer total_borrow;       //总借阅量

    @Override
    public String toString() {
        return "BookNumber{" +
                "isbn='" + isbn + '\'' +
                ", number=" + number +
                '}';
    }


    public BookNumber(String isbn, Integer number) {
        this.isbn = isbn;
        this.number = number;
    }

    public BookNumber(String isbn, Integer number, Integer nownumber) {
        this.isbn = isbn;
        this.number = number;
        this.nownumber = nownumber;
    }

    public BookNumber() {
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getNownumber() {
        return nownumber;
    }

    public void setNownumber(Integer nownumber) {
        this.nownumber = nownumber;
    }

    public Integer getTotal_borrow() {
        return total_borrow;
    }

    public void setTotal_borrow(Integer total_borrow) {
        this.total_borrow = total_borrow;
    }
}
