package core.service;

import core.po.*;
import utils.Page;

public interface BookService  {
    public Page<Book> findBookList(Integer page, Integer rows,
                                       String title, String isbn);







    public int bookUpDate(Book book);          //更新图书信息
    public int deleteBook(String isbn);             //删除图书
    public Testdate testdate();

    public BookBorrowNumber selectTopBook(BookBorrowNumber bookBorrowNumber);

    public int creatBook(AddBook addBook );          //添加书籍
    public void creatBookRoomAndGenre(BookRoom bookRoom);    //创建图书位置分类信息
    public BookNumber selectBookNumberByISBN(String isbn);    //通过isbn码查询图书数量
    public int creatBookNumber(AddBook addBook);     //通过isbn码与图书数量创建图书相关数据
    public Page<Book> findLibraryBookList(Integer page, Integer rows, String name, String isbn);
    public Book getBookByIsbn(String isbn);        //通过书籍isbn查询书籍信息
    public String strToDate(String strDate);  //计算书籍借阅到期时间
    public BookNumber getBookNowNumber(String isbn);  //通过isbn获取当前图书数量
    public void borrowlogset(Borrow borrow);    //添加借书记录
    public Boolean setBorrowBook(Borrow borrow);//借阅图书
    public Integer addborrownumber(BookNumber bookNumber);     //更改图书借阅次数与在馆图书数量
    Page<Book> findBorrowBookList(Integer page, Integer rows, Integer usercode);    //管理员查询读者借阅数据
    Page<BookLog> findReaderBookList(Integer page, Integer rows, Integer usercode);    //读者借阅书籍查询
    public void returnlogset(Borrow borrow);    //添加还书记录
    Boolean UserBorrowedBook(Borrow borrow);    //判断用户是否已借阅书籍,True为已借阅书籍
    public Boolean returnBook(Borrow borrow);//归还书籍
}
